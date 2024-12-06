import 'dart:developer';

import 'package:flutter_issues_viewer/core/base/base_exception.dart';
import 'package:flutter_issues_viewer/core/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/core/services/network_service.dart/i_network_service.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/models/issue/issue_data_model.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/services/issue_network_service/i_issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/services/issue_network_service/issues_endpoints.dart';
import 'package:flutter_issues_viewer/modules/issuess/domain/entities/issue/issue.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class IssuesNetworkService implements IIssuesNetworkService {
  final _networkService = locator<INetworkService>();

  static const _issuesPerPage = 20;
  static const _perPage = 'per_page=';
  static const _pageNo = 'page=';
  static const _sort = 'sort=';
  static const _filter = 'filter=';

  @override
  Future<BaseNetResponse<List<Issue>>> issues({
    bool isPaginated = true,
    int pageNumber = 1,
    IssuesFilterBy? filterBy,
    IssuesSortBy? sortBy,
  }) async {
    // Build the path based on the parameters
    String path = _buildPath(
      isPaginated,
      pageNumber,
      sortBy,
      filterBy,
    );

    final response = await _networkService.get(
      path: path,
    );
    return response.when(
      success: (response) {
        log(response.toString());

        try {
          final issues = response.isEmpty
              ? <Issue>[]
              : response
                  .map<Issue>(
                    (json) => Issue.fromData(
                      IssueDataModel.fromJson(json as Map<String, dynamic>),
                    ),
                  )
                  .toList();

          return BaseNetResponse.success(issues);
        } catch (e) {
          log('Error parsing JSON: $e');
          return BaseNetResponse.error(
            exception: BaseException(
              prefix: 'IssuesNetworkService',
              message: 'Error parsing JSON',
            ),
          );
        }
      },
      error: (exception) {
        log(exception.toString());
        return BaseNetResponse.error(
          exception: BaseException(
            prefix: 'IssuesNetworkService',
            message: 'Error fetching issues: ${exception.toString()}',
          ),
        );
      },
    );
  }

  String _buildPath(
    bool isPaginated,
    int pageNumber,
    IssuesSortBy? sortBy,
    IssuesFilterBy? filterBy,
  ) {
    final basePath = IssueEndpoints.flutterRepoIssues;
    final pageInfo =
        isPaginated ? '$_perPage$_issuesPerPage&$_pageNo$pageNumber&' : '';
    final sortInfo = sortBy != null ? '$_sort${sortBy.name}&' : '';
    final filterInfo = filterBy != null ? '$_filter${filterBy.name}' : '';
    final path = '$basePath?$pageInfo$sortInfo$filterInfo';
    return path;
  }
}
