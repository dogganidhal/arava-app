import 'package:arava_app/blocs/app_bloc/app_bloc.dart';
import 'package:arava_app/i18n/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class _LanguageDropdownData {
  final String name;
  final String languageCode;

  _LanguageDropdownData({this.name, this.languageCode});
}

class Onboarding extends StatefulWidget {

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _selectedLanguage;
  List<_LanguageDropdownData> _languages = [
    _LanguageDropdownData(name: '🇺🇸 English', languageCode: 'en'),
    _LanguageDropdownData(name: '🇫🇷 Français', languageCode: 'fr'),
    _LanguageDropdownData(name: '🇨🇳 中文', languageCode: 'zh_Hans')
  ];

  @override
  void initState() {
    super.initState();
    _selectedLanguage = _languages.indexWhere((lang) => lang.languageCode == Intl.getCurrentLocale());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              DropdownButton<int>(
                value: _selectedLanguage,
                items: _languages
                  .map(((language) => new DropdownMenuItem<int>(
                    value: _languages.indexOf(language),
                    child: new Text(language.name),
                  )))
                  .toList(),
                onChanged: (index) {
                  BlocProvider.of<AppBloc>(context)
                    .changeLocale(_languages[index].languageCode);
                  setState(() => _selectedLanguage = index);
                },
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.all(16),
                child: ButtonTheme(
                  height: 48,
                  minWidth: double.infinity,
                  child: MaterialButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context).onboarding_Continue()),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}