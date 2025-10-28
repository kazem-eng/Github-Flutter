abstract class NetConstants {
  static const connectionTimeout = 20; // seconds
  static const baseURL = 'https://api.github.com/';
  static const githubToken =
      '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';

  // header keys
  static const defaultHeader = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $githubToken',
  };

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
