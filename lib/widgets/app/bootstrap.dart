import 'package:arava_app/blocs/app_bloc/app_bloc.dart';
import 'package:arava_app/blocs/app_bloc/state/app_state.dart';
import 'package:arava_app/i18n/localizations.dart';
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
  AppBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = get()
      ..loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arava',
      theme: AravaTheme.kLightTheme,
      darkTheme: AravaTheme.kDarkTheme,
      onGenerateRoute: Modular.generateRoute,
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
      home: BlocBuilder<AppBloc, AppState>(
        bloc: _bloc,
        builder: (context, state) => BlocProvider(
          create: (context) => _bloc,
          child: state.when(
            loading: _loading,
            unintialized: _loading,
            appLoaded: _loadedApp,
            firstLaunch: _firstLaunch
          ),
        )
      ),
    );
  }

  Widget _loading(AppState state) => Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );

  Widget _loadedApp(AppState state) => Main();

  Widget _firstLaunch(AppState state) => Onboarding();
}