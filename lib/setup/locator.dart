import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/features/issues/data/services/services_export.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_details/issue_details_cubit.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_filter/issue_filter_cubit.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_sort/issue_sort_cubit.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issues_list/issues_cubit.dart';

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

    // Cubits
    ..registerFactory(() => IssueFilterCubit())
    ..registerFactory(() => IssueSortCubit())
    ..registerFactory(() => IssueDetailsCubit())
    ..registerFactory(() => IssuesCubit());

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
