import 'package:flutter_issues_viewer/features/issues/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_filter/issue_filter_props.dart';

typedef IssueFilterCallback = Future<IssuesFilterBy?> Function(
  IssueFilterProps props,
);
