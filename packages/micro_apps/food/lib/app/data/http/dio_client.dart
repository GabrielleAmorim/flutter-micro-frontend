import 'package:dio/dio.dart';

import '../../../app_config.dart';
import '../model/model.dart';
import 'http.dart';

class DioClient implements RestClientAdapter {
  DioClient({BaseOptions? options}) {
    _dio = Dio(options ?? _options);
  }
  late Dio _dio;

  /// Base Dio Url Client
  static const String baseUrl = AppConfig.baseUrl;
  static const String _contentType = "application/json; charset=utf-8";
  static const int _connectionTimeout = 10000;
  static const int _receiveTimeout = 5000;

  final _options = BaseOptions(
    baseUrl: baseUrl,
    contentType: _contentType,
    connectTimeout: _connectionTimeout,
    receiveTimeout: _receiveTimeout,
  );

  @override
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _response<T>(response);
    } on DioError catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _response<T>(response);
    } on DioError catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _response<T>(response);
    } on DioError catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _response<T>(response);
    } on DioError catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _response<T>(response);
    } on DioError catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  RestClientResponse<T> _response<T>(Response<T>? response) {
    return RestClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  RestClientException _clientException(DioError error) {
    return RestClientException(
      message: error.response?.statusMessage,
      statusCode: error.response?.statusCode,
      error: error.error,
      response: _response<dynamic>(error.response),
    );
  }
}
