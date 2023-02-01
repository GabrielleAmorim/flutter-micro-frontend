// ignore_for_file: avoid_dynamic_calls, prefer_constructors_over_static_methods

import '../../model/model.dart';

///Class to return default errors messages
class ErrorsString {
  ///Errors String Constructor
  ErrorsString({
    required this.code_204,
    required this.code_304,
    required this.code_400,
    required this.code_401,
    required this.code_403,
    required this.code_404,
    required this.code_405,
    required this.code_406,
    required this.code_500,
    required this.messageDefault,
  });

  ///No Content
  String? code_204;

  ///Not Modified
  String? code_304;

  ///Bad Request
  String? code_400;

  ///Unauthorized.
  String? code_401;

  ///Forbidden
  String? code_403;

  ///Not Found
  String? code_404;

  ///Method Not Allowed
  String? code_405;

  ///Not Acceptable
  String? code_406;

  ///Internal Server Error
  String? code_500;

  ///Erro default
  String messageDefault;

  /// check if backend has a message otherwise return a default message
  static ErrorsString treatedErrors(RestClientException e) {
    String messages = '';
    if (e.response?.data is Map) {
      messages = (e.response?.data['message'] ?? '').toString();
    } else {
      messages = '${e.response?.data}';
    }
    return automaticMessages(
      messageToBeReplicated: messages,
      exception: e,
    );
  }

  /// Automatic default strings to replicate in response
  static ErrorsString automaticMessages({
    String? messageToBeReplicated,
    required RestClientException exception,
  }) {
    final String messageDefault = _getMessageDefault(exception);
    return ErrorsString(
      code_204: messageToBeReplicated ?? "Nenhum valor retornado do servidor",
      code_304: messageToBeReplicated ?? "Nenhum valor modificado no servidor",
      code_400:
          messageToBeReplicated ?? "O servidor não pode processar a solicitação, reveja os campos e tente novamente.",
      code_401: messageToBeReplicated ?? "Você está sem credênciais para o servidor lhe retornar o resultado",
      code_403: messageToBeReplicated ?? "O servidor recusou a solicitação",
      code_404:
          messageToBeReplicated ?? "O servidor não conseguiu encontrar resultados a partir dos dados solicitados.",
      code_405: messageToBeReplicated ?? "Método desabilitado",
      code_406: messageToBeReplicated ?? "O servidor é incapaz de retornar os conteúdos solicitados",
      code_500: messageToBeReplicated ??
          "O servidor encontrou uma condição inesperada, se o problema persistir contate o suporte",
      messageDefault: messageDefault,
    );
  }
}

String _getMessageDefault(RestClientException exception) {
  final data = exception.response?.data;
  if (data == null) {
    return "Não foi possível realizar a comunicação com o servidor. Verifique sua internet.";
  }
  if (data is Map) {
    final errorText = data['Texto'];
    if (errorText?.isNotEmpty == true) {
      return errorText.toString();
    }
  }
  return "O servidor retornou um erro inesperado";
}
