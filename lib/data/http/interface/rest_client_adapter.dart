import '../../model/model.dart';

/// HttpClient contract which it need to have to work
abstract class RestClientAdapter {
  /// RestClientAdapter authenticate
  RestClientAdapter auth();

  /// RestClientAdapter unauthenticated
  RestClientAdapter unAuth();

  /// POST method
  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// GET method
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// PUT method
  Future<RestClientResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// DELETE method
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  /// PATCH method
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
