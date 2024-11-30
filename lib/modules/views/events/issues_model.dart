import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_data_model.dart';

class IssuesModel {
  const IssuesModel({
    this.currentPage = 1,
    this.issues = const [],
    this.filteredBy = IssuesFilterBy.assigned,
    this.sortBy = IssuesSortBy.created,
  });

  IssuesModel copyWith({
    List<Issue>? issues,
    IssuesFilterBy? filteredBy,
    IssuesSortBy? sortBy,
    int? currentPage,
  }) {
    return IssuesModel(
      issues: issues ?? this.issues,
      filteredBy: filteredBy ?? this.filteredBy,
      sortBy: sortBy ?? this.sortBy,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  final List<Issue> issues;
  final int currentPage;
  final IssuesFilterBy filteredBy;
  final IssuesSortBy sortBy;
}
