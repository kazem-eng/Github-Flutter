import 'package:flutter_issues_viewer/modules/issuess/domain/entities/issue/issue.dart';

class IssueDetailsProps {
  const IssueDetailsProps({
    this.issue = const Issue(),
  });

  final Issue issue;
}