import 'package:arava_app/i18n/messages_all.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';


class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    final String name = (locale.countryCode?.isEmpty ?? true) ?
      locale.languageCode :
      locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    await initializeMessages(localeName);
    Intl.defaultLocale = localeName;
    return AppLocalizations();
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  onboarding_ChooseLanguage() => Intl.message(
    'Choose language',
    name: "onboarding_ChooseLanguage"
  );

  onboarding_Continue() => Intl.message(
    'Continue',
    name: "onboarding_Continue"
  );
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr', 'zh_Hans'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}