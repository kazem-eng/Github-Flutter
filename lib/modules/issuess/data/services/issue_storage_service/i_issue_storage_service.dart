enum StorageKey {
  viewedIssues;
}

abstract class IIssueStorageService {
  List<String> getViewedIssues();
  Future<bool> setViewedIssues(List<String> issueIds);
}
