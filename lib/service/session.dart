import 'dart:convert';

import 'package:arava_app/model/jwt_auth_credentials/jwt_auth_credentials.dart';
import 'package:arava_app/service/cache_manager.dart';


class Session {
  static final String _kCredentials = "com.arava.credentials";
  static final String _kFirstAppLaunch = "com.arava.first_app_launch";
  static final String _kPreferredLocale = "com.arava.preferred_locale";

  final CacheManager cacheManager;

  Session({this.cacheManager});

  Future<void> persistCredentials(JwtAuthCredentials credentials) async {
    await cacheManager.setStringAsync(_kCredentials, json.encode(credentials));
    return null;
  }

  Future<JwtAuthCredentials> getCredentials() async {
    final jsonString = await cacheManager.getStringAsync(_kCredentials);
    if (jsonString == null) {
      return null;
    }
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return JwtAuthCredentials.fromJson(jsonMap);
  }

  Future<void> setFirstAppLaunch(bool firstAppLaunch) async {
    await cacheManager.setBoolAsync(_kFirstAppLaunch, firstAppLaunch);
  }

  Future<bool> getFirstAppLaunch() async {
     return await cacheManager.getBoolAsync(_kFirstAppLaunch) ?? true;
  }

  Future<String> getPreferredLocale() async {
    return await cacheManager.getStringAsync(_kPreferredLocale);
  }

  Future<void> setPreferredLocale(String locale) async {
    return await cacheManager.setStringAsync(_kPreferredLocale, locale);
  }
}