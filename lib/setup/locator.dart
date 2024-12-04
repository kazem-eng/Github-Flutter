import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/graph_ql_network_service.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/issues_graph_ql_network_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_export.dart';
import 'package:flutter_issues_viewer/modules/data/services/services_export.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/navigation/navigation_service.dart';

final locator = GetIt.instance;

Future<void> configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator
    // Core services
    ..registerLazySingleton(
      () => NavigationService(),
    ) // Register the graphql implementation
    ..registerSingleton<INetworkService>(
      GraphQlNetworkService(),
      instanceName: 'graphqlNetworkService',
    )
    // Register the rest implementation
    ..registerSingleton<INetworkService>(
      NetworkService(),
      instanceName: 'restNetworkService',
    )
    ..registerLazySingleton<ISharedPreferencesService>(
      () => SharedPreferencesService(preferences: sharedPreferences),
    )
    ..registerLazySingleton<ILocalStorageService>(() => LocalStorageService())
    // ------------------------------------------------------------

    // Issues module
    // Data services
    ..registerSingleton<IIssuesNetworkService>(
      IssuesNetworkService(),
      instanceName: 'issuesNetworkService',
    )
    ..registerSingleton<IIssuesNetworkService>(
      GraphQlIssuesNetworkService(),
      instanceName: 'graphQlIssuesNetworkService',
    )

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
