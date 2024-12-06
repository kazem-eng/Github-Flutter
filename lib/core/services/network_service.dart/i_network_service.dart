import 'package:flutter_issues_viewer/core/base/base_net_response/base_net_response.dart';

abstract class INetworkService<T> {
  Future<BaseNetResponse<T>> get({
    required String path,
    Map<String, String>? header,
  });
}
