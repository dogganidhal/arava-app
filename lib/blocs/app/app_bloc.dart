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
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  AppState get initialState => AppState.unintialized();

  @override
  Stream<AppState> mapEventToState(AppEvent event) => event.when(
    loadApp: _loadApp,
    changeLocale: _changeLocale,
    confirmFirstLaunch: _confirmFirstLaunch
  );

  void loadApp() {
    add(AppEvent.loadApp());
  }

  void confirmFirstLaunch() {
    add(AppEvent.confirmFirstLaunch());
  }

  void changeLocale(String locale) {
    add(AppEvent.changeLocale(locale: locale));
  }

  Stream<AppState> _loadApp(LoadApp event) async* {
    yield AppState.loading();
    authBloc.loadAuth();
    final firstLaunch = await session.getFirstAppLaunch();
    if (firstLaunch) {
      yield AppState.firstLaunch(language: Intl.defaultLocale);
    } else {
      try {
        final appConfiguration = await _loadAppConfiguration();
        session.setApiConfiguration(appConfiguration);
        Locale locale = appConfiguration.preferredLocale != null ?
          Locale(appConfiguration.preferredLocale) :
          Locale(Intl.defaultLocale);
        AppLocalizations.load(locale);
        yield AppState.appLoaded(appConfiguration: appConfiguration);
      } on AppException catch (exception) {
        yield AppState.error(exception: exception);
      }
    }
  }

  Stream<AppState> _confirmFirstLaunch(ConfirmFirstLaunch event) async* {
    await session.setFirstAppLaunch(false);
    loadApp();
  }

  Stream<AppState> _changeLocale(ChangeLocale event) async* {
    await AppLocalizations.load(Locale(event.locale));
    await session.setPreferredLocale(event.locale);
    if (state is AppLoaded) {
      final oldConfiguration = (state as AppLoaded).appConfiguration;
      yield AppState.appLoaded(
        appConfiguration: AppConfiguration(
          archipelagos: oldConfiguration.archipelagos,
          poiTypes: oldConfiguration.poiTypes,
          versionConfiguration: oldConfiguration.versionConfiguration,
          preferredLocale: event.locale
        )
      );
    }
    if (state is FirstLaunch) {
      yield AppState.firstLaunch(language: event.locale);
    }
  }

  Future<AppConfiguration> _loadAppConfiguration() async {
    ApiConfiguration apiConfiguration;
    try {
      apiConfiguration = await appService.loadApiConfiguration();
      final preferredLocale = await session.getPreferredLocale();
      return AppConfiguration.fromApiConfiguration(
        apiConfiguration: apiConfiguration,
        preferredLocale: preferredLocale
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