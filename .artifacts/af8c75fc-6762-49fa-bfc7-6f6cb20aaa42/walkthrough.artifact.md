# AdMob Entegrasyonu Tamamlandı

Uygulamanıza Google Mobile Ads (AdMob) entegrasyonu başarıyla gerçekleştirildi. Artık ana ekranın alt kısmında reklam gösterimi yapılabilmektedir.

## Yapılan Değişiklikler

### 1. Bağımlılıklar ve Servis Başlatma
- **pubspec.yaml:** `google_mobile_ads` paketi eklendi.
- **main.dart:** Uygulama başlatılırken `MobileAds.instance.initialize()` çağrısı eklendi.

### 2. Platform Yapılandırmaları
- **Android:**
    - `minSdk` değeri 23'e yükseltildi.
    - `AndroidManifest.xml` dosyasına Google tarafından sağlanan test App ID'si eklendi.
- **iOS:**
    - `Info.plist` dosyasına test App ID'si eklendi.

### 3. Reklam Uygulaması
- **AdHelper:** Reklam birim kimliklerini (Unit IDs) platform bazlı yöneten yardımcı sınıf eklendi.
- **InputPage:**
    - `BannerAd` nesnesi eklendi ve sayfa açıldığında (`initState`) yüklenecek şekilde ayarlandı.
    - Ekranın alt kısmında, "Calculate" butonunun hemen üzerinde reklam alanı oluşturuldu.
    - Bellek yönetimi için sayfa kapatıldığında reklam nesnesinin imha edilmesi (`dispose`) sağlandı.

## Nasıl Test Edilir?

> [!IMPORTANT]
> Şu an kodda **Test Reklam ID'leri** kullanılmaktadır. Uygulamayı emülatörde veya gerçek cihazda çalıştırdığınızda alt kısımda "Test Ad" ibaresini görmelisiniz.

### Doğrulama Adımları
1.  Terminalde `flutter run` komutunu çalıştırın.
2.  Ana ekranın yüklenmesini bekleyin.
3.  Alt kısımda standart Banner reklamının göründüğünü doğrulayın.

> [!WARNING]
> Uygulamanızı yayınlamadan önce kendi AdMob hesabınızdan alacağınız gerçek **App ID** ve **Ad Unit ID**'leri `AndroidManifest.xml`, `Info.plist` ve `lib/logic/ad_helper.dart` dosyalarına girmeyi unutmayın.
