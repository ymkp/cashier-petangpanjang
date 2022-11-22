import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logg {
  Logg._();

  static void loggerprint(
    dynamic s, {
    dynamic error,
  }) {
    if (kDebugMode) {
      log(s, error: error);
    }
  }
}
