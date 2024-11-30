import 'dart:convert';
import 'dart:developer';

import 'package:flutter_issues_viewer/core/domain/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/i_network_service.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_constants.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_exception.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_data_model.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/i_issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/issues_endpoints.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class IssuesNetworkService implements IIssuesNetworkService {
  final _networkService = locator<INetworkService>();

  static const _issuesPerPage = 10;
  static const _perPage = 'per_page=';
  static const _pageNo = 'page=';
  static const _sort = 'sort=';
  static const _filter = 'filter=';

  @override
  Future<BaseNetResponse<List<Issue>>> issues({
    bool isPaginated = true,
    int pageNumber = 1,
    IssuesFilterBy filterBy = IssuesFilterBy.assigned,
    IssuesSortBy sortBy = IssuesSortBy.created,
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
          // Handle the response
          final handledResponse = _handleResponse(response);

          // If the response is an error, return it
          if (handledResponse is BaseNetResponseError) {
            log(handledResponse.toString());
            return BaseNetResponse.error(
              message: handledResponse.data.message,
            );
          }

          // Parse the JSON data into a list of Issue objects
          final issues = handledResponse.data.isEmpty
              ? <Issue>[]
              : handledResponse.data
                  .map<Issue>(
                    (json) => Issue.fromData(
                      IssueDataModel.fromJson(json as Map<String, dynamic>),
                    ),
                  )
                  .toList();

          return BaseNetResponse.success(issues);
        } catch (e) {
          log('Error parsing JSON: $e');
          return const BaseNetResponse.error(
            message: 'Error parsing JSON data',
          );
        }
      },
      error: (data, message) {
        log('Error fetching issues: $message');
        return BaseNetResponse.error(
          message: 'Error fetching issues: $message',
        );
      },
    );
  }

  String _buildPath(
    bool isPaginated,
    int pageNumber,
    IssuesSortBy sortBy,
    IssuesFilterBy filterBy,
  ) {
    final basePath = IssueEndpoints.flutterRepoIssues;
    final pageInfo =
        isPaginated ? '$_perPage$_issuesPerPage&$_pageNo$pageNumber&' : '';
    final sortInfo = '$_sort${sortBy.name}&';
    final filterInfo = '$_filter${filterBy.name}';
    final path = '$basePath?$pageInfo$sortInfo$filterInfo';
    return path;
  }

  BaseNetResponse _handleResponse(response) {
    final body = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        return BaseNetResponse.success(body);
      case 400:
        return BaseNetResponse.error(data: BadRequestException());
      case 401:
      case 403:
      case 422:
        final message = body['message'];
        return BaseNetResponse.error(data: message);
      case 500:
        return BaseNetResponse.error(data: ServerException());
      default:
        return BaseNetResponse.error(
          data: FetchDataException(
            message: '${NetConstants.connectionFailure}${response.statusCode}}',
          ),
        );
    }
  }
}
