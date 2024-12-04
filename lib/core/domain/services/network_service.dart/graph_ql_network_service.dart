import 'dart:developer';
import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_issues_viewer/core/domain/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/i_network_service.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_constants.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_exception.dart';

class GraphQlNetworkService extends INetworkService {
  GraphQlNetworkService()
      : _client = GraphQLClient(
          link: HttpLink(
            NetConstants.graphQlBaseURL,
            defaultHeaders: NetConstants.defaultHeader,
          ),
          cache: GraphQLCache(),
        );

  final GraphQLClient _client;

  @override
  Future<BaseNetResponse> get({
    required String path,
    Map<String, String>? header,
  }) async {
    try {
      final queryOptions = QueryOptions(
        document: gql(path),
      );
      final response = await _client.query(queryOptions);

      if (response.hasException) {
        // The query failed; handle the errors.
        log('Error: ${response.exception.toString()}');
        return BaseNetResponse.error(
          exception: FetchDataException(message: response.exception.toString()),
        );
      }
      return _handleResponse(response);
    } on SocketException catch (e) {
      log(e.toString());
      return BaseNetResponse.error(
        exception: FetchDataException(message: NetConstants.noConnection),
      );
    } on FormatException catch (e) {
      log(e.toString());
      return BaseNetResponse.error(exception: FormatException());
    } catch (error) {
      return const BaseNetResponse.error();
    }
  }

  BaseNetResponse _handleResponse(response) {
    // TODO handle response
    final body = response.data!['repository']['issues']['nodes'];
    return BaseNetResponse.success(body);
  }
}
