import 'dart:developer';

import 'package:flutter_issues_viewer/core/domain/base/base_exception.dart';
import 'package:flutter_issues_viewer/core/domain/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/i_network_service.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue/issue_data_model.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/data/services/network/i_issues_network_service.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue/issue.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class GraphQlIssuesNetworkService implements IIssuesNetworkService {
  final _networkService = locator<INetworkService>(
    instanceName: 'graphqlNetworkService',
  );

  @override
  Future<BaseNetResponse<List<Issue>>> issues({
    bool isPaginated = true,
    int pageNumber = 1,
    IssuesFilterBy? filterBy,
    IssuesSortBy? sortBy,
  }) async {
    const String query = r'''
                query {
                  repository(owner: "flutter", name: "flutter") {
                    issues(first: 30) {
                      nodes {
                        id
                        title
                        url
                        number
                        state
                        createdAt
                        updatedAt
                        closedAt
                        bodyText
                        author {
                          login
                          url
                        }
                        assignees(first: 10) {
                          nodes {
                            login
                            url
                          }
                        }
                        labels(first: 10) {
                          nodes {
                            name
                            color
                            description
                          }
                        }
                        comments {
                          totalCount
                        }
                      }
                    }
                  }
                }
            ''';

    final response = await _networkService.get(
      path: query,
    );
    return response.when(
      success: (response) {
        log(response.toString());

        try {
          final issues = (response as List)
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
}
