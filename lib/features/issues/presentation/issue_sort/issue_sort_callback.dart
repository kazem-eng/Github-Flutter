import 'package:flutter_issues_viewer/features/issues/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_sort/issue_sort_props.dart';

typedef IssueSortCallback = Future<IssuesSortBy?> Function(
  IssueSortProps props,
);
