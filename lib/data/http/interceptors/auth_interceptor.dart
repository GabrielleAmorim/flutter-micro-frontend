import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../helpers/helpers.dart';
import '../../helpers/helpers.dart';

/// [AuthInterceptor] class is a extends of interceptor
/// this class will show us the log what is request is doing
class AuthInterceptor extends Interceptor {
  AuthInterceptor() {
    _activeLogger = dotenv.env['ACTIVE_LOGGER'] == 'true';
    _activeLogger = dotenv.env['ACTIVE_LOGGER_ERROR'] == 'true';
  }
  final LoggerImpl _log = LoggerImpl();
  late bool _activeLogger;
  late bool _activeLoggerError;
  //static const _storageInstance = FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[DataHelperKey.authRequired] == true) {
      // final token = await _storageInstance.read(key: 'session');
      // options.headers['Authorization'] = 'Bearer $token';
    }

    if (_activeLogger && !kReleaseMode) {
      _log
        ..append('################## Request LOG ################ ')
        ..append('url: ${options.uri}')
        ..append('method: ${options.method}')
        ..append('data: ${options.data}')
        ..append('headers: ${options.headers}')
        ..append('################## Request LOG ################ ')
        ..closeAppend();
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (_activeLogger && !kReleaseMode) {
      _log
        ..append('################## Response LOG ################ ')
        ..append('data: ${response.data}')
        ..append('################## Response LOG ################ ')
        ..closeAppend();
    }
    if (_checkingError(response)) {
      final error = _gettingError(response);
      response.statusMessage = error.toString();
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          error: error,
          type: DioErrorType.response,
          response: response,
        ),
      );
    } else {
      handler.next(response);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_activeLoggerError && !kReleaseMode) {
      _log
        ..append('################## Error LOG ################ ')
        ..append('Response error: ${err.response}')
        ..append('################## Error LOG ################ ')
        ..closeAppend();
    }
    handler.next(err);
  }

  /// Checking in response object if contains any condiction
  /// to invalidate the response.
  bool _checkingError(Response<dynamic> response) {
    bool hasError = false;
    final data = response.data;
    if (data is Map) {
      if (data['sTipoMensagem'] == 'ERRO') {
        hasError = true;
      }
    }
    return hasError;
  }

  /// Checking the response data
  dynamic _gettingError(Response<dynamic> response) {
    dynamic error;
    final data = response.data;
    if (data is Map) {
      if (data['Texto'] != null) {
        error = data['Texto'];
      }
    }
    return error;
  }
}
