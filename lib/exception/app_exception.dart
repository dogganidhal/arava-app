import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/error_code/error_code.dart';
import 'package:flutter/material.dart';


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

typedef LocalizedRemoteException LocalizedExceptionCreator();

abstract class LocalizedRemoteException extends AppException {
  static final Map<ErrorCode, LocalizedExceptionCreator> _kLocalizedExceptionMap = {
    ErrorCode.AUTH_BAD_CREDENTIALS: () => BadCredentialsException(),
    ErrorCode.AUTH_USER_EXISTS: () => UserExistsException()
  };

  @override
  String get code;
  @override
  LocalizedErrorMessage get localizedMessage;

  static LocalizedRemoteException fromErrorCode(ErrorCode errorCode) {
    return _kLocalizedExceptionMap[errorCode]();
  }
}

class UserExistsException extends LocalizedRemoteException {
  @override
  String get code => "AUTH_USER_EXISTS";

  @override
  LocalizedErrorMessage get localizedMessage => LocalizedErrorMessage(
    english: "User exists already, try to login instead",
    french: "Cet utilisateur existe déjà, veuillez vous connectez",
    chinese: "用户已经存在，请尝试登录"
  );
}

class BadCredentialsException extends LocalizedRemoteException {
  @override
  String get code => "AUTH_BAD_CREDENTIALS";

  @override
  LocalizedErrorMessage get localizedMessage => LocalizedErrorMessage(
    english: "Incorrect email or password",
    french: "Adresse email ou mot de passe incorrect",
    chinese: "错误的邮箱帐号或密码"
  );
}

class InternalServerException extends LocalizedRemoteException {
  @override
  String get code => "GENERAL_INTERNAL_SERVER_ERROR";

  @override
  LocalizedErrorMessage get localizedMessage => LocalizedErrorMessage(
    english: "Server is having some trouble right now, please come back later",
    french: "Le serveur est actuellement indisponible, veuillez réessayer ultérieurement",
    chinese: "服务器出现问题，请稍后再回来"
  );
}