import 'package:flutter_issues_viewer/features/issues/domain/entities/issue/issue.dart';

class IssueDetailsProps {
  const IssueDetailsProps({
    this.issue = const Issue(),
  });

  final Issue issue;
}
