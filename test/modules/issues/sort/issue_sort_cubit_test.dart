import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/features/issues/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_sort/issue_sort_model.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_sort/issue_sort_cubit.dart';
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
  late IssueSortCubit cubit;
  late NavigationService mockNavigationService;

  setUp(() {
    mockNavigationService = getAndRegisterNavigationService();

    cubit = IssueSortCubit();
  });

  tearDown(() {
    removeRegistrationIfExists<NavigationService>();
  });

  group('IssueSortCubit - ', () {
    test(
        'Given initial state, '
        'When view model is created, '
        'Then state is BaseState.initial', () {
      // arrange & act & assert
      expect(cubit.state, const BaseState<IssueSortModel>.initial());
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
      await cubit.initVM(props);

      // assert
      expect(cubit.model.selectedSort, IssuesSortBy.created);
      expect(cubit.state, BaseState.success(cubit.model));
    });

    test(
        'Given a sort option, '
        'When onSortChanged is called, '
        'Then selectedSort is updated and navigation occurs', () {
      // arrange
      const sort = IssuesSortBy.updated;

      // act
      cubit.onSortChanged(sort);

      // assert
      expect(cubit.model.selectedSort, sort);
      verify(mockNavigationService.goBack(sort));
    });
  });
}
