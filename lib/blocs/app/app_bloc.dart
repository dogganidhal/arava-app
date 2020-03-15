import 'package:arava/blocs/app/event/app_event.dart';
import 'package:arava/blocs/app/state/app_state.dart';
import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/favorites/favorites_bloc.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/service/app_service.dart';
import 'package:arava/service/poi_service.dart';
import 'package:arava/service/session.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthBloc authBloc;
  final NavigationBloc navigationBloc;
  final FavoritesBloc favoritesBloc;
  final AppService appService;
  final PoiService poiService;
  final Session session;

  AppBloc({
    @required this.appService, @required this.session,
    @required this.navigationBloc, @required this.authBloc,
    @required this.poiService, @required this.favoritesBloc
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
      final pinDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        AravaAssets.Pin
      );
      final sponsoredPinDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        AravaAssets.SponsoredPin
      );
      return AppConfiguration.fromApiConfiguration(
        apiConfiguration: apiConfiguration,
        preferredLocale: preferredLocale,
        pinBitmapDescriptor: pinDescriptor,
        sponsoredPinBitmapDescriptor: sponsoredPinDescriptor
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
}