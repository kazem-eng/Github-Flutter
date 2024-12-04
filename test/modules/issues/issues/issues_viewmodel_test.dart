import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/data/services/services_export.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue/issue.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_model.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/navigation/navigation_service.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

import '../../../mocks/services_mocks.dart';
import '../filter/issue_filter_viewmodel_test.mocks.dart';
import '../sort/issue_sort_viewmodel_test.mocks.dart';

void main() {
  setUp(() {
    getAndRegisterIssuesNetworkService();
    getAndRegisterNavigationService();
    getAndRegisterISharedPreferencesService();
    getAndRegisterILocalStorageService();
  });

  tearDown(() {
    removeRegistrationIfExists<NavigationService>();
    removeRegistrationIfExists<IIssuesNetworkService>();
    removeRegistrationIfExists<ISharedPreferencesService>();
    removeRegistrationIfExists<ILocalStorageService>();
  });

  group('IssuesViewmodel -', () {
    test(
        'Given initial state, '
        'When view model is created, '
        'Then state is BaseState.loading', () {
      // arrange & act
      final viewModel = IssuesViewmodel();

      // assert
      expect(viewModel.state, const BaseState<IssuesModel>.loading());
    });

    test(
        'Given view model, '
        'When view model is initialize , '
        'Then the model is updated subsequently', () async {
      // arrange
      const issues = [
        Issue(id: 1, title: 'Issue 1'),
        Issue(id: 2, title: 'Issue 2'),
      ];

      final issueNetService = getAndRegisterIssuesNetworkService(
        issuesStub: const BaseNetResponse.success(issues),
      );

      final viewModel = IssuesViewmodel();

      // act
      await viewModel.initCalendar(
        filterBottomSheet: (IssueFilterProps _) => Future.value(),
        sortBottomSheet: (IssueSortProps _) => Future.value(),
        themeInitializer: ({required isDark}) {},
      );

      // assert
      verify(issueNetService.issues());
      expect(viewModel.state, BaseState.success(viewModel.model));
      expect(viewModel.model.currentPage, 1);
      expect(viewModel.model.filteredBy, IssuesFilterBy.assigned);
      expect(viewModel.model.sortBy, IssuesSortBy.created);
      expect(viewModel.model.issues, isNotEmpty);
      expect(viewModel.model.issues, issues);
    });

    test(
        'Given a sort option, '
        'When onSortChanged is called, '
        'Then selectedSort is updated and issues are fetched sorted', () async {
      // arrange
      const expectedSort = IssuesSortBy.updated;
      final dateNow = DateTime(2023, 1, 1, 12);
      final dateYesterday = dateNow.subtract(const Duration(days: 1));

      final initIssues = [
        Issue(
          id: 1,
          title: 'Issue 1',
          updatedAt: dateYesterday,
        ),
        Issue(
          id: 2,
          title: 'Issue 2',
          updatedAt: dateNow,
        ),
      ];
      final sortMock = MockIssueSortCallback();
      when(
        sortMock.sortIssues(argThat(isNotNull)),
      ).thenAnswer((_) => Future.value(expectedSort));

      // Before sort
      getAndRegisterIssuesNetworkService(
        issuesStub: BaseNetResponse.success(initIssues),
      );
      final viewModel = IssuesViewmodel();
      // act
      await viewModel.initCalendar(
        filterBottomSheet: (IssueFilterProps _) => Future.value(),
        sortBottomSheet: sortMock.sortIssues,
        themeInitializer: ({required isDark}) {},
      );
      // assert
      expect(viewModel.model.sortBy, IssuesSortBy.created); // default sort
      expect(viewModel.model.issues, initIssues);

      // Model after sort
      // act
      await viewModel.sort();

      // assert
      expect(viewModel.model.sortBy, expectedSort);
    });
    test(
        'Given a filter option, '
        'When filter is changed, '
        'Then selectedFilter is updated', () async {
      // arrange
      const initIssues = [
        Issue(id: 1, title: 'Issue 1'),
        Issue(id: 2, title: 'Issue 2'),
      ];
      const expectedFilter = IssuesFilterBy.repos;
      final filterMock = MockIssueFilterCallback();
      when(
        filterMock.filterIssues(argThat(isNotNull)),
      ).thenAnswer((_) => Future.value(expectedFilter));

      // Before sort
      getAndRegisterIssuesNetworkService(
        issuesStub: const BaseNetResponse.success(initIssues),
      );
      final viewModel = IssuesViewmodel();
      // act
      await viewModel.initCalendar(
        filterBottomSheet: filterMock.filterIssues,
        sortBottomSheet: (IssueSortProps props) {
          return Future.value();
        },
        themeInitializer: ({required isDark}) {},
      );
      // assert
      expect(
        viewModel.model.filteredBy,
        IssuesFilterBy.assigned,
      ); // default filter
      expect(viewModel.model.issues, initIssues);

      // Model after filter
      // act
      await viewModel.filter();

      // assert
      expect(viewModel.model.filteredBy, expectedFilter);
    });

    test(
        'Given more issues, '
        'When moreIssues is called, '
        'Then issues are fetched and appended to the existing list', () async {
      // arrange
      const initialIssues = [
        Issue(id: 1, title: 'Issue 1'),
      ];
      const newIssues = [
        Issue(id: 2, title: 'Issue 2'),
      ];

      getAndRegisterIssuesNetworkService(
        issuesStub: const BaseNetResponse.success(initialIssues),
      );
      final viewModel = IssuesViewmodel();
      await viewModel.initCalendar(
        filterBottomSheet: (IssueFilterProps _) => Future.value(),
        sortBottomSheet: (IssueSortProps _) => Future.value(),
        themeInitializer: ({required isDark}) {},
      );

      getAndRegisterIssuesNetworkService(
        issuesStub: const BaseNetResponse.success(newIssues),
        pageNumber: 2,
      );

      // act
      await viewModel.moreIssues();

      // assert
      expect(viewModel.model.currentPage, 2);
      expect(viewModel.model.issues.length, 2);
      expect(viewModel.state, BaseState.success(viewModel.model));
    });
  });
}
