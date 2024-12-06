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
