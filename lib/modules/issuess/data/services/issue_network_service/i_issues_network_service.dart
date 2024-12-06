import 'package:flutter_issues_viewer/core/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issuess/domain/entities/issue/issue.dart';

abstract class IIssuesNetworkService {
  Future<BaseNetResponse<List<Issue>>> issues({
    bool isPaginated = true,
    int pageNumber = 1,
    IssuesFilterBy? filterBy,
    IssuesSortBy? sortBy,
  });
}