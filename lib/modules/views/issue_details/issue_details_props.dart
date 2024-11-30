import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';

class IssueDetailsProps {
  const IssueDetailsProps({
    this.issue = const Issue(),
  });

  final Issue issue;
}
