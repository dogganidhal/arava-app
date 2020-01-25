import 'package:arava_app/blocs/app_bloc/event/app_event.dart';
import 'package:arava_app/blocs/app_bloc/state/app_state.dart';
import 'package:arava_app/i18n/localizations.dart';
import 'package:arava_app/model/app_configuration/app_configuration.dart';
import 'package:arava_app/service/app_service.dart';
import 'package:arava_app/service/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  final AppService appService;
  final Session session;

  AppBloc({@required this.appService, @required this.session});

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
        final apiConfiguration = await appService.loadApiConfiguration();
        final preferredLocale = await session.getPreferredLocale();
        final appConfiguration = AppConfiguration.fromApiConfiguration(
          apiConfiguration: apiConfiguration,
          preferredLocale: preferredLocale
        );
        Locale locale = preferredLocale != null ?
          Locale(preferredLocale) :
          Intl.defaultLocale;
        AppLocalizations.load(locale);
        yield AppState.appLoaded(appConfiguration: appConfiguration);
      } catch (exception) {
        // TODO: Load from cache
      }
    }
  }

  Stream<AppState> _confirmFirstLaunch(ConfirmFirstLaunch event) async* {
    session.setFirstAppLaunch(true);
  }

  Stream<AppState> _changeLocale(ChangeLocale changeLocale) async* {
    debugPrint("Changing locale from ${Intl.defaultLocale}");
    await AppLocalizations.load(Locale(changeLocale.locale));
    debugPrint("Changed locale to ${Intl.defaultLocale}");
    final l = await AppLocalizations.load(Locale(Intl.defaultLocale));
    debugPrint("choose_language : ${l.onboarding_ChooseLanguage()}");
    debugPrint("continue : ${l.onboarding_Continue()}");
  }

}