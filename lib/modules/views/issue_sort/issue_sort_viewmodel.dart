import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_model.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/navigation/navigation_service.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

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
