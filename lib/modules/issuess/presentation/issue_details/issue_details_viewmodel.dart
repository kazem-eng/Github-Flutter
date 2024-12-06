import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_details/issue_details_model.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_details/issue_details_props.dart';

class IssueDetailsViewmodel
    extends BaseViewModel<BaseState<IssueDetailsModel>> {
  IssueDetailsViewmodel({
    BaseState<IssueDetailsModel> initState = const BaseState.initial(),
  }) : super(initState);

  //state
  var _model = const IssueDetailsModel();
  IssueDetailsModel get model => _model;

  // Events
  Future<void> initVM(IssueDetailsProps props) async {
    _model = _model.copyWith(issue: props.issue);
    setState = BaseState.success(_model);
  }
}
