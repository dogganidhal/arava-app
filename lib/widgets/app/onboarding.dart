import 'package:arava/blocs/app/app_bloc.dart';
import 'package:arava/blocs/app/state/app_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:arava/widgets/language_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: Modular.get<AppBloc>(),
        condition: (previous, next) => true,
        listener: (context, state) {},
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Container()),
                Image.asset(AravaAssets.Logo, height: 96),
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
                      onPressed: () => Modular.get<AppBloc>().confirmFirstLaunch(),
                      child: Text(
                        AppLocalizations.of(context).onboarding_Continue(),
                      ),
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