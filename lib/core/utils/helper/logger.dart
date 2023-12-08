import 'package:flutter/foundation.dart';

class AppLogger {
  static void log(String s) {
    if (kDebugMode) {
      print(s);
    }
  }

 static void logWithTag({required String s, required String tag}) {
    if (kDebugMode) {
      print("$tag >>>>>>>>>>>>> $s");
    }
  }
}
