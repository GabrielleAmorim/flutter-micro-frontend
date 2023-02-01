import './http.dart';

/// RestClient Exception
class RestClientException implements Exception {
  /// Constructor
  RestClientException({
    this.message,
    this.statusCode,
    required this.error,
    this.response,
  });

  /// message
  String? message;

  /// statusCode
  int? statusCode;

  /// error
  dynamic error;

  /// Response
  RestClientResponse<dynamic>? response;

  @override
  String toString() {
    return 'RestClientException{message: $message, statusCode: $statusCode, error: $error, response: $response}';
  }
}
