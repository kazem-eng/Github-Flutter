enum StorageKey {
  appTheme,
  viewedIssues;
}

abstract class ILocalStorageService {
  bool isDarkTheme();
  Future<bool> setIsDarkTheme({required bool isDarkTheme});

  List<String> getViewedIssues();
  Future<bool> setViewedIssues(List<String> issueIds);
}
