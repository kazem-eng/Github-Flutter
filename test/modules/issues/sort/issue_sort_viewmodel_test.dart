import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/modules/issues/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_sort/issue_sort_model.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_sort/issue_sort_viewmodel.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

import '../../../mocks/services_mocks.dart';

@GenerateNiceMocks([
  MockSpec<IssueSortCallback>(onMissingStub: OnMissingStub.returnDefault),
])
class IssueSortCallback {
  Future<IssuesSortBy> sortIssues(IssueSortProps props) async {
    return IssuesSortBy.created;
  }
}

void main() {
  late IssueSortViewmodel viewModel;
  late NavigationService mockNavigationService;

  setUp(() {
    mockNavigationService = getAndRegisterNavigationService();

    viewModel = IssueSortViewmodel();
  });

  tearDown(() {
    removeRegistrationIfExists<NavigationService>();
  });

  group('IssueSortViewmodel - ', () {
    test(
        'Given initial state, '
        'When view model is created, '
        'Then state is BaseState.initial', () {
      // arrange & act & assert
      expect(viewModel.state, const BaseState<IssueSortModel>.initial());
    });

    test(
        'Given IssueSortProps, '
        'When initVM is called, '
        'Then selectedSort is set and state is updated', () async {
      // arrange
      const props = IssueSortProps(
        selectedSort: IssuesSortBy.created,
      );

      // act
      await viewModel.initVM(props);

      // assert
      expect(viewModel.model.selectedSort, IssuesSortBy.created);
      expect(viewModel.state, BaseState.success(viewModel.model));
    });

    test(
        'Given a sort option, '
        'When onSortChanged is called, '
        'Then selectedSort is updated and navigation occurs', () {
      // arrange
      const sort = IssuesSortBy.updated;

      // act
      viewModel.onSortChanged(sort);

      // assert
      expect(viewModel.model.selectedSort, sort);
      verify(mockNavigationService.goBack(sort));
    });
  });
}
