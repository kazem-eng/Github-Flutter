import 'package:flutter_issues_viewer/features/issues/data/models/issue_contracts.dart';

class IssueSortModel {
  const IssueSortModel({
    this.selectedSort,
  });

  final IssuesSortBy? selectedSort;

  IssueSortModel copyWith({
    IssuesSortBy? selectedSort,
  }) {
    return IssueSortModel(
      selectedSort: selectedSort ?? this.selectedSort,
    );
  }
}
