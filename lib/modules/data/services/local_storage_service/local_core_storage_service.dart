import 'dart:developer';

import 'package:flutter_issues_viewer/modules/data/services/local_storage_service/shared_preferences_service.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

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

class LocalStorageService implements ILocalStorageService {
  final _storageService = locator<ISharedPreferencesService>();

  @override
  bool isDarkTheme() {
    try {
      return _storageService.getBool(StorageKey.appTheme.name) ?? false;
    } catch (e) {
      _reportIssue(e, 'isDarkTheme');
      return false;
    }
  }

  @override
  Future<bool> setIsDarkTheme({
    required bool isDarkTheme,
  }) async {
    try {
      return await _storageService.setBool(
        key: StorageKey.appTheme.name,
        value: isDarkTheme,
      );
    } catch (e) {
      _reportIssue(e, 'setIsDarkTheme');
      return false;
    }
  }

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
