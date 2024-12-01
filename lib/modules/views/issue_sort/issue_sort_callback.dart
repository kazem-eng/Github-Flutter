import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_props.dart';

typedef IssueSortCallback = Future<IssuesSortBy?> Function(
  IssueSortProps props,
);
