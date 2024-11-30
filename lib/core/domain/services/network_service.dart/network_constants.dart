abstract class NetConstants {
  static const connectionTimeout = 10;
  static const baseURL = 'https://api.github.com/';
  static const githubToken = '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';

  // header keys

  static const defaultHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $githubToken',
  };
  static const placeholederURL = 'http://via.placeholder.com/350x150';

  // Error Messages:
  static const noConnection =
      'No Internet connection\nTo see pictures please check your connectivity';
  static const connectionFailure = 'Communication Failure. ';
  static const invalidRequest = 'Invalid Request. ';
  static const unauthorizedRequest = 'Unauthorised. ';
  static const communicationError = 'Error During Communication. ';
  static const serverError = 'Server Error. ';
  static const unknownError = 'Something went wrong. ';
  static const formatException = 'Invalid format. Please check url format. ';
}
