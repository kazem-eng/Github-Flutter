import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/modules/issues/data/services/services_export.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_details/issue_details_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_filter/issue_filter_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_sort/issue_sort_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issues_list/issues_viewmodel.dart';

final locator = GetIt.instance;

Future<void> configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator
    // Core services
    ..registerLazySingleton(() => NavigationService())
    ..registerSingleton<INetworkService>(NetworkService())
    ..registerLazySingleton<ISharedPreferencesService>(
      () => SharedPreferencesService(preferences: sharedPreferences),
    )
    ..registerSingleton<ILocalStorageService>(LocalStorageService())
    // ------------------------------------------------------------

    // Issues module
    // Data services
    ..registerFactory<IIssuesNetworkService>(() => IssuesNetworkService())
    ..registerLazySingleton<IIssueStorageService>(() => IssueStorageService())

    // Viewmodels
    ..registerFactory(() => IssueFilterViewmodel())
    ..registerFactory(() => IssueSortViewmodel())
    ..registerFactory(() => IssueDetailsViewmodel())
    ..registerFactory(() => IssuesViewmodel());

  // ------------------------------------------------------------
}

void removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

void resetLazySingletonIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.resetLazySingleton<T>();
  }
}
