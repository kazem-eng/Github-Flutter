enum CoreStorageKey {
  appTheme,
}

abstract class ILocalStorageService {
  bool isDarkTheme();
  Future<bool> setDarkTheme({required bool isDarkTheme});
}
