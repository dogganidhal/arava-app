import 'package:arava_app/blocs/app/app_bloc.dart';
import 'package:arava_app/i18n/app_localizations.dart';
import 'package:arava_app/modules/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class _LanguageDropdownData {
  final String name;
  final String languageCode;

  _LanguageDropdownData({this.name, this.languageCode});
}

class LanguageSelector extends StatefulWidget {
  final VoidCallback onLanguageSelected;

  LanguageSelector({Key key, this.onLanguageSelected}) : super(key: key);

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends ModularState<LanguageSelector, AppModule> {
  int _selectedLanguage;
  List<_LanguageDropdownData> _languages = AppLocalizations.locales.entries
    .map((entry) => _LanguageDropdownData(name: entry.value, languageCode: entry.key))
    .toList();

  @override
  void initState() {
    super.initState();
    final index = _languages.indexWhere((lang) => lang.languageCode == AppLocalizations.currentLanguageCode);
    _selectedLanguage = index != -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(AppLocalizations.of(context).onboarding_ChooseLanguage()),
        ),
        DropdownButton<int>(
          value: _selectedLanguage,
          items: _languages
            .map(((language) => DropdownMenuItem<int>(
              value: _languages.indexOf(language),
              child: Text(language.name),
            )))
            .toList(),
          onChanged: (index) {
            get<AppBloc>().changeLocale(_languages[index].languageCode);
            setState(() => _selectedLanguage = index);
            if (widget.onLanguageSelected != null) {
              widget.onLanguageSelected();
            }
          },
        ),
      ],
    );
  }
}