import 'dart:io';

class InternetChecker {
  static const String testHost = 'google.com';

  static Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup(testHost);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
