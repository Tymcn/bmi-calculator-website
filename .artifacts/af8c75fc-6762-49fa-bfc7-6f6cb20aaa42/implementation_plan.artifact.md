# AdMob app-ads.txt Doğrulama Çözüm Planı (Kök Dizin Hatası)

AdMob tarayıcıları, `app-ads.txt` dosyasını sadece web sitenizin **ana dizininde** (kök dizin) arar. Mevcut kurulumda dosya bir alt klasörde (`/bmi-calculator-website/`) olduğu için AdMob dosyayı bulamıyor.

## Sorunun Nedeni

- **AdMob Tarayıcı Davranışı:** AdMob, Google Play'deki web sitenizi alır (Örn: `tymcn.github.io/...`) ve dosyayı her zaman `domain.com/app-ads.txt` şeklinde arar.
- **Şu anki Durum:** Dosyanız `tymcn.github.io/bmi-calculator-website/app-ads.txt` adresinde. AdMob buraya bakmıyor.

## Çözüm Adımları

Bu sorunu çözmek için GitHub'da bir "User Site" (Kullanıcı Sitesi) oluşturmamız gerekiyor.

### 1. GitHub'da Yeni Repository Oluşturun
- Repository adı tam olarak şu olmalıdır: **`Tymcn.github.io`** (Kullanıcı adınız + .github.io)
- Bu repository'i **Public** (Açık) yapın.

### 2. app-ads.txt Dosyasını Buraya Yükleyin
- Az önce oluşturduğum `app-ads.txt` dosyasını bu yeni repository'nin ana dizinine yükleyin.
- Dosya şu adreste erişilebilir olmalıdır: `https://tymcn.github.io/app-ads.txt`

### 3. Google Play Console Güncellemesi
- **Mağaza Ayarları** kısmındaki Web Sitesi adresini şu şekilde değiştirin: **`https://tymcn.github.io/`**
- Değişiklikleri kaydedin ve yayına alın (İnceleme gerektirebilir).

### 4. AdMob Kontrolü
- Play Console'daki güncelleme onaylandıktan sonra AdMob panelinden tekrar "Güncellemeleri kontrol edin" butonuna basın.

## Doğrulama Planı

- Tarayıcıda `https://tymcn.github.io/app-ads.txt` adresine girdiğinizde dosya içeriğini gördüğünüzü onaylayın.
- AdMob'un tarama yapması için 24-48 saat bekleyin (Genellikle daha hızlıdır).
