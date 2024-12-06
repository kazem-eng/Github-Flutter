import 'package:flutter_issues_viewer/features/issues/data/models/issue_contracts.dart';

class IssueFilterModel {
  const IssueFilterModel({
    this.selectedFilter,
  });

  final IssuesFilterBy? selectedFilter;

  IssueFilterModel copyWith({
    IssuesFilterBy? selectedFilter,
  }) {
    return IssueFilterModel(
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
