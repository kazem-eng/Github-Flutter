import 'package:flutter_issues_viewer/modules/data/models/issue_export.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';

class IssuesModel {
  const IssuesModel({
    this.currentPage = 1,
    this.issues = const [],
    this.viewedIssueIds = const [],
    this.filteredBy = IssuesFilterBy.assigned,
    this.sortBy = IssuesSortBy.created,
    this.isDarkTheme = true,
  });

  IssuesModel copyWith({
    List<Issue>? issues,
    List<String>? viewedIssueIds,
    IssuesFilterBy? filteredBy,
    IssuesSortBy? sortBy,
    int? currentPage,
    bool? isDarkTheme,
  }) {
    return IssuesModel(
      issues: issues ?? this.issues,
      filteredBy: filteredBy ?? this.filteredBy,
      sortBy: sortBy ?? this.sortBy,
      currentPage: currentPage ?? this.currentPage,
      viewedIssueIds: viewedIssueIds ?? this.viewedIssueIds,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }

  final List<Issue> issues;
  final List<String> viewedIssueIds;
  final int currentPage;
  final IssuesFilterBy filteredBy;
  final IssuesSortBy sortBy;
  final bool isDarkTheme;
}
