enum StorageKey {
  viewedIssues;
}

abstract class ILocalStorageService {
  List<String> getViewedIssues();
  Future<bool> setViewedIssues(List<String> issueIds);
}
