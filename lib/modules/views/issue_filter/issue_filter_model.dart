import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';

class IssueFilterModel {
  const IssueFilterModel({
    this.selectedFilter = IssuesFilterBy.assigned,
  });

  final IssuesFilterBy selectedFilter;

  IssueFilterModel copyWith({
    IssuesFilterBy? selectedFilter,
  }) {
    return IssueFilterModel(
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
