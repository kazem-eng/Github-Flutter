import 'dart:developer';

import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/data/services/services_export.dart';
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
  final _localStorageService = locator<ILocalStorageService>();

  late final IssueFilterCallback _filterBottomSheet;
  late final IssueSortCallback _sortBottomSheet;
  late final void Function({required bool isDark}) _themeInitializer;

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
        final updatedData = data.map((e) {
          final viewed = _model.viewedIssueIds.contains(e.id.toString());
          return e.copyWith(isViewed: viewed);
        }).toList();
        _model = _model.copyWith(
          issues: [
            ..._model.issues,
            ...updatedData,
          ],
        );
        setState = BaseState.success(_model);
      },
      error: (data, exception) {
        log('Error fetching issues: $exception');
        setState = BaseState.error(exception: exception);
      },
    );
  }

  Future<void> _getStorageData() async {
    final viewedIssues = _localStorageService.getViewedIssues();
    final isDarkTheme = _localStorageService.isDarkTheme();
    _themeInitializer(isDark: isDarkTheme);
    _model = _model.copyWith(
      viewedIssueIds: viewedIssues,
      isDarkTheme: isDarkTheme,
    );
    notifyListeners();
  }

  void _addViewedIssue({required int index}) {
    _model.issues[index] = _model.issues[index].copyWith(isViewed: true);
    final viewedIssues = [..._model.viewedIssueIds];
    viewedIssues.add(_model.issues[index].id.toString());
    _model = _model.copyWith(viewedIssueIds: viewedIssues);
    _localStorageService.setViewedIssues(viewedIssues);
    notifyListeners();
  }

  // Events
  Future<void> initCalendar({
    required IssueFilterCallback filterBottomSheet,
    required IssueSortCallback sortBottomSheet,
    required void Function({required bool isDark}) themeInitializer,
  }) async {
    _filterBottomSheet = filterBottomSheet;
    _sortBottomSheet = sortBottomSheet;
    _themeInitializer = themeInitializer;
    await _getStorageData();
    await _fetchIssues();
  }

  Future<void> moreIssues() async {
    _model = _model.copyWith(currentPage: _model.currentPage + 1);
    await _fetchIssues();
  }

  void openIssueDetails(int index) {
    _addViewedIssue(index: index);
    _navigationService.goTo(
      Routes.issueDetail,
      arguments: IssueDetailsProps(issue: _model.issues[index]),
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

  void switchTheme() {
    final revertedTheme = !_model.isDarkTheme;
    _themeInitializer(isDark: revertedTheme);
    _localStorageService.setIsDarkTheme(isDarkTheme: revertedTheme);
    _model = _model.copyWith(isDarkTheme: revertedTheme);
    notifyListeners();
  }
}
