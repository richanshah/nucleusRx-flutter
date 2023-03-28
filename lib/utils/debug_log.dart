import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    // number of method calls to be displayed
    errorMethodCount: 8,
    // number of method calls if stacktrace is provided
    lineLength: 120,
    // width of the output
    colors: true,
    // Colorful log messages
    printEmojis: false,
    // Print an emoji for each log message
    printTime: false,
    noBoxingByDefault: true
    // Should each log print contain a timestamp
  ),
);

class DebugLog {
  static void d(dynamic message, ) {
    if (kDebugMode) {
      _logger.d(message);
    }
  }

  static void v(dynamic message) {
    if (kDebugMode) {
      _logger.v(message);
    }
  }

  static void e(dynamic message, [dynamic errors]) {
    if (kDebugMode) {
      _logger.e(message, errors);
    }
  }

  static void w(dynamic message) {
    if (kDebugMode) {
      _logger.w(message);
    }
  }

  static void i(dynamic message) {
    if (kDebugMode) {
      _logger.i(message);
    }
  }
}
