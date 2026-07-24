# BMI Calculator

A professional, cross-platform Body Mass Index (BMI) Calculator built with Flutter.

## Features

- **Multi-unit Support:** Seamlessly switch between Metric (cm/kg) and Imperial (in/lb) systems.
- **Dynamic Localization:** Full support for English and Turkish, adapting to device settings.
- **History Tracking:** Automatically saves the last 10 measurements locally for easy reference.
- **User Experience:**
  - Haptic feedback for a realistic physical feel.
  - Modern, dark-themed UI following Material 3 principles.
  - Accessibility-focused widget structure.
- **Monetization:** Integrated with AdMob (Banner Ads) for revenue generation.

## Technical Highlights

- **Clean Architecture:** Separation of business logic (logic layer) from UI components.
- **Null Safety:** Robust code structure with 100% sound null safety.
- **Automated Testing:** Includes unit tests for calculation logic and widget tests for core user flows.
- **Modern Android Support:** Targeted for Android 16 (API 36) and updated to the latest Gradle/Kotlin versions.

## Getting Started

1. **Prerequisites:** Ensure you have the Flutter SDK installed and configured.
2. **Dependencies:** Run `flutter pub get` to fetch required packages.
3. **Run:** Execute `flutter run` to launch the application on your preferred device.

## AdMob Configuration

To use your own ads, update the App IDs and Unit IDs in:
- `android/app/src/main/AndroidManifest.xml`
- `ios/Runner/Info.plist`
- `lib/logic/ad_helper.dart`

Ensure your `app-ads.txt` is hosted on your developer website as specified in AdMob requirements.
