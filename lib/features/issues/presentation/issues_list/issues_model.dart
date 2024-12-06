import 'package:flutter_issues_viewer/features/issues/data/models/issue_export.dart';
import 'package:flutter_issues_viewer/features/issues/domain/entities/issue/issue.dart';

class IssuesModel {
  const IssuesModel({
    this.currentPage = 1,
    this.issues = const [],
    this.viewedIssueIds = const [],
    this.filteredBy,
    this.sortBy,
  });

  IssuesModel copyWith({
    List<Issue>? issues,
    List<String>? viewedIssueIds,
    IssuesFilterBy? filteredBy,
    IssuesSortBy? sortBy,
    int? currentPage,
  }) {
    return IssuesModel(
      issues: issues ?? this.issues,
      filteredBy: filteredBy ?? this.filteredBy,
      sortBy: sortBy ?? this.sortBy,
      currentPage: currentPage ?? this.currentPage,
      viewedIssueIds: viewedIssueIds ?? this.viewedIssueIds,
    );
  }

  final List<Issue> issues;
  final List<String> viewedIssueIds;
  final int currentPage;
  final IssuesFilterBy? filteredBy;
  final IssuesSortBy? sortBy;
}
