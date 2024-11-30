import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/i_network_service.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_service.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/i_issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/views/events/issues_viewmodel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void configureDependencies() {
  locator
    // Core services
    ..registerSingleton<INetworkService>(NetworkService())

    // Issues module
    ..registerFactory<IIssuesNetworkService>(() => IssuesNetworkService())
    ..registerFactory(() => IssuesViewmodel());
}
