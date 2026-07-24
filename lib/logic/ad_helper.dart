import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // Test Banner Ad Unit ID for Android
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      // Test Banner Ad Unit ID for iOS
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
