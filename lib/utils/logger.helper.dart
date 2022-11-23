import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class LoggerHelper {
  LoggerHelper._();

  static void log(
    dynamic s, {
    dynamic error,
  }) {
    if (kDebugMode) {
      dev.log(s.toString(), error: error);
    }
  }
}
