import 'package:flutter_issues_viewer/modules/issues/domain/entities/issue/issue.dart';

class IssueDetailsModel {
  const IssueDetailsModel({
    this.issue = const Issue(),
  });

  final Issue issue;

  IssueDetailsModel copyWith({
    Issue? issue,
  }) {
    return IssueDetailsModel(
      issue: issue ?? this.issue,
    );
  }
}
