import './../http.dart';

/// Status code message and cases
class StatusException {
  /// build a error to throw
  Failure build(int statusCode, ErrorsString erros) {
    switch (statusCode) {
      case 204:
        return throw Failure(
          message: erros.code_204 ?? erros.messageDefault,
        );
      case 304:
        return throw Failure(
          message: erros.code_304 ?? erros.messageDefault,
        );
      case 400:
        return throw Failure(
          message: erros.messageDefault,
        );
      case 401:
        return throw Failure(
          message: erros.code_401 ?? erros.messageDefault,
        );
      case 403:
        return throw Failure(
          message: erros.code_403 ?? erros.messageDefault,
        );
      case 404:
        return throw Failure(
          message: erros.code_404 ?? erros.messageDefault,
        );
      case 405:
        return throw Failure(
          message: erros.code_405 ?? erros.messageDefault,
        );
      case 406:
        return throw Failure(
          message: erros.code_406 ?? erros.messageDefault,
        );
      case 500:
        return throw Failure(
          message: erros.code_500 ?? erros.messageDefault,
        );
      default:
        return throw Failure(message: erros.messageDefault);
    }
  }
}
