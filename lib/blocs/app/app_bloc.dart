import 'dart:async';
import 'dart:typed_data';

import 'package:arava/blocs/app/event/app_event.dart';
import 'package:arava/blocs/app/state/app_state.dart';
import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/favorites/favorites_bloc.dart';
import 'package:arava/blocs/global_context/global_context_bloc.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/model/archipelago/archipelago.dart';
import 'package:arava/model/island/island.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:arava/service/app_service.dart';
import 'package:arava/service/poi_service.dart';
import 'package:arava/service/session.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show BitmapDescriptor;
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthBloc authBloc;
  final NavigationBloc navigationBloc;
  final FavoritesBloc favoritesBloc;
  final GlobalContextBloc globalContextBloc;
  final AppService appService;
  final PoiService poiService;
  final Session session;

  AppBloc({
    @required this.appService, @required this.session,
    @required this.navigationBloc, @required this.authBloc,
    @required this.poiService, @required this.favoritesBloc,
    @required this.globalContextBloc
  });

  @override
  AppState get initialState => AppState.appUnintializedState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) => event.when(
    appLoadEvent: _loadApp,
    appChangeLocaleEvent: _changeLocale,
    appConfirmFirstLaunchEvent: _confirmFirstLaunch
  );

  void loadApp() {
    add(AppEvent.appLoadEvent());
  }

  void confirmFirstLaunch() {
    add(AppEvent.appConfirmFirstLaunchEvent());
  }

  void changeLocale(String locale) {
    add(AppEvent.appChangeLocaleEvent(locale: locale));
  }

  Stream<AppState> _loadApp(AppLoadEvent event) async* {
    yield AppState.appLoadingState();
    authBloc.loadAuth();
    favoritesBloc.loadFavorites();
    final firstLaunch = await session.getFirstAppLaunch();
    if (firstLaunch) {
      yield AppState.appFirstLaunchState(language: Intl.defaultLocale);
    } else {
      try {
        final appConfiguration = await _loadAppConfiguration();
        session.setApiConfiguration(appConfiguration);
        globalContextBloc.updateConfiguration(appConfiguration);
        Locale locale = appConfiguration.preferredLocale != null ?
          Locale(appConfiguration.preferredLocale) :
          Locale(Intl.defaultLocale);
        AppLocalizations.load(locale);
        yield AppState.appLoadedState(appConfiguration: appConfiguration);
      } on AppException catch (exception) {
        yield AppState.appErrorState(exception: exception);
      }
    }
  }

  Stream<AppState> _confirmFirstLaunch(AppConfirmFirstLaunchEvent event) async* {
    await session.setFirstAppLaunch(false);
    loadApp();
  }

  Stream<AppState> _changeLocale(AppChangeLocaleEvent event) async* {
    await AppLocalizations.load(Locale(event.locale));
    await session.setPreferredLocale(event.locale);
    if (state is AppLoadedState) {
      final oldConfiguration = (state as AppLoadedState).appConfiguration;
      yield AppState.appLoadedState(
        appConfiguration: oldConfiguration
          .withPreferredLocale(event.locale)
      );
    }
    if (state is AppFirstLaunchState) {
      yield AppState.appFirstLaunchState(language: event.locale);
    }
  }

  Future<AppConfiguration> _loadAppConfiguration() async {
    ApiConfiguration apiConfiguration;
    try {
      apiConfiguration = await appService.loadApiConfiguration();
      final preferredLocale = await session.getPreferredLocale();
      final defaultPinBitmapDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        AravaAssets.Pin
      );
      final defaultSponsoredPinBitmapDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        AravaAssets.SponsoredPin
      );
      final island = await _getUserIsland(apiConfiguration.archipelagos);
      globalContextBloc.updateSelectedIsland(island);
      return AppConfiguration.fromApiConfiguration(
        apiConfiguration: apiConfiguration,
        preferredLocale: preferredLocale,
        defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
        defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
        pinsMap: await _downloadPinsDescriptors(apiConfiguration.themes),
        sponsoredPinsMap: await _downloadSponsoredPinsDescriptors(apiConfiguration.themes)
      );
    } on DioError {
      apiConfiguration = await session.getApiConfiguration();
      if (apiConfiguration == null) {
        throw ConnectivityException();
      }
    } catch (exception) {
      throw UnexpectedException();
    }
    return null;
  }

  Future<Island> _getUserIsland(List<Archipelago> archipelagos) async {
    final islands = _extractIslands(archipelagos);
    final locationData = await _getUserLocation();
    if (locationData != null) {
      final distance = Distance();
      islands.sort((lhs, rhs) => distance.distance(
          LatLng(lhs.center.latitude, lhs.center.longitude),
          LatLng(locationData.latitude, locationData.longitude)
        ) > distance.distance(
          LatLng(rhs.center.latitude, rhs.center.longitude),
          LatLng(locationData.latitude, locationData.longitude)
        ) ? 1 : -1);
      final nearestIsland = islands.first;
      final distanceToNearestIsland = distance.as(LengthUnit.Kilometer,
        LatLng(nearestIsland.center.latitude, nearestIsland.center.longitude),
        LatLng(locationData.latitude, locationData.longitude)
      );
      if (distanceToNearestIsland < 500) {
        return nearestIsland;
      }
    }
    return islands.firstWhere((island) => island.name.toLowerCase() == "tahiti");
  }

  Future<Map<String, BitmapDescriptor>> _downloadPinsDescriptors(List<PoiTheme> themes) async {
    Map<String, BitmapDescriptor> map = Map<String, BitmapDescriptor>();
    final futures = themes
      .where((theme) => theme.marker != null)
      .map((theme) => MapEntry(theme.id, poiService.downloadBytes(theme.marker.url)));
    await Future
      .forEach(futures, (MapEntry<String, Future<List<int>>> future) async {
        final bytes = await future.value;
        final bitmapDescriptor = BitmapDescriptor.fromBytes(Uint8List.fromList(bytes));
        map[future.key] = bitmapDescriptor;
      });
    return map;
  }

  Future<Map<String, BitmapDescriptor>> _downloadSponsoredPinsDescriptors(List<PoiTheme> themes) async {
    Map<String, BitmapDescriptor> map = Map<String, BitmapDescriptor>();
    final futures = themes
      .where((theme) => theme.sponsoredMarker != null)
      .map((theme) => MapEntry(theme.id, poiService.downloadBytes(theme.sponsoredMarker.url)));
    await Future
      .forEach(futures, (MapEntry<String, Future<List<int>>> future) async {
        final bytes = await future.value;
        final bitmapDescriptor = BitmapDescriptor.fromBytes(Uint8List.fromList(bytes));
        map[future.key] = bitmapDescriptor;
      });
    return map;
  }

  Future<LocationData> _getUserLocation() async {
    final location = Location();
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      if (await location.requestService()) {
        return null;
      }
    }
    final permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.DENIED) {
      if (await location.requestPermission() != PermissionStatus.GRANTED) {
        return null;
      }
    }
    return await location.getLocation();
  }

  List<Island> _extractIslands(List<Archipelago> archipelagos) => archipelagos
    .fold(<Island>[], (islands, archipelago) => [...islands, ...archipelago.islands])
    .cast<Island>()
    .toList();
}