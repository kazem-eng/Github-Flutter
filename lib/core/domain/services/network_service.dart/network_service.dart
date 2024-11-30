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
      final response = await _client
          .get(
            uri,
            headers: header ?? NetConstants.defaultHeader,
          )
          .timeout(
            const Duration(
              seconds: NetConstants.connectionTimeout,
            ),
          );
      return BaseNetResponse.success(response);
    } on SocketException catch (e) {
      log(e.toString());
      return BaseNetResponse.error(
        data: FetchDataException(message: NetConstants.noConnection),
      );
    } on FormatException catch (e) {
      log(e.toString());
      return BaseNetResponse.error(data: FormatException());
    } catch (error) {
      return BaseNetResponse.error(
        data: UnknowException(message: error.toString()),
      );
    }
  }
}
