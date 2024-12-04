import 'package:flutter_issues_viewer/core/domain/base/base_exception.dart';
import 'package:flutter_issues_viewer/core/domain/services/network_service.dart/network_constants.dart';

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

class UnknownException extends BaseException {
  UnknownException({String? message})
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
