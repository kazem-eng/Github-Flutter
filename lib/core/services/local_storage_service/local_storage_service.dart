import 'dart:developer';

import 'package:flutter_issues_viewer/core/services/local_storage_service/i_local_storage_service.dart';
import 'package:flutter_issues_viewer/core/services/shared_preferences_service/shared_preferences_service_export.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class LocalStorageService implements ILocalStorageService {
  final _storageService = locator<ISharedPreferencesService>();

  @override
  bool isDarkTheme() {
    try {
      return _storageService.getBool(CoreStorageKey.appTheme.name) ?? false;
    } catch (e) {
      _reportIssue(e, 'isDarkTheme');
      return false;
    }
  }

  @override
  Future<bool> setDarkTheme({
    required bool isDarkTheme,
  }) async {
    try {
      return await _storageService.setBool(
        key: CoreStorageKey.appTheme.name,
        value: isDarkTheme,
      );
    } catch (e) {
      _reportIssue(e, 'setIsDarkTheme');
      return false;
    }
  }
}

void _reportIssue(Object e, String methodName) {
  log('Error in $methodName in  storage: $e');
}
