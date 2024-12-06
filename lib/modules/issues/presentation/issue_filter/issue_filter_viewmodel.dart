import 'package:flutter_issues_viewer/setup/locator.dart';
import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/modules/issues/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_filter/issue_filter_model.dart';
import 'package:flutter_issues_viewer/modules/issues/presentation/issue_filter/issue_filter_props.dart';

class IssueFilterViewmodel extends BaseViewModel<BaseState<IssueFilterModel>> {
  IssueFilterViewmodel({
    BaseState<IssueFilterModel> initState = const BaseState.initial(),
  }) : super(initState);
  // Injected services
  final _navigationService = locator<NavigationService>();

  // State
  var _model = const IssueFilterModel();
  IssueFilterModel get model => _model;

  // Events
  Future<void> initVM(IssueFilterProps props) async {
    _model = _model.copyWith(selectedFilter: props.selectedFilter);
    setState = BaseState.success(_model);
  }

  void onFilterChanged(IssuesFilterBy filter) {
    _model = _model.copyWith(selectedFilter: filter);
    notifyListeners();
    _navigationService.goBack(_model.selectedFilter);
  }
}
