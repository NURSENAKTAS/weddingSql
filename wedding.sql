-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: webproje1
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iletisims`
--

DROP TABLE IF EXISTS `iletisims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iletisims` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kullanici_id` bigint(20) unsigned DEFAULT NULL,
  `ad_soyad` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `konu` text NOT NULL,
  `mesaj` text NOT NULL,
  `durum` enum('beklemede','yanıtlandı','kapatıldı') NOT NULL DEFAULT 'beklemede',
  `olusturulma_tarihi` date NOT NULL DEFAULT '2025-04-08',
  PRIMARY KEY (`id`),
  KEY `iletisims_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `iletisims_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iletisims`
--

LOCK TABLES `iletisims` WRITE;
/*!40000 ALTER TABLE `iletisims` DISABLE KEYS */;
/*!40000 ALTER TABLE `iletisims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mekan_randevus`
--

DROP TABLE IF EXISTS `mekan_randevus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mekan_randevus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mekan_id` bigint(20) unsigned NOT NULL,
  `randevus_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mekan_randevus_mekan_id_foreign` (`mekan_id`),
  KEY `mekan_randevus_randevus_id_foreign` (`randevus_id`),
  CONSTRAINT `mekan_randevus_mekan_id_foreign` FOREIGN KEY (`mekan_id`) REFERENCES `mekanlars` (`id`),
  CONSTRAINT `mekan_randevus_randevus_id_foreign` FOREIGN KEY (`randevus_id`) REFERENCES `randevus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mekan_randevus`
--

LOCK TABLES `mekan_randevus` WRITE;
/*!40000 ALTER TABLE `mekan_randevus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mekan_randevus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mekanlars`
--

DROP TABLE IF EXISTS `mekanlars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mekanlars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mekan_adi` varchar(255) NOT NULL,
  `konum` text NOT NULL,
  `fiyat` double NOT NULL,
  `aciklama` text NOT NULL,
  `resim_url` varchar(255) NOT NULL,
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  `guncelleme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mekanlars`
--

LOCK TABLES `mekanlars` WRITE;
/*!40000 ALTER TABLE `mekanlars` DISABLE KEYS */;
/*!40000 ALTER TABLE `mekanlars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_ogeleris`
--

DROP TABLE IF EXISTS `menu_ogeleris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_ogeleris` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_adi` varchar(255) NOT NULL,
  `aciklama` text NOT NULL,
  `fiyat` double NOT NULL,
  `resim_url` varchar(255) NOT NULL,
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  `gunceleme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_ogeleris`
--

LOCK TABLES `menu_ogeleris` WRITE;
/*!40000 ALTER TABLE `menu_ogeleris` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_ogeleris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_03_08_16246_create_organizasyonlars_table',1),(5,'2025_03_08_162754_create_mekanlars_table',1),(6,'2025_03_08_162840_create_suslemelers_table',1),(7,'2025_03_08_162842_create_menu_ogeleris_table',1),(8,'2025_03_08_162843_create_pastalars_table',1),(9,'2025_03_08_163048_create_paketlers_table',1),(10,'2025_03_08_163052_create_randevus_table',1),(11,'2025_03_08_163225_create_rezervasyonlars_table',1),(12,'2025_03_08_163421_create_odemelers_table',1),(13,'2025_03_19_130355_create_mekan_randevus_table',1),(14,'2025_03_19_130446_create_iletisims_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odemelers`
--

DROP TABLE IF EXISTS `odemelers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odemelers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rezervasyon_id` bigint(20) unsigned NOT NULL,
  `tutar` double NOT NULL,
  `odeme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:40',
  `odeme_yontemi` varchar(255) NOT NULL,
  `odeme_durumu` enum('Onaylandı','Beklemede','Başarısız','İptal Edildi') NOT NULL DEFAULT 'Beklemede',
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:40',
  `guncelleme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:40',
  PRIMARY KEY (`id`),
  KEY `odemelers_rezervasyon_id_foreign` (`rezervasyon_id`),
  CONSTRAINT `odemelers_rezervasyon_id_foreign` FOREIGN KEY (`rezervasyon_id`) REFERENCES `rezervasyonlars` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odemelers`
--

LOCK TABLES `odemelers` WRITE;
/*!40000 ALTER TABLE `odemelers` DISABLE KEYS */;
/*!40000 ALTER TABLE `odemelers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizasyonlars`
--

DROP TABLE IF EXISTS `organizasyonlars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizasyonlars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `organizasyon_türü` varchar(255) NOT NULL,
  `aciklama` text NOT NULL,
  `fiyat` double NOT NULL,
  `resim_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizasyonlars`
--

LOCK TABLES `organizasyonlars` WRITE;
/*!40000 ALTER TABLE `organizasyonlars` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizasyonlars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paketlers`
--

DROP TABLE IF EXISTS `paketlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paketlers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mekan_id` bigint(20) unsigned NOT NULL,
  `susleme_id` bigint(20) unsigned NOT NULL,
  `menu_ogeleri_id` bigint(20) unsigned NOT NULL,
  `pasta_id` bigint(20) unsigned NOT NULL,
  `organizasyon_id` bigint(20) unsigned NOT NULL,
  `paket_adi` varchar(255) NOT NULL,
  `temel_fiyat` decimal(8,2) NOT NULL,
  `ekstra_fiyat` int(11) NOT NULL,
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  `guncellenme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  PRIMARY KEY (`id`),
  KEY `paketlers_mekan_id_foreign` (`mekan_id`),
  KEY `paketlers_susleme_id_foreign` (`susleme_id`),
  KEY `paketlers_menu_ogeleri_id_foreign` (`menu_ogeleri_id`),
  KEY `paketlers_pasta_id_foreign` (`pasta_id`),
  KEY `paketlers_organizasyon_id_foreign` (`organizasyon_id`),
  CONSTRAINT `paketlers_mekan_id_foreign` FOREIGN KEY (`mekan_id`) REFERENCES `mekanlars` (`id`),
  CONSTRAINT `paketlers_menu_ogeleri_id_foreign` FOREIGN KEY (`menu_ogeleri_id`) REFERENCES `menu_ogeleris` (`id`),
  CONSTRAINT `paketlers_organizasyon_id_foreign` FOREIGN KEY (`organizasyon_id`) REFERENCES `organizasyonlars` (`id`),
  CONSTRAINT `paketlers_pasta_id_foreign` FOREIGN KEY (`pasta_id`) REFERENCES `pastalars` (`id`),
  CONSTRAINT `paketlers_susleme_id_foreign` FOREIGN KEY (`susleme_id`) REFERENCES `suslemelers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paketlers`
--

LOCK TABLES `paketlers` WRITE;
/*!40000 ALTER TABLE `paketlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `paketlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastalars`
--

DROP TABLE IF EXISTS `pastalars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastalars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pasta_adi` varchar(255) NOT NULL,
  `aciklama` text NOT NULL,
  `fiyat` double NOT NULL,
  `resim_url` varchar(255) NOT NULL,
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  `gunceleme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastalars`
--

LOCK TABLES `pastalars` WRITE;
/*!40000 ALTER TABLE `pastalars` DISABLE KEYS */;
/*!40000 ALTER TABLE `pastalars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randevus`
--

DROP TABLE IF EXISTS `randevus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `randevus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint(20) unsigned NOT NULL,
  `paket_id` bigint(20) unsigned NOT NULL,
  `randevu_türü` varchar(255) NOT NULL,
  `randevu_tarihi` datetime NOT NULL,
  `ozel_istekler` varchar(255) DEFAULT NULL,
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:40',
  `guncelleme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:40',
  PRIMARY KEY (`id`),
  KEY `randevus_kullanici_id_foreign` (`kullanici_id`),
  KEY `randevus_paket_id_foreign` (`paket_id`),
  CONSTRAINT `randevus_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `users` (`id`),
  CONSTRAINT `randevus_paket_id_foreign` FOREIGN KEY (`paket_id`) REFERENCES `paketlers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randevus`
--

LOCK TABLES `randevus` WRITE;
/*!40000 ALTER TABLE `randevus` DISABLE KEYS */;
/*!40000 ALTER TABLE `randevus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervasyonlars`
--

DROP TABLE IF EXISTS `rezervasyonlars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezervasyonlars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `randevu_id` bigint(20) unsigned NOT NULL,
  `rezervasyon_durum` enum('Onaylandı','Beklemede','Başarısız','İptal Edildi') NOT NULL DEFAULT 'Beklemede',
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:40',
  `guncelleme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:40',
  PRIMARY KEY (`id`),
  KEY `rezervasyonlars_randevu_id_foreign` (`randevu_id`),
  CONSTRAINT `rezervasyonlars_randevu_id_foreign` FOREIGN KEY (`randevu_id`) REFERENCES `randevus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervasyonlars`
--

LOCK TABLES `rezervasyonlars` WRITE;
/*!40000 ALTER TABLE `rezervasyonlars` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezervasyonlars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suslemelers`
--

DROP TABLE IF EXISTS `suslemelers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suslemelers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `susleme_adi` varchar(255) NOT NULL,
  `fiyat` double NOT NULL,
  `aciklama` text NOT NULL,
  `resim_url` varchar(255) NOT NULL,
  `olusturulma_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  `guncelleme_tarihi` datetime NOT NULL DEFAULT '2025-04-08 19:25:39',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suslemelers`
--

LOCK TABLES `suslemelers` WRITE;
/*!40000 ALTER TABLE `suslemelers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suslemelers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-08 19:27:33
