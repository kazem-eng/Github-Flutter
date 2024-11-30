import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_export.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/issues_network_export.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/navigation/navigator_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void configureDependencies() {
  locator
    // Core services
    ..registerLazySingleton(() => NavigatorController())
    ..registerSingleton<INetworkService>(NetworkService())

    // ------------------------------------------------------------

    // Issues module
    // Data services
    ..registerFactory<IIssuesNetworkService>(() => IssuesNetworkService())

    // Viewmodels
    ..registerFactory(() => IssueDetailsViewmodel())
    ..registerFactory(() => IssuesViewmodel());
}
