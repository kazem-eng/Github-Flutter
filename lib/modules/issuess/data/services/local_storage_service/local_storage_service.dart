import 'dart:developer';

import 'package:flutter_issues_viewer/modules/issuess/data/services/local_storage_service/i_local_storage_service.dart';
import 'package:flutter_issues_viewer/core/services/shared_preferences_service/shared_preferences_service_export.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class LocalStorageService implements ILocalStorageService {
  final _storageService = locator<ISharedPreferencesService>();

  @override
  List<String> getViewedIssues() {
    try {
      return _storageService.getStringList(StorageKey.viewedIssues.name) ?? [];
    } catch (e) {
      _reportIssue(e, 'isDarkTheme');
      return [];
    }
  }

  @override
  Future<bool> setViewedIssues(List<String> issueIds) {
    try {
      return _storageService.setStringList(
        key: StorageKey.viewedIssues.name,
        value: issueIds,
      );
    } catch (e) {
      _reportIssue(e, 'setViewedIssues');
      return Future.value(false);
    }
  }
}

void _reportIssue(Object e, String methodName) {
  log('Error in $methodName in  storage: $e');
}
