import 'package:flutter_issues_viewer/setup/locator.dart';
import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issuess/views/issue_sort/issue_sort_model.dart';
import 'package:flutter_issues_viewer/modules/issuess/views/issue_sort/issue_sort_props.dart';

class IssueSortViewmodel extends BaseViewModel<BaseState<IssueSortModel>> {
  IssueSortViewmodel({
    BaseState<IssueSortModel> initState = const BaseState.initial(),
  }) : super(initState);

  // Injected services
  final _navigationService = locator<NavigationService>();

  //state
  var _model = const IssueSortModel();
  IssueSortModel get model => _model;

  // Events
  Future<void> initVM(IssueSortProps props) async {
    _model = _model.copyWith(selectedSort: props.selectedSort);
    setState = BaseState.success(_model);
  }

  void onSortChanged(IssuesSortBy sort) {
    _model = _model.copyWith(selectedSort: sort);
    notifyListeners();
    _navigationService.goBack(_model.selectedSort);
  }
}
