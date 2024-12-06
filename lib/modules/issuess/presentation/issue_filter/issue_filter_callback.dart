import 'package:flutter_issues_viewer/modules/issuess/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_filter/issue_filter_props.dart';

typedef IssueFilterCallback = Future<IssuesFilterBy?> Function(
  IssueFilterProps props,
);