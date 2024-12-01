import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';

class IssueFilterProps {
  const IssueFilterProps({this.selectedFilter});

  final IssuesFilterBy? selectedFilter;
}
