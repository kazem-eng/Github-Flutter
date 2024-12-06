import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_filter/issue_filter_model.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_filter/issue_filter_props.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_filter/issue_filter_viewmodel.dart';
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
  late IssueFilterViewmodel viewModel;
  late NavigationService mockNavigationService;

  setUp(() {
    mockNavigationService = getAndRegisterNavigationService();
    viewModel = IssueFilterViewmodel();
  });

  tearDown(() {
    removeRegistrationIfExists<NavigationService>();
  });

  group('IssueFilterViewmodel - ', () {
    test(
        'Given initial state, '
        'When view model is created, '
        'Then state is BaseState.initial', () {
      // arrange & act & assert
      expect(viewModel.state, const BaseState<IssueFilterModel>.initial());
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
      await viewModel.initVM(props);

      // assert
      expect(viewModel.model.selectedFilter, IssuesFilterBy.assigned);
      expect(viewModel.state, BaseState.success(viewModel.model));
    });

    test(
        'Given a filter option, '
        'When onFilterChanged is called, '
        'Then selectedFilter is updated and navigation occurs', () {
      // arrange
      const filter = IssuesFilterBy.mentioned;

      // act
      viewModel.onFilterChanged(filter);

      // assert
      expect(viewModel.model.selectedFilter, filter);
      verify(mockNavigationService.goBack(filter)).called(1);
    });
  });
}
