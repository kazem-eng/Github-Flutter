import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPreferencesService {
  Future<bool> setStringList({
    required String key,
    required List<String> value,
  });
  List<String>? getStringList(String key);

  bool? getBool(String key);
  Future<bool> setBool({
    required String key,
    required bool value,
  });
}

class SharedPreferencesService extends ISharedPreferencesService {
  SharedPreferencesService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  final SharedPreferences _preferences;

  @override
  Future<bool> setStringList({
    required String key,
    required List<String> value,
  }) async {
    return await _preferences.setStringList(key, value);
  }

  @override
  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  @override
  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  @override
  Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return await _preferences.setBool(key, value);
  }
}
