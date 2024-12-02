import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_issues_viewer/core/domain/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/i_issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';
import 'package:flutter_issues_viewer/navigation/navigation_service.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

import 'services_mocks.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<IIssuesNetworkService>(onMissingStub: OnMissingStub.returnDefault),
])
void main() {}
NavigationService getAndRegisterNavigationService() {
  removeRegistrationIfExists<NavigationService>();
  final mock = MockNavigationService();
  locator.registerSingleton<NavigationService>(mock);
  return mock;
}

IIssuesNetworkService getAndRegisterIssuesNetworkService({
  BaseNetResponse<List<Issue>>? issuesStub,
  IssuesSortBy? sortBy,
  IssuesFilterBy? filterBy,
  int? pageNumber,
}) {
  removeRegistrationIfExists<IIssuesNetworkService>();
  final mock = MockIIssuesNetworkService();
  if (issuesStub != null) {
    if (sortBy != null) {
      when(
        mock.issues(
          isPaginated: anyNamed('isPaginated'),
          pageNumber: anyNamed('pageNumber'),
          filterBy: anyNamed('filterBy'),
          sortBy: sortBy,
        ),
      ).thenAnswer((_) async => issuesStub);
    } else if (filterBy != null) {
      when(
        mock.issues(
          isPaginated: anyNamed('isPaginated'),
          pageNumber: anyNamed('pageNumber'),
          filterBy: filterBy,
          sortBy: anyNamed('sortBy'),
        ),
      ).thenAnswer((_) async => issuesStub);
    } else if (pageNumber != null) {
      when(
        mock.issues(
          isPaginated: anyNamed('isPaginated'),
          pageNumber: pageNumber,
          filterBy: anyNamed('filterBy'),
          sortBy: anyNamed('sortBy'),
        ),
      ).thenAnswer((_) async => issuesStub);
    } else {
      when(
        mock.issues(
          isPaginated: anyNamed('isPaginated'),
          pageNumber: anyNamed('pageNumber'),
          filterBy: anyNamed('filterBy'),
          sortBy: anyNamed('sortBy'),
        ),
      ).thenAnswer((_) async => issuesStub);
    }
  }

  locator.registerSingleton<IIssuesNetworkService>(mock);
  return mock;
}
