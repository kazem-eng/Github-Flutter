import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_issues_viewer/core/domain/base/base_net_response/base_net_response.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/i_network_service.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_constants.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_exception.dart';

class NetworkService extends INetworkService {
  NetworkService() : _client = http.Client();

  final http.Client _client;

  @override
  Future<BaseNetResponse> get({
    required String path,
    Map<String, String>? header,
  }) async {
    try {
      final uri = Uri.parse('${NetConstants.baseURL}$path');
      final newHeader = header ?? NetConstants.defaultHeader;
      final response = await _client
          .get(
            uri,
            headers: newHeader,
          )
          .timeout(
            const Duration(
              seconds: NetConstants.connectionTimeout,
            ),
          );
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
      return BaseNetResponse.error(
        exception: UnknownException(message: error.toString()),
      );
    }
  }

  BaseNetResponse _handleResponse(response) {
    final body = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        return BaseNetResponse.success(body);
      case 400:
        return BaseNetResponse.error(exception: BadRequestException());
      case 401:
      case 403:
      case 422:
        final message = body['message'];
        return BaseNetResponse.error(
          exception: UnauthorisedException(
            message: message,
          ),
        );
      case 500:
        return BaseNetResponse.error(exception: ServerException());
      default:
        return BaseNetResponse.error(
          exception: FetchDataException(
            message: '${NetConstants.connectionFailure}${response.statusCode}}',
          ),
        );
    }
  }
}
