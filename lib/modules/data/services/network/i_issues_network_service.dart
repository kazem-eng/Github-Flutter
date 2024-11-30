import 'package:flutter_issues_viewer/core/domain/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';

abstract class IIssuesNetworkService {
  Future<BaseNetResponse<List<Issue>>> issues({
    bool isPaginated = true,
    int pageNumber = 1,
    IssuesFilterBy filterBy = IssuesFilterBy.assigned,
    IssuesSortBy sortBy = IssuesSortBy.created,
  });
}
