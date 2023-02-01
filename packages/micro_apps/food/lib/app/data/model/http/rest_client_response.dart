/// class which tell us response of backend
class RestClientResponse<T> {
  ///Constructor
  const RestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  /// data
  final T? data;

  ///statusCode
  final int? statusCode;

  /// StatusMessage
  final String? statusMessage;
}
