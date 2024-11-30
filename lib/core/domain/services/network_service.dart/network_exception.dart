import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_constants.dart';

class BaseException implements Exception {
  BaseException({
    required this.prefix,
    required this.message,
  });

  final String prefix;
  final String message;

  @override
  String toString() => '$prefix$message';
}

//Network Exceptions
class FetchDataException extends BaseException {
  FetchDataException({String? message})
      : super(
          message: message ?? '',
          prefix: NetConstants.communicationError,
        );
}

class BadRequestException extends BaseException {
  BadRequestException({String? message})
      : super(
          message: message ?? '',
          prefix: NetConstants.invalidRequest,
        );
}

class UnauthorisedException extends BaseException {
  UnauthorisedException({String? message})
      : super(
          message: message ?? '',
          prefix: NetConstants.unauthorizedRequest,
        );
}

class ServerException extends BaseException {
  ServerException({String? message})
      : super(
          message: message ?? '',
          prefix: NetConstants.serverError,
        );
}

class UnknowException extends BaseException {
  UnknowException({String? message})
      : super(
          message: message ?? '',
          prefix: NetConstants.unknownError,
        );
}

class FormatException extends BaseException {
  FormatException({String? message})
      : super(
          message: message ?? '',
          prefix: NetConstants.formatException,
        );
}
