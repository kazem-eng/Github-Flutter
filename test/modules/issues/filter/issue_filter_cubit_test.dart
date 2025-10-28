import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/features/issues/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_filter/issue_filter_model.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_filter/issue_filter_props.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_filter/issue_filter_cubit.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

import '../../../mocks/services_mocks.dart';

@GenerateNiceMocks([
  MockSpec<IssueFilterCallback>(onMissingStub: OnMissingStub.returnDefault),
])
class IssueFilterCallback {
  Future<IssuesFilterBy> filterIssues(IssueFilterProps props) async {
    return IssuesFilterBy.assigned;
  }
}

void main() {
  late IssueFilterCubit cubit;
  late NavigationService mockNavigationService;

  setUp(() {
    mockNavigationService = getAndRegisterNavigationService();
    cubit = IssueFilterCubit();
  });

  tearDown(() {
    removeRegistrationIfExists<NavigationService>();
  });

  group('IssueFilterCubit - ', () {
    test(
        'Given initial state, '
        'When view model is created, '
        'Then state is BaseState.initial', () {
      // arrange & act & assert
      expect(cubit.state, const BaseState<IssueFilterModel>.initial());
    });

    test(
        'Given IssueFilterProps, '
        'When initVM is called, '
        'Then selectedFilter is set and state is updated', () async {
      // arrange
      const props = IssueFilterProps(
        selectedFilter: IssuesFilterBy.assigned,
      );

      // act
      await cubit.initVM(props);

      // assert
      expect(cubit.model.selectedFilter, IssuesFilterBy.assigned);
      expect(cubit.state, BaseState.success(cubit.model));
    });

    test(
        'Given a filter option, '
        'When onFilterChanged is called, '
        'Then selectedFilter is updated and navigation occurs', () {
      // arrange
      const filter = IssuesFilterBy.mentioned;

      // act
      cubit.onFilterChanged(filter);

      // assert
      expect(cubit.model.selectedFilter, filter);
      verify(mockNavigationService.goBack(filter)).called(1);
    });
  });
}
