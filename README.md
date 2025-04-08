<h4 align="center">Düğün Organizasyon Sistemi SQL</h4>
<div align="center">
  <span style="display: inline-block; margin-right: 10px;">
    <img src="https://img.shields.io/badge/Database-MySQL-blue" alt="MYSQL">
  </span>
  <span style="display: inline-block; margin-right: 10px;">
    <img src="https://img.shields.io/badge/Database-MariaDB-blue" alt="MariaDB">
  </span>
</div>

<p align="center">
  <a href="#overview">Proje Açıklaması</a> •
  <a href="#structure">Veritabanı Yapısı</a>
</p>
<div align="center">
  <img src="https://github.com/NURSENAKTAS/weddingSql/blob/main/wedding.png" alt="ss1">
</div>
<h2 id="overview">Proje Açıklaması</h2>

Bu sistem, düğün organizasyonlarını yönetmek ve düzenlemek için tasarlanmış kapsamlı bir web uygulamasıdır. 
Sistem, düğün mekanları, organizasyon hizmetleri, pasta seçenekleri, süsleme hizmetleri ve rezervasyon yönetimi gibi temel özellikleri içermektedir. 
Kullanıcılar mekan rezervasyonu yapabilir, organizasyon paketleri seçebilir ve düğün planlamalarını kolayca yönetebilirler.
Projenin amacı, düğün organizasyon süreçlerini daha verimli hale getirmek ve müşterilere daha organize bir hizmet sunmaktır.

<h2 id="structure">Veritabanı Yapısı</h2>

### Ana Tablolar

#### Users Tablosu
- **id** (Primary Key): Kullanıcı benzersiz kimliği (Bigint, Auto Increment)
- **name**: Kullanıcı adı (String, Not Null)
- **email**: E-posta adresi (String, Not Null)
- **password**: Şifre (String, Not Null)
- **created_at**: Oluşturulma tarihi (Timestamp)
- **updated_at**: Güncellenme tarihi (Timestamp)

#### Mekanlars Tablosu
- **id** (Primary Key): Mekan benzersiz kimliği (Bigint, Auto Increment)
- **mekan_adi**: Mekanın adı (String, Not Null)
- **konum**: Mekanın konumu (Text, Not Null)
- **fiyat**: Mekan fiyatı (Double, Not Null)
- **aciklama**: Mekan açıklaması (Text, Not Null)
- **resim_url**: Mekan resmi URL'i (String, Not Null)
- **olusturulma_tarihi**: Oluşturulma tarihi (Datetime, Not Null)
- **guncelleme_tarihi**: Güncellenme tarihi (Datetime, Not Null)

#### Organizasyonlars Tablosu
- **id** (Primary Key): Organizasyon benzersiz kimliği (Bigint, Auto Increment)
- **organizasyon_adi**: Organizasyon adı (String, Not Null)
- **aciklama**: Organizasyon açıklaması (Text, Not Null)
- **fiyat**: Organizasyon fiyatı (Double, Not Null)

#### Pastalars Tablosu
- **id** (Primary Key): Pasta benzersiz kimliği (Bigint, Auto Increment)
- **pasta_adi**: Pasta adı (String, Not Null)
- **aciklama**: Pasta açıklaması (Text, Not Null)
- **fiyat**: Pasta fiyatı (Double, Not Null)

#### Suslemelers Tablosu
- **id** (Primary Key): Süsleme benzersiz kimliği (Bigint, Auto Increment)
- **susleme_adi**: Süsleme adı (String, Not Null)
- **aciklama**: Süsleme açıklaması (Text, Not Null)
- **fiyat**: Süsleme fiyatı (Double, Not Null)

### İlişkisel Tablolar

#### Mekan Randevus Tablosu
- **id** (Primary Key): Randevu benzersiz kimliği (Bigint, Auto Increment)
- **mekan_id** (Foreign Key): Mekan referansı (Bigint, References mekanlars.id)
- **randevus_id** (Foreign Key): Randevu referansı (Bigint, References randevus.id)

#### Randevus Tablosu
- **id** (Primary Key): Randevu benzersiz kimliği (Bigint, Auto Increment)
- **tarih**: Randevu tarihi (Date, Not Null)
- **saat**: Randevu saati (Time, Not Null)
- **durum**: Randevu durumu (Enum, Not Null)

#### Rezervasyonlars Tablosu
- **id** (Primary Key): Rezervasyon benzersiz kimliği (Bigint, Auto Increment)
- **musteri_adi**: Müşteri adı (String, Not Null)
- **musteri_email**: Müşteri e-posta adresi (String, Not Null)
- **musteri_telefon**: Müşteri telefon numarası (String, Not Null)
- **rezervasyon_tarihi**: Rezervasyon tarihi (Date, Not Null)
- **durum**: Rezervasyon durumu (Enum, Not Null)

#### Iletisims Tablosu
- **id** (Primary Key): İletişim benzersiz kimliği (Bigint, Auto Increment)
- **kullanici_id** (Foreign Key): Kullanıcı referansı (Bigint, References users.id)
- **ad_soyad**: Gönderen adı soyadı (String, Not Null)
- **email**: E-posta adresi (String, Not Null)
- **konu**: İletişim konusu (Text, Not Null)
- **mesaj**: İletişim mesajı (Text, Not Null)
- **durum**: İletişim durumu (Enum, Not Null)

### Yardımcı Tablolar

#### Paketlers Tablosu
- **id** (Primary Key): Paket benzersiz kimliği (Bigint, Auto Increment)
- **paket_adi**: Paket adı (String, Not Null)
- **aciklama**: Paket açıklaması (Text, Not Null)
- **fiyat**: Paket fiyatı (Double, Not Null)

#### Odemelers Tablosu
- **id** (Primary Key): Ödeme benzersiz kimliği (Bigint, Auto Increment)
- **rezervasyon_id** (Foreign Key): Rezervasyon referansı (Bigint, References rezervasyonlars.id)
- **odeme_tutari**: Ödeme tutarı (Double, Not Null)
- **odeme_tarihi**: Ödeme tarihi (Datetime, Not Null)
- **odeme_durumu**: Ödeme durumu (Enum, Not Null)

### Sistem Tabloları

#### Cache ve Cache Locks Tabloları
- Sistem önbellek yönetimi için kullanılan tablolar
- Önbellek anahtarları ve değerleri saklanır

#### Failed Jobs ve Jobs Tabloları
- Arka plan işlemlerinin yönetimi için kullanılan tablolar
- Başarısız işler ve iş kuyruğu yönetimi

#### Sessions Tablosu
- Kullanıcı oturum bilgilerinin saklandığı tablo
- Oturum kimlikleri ve verileri

#### Migrations Tablosu
- Veritabanı şema değişikliklerinin kaydını tutan tablo
- Migration sürümleri ve çalıştırma tarihleri

> GitHub https://github.com/NURSENAKTAS &nbsp;&middot;&nbsp; <br>
> LinkedIn https://www.linkedin.com/in/nurşen-aktaş-329193303/<br>
> GitHub https://github.com/Froxerr &nbsp;&middot;&nbsp; <br>
> LinkedIn https://www.linkedin.com/in/ibrahim-aral-99804a344/ 
