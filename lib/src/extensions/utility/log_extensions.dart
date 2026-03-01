// lib/src/extensions/utility/log_extensions.dart
import 'dart:developer';

import 'package:flutter/foundation.dart';

extension LogExtensions on String {
  void debugLog() {
    if (kDebugMode) debugPrint(this);
  }

  void infoLog({String name = 'INFO'}) {
    if (kDebugMode) log(this, name: name, level: 800);
  }

  void warningLog({String name = 'WARNING'}) {
    if (kDebugMode) log(this, name: name, level: 900);
  }

  void errorLog({String name = 'ERROR'}) {
    if (kDebugMode) log(this, name: name, level: 1000);
  }
}
