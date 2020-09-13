import 'package:arava/blocs/app/app_bloc.dart';
import 'package:arava/blocs/app/state/app_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/i18n/app_localizations_delegate.dart';
import 'package:arava/theme/arava_theme.dart';
import 'package:arava/widgets/app/app_configuration_provider.dart';
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

class _BootstrapState extends State<Bootstrap> {
  AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = Modular.get<AppBloc>()
      ..loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: _appBloc,
      builder: (context, state) => AppConfigurationProvider(
        configuration: state.whenOrElse(
          appLoadedState: (appLoadedState) => appLoadedState.appConfiguration,
          orElse: (_) => null
        ),
        child: MaterialApp(
          title: 'Arava',
          theme: AravaTheme.kLightTheme,
          // darkTheme: AravaTheme.kDarkTheme,
          onGenerateRoute: Modular.generateRoute,
          navigatorKey: Modular.get(),
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
              appLoadingState: _loading,
              appUnintializedState: _loading,
              appLoadedState: _loadedApp,
              appFirstLaunchState: _firstLaunch,
              appErrorState: (state) => _error(context, state)
            ),
          )
        ),
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

  Widget _loadedApp(AppLoadedState state) => Main(configuration: state.appConfiguration);

  Widget _firstLaunch(AppState state) => OnBoarding();

  Widget _error(BuildContext context, AppErrorState error) => Scaffold(
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
              onPressed: () => Modular.get<AppBloc>().loadApp(),
              child: Text(AppLocalizations.of(context).onboarding_Retry()),
            ),
          ),
        )
      ],
    ),
  );
}