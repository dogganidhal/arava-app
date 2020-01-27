import 'package:arava/blocs/app/app_bloc.dart';
import 'package:arava/blocs/app/state/app_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/i18n/app_localizations_delegate.dart';
import 'package:arava/modules/app_module.dart';
import 'package:arava/theme/arava_theme.dart';
import 'package:arava/widgets/app/onboarding.dart';
import 'package:arava/widgets/main/main.dart';
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
        home: Builder(
          builder: (context) => state.when(
            loading: _loading,
            unintialized: _loading,
            appLoaded: _loadedApp,
            firstLaunch: _firstLaunch,
            error: (state) => _error(context, state)
          ),
        )
      )
    );
  }

  Widget _loading(AppState state) => Scaffold(
    body: Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );

  Widget _loadedApp(AppLoaded state) => Main(configuration: state.appConfiguration);

  Widget _firstLaunch(AppState state) => OnBoarding();

  Widget _error(BuildContext context, Error error) => Scaffold(
    body: Column(
      children: [
        Flexible(child: Container()),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(error.exception.getLocalizedMessage(context)),
        ),
        Flexible(child: Container()),
        Padding(
          padding: EdgeInsets.all(16),
          child: ButtonTheme(
            height: 48,
            minWidth: double.infinity,
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () => get<AppBloc>().loadApp(),
              child: Text(AppLocalizations.of(context).onboarding_Retry()),
            ),
          ),
        )
      ],
    ),
  );
}