-- ========================================================
-- ONLINE KÜTÜPHANE SİSTEMİ VERİTABANI TASARIMI
-- ========================================================

-- 1. ADIM: TABLOLARIN OLUŞTURULMASI
-- --------------------------------------------------------

-- Kategoriler Tablosu: Kitapların türlerini saklar.
CREATE TABLE Kategoriler (
    kategori_id INT PRIMARY KEY,
    kategori_adi VARCHAR(50) NOT NULL
);

-- Kitaplar Tablosu: Kitap detaylarını ve müsaitlik durumunu saklar.
CREATE TABLE Kitaplar (
    kitap_id INT PRIMARY KEY,
    baslik VARCHAR(100) NOT NULL,
    yazar VARCHAR(100) NOT NULL,
    aciklama TEXT,
    resim_url VARCHAR(255),
    kategori_id INT,
    musait_mi BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (kategori_id) REFERENCES Kategoriler(kategori_id)
);

-- Kullanıcılar Tablosu: Kayıtlı kullanıcı bilgilerini saklar.
CREATE TABLE Kullanicilar (
    kullanici_id INT PRIMARY KEY,
    ad_soyad VARCHAR(100) NOT NULL,
    eposta VARCHAR(100) UNIQUE NOT NULL
);

-- Ödünç Alma Tablosu: Ödünç işlemlerini takip eder.
CREATE TABLE OduncAlma (
    islem_id INT PRIMARY KEY,
    kullanici_id INT,
    kitap_id INT,
    odunc_tarihi DATE,
    teslim_tarihi DATE,
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
    FOREIGN KEY (kitap_id) REFERENCES Kitaplar(kitap_id)
);

-- 2. ADIM: VERİ EKLEME
-- --------------------------------------------------------

INSERT INTO Kategoriler (kategori_id, kategori_adi) VALUES
(1, 'Roman'), (2, 'Bilim Kurgu'), (3, 'Tarih');

INSERT INTO Kitaplar (kitap_id, baslik, yazar, kategori_id, musait_mi) VALUES
(1, 'Nutuk', 'Mustafa Kemal Atatürk', 3, TRUE),
(2, '1984', 'George Orwell', 2, TRUE),
(3, 'Suç ve Ceza', 'Dostoyevski', 1, FALSE);

INSERT INTO Kullanicilar (kullanici_id, ad_soyad, eposta) VALUES
(1, 'Ahmet Yılmaz', 'ahmet@email.com');

INSERT INTO OduncAlma (islem_id, kullanici_id, kitap_id, odunc_tarihi, teslim_tarihi) VALUES
(1, 1, 3, '2023-10-01', '2023-10-15');

-- 3. ADIM: SORGULAR
-- --------------------------------------------------------

-- Tüm kitapları kategorileriyle listeleme
SELECT b.baslik, b.yazar, k.kategori_adi
FROM Kitaplar b
JOIN Kategoriler k ON b.kategori_id = k.kategori_id;

-- Müsait olan kitapları listeleme
SELECT * FROM Kitaplar WHERE musait_mi = TRUE;
