# Paket Adı Güncelleme Planı (com.tymcn.bmi_calculater)

Uygulamanın paket adını (Application ID) `com.tymcn.bmi_calculator` yerine `com.tymcn.bmi_calculater` olarak güncelleyeceğiz. Bu değişiklik hem Google Play Store uyumluluğu hem de klasör yapısı tutarlılığı için gereklidir.

## Önerilen Değişiklikler

### [Android Yapılandırması]

#### [MODIFY] [build.gradle.kts](file:///E:/Flutter%20Projeler/bmi_calculater/android/app/build.gradle.kts)
- `namespace` ve `applicationId` değerlerini `com.tymcn.bmi_calculater` olarak güncelleyeceğiz.

#### [MODIFY] [MainActivity.kt](file:///E:/Flutter%20Projeler/bmi_calculater/android/app/src/main/kotlin/com/tymcn/bmi_calculator/MainActivity.kt)
- Dosya başındaki `package com.tymcn.bmi_calculator` satırını `package com.tymcn.bmi_calculater` olarak değiştireceğiz.

#### [RENAME] Kotlin Paket Dizini
- `android/app/src/main/kotlin/com/tymcn/bmi_calculator` klasörünü `android/app/src/main/kotlin/com/tymcn/bmi_calculater` olarak yeniden adlandıracağız.

### [Flutter Yapılandırması]

#### [MODIFY] [pubspec.yaml](file:///E:/Flutter%20Projeler/bmi_calculater/pubspec.yaml)
- Proje ismini (`name`) `bmi_calculator` yerine `bmi_calculater` olarak güncelleyeceğiz (mevcut kök klasör isminizle aynı olması için).

## Doğrulama Planı

### Manuel Doğrulama
1. `flutter clean` komutu çalıştırılacak.
2. `flutter build appbundle` komutu ile yeni paket adıyla derleme yapılacak.
3. Derleme sonrası oluşan AAB dosyasının paket adı kontrol edilecek.

> [!IMPORTANT]
> Bu değişiklikten sonra eski paket adıyla (`bmi_calculator`) yüklü olan uygulamalar, yeni paket adıyla (`bmi_calculater`) güncellenemez; yeni bir uygulama olarak yüklenmesi gerekir. Eğer Play Store'da mevcut bir uygulamanız varsa bu kritik bir durumdur.

**Bu planı onaylıyor musunuz?**
