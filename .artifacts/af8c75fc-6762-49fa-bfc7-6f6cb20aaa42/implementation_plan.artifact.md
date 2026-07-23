# Android 16 (API 36) Hedefleme Planı

Bu plan, uygulamanın Google Play Store şartlarını karşılaması için hedef API düzeyini Android 16 (API 36) sürümüne yükseltmeyi amaçlar.

## Kullanıcı İncelemesi Gerekiyor

> [!IMPORTANT]
> Hedef API düzeyini 36'ya yükseltmek, uygulamanın Android 16 özelliklerini ve davranış değişikliklerini benimsemesini gerektirir. Flutter uygulamaları genellikle bu geçişten minimum düzeyde etkilenir, ancak test edilmesi önerilir.

## Önerilen Değişiklikler

### Android Modülü

#### [MODIFY] [app/build.gradle.kts](file:///E:/Flutter%20Projeler/bmi_calculater/android/app/build.gradle.kts)
- `compileSdk` değerini `36` olarak güncelleyin.
- `targetSdk` değerini `36` olarak güncelleyin.

## Doğrulama Planı

### Manuel Doğrulama
- Projenin başarıyla derlendiğinden emin olun (`flutter build apk`).
- Uygulamanın bir Android 16 emülatöründe veya cihazında (varsa) doğru çalıştığını kontrol edin.
- `build.gradle.kts` içindeki değerlerin doğru şekilde yansıdığını kontrol edin.
