import 'package:logger/logger.dart' as log;

/// Abstract class which tell what logger need to have
abstract class Logger {
  /// debug Log
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// info log
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// warning Log
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// error Log
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]);

  /// append Log
  void append(dynamic message);

  /// closedAppend Log
  void closeAppend();
}

/// class Logger Implementation
class LoggerImpl implements Logger {
  /// Message which will appear in log
  List<String> messages = [];

  /// instance of log
  final logger = log.Logger();

  /// debug log
  @override
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.d(message, error, stackTrace);
  }

  /// error log
  @override
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error, stackTrace);
  }

  /// info log
  @override
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  /// warning log
  @override
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.w(message, error, stackTrace);
  }

  /// append log
  @override
  void append(dynamic message) {
    messages.add(message.toString());
  }

  /// closeAppend log
  @override
  void closeAppend() {
    info(messages.join('\n'));
    messages = [];
  }
}
