import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';

class IssueSortModel {
  const IssueSortModel({
    this.selectedSort = IssuesSortBy.created,
  });

  final IssuesSortBy selectedSort;

  IssueSortModel copyWith({
    IssuesSortBy? selectedSort,
  }) {
    return IssueSortModel(
      selectedSort: selectedSort ?? this.selectedSort,
    );
  }
}