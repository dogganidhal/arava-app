import 'package:shared_preferences/shared_preferences.dart';


class CacheManager {
  final Future<SharedPreferences> _instance = SharedPreferences.getInstance();

  Future<String> getStringAsync(String key) async {
    final instance = await _instance;
    return instance.getString(key);
  }

  Future<void> setStringAsync(String key, String value) async {
    final instance = await _instance;
    instance.setString(key, value);
  }

  Future<bool> getBoolAsync(String key) async {
    final instance = await _instance;
    return instance.getBool(key);
  }

  Future<void> setBoolAsync(String key, bool value) async {
    final instance = await _instance;
    instance.setBool(key, value);
  }
}