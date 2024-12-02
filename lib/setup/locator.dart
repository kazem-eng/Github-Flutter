import 'package:get_it/get_it.dart';

import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_export.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/issues_network_export.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/navigation/navigation_service.dart';

final locator = GetIt.instance;

void configureDependencies() {
  locator
    // Core services
    ..registerLazySingleton(() => NavigationService())
    ..registerSingleton<INetworkService>(NetworkService())

    // ------------------------------------------------------------

    // Issues module
    // Data services
    ..registerFactory<IIssuesNetworkService>(() => IssuesNetworkService())

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
