import 'dart:convert';

import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/jwt_auth_credentials/jwt_auth_credentials.dart';
import 'package:arava/model/user/user.dart';
import 'package:arava/service/cache_manager.dart';
import 'package:meta/meta.dart';


class Session {
  static final String _kUser = "com.arava.user";
  static final String _kCredentials = "com.arava.credentials";
  static final String _kFirstAppLaunch = "com.arava.first_app_launch";
  static final String _kPreferredLocale = "com.arava.preferred_locale";
  static final String _kApiConfiguration = "com.arava.api_configuration";

  final CacheManager cacheManager;

  final Map<String, dynamic> _cacheMap = {
    _kUser: null
  };

  Session({@required this.cacheManager});

  // region Auth credentials related operations

  User get cachedUser => _cacheMap[_kUser];

  Future<User> getUser() async {
    final jsonString = await cacheManager.getStringAsync(_kUser);
    if (jsonString == null) {
      return null;
    }
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final User user = User.fromJson(jsonMap);
    _cacheMap[_kUser] = user;
    return user;
  }

  Future<void> setUser(User user) async {
    await cacheManager.setStringAsync(_kUser, json.encode(user.toJson()));
    _cacheMap[_kUser] = user;
  }

  Future<void> clearUser() async {
    await cacheManager.removeAsync(_kUser);
    _cacheMap[_kUser] = null;
  }

  Future<void> persistCredentials(JwtAuthCredentials credentials) async {
    await cacheManager.setStringAsync(_kCredentials, json.encode(credentials.toJson()));
  }

  Future<JwtAuthCredentials> getCredentials() async {
    final jsonString = await cacheManager.getStringAsync(_kCredentials);
    if (jsonString == null) {
      return null;
    }
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return JwtAuthCredentials.fromJson(jsonMap);
  }

  Future<void> clearCredentials() async {
    await cacheManager.removeAsync(_kCredentials);
  }

  // endregion

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

  Future<ApiConfiguration> getApiConfiguration() async {
    final jsonString = await cacheManager.getStringAsync(_kApiConfiguration);
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);
      return ApiConfiguration.fromJson(jsonMap);
    }
    return null;
  }

  Future<void> setApiConfiguration(ApiConfiguration configuration) async {
    return await cacheManager.setStringAsync(_kApiConfiguration, json.encode(configuration.toJson()));
  }


}