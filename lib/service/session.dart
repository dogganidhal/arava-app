import 'dart:convert';

import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/jwt_auth_credentials/jwt_auth_credentials.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/user/user.dart';
import 'package:arava/service/cache_manager.dart';
import 'package:meta/meta.dart';


class Session {
  static final String _kUser = "com.arava.user";
  static final String _kCredentials = "com.arava.credentials";
  static final String _kFirstAppLaunch = "com.arava.first_app_launch";
  static final String _kPreferredLocale = "com.arava.preferred_locale";
  static final String _kApiConfiguration = "com.arava.api_configuration";
  static final String _kFavorites = "com.arava.favorites";

  final CacheManager cacheManager;

  final Map<String, dynamic> _cacheMap = {
    _kUser: null,
    _kFavorites: []
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

  List<Poi> get cachedFavorites => _cacheMap[_kFavorites];

  Future<List<Poi>> getFavorites() async {
    final jsonString = await cacheManager.getStringAsync(_kFavorites);
    if (jsonString == null) {
      return [];
    }
    final favorites = (json.decode(jsonString) as List)
      .map((jsonMap) => Poi.fromJson(jsonMap))
      .toList();
    _cacheMap[_kFavorites] = favorites;
    return favorites;
  }

  Future<void> setFavorites(List<Poi> favorites) async {
    final jsonString = json.encode(favorites
      .map((favorite) => favorite.toJson())
      .toList()
    );
    _cacheMap[_kFavorites] = favorites;
    await cacheManager.setStringAsync(_kFavorites, jsonString);
  }

  Future<void> clearFavorites() async {
    await cacheManager.removeAsync(_kFavorites);
  }

  bool hasFavorite(Poi favorite) => (_cacheMap[_kFavorites] as List<Poi>)
    .any((poi) => favorite.id == poi.id);

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