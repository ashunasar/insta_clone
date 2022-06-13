import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as log;

class AppLogger {
  //* initializing logger with Logger to print log messages more prettier
  static final _logger = log.Logger(
    printer: log.PrettyPrinter(
      printEmojis: true,
      printTime: false,
      methodCount: 0,
    ),
  );

//* print function to print log messages
  static void printLog(Object value) {
    if (!kReleaseMode) {
      _logger.d(value);
    }
  }
}
