import 'package:arava/blocs/app/event/app_event.dart';
import 'package:arava/blocs/app/state/app_state.dart';
import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/service/app_service.dart';
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
  final AppService appService;
  final Session session;

  AppBloc({
    @required this.appService, @required this.session,
    @required this.navigationBloc, @required this.authBloc
  });

  @override
  AppState get initialState => AppState.appUnintializedState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) => event.when(
    loadAppEvent: _loadApp,
    changeLocaleEvent: _changeLocale,
    confirmFirstLaunchEvent: _confirmFirstLaunch
  );

  void loadApp() {
    add(AppEvent.loadAppEvent());
  }

  void confirmFirstLaunch() {
    add(AppEvent.confirmFirstLaunchEvent());
  }

  void changeLocale(String locale) {
    add(AppEvent.changeLocaleEvent(locale: locale));
  }

  Stream<AppState> _loadApp(LoadAppEvent event) async* {
    yield AppState.appLoadingState();
    authBloc.loadAuth();
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

  Stream<AppState> _confirmFirstLaunch(ConfirmFirstLaunchEvent event) async* {
    await session.setFirstAppLaunch(false);
    loadApp();
  }

  Stream<AppState> _changeLocale(ChangeLocaleEvent event) async* {
    await AppLocalizations.load(Locale(event.locale));
    await session.setPreferredLocale(event.locale);
    if (state is AppLoadedState) {
      final oldConfiguration = (state as AppLoadedState).appConfiguration;
      yield AppState.appLoadedState(
        appConfiguration: AppConfiguration(
          archipelagos: oldConfiguration.archipelagos,
          themes: oldConfiguration.themes,
          versionConfiguration: oldConfiguration.versionConfiguration,
          preferredLocale: event.locale
        )
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