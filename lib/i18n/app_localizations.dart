import 'dart:async';

import 'package:arava/i18n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppLocalizations {
  static Map<String, String> locales = {
    'fr': '🇫🇷 Français',
    'en': '🇺🇸 English',
    'zh_Hans': '🇨🇳 中文'
  };

  static Future<AppLocalizations> load(Locale locale) async {
    final String name = (locale.countryCode?.isEmpty ?? true) ?
      locale.languageCode :
      locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    await initializeMessages(localeName);
    Intl.defaultLocale = localeName;
    return AppLocalizations();
  }

  static String get currentLanguageCode => Intl.getCurrentLocale();
  static String get currentLanguage => locales[currentLanguageCode];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String appName() => Intl.message(
    'Arava',
    name: 'appName'
  );

  // region Onboarding

  String onboarding_Retry() => Intl.message(
    'retry',
    name: 'onboarding_Retry'
  );

  String onboarding_ChooseLanguage() => Intl.message(
    'Choose language',
    name: "onboarding_ChooseLanguage"
  );

  String onboarding_Continue() => Intl.message(
    'Continue',
    name: "onboarding_Continue"
  );

  // endregion

  //region Home

  String home_Map() => Intl.message(
    'Map',
    name: 'home_Map'
  );

  String home_Featured() => Intl.message(
    'Featured',
    name: 'home_Featured'
  );

  String home_Favorites() => Intl.message(
    'Favorites',
    name: 'home_Favorites'
  );

  String home_Photos() => Intl.message(
    'Photos',
    name: 'home_Photos'
  );

  String home_More() => Intl.message(
    'More',
    name: 'home_More'
  );

  //endregion

  // region More

  String more_Settings() => Intl.message(
    'Settings',
    name: 'more_Settings'
  );

  String more_Favorites() => Intl.message(
    'Favorites',
    name: 'more_Favorites'
  );

  String more_QaA() => Intl.message(
    'Q&A',
    name: 'more_QaA'
  );

  String more_EmailUs() => Intl.message(
    'Email us',
    name: 'more_EmailUs'
  );

  String more_LoginSignUp() => Intl.message(
    'Login / Sign up',
    name: 'more_LoginSignUp'
  );

  String more_LastUpdate() => Intl.message(
    'Last update',
    name: 'more_LastUpdate'
  );

  String more_Update() => Intl.message(
    'Update app',
    name: 'more_Update'
  );

  // endregion

  // region Settings

  String settings_Title() => Intl.message(
    'Settings',
    name: 'settings_Title'
  );

  String settings_Language() => Intl.message(
    'Language',
    name: 'settings_Language'
  );

  // endregion

  // region General

  String general_Island() => Intl.message(
    'Island',
    name: 'general_Island'
  );

  // endregion

  // region Search

  String search_SelectIsland() => Intl.message(
    'Select islands',
    name: 'search_SelectIsland'
  );

  String search_Filter() => Intl.message(
    'Refine',
    name: 'search_Filter'
  );

  // endregion

}