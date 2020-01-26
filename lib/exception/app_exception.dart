import 'package:arava/i18n/app_localizations.dart';
import 'package:flutter/material.dart';

/// TODO: This is a very naïve approach to localize error messages,
/// better find a better way

class LocalizedErrorMessage {
  final String english;
  final String french;
  final String chinese;
  final Map<String, String> _map;

  LocalizedErrorMessage({
    @required this.english,
    @required this.french,
    @required this.chinese
  }) : _map = {
    'en': english,
    'fr': french,
    'zh_Hans': chinese
  };

  operator [](String languageCode) {
    return _map[languageCode];
  }
}

abstract class AppException implements Exception {
  String get code;
  @protected
  LocalizedErrorMessage get localizedMessage;

  String getLocalizedMessage(BuildContext context) {
    return localizedMessage[AppLocalizations.currentLanguageCode];
  }
}

class UnexpectedException extends AppException {
  @override
  String get code => "UNEXPECTED_ERROR";

  @override
  LocalizedErrorMessage get localizedMessage => LocalizedErrorMessage(
    english: "An unexpected error has occured",
    french: "Une erreur est survenue",
    chinese: "发生意外错误"
  );
}

class ConnectivityException extends AppException {
  @override
  String get code => "CONNECTIVITY_ERROR";

  @override
  LocalizedErrorMessage get localizedMessage => LocalizedErrorMessage(
    english: "Internet connection is required for the requested resource",
    french: "La connexion internet est requise pour la ressource demandée",
    chinese: "要求的资源需要Internet连接"
  );
}