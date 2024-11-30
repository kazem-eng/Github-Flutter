import 'dart:developer';

import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/i_issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/views/events/issues_model.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class IssuesViewmodel extends BaseViewModel<BaseState<IssuesModel>> {
  IssuesViewmodel({
    BaseState<IssuesModel> initState = const BaseState.loading(),
  }) : super(initState);

  // Injected services
  final _issuesNetworService = locator<IIssuesNetworkService>();

  //state
  var _model = const IssuesModel();
  IssuesModel get model => _model;

  // Controll methods
  Future<void> _fetchIssues() async {
    log('Fetching issues...');
    final response = await _issuesNetworService.issues(
      pageNumber: _model.currentPage,
      filterBy: _model.filteredBy,
      sortBy: _model.sortBy,
    );
    response.when(
      success: (data) {
        log(data.toString());
        _model = _model.copyWith(issues: [..._model.issues, ...data]);
        setState = BaseState.success(_model);
      },
      error: (_, message) {
        log('Error fetching issues: $message');
        // TODO Show proper error message
        setState = const BaseState.error();
      },
    );
  }

  // Events
  Future<void> initCalendar() async {
    await _fetchIssues();
  }

  void moreIssues() {
    _model = _model.copyWith(currentPage: _model.currentPage + 1);
    _fetchIssues();
  }
}
