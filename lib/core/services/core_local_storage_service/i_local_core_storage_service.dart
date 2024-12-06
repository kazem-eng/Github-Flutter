enum CoreStorageKey {
  appTheme,
}

abstract class ICoreLocalStorageService {
  bool isDarkTheme();
  Future<bool> setIsDarkTheme({required bool isDarkTheme});
}
