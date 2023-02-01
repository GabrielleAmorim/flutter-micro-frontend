import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import '../../app_config.dart';
import '../helpers/helpers.dart';
import '../model/model.dart';
import 'http.dart';

class DioClient implements RestClientAdapter {
  DioClient({BaseOptions? options}) {
    _dio = Dio(options ?? _options);
    _dio.interceptors.add(AuthInterceptor());
  }
  late Dio _dio;

  /// Base Dio Url Client
  static final String baseUrl =
      FlavorConfig.instance.variables[AppConfig.apiUrlBase].toString();
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
  RestClientAdapter auth() {
    _options.extra[DataHelperKey.authRequired] = true;
    return this;
  }

  @override
  RestClientAdapter unAuth() {
    _options.extra[DataHelperKey.authRequired] = false;
    return this;
  }

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
      // TODO(Marcone): Tratar erro no caso de ser um erro diferente do DIO
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
      // TODO(Marcone): Tratar erro no caso de ser um erro diferente do DIO
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
      // TODO(Marcone): Tratar erro no caso de ser um erro diferente do DIO
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
      // TODO(Marcone): Tratar erro no caso de ser um erro diferente do DIO
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
      // TODO(Marcone): Tratar erro no caso de ser um erro diferente do DIO
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
