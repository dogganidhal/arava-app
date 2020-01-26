import 'package:arava_app/blocs/app/app_bloc.dart';
import 'package:arava_app/blocs/app/state/app_state.dart';
import 'package:arava_app/i18n/app_localizations.dart';
import 'package:arava_app/modules/app_module.dart';
import 'package:arava_app/widgets/language_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnBoarding extends ModularStatelessWidget<AppModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: get(),
        condition: (previous, next) => true,
        listener: (context, state) {},
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Container()),
                Image.asset("assets/images/octopus.png", height: 96),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "Arava",
                    style: Theme
                      .of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Theme.of(context).primaryColor)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(AppLocalizations.of(context).onboarding_ChooseLanguage()),
                ),
                LanguageSelector(),
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: ButtonTheme(
                    height: 48,
                    minWidth: double.infinity,
                    child: MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () => get<AppBloc>().confirmFirstLaunch(),
                      child: Text(AppLocalizations.of(context).onboarding_Continue()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}