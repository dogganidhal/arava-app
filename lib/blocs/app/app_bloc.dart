import 'package:arava_app/blocs/app/event/app_event.dart';
import 'package:arava_app/blocs/app/state/app_state.dart';
import 'package:arava_app/blocs/navigation/navigation_bloc.dart';
import 'package:arava_app/exception/app_exception.dart';
import 'package:arava_app/i18n/app_localizations.dart';
import 'package:arava_app/model/api_configuration/api_configuration.dart';
import 'package:arava_app/model/app_configuration/app_configuration.dart';
import 'package:arava_app/service/app_service.dart';
import 'package:arava_app/service/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  final NavigationBloc navigationBloc;
  final AppService appService;
  final Session session;

  AppBloc({
    @required this.appService, @required this.session,
    @required this.navigationBloc
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
    final firstLaunch = await session.getFirstAppLaunch();
    if (firstLaunch) {
      yield AppState.firstLaunch();
    } else {
      try {
        final apiConfiguration = await _loadAppConfiguration();
        session.setApiConfiguration(apiConfiguration);
        Locale locale = apiConfiguration.preferredLocale != null ?
        Locale(apiConfiguration.preferredLocale) :
        Intl.defaultLocale;
        AppLocalizations.load(locale);
        yield AppState.appLoaded(appConfiguration: apiConfiguration);
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
          islands: oldConfiguration.islands,
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