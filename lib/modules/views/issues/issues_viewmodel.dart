import 'dart:developer';

import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/i_issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_callback.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_callback.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_model.dart';
import 'package:flutter_issues_viewer/navigation/navigation_service.dart';
import 'package:flutter_issues_viewer/navigation/routes.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class IssuesViewmodel extends BaseViewModel<BaseState<IssuesModel>> {
  IssuesViewmodel({
    BaseState<IssuesModel> initState = const BaseState.loading(),
  }) : super(initState);

  // Injected services
  final _issuesNetworService = locator<IIssuesNetworkService>();
  final _navigationService = locator<NavigationService>();
  late final IssueFilterCallback _filterBottomSheet;
  late final IssueSortCallback _sortBottomSheet;

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
        setState = const BaseState.error();
      },
    );
  }

  // Events
  Future<void> initCalendar({
    required IssueFilterCallback filterBottomSheet,
    required IssueSortCallback sortBottomSheet,
  }) async {
    _filterBottomSheet = filterBottomSheet;
    _sortBottomSheet = sortBottomSheet;
    await _fetchIssues();
  }

  Future<void> moreIssues() async {
    _model = _model.copyWith(currentPage: _model.currentPage + 1);
    await _fetchIssues();
  }

  void openIssueDetails(Issue issue) {
    _navigationService.goTo(
      Routes.issueDetail,
      arguments: IssueDetailsProps(issue: issue),
    );
  }

  Future<void> sort() async {
    final sort = await _sortBottomSheet(
      IssueSortProps(selectedSort: _model.sortBy),
    );
    if (sort == null) {
      return;
    }
    _model = _model.copyWith(sortBy: sort);
    refresh();
  }

  Future<void> filter() async {
    final filter = await _filterBottomSheet(
      IssueFilterProps(selectedFilter: _model.filteredBy),
    );
    if (filter == null) {
      return;
    }
    _model = _model.copyWith(filteredBy: filter);
    refresh();
  }

  Future<void> refresh() async {
    setState = const BaseState.loading();
    _model = _model.copyWith(currentPage: 1, issues: []);
    await _fetchIssues();
  }
}
