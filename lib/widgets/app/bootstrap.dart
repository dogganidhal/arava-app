import 'package:arava_app/blocs/app/app_bloc.dart';
import 'package:arava_app/blocs/app/state/app_state.dart';
import 'package:arava_app/i18n/app_localizations_delegate.dart';
import 'package:arava_app/modules/app_module.dart';
import 'package:arava_app/theme/arava_theme.dart';
import 'package:arava_app/widgets/app/onboarding.dart';
import 'package:arava_app/widgets/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';


class Bootstrap extends StatefulWidget {
  @override
  _BootstrapState createState() => _BootstrapState();
}

class _BootstrapState extends ModularState<Bootstrap, AppModule> {
  AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = get()..loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: _appBloc,
      builder: (context, state) => MaterialApp(
        title: 'Arava',
        theme: AravaTheme.kLightTheme,
        darkTheme: AravaTheme.kDarkTheme,
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: get(),
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('fr'),
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        ],
        home: state.when(
          loading: _loading,
          unintialized: _loading,
          appLoaded: _loadedApp,
          firstLaunch: _firstLaunch
        )
      )
    );
  }

  Widget _loading(AppState state) => Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );

  Widget _loadedApp(AppState state) => Main();

  Widget _firstLaunch(AppState state) => OnBoarding();
}