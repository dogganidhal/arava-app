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

  String home_Activities() => Intl.message(
    'Activites',
    name: 'home_Activities'
  );

  String home_More() => Intl.message(
    'More',
    name: 'home_More'
  );

  //endregion

  // region More

  String more_Profile() => Intl.message(
    'Profile',
    name: 'more_Profile'
  );

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

  String more_LogoutConfirmation() => Intl.message(
    'Do you really want to logout ?',
    name: 'more_LogoutConfirmation'
  );

  String more_Logout() => Intl.message(
    'Logout',
    name: 'more_Logout'
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

  String general_RequiredField() => Intl.message(
    'This field is required',
    name: 'general_RequiredField'
  );

  String general_Cancel() => Intl.message(
    'Cancel',
    name: 'general_Cancel'
  );

  String general_Loading() => Intl.message(
    'Loading ...',
    name: 'general_Loading'
  );

  String general_NoItems() => Intl.message(
    'No items',
    name: 'general_NoItems'
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

  String search_FilterQueryPlaceholder() => Intl.message(
    'Park, Hotel ...',
    name: 'search_FilterQueryPlaceholder'
  );

  String search_FilterSponsored() => Intl.message(
    'Things to do',
    name: 'search_FilterSponsored'
  );

  String search_EmptyResponseDescription() => Intl.message(
    "No results found in the requested area, try to move the map, or edit search filters",
    name: 'search_EmptyResponseDescription'
  );

  String search_SearchThisArea() => Intl.message(
    'Search this area',
    name: 'search_SearchThisArea'
  );

  String searchResult_DetailsTabTitle() => Intl.message(
    "Details",
    name: 'searchResult_DetailsTabTitle'
  );

  String searchResult_MapTabTitle() => Intl.message(
    "Map",
    name: 'searchResult_MapTabTitle'
  );

  String searchResult_CommentsTabTitle() => Intl.message(
    "Comments",
    name: 'searchResult_CommentsTabTitle'
  );

  String searchResult_NoDescriptionPlaceholder() => Intl.message(
    "No description",
    name: 'searchResult_NoDescriptionPlaceholder'
  );

  String searchResult_LaunchMap() => Intl.message(
    "View on map",
    name: 'searchResult_LaunchMap'
  );

  String searchResult_NoCommentsPlaceholder() => Intl.message(
    "No comments",
    name: 'searchResult_NoCommentsPlaceholder'
  );

  String searchResult_SignUpToComment() => Intl.message(
    "Please sign in / sign up to comment or rate",
    name: 'searchResult_SignUpToComment'
  );

  String searchResult_RateComment() => Intl.message(
    "Noter / Écrire un commentaire",
    name: 'searchResult_RateComment'
  );

  String searchResult_CommentBefore24Hours(int hours) => Intl.message(
    "$hours hours ago",
    args: [hours],
    name: 'searchResult_CommentBefore24Hours'
  );

  // endregion

  // region Auth

  String auth_LoginTitle() => Intl.message(
    'Login',
    name: 'auth_LoginTitle'
  );

  String auth_LoginSubtitle() => Intl.message(
    'Please login to continue',
    name: 'auth_LoginSubtitle'
  );

  String auth_EmailFieldPlaceholder() => Intl.message(
    'Email',
    name: 'auth_EmailFieldPlaceholder'
  );

  String auth_InvalidEmailErrorMessage() => Intl.message(
    'Invalid email address',
    name: 'auth_InvalidEmailErrorMessage'
  );

  String auth_PasswordFieldPlaceholder() => Intl.message(
    'Password',
    name: 'auth_PasswordFieldPlaceholder'
  );

  String auth_PasswordMinimumLengthErrorMessage() => Intl.message(
    'Password must have at least 6 characters',
    name: 'auth_PasswordMinimumLengthErrorMessage'
  );

  String auth_FirstNameFieldPlaceholder() => Intl.message(
    'First name',
    name: 'auth_FirstNameFieldPlaceholder'
  );

  String auth_LastNameFieldPlaceholder() => Intl.message(
    'Last name',
    name: 'auth_LastNameFieldPlaceholder'
  );

  String auth_SignUpTitle() => Intl.message(
    'Sign up',
    name: 'auth_SignUpTitle'
  );

  String auth_SignUpSubtitle() => Intl.message(
    'Please sign up to continue',
    name: 'auth_SignUpSubtitle'
  );

  // endregion

  // region Profile

  String profile_CurrentPasswordFieldPlaceholder() => Intl.message(
    'Current password',
    name: 'profile_CurrentPasswordFieldPlaceholder'
  );

  String profile_NewPasswordFieldPlaceholder() => Intl.message(
    'New password',
    name: 'profile_NewPasswordFieldPlaceholder'
  );

  String profile_SubmitProfileUpdate() => Intl.message(
    'Submit',
    name: 'profile_SubmitProfileUpdate'
  );

  String profile_ProfileUpdateSuccessful() => Intl.message(
    'Profile updated successfully',
    name: 'profile_ProfileUpdateSuccessful'
  );

  // endregion

  // region Favorites

  String favorites_EmptyFavorites() => Intl.message(
    'No Favorites',
    name: 'favorites_EmptyFavorites'
  );

  // endregion

}