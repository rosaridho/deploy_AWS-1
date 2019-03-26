-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: db_ecommerce
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_password` varchar(50) DEFAULT NULL,
  `admin_username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_password` (`admin_password`),
  UNIQUE KEY `admin_username` (`admin_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,'demiapabro','demiGod'),(3,'demiapa2','demiGod2');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_password` varchar(50) DEFAULT NULL,
  `payment_username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_password` (`payment_password`),
  UNIQUE KEY `payment_username` (`payment_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembeli`
--

DROP TABLE IF EXISTS `pembeli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembeli` (
  `pembeli_id` int(11) NOT NULL AUTO_INCREMENT,
  `pembeli_email` varchar(50) DEFAULT NULL,
  `pembeli_password` varchar(50) DEFAULT NULL,
  `pembeli_username` varchar(50) DEFAULT NULL,
  `pembeli_namaLengkap` varchar(50) DEFAULT NULL,
  `pembeli_gender` varchar(50) DEFAULT NULL,
  `pembeli_lokasiKota` varchar(50) DEFAULT NULL,
  `pembeli_pekerjaan` varchar(50) DEFAULT NULL,
  `pembeli_avatar` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`pembeli_id`),
  UNIQUE KEY `pembeli_email` (`pembeli_email`),
  UNIQUE KEY `pembeli_password` (`pembeli_password`),
  UNIQUE KEY `pembeli_username` (`pembeli_username`),
  UNIQUE KEY `pembeli_namaLengkap` (`pembeli_namaLengkap`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembeli`
--

LOCK TABLES `pembeli` WRITE;
/*!40000 ALTER TABLE `pembeli` DISABLE KEYS */;
INSERT INTO `pembeli` VALUES (1,'rahmedi@gmail.com','123456medi','medi','Rahmedi Rosa','male','Jakarta','Dokter','https://lh3.googleusercontent.com/3Z7KUFvgU_z8EZPR-xHg-FVn1NBZpimPlFjJNNGA2OVlkaRarddcTbYpkpS6CNkB8pR6FD9oM22s4eprTLx-rdVG_2gVFawYlUczuvwaN5bDVP58PvRSNWkD9fQx5t6Cm4MYKeuRTP6tifWOjIFd_FICNvLP4c78FR63LR4k7xZGRUYQbLDXvJ2unQWUU_164pMMznFCE1Ei4nd9OjyUqX0fgjJ2DnpvTozltwJ2Q5W2OrnwiOOrH2CYJp3sPva6o_qIZnfkjJf-zIZD1lpQqioYjx1HXojOMQdzZ3BgFMZtkzUOMoFW_jzO1uZ28jyIVnrQJEuw6-JJVCP_WR52nJw0w4CRBY6RmzlN-g2KoAHr02jpPQPxIPVuKaHGvVLNY8jM22d2_es7EwslQgriztfICUCO3MYAsTWq6L81VI0YYtCYdUtSd56M5bq4VF5C8vHz8ZzUmjMRYJ6tzdkWxYCYbj7rfw9kzIGK2W4wNP8jKy7RuGTs0AzIoaSAWarWP1_lIQ_1XNhRxtYPS5zg4UvC9OEkiSMSd8c3aGARMcUzivBk1xWoiHA4G1MYSFAakmH8aoUgL7yw641043AHvZTUbck5GSfVvtRCgZDA34KMNHeIRieo5haCR4V7-UTGPE3bdP7h-c-dA1A9x_MwuovPYWjtpdE=w306-h331-no'),(4,'rosa@gmail.com','123456rosa','rosa','Rosa Rosa','male','Bandung','Teknik','https://lh3.googleusercontent.com/ucD5F-kyT8R5r23QBFD_xx4Y6zZqlx69Ltz7VPIW1MT_apSoDUywQdImEywpAgBjKouQtjdggZ8Q5pb3g1MeOI-cU49VCkEdSgTvOjISEfzlYWyo6UteiQD5M4p70HsMYEXU6_TbCZAvAsmppN6BpOc4XRYdF7BGgRT824BqVXyxOwOjjspJSX-88FsC8on1eSG2ye2RRI3ZykrqHnAppauFOXQsLfv8bM1Ey4hagCVY6C0tguyzphMH77n4k7nDpaB8woohIXEyGZkSu-Zz2HqfRFWpQy4Vh8YSH_dPX9RnFSJZ5bZMZUJGeNpHDCwZiGPb6adIdW1jwBZj7zbY1HPT74F_kI-lzPZDZF4EMjoYpaMH8fN-7o4aYawCfB8MrJUZGquqmM4eK8HfRrRgqIazjdFFr2BoYRidUrl_-vv_gdVYmyYheO5UEjMT3Tl2xxqrNgHj-CnSTHVvfz2vnp6xFcgZusDaxzwPQeyRJZLcDjt0yESW0n_dKerpzcMHLsUPwzndEFKas47K59JYN4IyHowo1xK0UfOOpYqNZdgx-dGEvWV8kCFjNHpRztINt61ao1gSv52aQqjzTOPmdo4vW9WDc2BMT8Jvvbeb_5V89801c3_5zAcghhk-WqG7AjDRVDHYjQ92vyAtcnmjXo2g3zboRz0=w451-h639-no');
/*!40000 ALTER TABLE `pembeli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjual`
--

DROP TABLE IF EXISTS `penjual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penjual` (
  `penjual_id` int(11) NOT NULL AUTO_INCREMENT,
  `penjual_email` varchar(50) DEFAULT NULL,
  `penjual_password` varchar(50) DEFAULT NULL,
  `penjual_username` varchar(50) DEFAULT NULL,
  `penjual_namaLengkap` varchar(50) DEFAULT NULL,
  `penjual_gender` varchar(50) DEFAULT NULL,
  `penjual_lokasiKota` varchar(50) DEFAULT NULL,
  `penjual_avatar` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`penjual_id`),
  UNIQUE KEY `penjual_email` (`penjual_email`),
  UNIQUE KEY `penjual_password` (`penjual_password`),
  UNIQUE KEY `penjual_username` (`penjual_username`),
  UNIQUE KEY `penjual_namaLengkap` (`penjual_namaLengkap`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjual`
--

LOCK TABLES `penjual` WRITE;
/*!40000 ALTER TABLE `penjual` DISABLE KEYS */;
INSERT INTO `penjual` VALUES (1,'cindya@gmail.com','123456cindya','cindya','Cindya Perthy Iswandi','female','Bandung','https://lh3.googleusercontent.com/TToBs6b7aTmR3FbaRc0tOcfg5MbZ8b9RzcolExfGcswWzj2zIerNwWybEO5HPl1Cdl5cRWrsIT_TgFe1_db7qHrIyUz-tmh-IfZu35MXh5fwLqcYIIbEVXMduMFFb3cS_hAQ9VcBMZnHpR1muO1AjeQPqVLq1TFqup0HsbCmD9jXGIdk_bt0InzzQAOjp_YVL5fU2wbYFT8veK0AUIZoZnKxc04byks0WmzV06BpN5dzOCJw54f8PcVD9i6UmAaMQRjD0XsQ5-4eSdWomsuSnda5yLV6iyuHdhq8a5GGcaTwtYQC_Ypc7D3U4AVn-24iZ1Gx0rXllYutxEBtPKFSFfFyi1qayAgiVvmvmdc4qKyyNb-bz890USSXKD3YTSNXr113IEfESvM2KpJ__FRxwF6QbzD-VZf9NMzhYiHLddWGVWZcsvC9UVNcm4GkS4uJP8y4xaeRdpyrWtTXI4H5WYPhbwJ--MFRoPV9p7vMziWVwnGj8KnhbJiWsFlvbShyIouMWxBzZjZvfWAFHkIQAx8JAnX3AaJJHh0PIvMLwItlvFX9O7GZmi6p0GclgczcZLRaFjrNCLHjNS_EFY6KAhX163zHBMN29e0t8Y24KfkKZ8oo94WLVDu7GRDUDkJLZcZnaCpXaxMBL4EhNrNm_eW1bsilLfk=s376-no'),(2,'ucok@gmail.com','123456ucok','ucok','Ucok Ucok','male','Bandung','https://lh3.googleusercontent.com/nBz-eG7Y5z0nwGIB7T--JlR3bd1V4jw-jAk5xn-zd6SZA5gzA_5ljgLcZcUDK04YafiLF4cPpf0K0Z5qwUF0u9ph85EMT5pLwHrnURI2Si740kk7wV8f7cMIuvQtNEM14TUGAOxLFocv8__i7EsLnOYZXyB_v284n_nUqjhmZKkXY5oIHPPuKqHYW63tglc3Ue-TIPr8Kt2qrX6juZLrubB1ele3yuv7lDwwlU7TlteAD1TTs5E3pMSiJQr9krJcI0NG8nd8zvuXrHfz3WsmBmA3K__DUt23CQ049AaE-tWws_HXcTZr4tefr39-E2FY36SGYnK490HUMil__iXef5mBmcyKQqepKnSB_OuRjSHXFgUOK3Ar6shK5H9_mg9dHt6jCgScc9HaJEfeznuiRfotmbUxcFzBoConUBbRXmSNaQCGDfM6JOxaK0hcip2151q14xglb9EpM9Dc8ShYLjvLmLUnZPNpzf9vXkb1D3wH1C1okcYtc0zSrQP53j58PZwN0wUIaGRFj4HH1_9-2yGiTddItvnwgaktvZgnIYxZsODv6lyljAvUJXYGNwjVjHjc-qX-vElRY1iA85kusTyCMSu5R1AnBI4WxzzyiarKv9uFIkhF4DRXySpnQn9-36ZBkVDYkuO3HmIb37aZe5qBczHuDLs=w427-h639-no');
/*!40000 ALTER TABLE `penjual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL AUTO_INCREMENT,
  `penjual_id` int(11) DEFAULT NULL,
  `produk_nama` varchar(50) DEFAULT NULL,
  `produk_harga` int(11) DEFAULT NULL,
  `produk_deskripsi` varchar(500) DEFAULT NULL,
  `produk_gambar` varchar(2500) DEFAULT NULL,
  `produk_stok` int(11) DEFAULT NULL,
  `produk_kategori` varchar(50) DEFAULT NULL,
  `produk_subkategori` varchar(50) DEFAULT NULL,
  `produk_statusPromo` int(11) DEFAULT NULL,
  `produk_diskon` int(11) DEFAULT NULL,
  `produk_hargaDiskon` int(11) DEFAULT NULL,
  `produk_tanggalPost` varchar(50) DEFAULT NULL,
  `produk_Jumlahdibeli` int(11) DEFAULT NULL,
  PRIMARY KEY (`produk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,1,'Mata Bor',40000,'Mata bor terbaik di Indonesia','https://lh3.googleusercontent.com/MHzE2AHU-sXnp4bScbC64yHkYYgVDxmrNQYd70YmmQZFzqM7t44zk5xyPKolc1bjB3DZmeHRg_u2hmtMhJdZNP_GhAYUJ7vDlKrOa2pYpE3YLuZO2jigKdkWk0JOp9BGrIbVu2gmycKax7IMYln-V38k4H8K-gWdp8Xl-Lx1iZBd17IjapGQ2O3A1R-DHlwgTIXSjddaSziZkVRUXt-NXUBaE1Fr7sMjc0e5tGIaJbaVQ-mQa1J0Kfib4z_js0MpBI2K6HgXZfVeEsf1ZhsEbpBkis27AMSwVf2q3RkWDAjrFLm3zlZbmyTHxoW6KmfHuIm69ipa5YXbJ4amYPg0weonnPdop39Df_ZzzXQXGlkdvMOIs8FtXxqQ0BCULg4E1OC_uUdTZJ7lUeg7Kky2CnbWuUrkDhyj2nWvJvLwPEW55HX_ErMBij8c134qOCm7YSBhrBjOx3YXmzywWZo8iObRzwKb1hEm_jV_JI4K-83tNwvWn6nStWVvynKUfXNgK-rJWnvshQeUWzg84rF-HEFu1KktgUPFg0D3mCg8cNGW1V_b1yh3X69uw6exWJJ4NWl99gNDTUOGkrxjPaNQeLcCiNDAHLYhn4YJWmjgdTAFpgB0mt3RxQEW1B6ERQm-8a8F02Z8_0bxMP0BBzCF5MJZQdEtjck=w955-h639-no',77,'Teknik','Sipil',1,5,20000,'2018/01/20',23),(2,1,'Baut Set',400000,'Baut set terbaik di Indonesia','https://lh3.googleusercontent.com/ooxOXQlAExOxF8uabFAr1It8Wss2PfdJAe54sKFeSmsyigo0UK1lJxRsGpg93xOTW9WYdWl96DcKS59JG9a8V9LIL-JBgX6-1SivLE3o_7py4fhof61kpkCBNI7jUN-8tTVtb7V0V2GpcRV7a1gmuHFymlxClLaf7Kuw9rHpYIzYqpEt_RaxPeFoBIBeCSGy8VCvsAjg_qIo73BVrtVDcbjNvguGRP2Zur8T0Sq9Zk4Pw5LooY7PpAgNFPEAzmjJvDjZKL8sh6Z_koHOHwmhKTnLXVCIiCgaosi5T3YWrpE-lYLBVStOWuHW_PjowclCIepIwqa-sDrw5WTItUISV2Zam_W5kqKMCCSpmg_xXb0JXTvKLchLE9eKqT4qUyrcZwWLShxMLW3elWpKWagmGQFIH8xYVvEgdSfCAlejxdOF18OSmcXruI1Nr9i8mnB3ZSg5S4qxeQZrSqGxCmGBZiUuVS356gpS_ko79NQaVZobtoc8K5HzOhUtyzHddH0gSWjWH5iAeWNtgqy-Uq9p9i6XFGs8qZjIzlNin8v3JxDwXDH1dsYyT_-4Ic73p64pxK-n4uvlkAgYnxnUAh2_rlqmRW_Zlls9KqI005kzS-XI9NyxlB3iYCuNv4bVQW684BcLjbkNKvXelWS9_9tfizKvKSu7o9k=w959-h639-no',6,'Teknik','Sipil',0,0,400000,'2018/02/20',4),(3,1,'Palu',5000,'Palu terbaik di Indonesia','https://lh3.googleusercontent.com/mE-7ValWSLuSWew55LSJws6Gk_57Er8FJWP8ShtuwOhSjIzfg0V8CX5nDv2AdBFuIzJxoP2iQNWOGRI7DXn9Kfcf3XoFWEqaB2GuyP9ZYBuih_SR__Zvfa-Q8ZX6jdONdF2J0XEQ32UpGq9A4pFtrSmlR51Zi2Br8V0_99QFg1aGnOFmBIdlx93nJqFsFnD8r3Gb8MQVx0IVdErIidJrN2Qrl2eq6T94srIbyibHx1Ep90_qAYzls6aznmpEFmEJoM9teG0T8ZyOyd5_XaZlOEeVPxF7nElpO7zZrmSwcvPCUDDtP9OrHQycEh-o4k-zjC_J9xGLx6Nmsg0kvJmCXVvy3i30WU3swBUtW9RKtf-Emie13djVXBTbXIJMtVvj8l7CXVdAjPi3TJybXutaIzb0bx40hJ8Pw4hPyeXH_a0503K7rH9TsVFQDN-i0swVgPEO1VMUgbpiZAN7RnKu_n3w3f7XKTGfpLhpvRslI-teWlFdHFMufpNOMIdP1lW4nl_AzH1XwPTRvayIoP2Yku1VyO8NHEwqxd0Wmgp5936munk0EfIgHtiXk4wyySwraP42TeDCzIxNYZeN78FQUHWXr5Db0NrzxHsHOXJ5z0c0yEMtSoxhFMtO9hz3D8vpTTpC26Cz0gKvwhGlLq4MmqCCwQ1mHCc=w960-h607-no',12,'Teknik','Sipil',0,0,5000,'2018/04/20',3),(4,1,'Kompressor',500000,'Kompressor terbaik di Indonesia','https://lh3.googleusercontent.com/qunULxIxnRN4nwIXM7Ilh1SXu5Fj7TLizi0MZHnFXDgX7UQAU05ZmtCWxjNvDwkpRlsbZizCCcwE2JNdfhk94qcSsS1itU8Q1X_Y3hpYMLnd7ushzUkq7A4rztR1-Cxg872SbNksF93cq12BhAz3fTP1vhtaEvSdyQIsODqSWehZGmHih4e4NHDGj4qd_O835ztG_G2bgsO32uNa82TmmE25ECR1KFEBSFQf1a7Dhacke4aT0AtHSx-bZhPct1e4AQk9UHU0gOwoFp6dcCP6A0GC8d1zXOz1NLWI9Z2SdO8t4eFM8zM7u26FErPE-_Uqv7Cul4PU_8I234G2BDt59wpU0a77j4T3LJygZ2gHbhe38niEF-0zF49tOsWEz3_sGHdox2Q6sbE9iTUocHsN0CDvn2VDAaprCTMh4vqML2VTvBEGY-1BziCPDDlgTj7v5gwXogy2kiTdYBsNBxK3IvLW9I1yVH4xoi-dtogk7c4zB5tSm3T5zLc5kfx3nuHy70hIo2HPR_9L_akG7U_uv1xfREQWYL-wWxgxBxsj82eV_g9vtepsV-3yFRsEAovqi2Q0vuSdFp83BjGluo9jf_ODO3NISsNvbcjFv56LniclWkg26x61k7h83vqF0zUK3S6m9uWuVDlV9FHqdE_yzE15RBQur8A=w955-h639-no',1,'Teknik','Mesin',0,1,500000,'2018/04/20',4),(5,1,'Headset Noise',100000,'Headset terbaik di Indonesia','https://lh3.googleusercontent.com/0GmuOrgcaC9i6CYWhJn-UT8hqNCmFMH43j83BjuMI549Dkmk9CYk61r9bcXrPNl_tpGJ73VLi6vDFNyCjC0KBiQwOq4JD4KbR4_JS15ba07h5uCIg80M0oPL0x01sWwtqcp-jZjOM88CfXj2UIACFfrvZva4d5rxqXvnk7XtXDEN7Cx_NM31WXJHiOYY6yLVETA9UOzwaE2sZSV1mNxYPjvHysqufb9SaPNUbOVK5eRgYIxceXq235LTb60XedwWV5idJ_aqAo_cINVPMJUJtOhSRtzckL6xMGscwQPfKt1BwoCpSYxIGyjYAzVN0Ke74bPLrvMuV7fqJ2iQ4TGRC11XipG5WXG7jKPndqxFPsmXp5ahV716D1iiClUlJceONaRA66zfgtUN6jG8oVSb1vf2Z0NTQd_2xrF_700IFeYlTdK3kCvzH3iLydkJDf6PXRSGibZo2sfUPL8k0qvcAkQChZdHtPC5z-E_nQNZpkUvPBkn-aOlppoVgp5rOoWMT6d2y4Nd5euWYXK-o3ILlbhv6ZAyrW34_sSRU6SEeHcQyr_osdsc7R_a_XasDRcXvac_7GZVZi_2-0-qpwgGc1t99d2PxKS4EKhXE5hWEVHtufuVzhwdaCjjYinmcFPi-_ugWtH1PCvQw9_yqwI3fynok09aBl8=w959-h639-no',47,'Teknik','Mesin',0,1,100000,'2018/01/01',3),(6,1,'Kunci Set',900000,'Kunci set terbaik di Indonesia','https://lh3.googleusercontent.com/rx_EHyC42gblIfVTVwyIGMVA9KGqDWfRPC0HrBO0CABzn-Nkyxin7kc8eRvqAge88kXdG6k2jQgC7fln6R47dAitUWJzL8a1CYMKcHDzzdDB2uq4Z71pyzey5wc95_vJ6X6nzAcK0OncDWdDqmPXn-C1y3UUvRKKuMz2Qke5six4WXXcFrfj5WWI2r7RIrEZSQrwzBBbeKG6-C_gG5pyL0AXNMI-WwkMSh4gdojNnra_TmSru0jurHCLG8cwFqVE2ZdExF-u7o7D3Ldgav0Ljp2f3muAIy8RwHCs86DI3kqd-ERNH6gMAnJiBh-cRS15Bj1zUdtpFSPZ-9_SwzcsBS4QxijRpA-C_lxdtz9h1hX1fjA2k6Jd3sAnYg_gazruppRV5Jzaxe5zls57iaYgfnL604Uh3Yik_PglbLJy5Xe0GyBbe0ZPorNiol_xmwT4ohoMmcKS9vMLygcymSZR21MFu9-XNvuVLVJl_qSSIEDIWRzHrJRjYlEUxPtcdAAwIWif5LvfCaXIklQgGIfKe1Et0O94QBLXZzuYFJIheJyqoknPWHERdPae5gJ9uq8Lq1hbfavsG3PuAt7KVYXo-_M2SgmlEfAhEut4-gw5bXrKXxeyHX0EfP4gaXu951NwDd-CPpbTvksSx-27IjT3e5viukAdflY=w960-h539-no',72,'Teknik','Mesin',0,1,900000,'2018/01/02',3),(7,1,'Bor ',90000,'Bor terbaik di Indonesia','https://lh3.googleusercontent.com/Nzq8zbvWB-LCT76fzsiyqk7LVMbEWvnelWRHndLYAjaK29sxy7yqH0DZY1ca1j85pnegzAkzP30aJeWZcwxd0KnNvVYD7iMc6c6_RSmO-FaG4oVFpPDcL0Eg0pyV90dt9UEvEgwR_hbK61XqPF717gXv-sWrDnCATB-3beWRaAKCPWfIcrY5JxlOjwTYqFdHLNrwv7S-7PP2Qt86vA_NUx5rIJnkBmSuIIgpNkZfBSDJO4PKtH-PZAA03tBjIbyq7wamPcoEynjvd2_oTbez9pKfrTbU-9X8RQEDemsDqIVWEPzxNZ5Ke8CVdiqj1IoOU4IB-wsaDdH8uYz9azMHo-X5Y79E9x-s6bbKyAacOFAmgMoOMrfM52ghenUtE1VfFlywjU396fNRjiuhriJoPrb9ppfdGw4kNCChBjVz4uPhckoSTR5SQ7QiSbVYHultS_q0sTVDxrVKPwEqRw7FVruFUN6amTVlEnq1X18Bf9An9fj5rLAqiXfhiFdbq0UpicosZwEjUBu4J-mZNRI2bjrZpFsqmcvg0IvrGTUnzU4W-9snV99reKt-DbOdsN39QzuvigoA5aFDiElLs55x7WirlTAWY5CPjNGjrvs3nD6XO8e8Y51C9HDbshkGq6QN02YM0XrUIWVGdiOlMJOkA8M9ZXu24S0=w959-h639-no',25,'Teknik','Sipil',1,3,63000,'2018/02/02',0),(8,1,'Agriculture Drone',1500000,'Drone Pertanian terbaik di Indonesia','https://lh3.googleusercontent.com/SQf66rFg_t5OPFElPyFtPIYzXt98Oan0avSQWb0zJi18Ha799x3lr9Tp2Ln4pWUdTxA40RKTWqXbDGOM_asncAye3fr7nzvO6_Tfa89SqGWnPPUsWH1mezwQQHn7GmKzR9zGBkCvti78fmlU_Geipginvmy34jVVcoUARngD1nsj-IXPfL079xvCLipfF3aeW-p79YfjKmBMIOlLcOQDxjleBZaDhg1KxDGqNEYTn73RMgpTHMJfYhONy03sPCpZi2jyi7DWtAUc8yIkvaYXCcU_NHXFCKezuTCsVrakmg9-stP2h9mRwoFO4tBpJ1mtQFlIdchdz4zacxqrGAOOUBfsaJkFbTNCSx4COWfEzCG4YB60iQEVS1ZZ22rxcmWxZR2XyDOFHAsOaikWw14_9ilvd9nZCfLjXgkNUWQk26L84vI3vDsGCuVxkXBr-r0hm8ySY8lbosOydULrpjwh_aq7zuKeL4faefB14ewy2ssRPQ00KbpHahjr573g3Ao_EHQJ0OlMa0Jjt0JSJLyKcCwXeKc3Cq51QbjPR9fj4ylwh3j_LGj0mCn9fLYa4cIMCjFFiLUFvi3H90Qi69AjjCy3F4Zmk4XAZWrR9UgnERlaMv-Bzau-sXP2gMcK9bDWu7fHIjhJZqnI54RzH07J0pMUYqh3ag=w800-h513-no',20,'Teknik','Elektro',0,5,1500000,'2018/03/02',5),(9,1,'Pyrex',9000,'Pyrex terbaik di Indonesia','https://lh3.googleusercontent.com/sgi2rX6D_H6bDksktbon9KkfPkI7svzyZr93X5jKxkoGQSqkCUhRk_2AsVhOGEUv3U-P-b5I4RFGVJJv8U3Y4xMJ7IlysYY72VufXvx4O2sU8UCTcn970lANObWKRupqWG1bxcB5SjEnz4Y0x_UNlGX118Jenn7RmCgwApeKaRk8aFo_flHxL0rjZNotniYtH9C0_mQUzHUf4_u5sv1OI5QnSinBLsUt2QZxs5f76ok6qiEPPWZCjXdMiBVcpZ1UnmdIBwz3A_Ys2A_U9HD9i_kGQtMNyL_fIMivcoYEQ5C84p1m4mf-v0rO-UdxkhOYJootYckrIVRPS7vX4rAWtd0J8M7Y2L2mLl_NwNpzYcWGoPRrVZkofQP1NkWfPZUQI5e-aFIgZ7RFtWpyXM2htFOF1imYKaKs9KbjlX5uI-uR2zngFwY0TUukDyrsaTo83GIM45deFGxrMiias8aF8FszS0ZDVWAtKOEKc6m-Dyp4-14CcpyjB_UpfLzlQtkGTvGv06NguIL6pDOKPNKWMldsFlrGJ-dCT-S3asjjPrNSMVCjemWy1cBPlKRXpGHtk9rPJJYCVLrahIyTohlumolJu1uhlyMkDf_GlwMKKBMXnNutMj01t-BGFx5LgT5-cd14CviSQppFssX_X6h5-k-djP-_aA=w222-h227-no',300,'Teknik','Kimia',1,5,4500,'2018/06/02',200),(10,1,'CNC',1000000,'CNC terbaik di Indonesia','https://lh3.googleusercontent.com/rVdTQLEmSiezoDJQURFqnyaxFpPz7E7jW6ZpLdWyAJ5saC_JMFfdKXEqpjdgQloYofA-pQL85kSwo4A-yztcLOolWJi4xE1YzFVAdlaL8giyR2n-q9bPK9sZF7fGa0kVa8Y1-uA2nWamhtLPtpBY9ctQwmUIBoIdkSn6yJOX36ffnPrENBsWBiyEu3VprGN5d98ND_ayTUicO8q0x9yQuktoP8PwhXGuYb7BXUNbQn9jB02Kn2QGK9yc45VZZLHMiMZkTM69nmSL1H734bEUNvpboPO14AYHMusSpAvpXpZWBHy7XM1PuBinUgDFp5beLg2NHmaeQ0WCExJS_H_auwU7oafLGrkn0ionw1802qNBwwac5EhNxywKb5jjDhPmEzoYIfQVZ9O5aV2BAYZqqe5SU4zxFVZsPPRMxakx7crqmDTHxRg9yRYPjrmFZA51ZCgwxDmg_zAyyHKDdNofa103YFtSe_Mqru5ZWA6xM6p2F-juknKO5LzqLanR19PG2k9-l4o08QsEU2oY6FR2SHtw09U9U2CHI1XLnwIx8jmhweTR34VSZDWbE7ILC2ZND8WKSPSrepChvX5QIMAW1YzH2AYJsvwn0NCV7Ld4iKflaBMAITPVFDci-agXBLIt_ZLEirskayhOdBP8Ov7dfx3k3DPS9A=w300-h168-no',5,'Teknik','Mesin',1,1,900000,'2018/01/02',0),(11,1,'Tool Box',1000,'Box terbaik di Indonesia','https://lh3.googleusercontent.com/rfmNP_VQwKLZyIggGlo4tEsgWyCDgcJwXpgjQo4OVlFzNPfvUE5LxsJYU37pv-v4onrhefE7ZSsXPmuzlAjCSJwSFYjoHectuhYPpwA02dW8Qh4fENDCf5ZPBPq8_lCCqc7Jsrm-QEP50WKdr5Wao-qNZVlowOHqONlPqnDzU4leUJIK-UK9xhoVvC_d9u-iOPf8lWf6Uzdcxpg7ok_RdV0v-NglS1PlxB1WFJgEE9dZFQa_UmE9q60hDs2iFYsA2R-CemmThNdZUJT4cEMU4T2AR_KQuLZoaZZeHKDQscTcsUdAs4uAz8eoFImcqK2UUt6VKsUxjrEW4_R7IGeB-TXdBdakQT2L4K841MGO4mX3IC-0rJlAxLwiSdw-Ao7bFS4KFxzEGTyNmWh64qL6PqkveJV8sw6nQGIb1d9trBCh7SRsCMYfx3-uRETuG3VPDOybVl8gtYLavT_Z9rB3ElfG4Q2ho3ROCGpUICNe2Z_f8tx_VZNKIS_8NwKzkSYDbG30ENkt-3NtBUaeqKmCRkmX4e2oHcJUWe56BxPJ8qYWvQsO8XPMC9WCKYfNqH0I-o3Zgp5vbtCefOwjpqwxTx7V02cJgTeoLAykr74fOTgA0x1SiVXCeb8BwMS2vhCLmj3r140HkJiG-i1L6V-rB-WJmIteBbw=w959-h639-no',60,'Teknik','Elektro',1,6,400,'2018/01/08',0),(12,1,'Gergaji Mesin',800000,'Gergaji Mesin terbaik di Indonesia','https://lh3.googleusercontent.com/rfmNP_VQwKLZyIggGlo4tEsgWyCDgcJwXpgjQo4OVlFzNPfvUE5LxsJYU37pv-v4onrhefE7ZSsXPmuzlAjCSJwSFYjoHectuhYPpwA02dW8Qh4fENDCf5ZPBPq8_lCCqc7Jsrm-QEP50WKdr5Wao-qNZVlowOHqONlPqnDzU4leUJIK-UK9xhoVvC_d9u-iOPf8lWf6Uzdcxpg7ok_RdV0v-NglS1PlxB1WFJgEE9dZFQa_UmE9q60hDs2iFYsA2R-CemmThNdZUJT4cEMU4T2AR_KQuLZoaZZeHKDQscTcsUdAs4uAz8eoFImcqK2UUt6VKsUxjrEW4_R7IGeB-TXdBdakQT2L4K841MGO4mX3IC-0rJlAxLwiSdw-Ao7bFS4KFxzEGTyNmWh64qL6PqkveJV8sw6nQGIb1d9trBCh7SRsCMYfx3-uRETuG3VPDOybVl8gtYLavT_Z9rB3ElfG4Q2ho3ROCGpUICNe2Z_f8tx_VZNKIS_8NwKzkSYDbG30ENkt-3NtBUaeqKmCRkmX4e2oHcJUWe56BxPJ8qYWvQsO8XPMC9WCKYfNqH0I-o3Zgp5vbtCefOwjpqwxTx7V02cJgTeoLAykr74fOTgA0x1SiVXCeb8BwMS2vhCLmj3r140HkJiG-i1L6V-rB-WJmIteBbw=w959-h639-no',15,'Teknik','Sipil',1,2,640000,'2018/08/08',0),(13,1,'Kabel Aki',8000,'Kabel Aki terbaik di Indonesia','https://lh3.googleusercontent.com/PUXkbogfuIl7YgYicujF7qAtKJXELbEhR0WNjploj7fObM32ZTRKahrmmMfXhqjbf_DL9ToLKHoGiMUnUah56KHxYP7Puh3-tCvJbyJyccArRfXd1rkvoQkUCpx1vCl0v-QDOQHsRMIrEtVjetj3d9i4eYE5dvuoNzxHdoqZhbXL_CRY-FV8AGmNnx27KKgdBgEQKbOnFCjqx78CZPx0D40RtZnsNkLEkO7yOLKbMvICp2Qk0DZmm1rRXEKmGExatnZJHy2NSo0NrOstfxxcmb0folCAxhF1LvhDgKLsxgtEbgL0IlsX3-OzSNQ037asoE-ArcQo9uKoQfULGEPlK90rV01Nk8h_VQ9aKrVetGKAA2h7laIxoday4Z8JNttBvdfvHlmt7-DEQ_HSgHh1QYLxl4iRHVvezSYu1KYMkG8B_sQX4xlq4xtwQRPBAXhD04bF6cJHbS1XyDSsm49PzwJqWQhex5wT3aqdR3u-DgRPk48syQpkeW5838A9CspxX0l51r5L6LWjfxGJy7UbguPbImhuSdUOrFJvPIGlvlgob_Cz3GV1n6j4u8CZfrVDSmMghsmBhw6I_wAnzla5UFxwDHXUKhCv7PITwjy-KO_5JIHF-CK0IzSoapzvVR7grsiFS713e0uPb7L-_KDRwq-SCdGuUvg=w852-h639-no',88,'Teknik','Elektro',1,9,800,'2018/11/08',7),(14,1,'Lakban',5000,'Lakban terbaik di Indonesia','https://lh3.googleusercontent.com/w29ZX7rJTX3-xQmUp14g-R_eVVp5BTVopxJqWMQHGCQ2yCvX8FLNk2XYHXZASDe1rDloFZc15X-QQBkV1DUbHdbf2xWOIOmmakTYynMvZqGjJ3P1xRkZdqt-AqU6ksTqw4TWO3RONGl6K206EWEQxi_e-iSL2EhfZ-OUWN6lHXZ_tbaa6Qc-F1Wrx-nmMXtfBdF-sqP2bahHyBNlqzQAsWpBqSFLfqySeyBhbovoX2fnjis-u5CdqTeM9SvcXNTaJjP8RfltGaohM9-YJJE0QGUvjFADAL_BWaMHXE0fhgSDzpq-QGXuvZf_xDemzcsk_6Ac8hAqoWuTtV6whw-XC0FJKsco53PPkHKo7HCNxgRcC3GXIeoKC2hwdmHxPkZTa-853JL9TwjpB5JGmXBZF2-3JN2VRyniV-p-aimJdcT-b7ZEVF2MaXME0itfNKBlfaNIog0hLNCvrvmKckEt_WxzZq1TrxC4J1S6WCfKk4M5GrPc0Kz4x1ArprrC22LoWxl6yPk0MTWOeKfWKQGvLzszHv-F5wu4micS4GkLWmqbetNLu2xrXnTnFfPCpv0chnFi5kkTCaTA0qM-jYu-g4843E5C6So4fIhzs7iauBekOICSmkMu09hengq9lqdnoIrZNMhTOOVIMsK761IhiDNMqnQUeDg=w800-h600-no',248,'Teknik','Elektro',0,9,5000,'2018/12/08',0),(15,1,'Cutter',50000,'Cutter terbaik di Indonesia','https://lh3.googleusercontent.com/4uIne-fL_x1WC4hLuPh0zHBPsk-ury2LkBMcoIxAqPoQgjVGof-BMY0Q3zS9PTkm56wBBTEOMhxAfpfby9MlJ70Msco2rMyY9rxZbxZBJI1AxRCsONMqNJFlAzi_-Y2-lzxvET6HQjDfFxxGn84JSyXpMj4_aX9rh6e9L7UpkqkAClex2PvOEze6X5EKsnqcLmtIcLGVpcNkAft5bqIs6N667riHYmkSNBQhOzIWj5v2FraLdbZ7TsR503yFMwXCNuBHKLl3wsPwzEwCTdnjCTheX6MFn5YX9s7Xc1Q3UVtKpZ8N8sN7frJtHTNU1nnFGSF6WcbJ30KeLlWaxAUwQcWgKqjmWzabvg-j_D496Hyc1hG0DCLlN4_tAUys7BT8ibHiYZyw4BWPml6rF_IOxhgSD1AAoAR_hZNvlL1eYIxSWXdmRtuZKqC4v3rjXVtKsQ6FOplcRYcmU_tWmt4QWsZ1-dMvZCSwGIBYQbHR_kYB4DbVxW_KLqUd4CGRDKKfW7KVreeti-MMLXUXdXagZMHYKjaPSfNKrKcxHmda3cm4O0DblafNmiv3bzfn7PcgWAikJqFChTfIsww7GnRapGcXpnMYRmNx6N9ob69kPkgVMbPFPM8jwGYoldPgbk77uz4738HbVpVtTAMA-vq_XLYjW6sbc4Y=w72-h54-k-no',43,'Teknik','Elektro',0,1,50000,'2018/07/08',0),(16,1,'Meteran Micro',5000,'Meteran Micro terbaik di Indonesia','https://lh3.googleusercontent.com/hQUycUcErNT_xkaHNIMI9CfC0N8kntaRIpGww5O3R2RWhptX9HfZbFumL3D1qZcr4_k4w6sLbSysTX5LwJVigigiWj3mMj40GCumLkgneLMfEMdQMtNisR5Cr0YHjtlsJvuT4g1Y8WhOiuj9zso7id2rrbskJuazsTlhmh2GRkcdMkYJKSDXtZLHuKP4RcJU19jdw71Y0yxrx3Vv0SRlxL5wxn9S5K8tOuoZe-c0Ps-Uiizbcuh694zipHUyjxSXA5qZOyGcQTaiZYS8UJjxCUPOrtdgGH_CZSxxiBrbZIvB1YfElaZq4yQLqhbjsymgygkcqskoq3klnTgODeOPqrO2o5DICbmxVQQmiwUAD10gDq9AUP-i5PPr2tPalvONmzk_HHbkRi4e1M_mGrp3X6POmNfZeZ4d9vlAATYrZ1RDX8i16L7ZAUB0cdBG4Q2N_xcF3dErL_eRx6BSZD88wQZuDTHTqyFLN6GNQIzxByGdQ5SU2maHx71xl_E_8QM57TlC0l8ocZNlukm9mYDeEwh4DReqj66211AWq06VZ9U_wswKbAjj-lk78TsR0VMCZpw0p0oy3i73QK_x9HFayNHJPsMjBivqTG_CXK6qOIAUw83PdUM7uIeZJ5yFGuum9Hr6jet6Zqzqbn5EB0TGR0HuAa1luDY=w72-h60-k-no',50,'Teknik','Mesin',0,1,5000,'2018/02/08',0),(17,1,'Meteran Micro2',5000,'Meteran Micro terbaik di Indonesia','https://lh3.googleusercontent.com/hQUycUcErNT_xkaHNIMI9CfC0N8kntaRIpGww5O3R2RWhptX9HfZbFumL3D1qZcr4_k4w6sLbSysTX5LwJVigigiWj3mMj40GCumLkgneLMfEMdQMtNisR5Cr0YHjtlsJvuT4g1Y8WhOiuj9zso7id2rrbskJuazsTlhmh2GRkcdMkYJKSDXtZLHuKP4RcJU19jdw71Y0yxrx3Vv0SRlxL5wxn9S5K8tOuoZe-c0Ps-Uiizbcuh694zipHUyjxSXA5qZOyGcQTaiZYS8UJjxCUPOrtdgGH_CZSxxiBrbZIvB1YfElaZq4yQLqhbjsymgygkcqskoq3klnTgODeOPqrO2o5DICbmxVQQmiwUAD10gDq9AUP-i5PPr2tPalvONmzk_HHbkRi4e1M_mGrp3X6POmNfZeZ4d9vlAATYrZ1RDX8i16L7ZAUB0cdBG4Q2N_xcF3dErL_eRx6BSZD88wQZuDTHTqyFLN6GNQIzxByGdQ5SU2maHx71xl_E_8QM57TlC0l8ocZNlukm9mYDeEwh4DReqj66211AWq06VZ9U_wswKbAjj-lk78TsR0VMCZpw0p0oy3i73QK_x9HFayNHJPsMjBivqTG_CXK6qOIAUw83PdUM7uIeZJ5yFGuum9Hr6jet6Zqzqbn5EB0TGR0HuAa1luDY=w72-h60-k-no',50,'Teknik','Mesin',0,1,5000,'2018/02/08',0),(18,1,'Meteran Micro3',5000,'Meteran Micro terbaik di Indonesia','https://lh3.googleusercontent.com/hQUycUcErNT_xkaHNIMI9CfC0N8kntaRIpGww5O3R2RWhptX9HfZbFumL3D1qZcr4_k4w6sLbSysTX5LwJVigigiWj3mMj40GCumLkgneLMfEMdQMtNisR5Cr0YHjtlsJvuT4g1Y8WhOiuj9zso7id2rrbskJuazsTlhmh2GRkcdMkYJKSDXtZLHuKP4RcJU19jdw71Y0yxrx3Vv0SRlxL5wxn9S5K8tOuoZe-c0Ps-Uiizbcuh694zipHUyjxSXA5qZOyGcQTaiZYS8UJjxCUPOrtdgGH_CZSxxiBrbZIvB1YfElaZq4yQLqhbjsymgygkcqskoq3klnTgODeOPqrO2o5DICbmxVQQmiwUAD10gDq9AUP-i5PPr2tPalvONmzk_HHbkRi4e1M_mGrp3X6POmNfZeZ4d9vlAATYrZ1RDX8i16L7ZAUB0cdBG4Q2N_xcF3dErL_eRx6BSZD88wQZuDTHTqyFLN6GNQIzxByGdQ5SU2maHx71xl_E_8QM57TlC0l8ocZNlukm9mYDeEwh4DReqj66211AWq06VZ9U_wswKbAjj-lk78TsR0VMCZpw0p0oy3i73QK_x9HFayNHJPsMjBivqTG_CXK6qOIAUw83PdUM7uIeZJ5yFGuum9Hr6jet6Zqzqbn5EB0TGR0HuAa1luDY=w72-h60-k-no',50,'Teknik','Mesin',0,1,5000,'2018/02/08',0),(19,2,'Light Meter SUPER',199998,'Light Meter SUPER','https://lh3.googleusercontent.com/KT8Q91NkR-yIcw7wmqQkwZhA7NOtKIEHylZjY6_m3BjwjNO1X_wibEzLm2wJqq3aZmMMJve7KM0k6PM0bFzKT6Dj04AJ6M5TlCsK_Hs8DIBj3-MQz39A_ktLU9wbJ7AkNV964teRzBeXXeTmgvoJ-1MvM0io5ReLR-CDtdl44WT1WKNFVyG_FL9W7dJ1JRrr_GtePIt1HT_vWKlOAlCACVBp8RbdWyfEld1MpA_PUm5Io7ZCP-AvczNt84_AE8swyu_-mCCBzaVMPsdjWrCUixE_RnstXkc1A0T11gBmSeWOAqyL1oDHFhm4OWlj1upxKhrXXe-mn376onewjkp8UnP1WptYtigQ7irlr2S_SxdLTiTEUC_Gn5sWN8cAWEYJ4pwt91mg2O-cbkD9tNgbYUxFvK1eZnXWGn-QXtk_9CuCX4rh9T033R9aBplyEISa3JKD37wUiEoW41GKZEhG7KWulkhI0LoFnQX4MXTSIYl56WtSFM_g7lV6y6WzGBJEjbwWrFVMA2tfWLcQNzATsgb4gOvuwMCyApRF8mcJfZUAAyb2pAGeYxiVRv1CT1Qhzm9Cyl4Iw78pC6jGewGxmHf94jCJZjrthwJWFAvXRjNW8CQS1gBN3nNgn7S5nm3IQOE9ZTdmlTqiVSpMml6r6S1mxtAOA-8=w755-h450-no',200,'Seniman','Umum',0,0,199998,'12-01-2009',10);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transStat`
--

DROP TABLE IF EXISTS `transStat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transStat` (
  `transStat_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_code` varchar(50) DEFAULT NULL,
  `status_message` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `gross_amount` varchar(50) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `transaction_time` varchar(50) DEFAULT NULL,
  `transaction_status` varchar(50) DEFAULT NULL,
  `approval_code` varchar(50) DEFAULT NULL,
  `signature_key` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`transStat_id`),
  UNIQUE KEY `status_code` (`status_code`),
  UNIQUE KEY `status_message` (`status_message`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `gross_amount` (`gross_amount`),
  UNIQUE KEY `currency` (`currency`),
  UNIQUE KEY `payment_type` (`payment_type`),
  UNIQUE KEY `transaction_time` (`transaction_time`),
  UNIQUE KEY `transaction_status` (`transaction_status`),
  UNIQUE KEY `approval_code` (`approval_code`),
  UNIQUE KEY `signature_key` (`signature_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transStat`
--

LOCK TABLES `transStat` WRITE;
/*!40000 ALTER TABLE `transStat` DISABLE KEYS */;
/*!40000 ALTER TABLE `transStat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksiPembeli`
--

DROP TABLE IF EXISTS `transaksiPembeli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksiPembeli` (
  `transaksiPembeli_id` int(11) NOT NULL AUTO_INCREMENT,
  `pembeli_username` varchar(50) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `penjual_id` int(11) DEFAULT NULL,
  `produk_nama` varchar(50) DEFAULT NULL,
  `produk_harga` int(11) DEFAULT NULL,
  `produk_deskripsi` varchar(500) DEFAULT NULL,
  `produk_jumlahBeli` int(11) DEFAULT NULL,
  `produk_statusPromo` int(11) DEFAULT NULL,
  `produk_diskon` int(11) DEFAULT NULL,
  `produk_hargaDiskon` int(11) DEFAULT NULL,
  `produk_tanggalBeli` varchar(50) DEFAULT NULL,
  `transaksi_status` varchar(50) DEFAULT NULL,
  `produk_hargaBayar` int(11) DEFAULT NULL,
  `produk_gambar` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`transaksiPembeli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksiPembeli`
--

LOCK TABLES `transaksiPembeli` WRITE;
/*!40000 ALTER TABLE `transaksiPembeli` DISABLE KEYS */;
INSERT INTO `transaksiPembeli` VALUES (1,'medi',2,1,'Baut Set',400000,'Baut set terbaik di Indonesia',2,0,0,400000,'2018/05/04','false',800000,'https://lh3.googleusercontent.com/ooxOXQlAExOxF8uabFAr1It8Wss2PfdJAe54sKFeSmsyigo0UK1lJxRsGpg93xOTW9WYdWl96DcKS59JG9a8V9LIL-JBgX6-1SivLE3o_7py4fhof61kpkCBNI7jUN-8tTVtb7V0V2GpcRV7a1gmuHFymlxClLaf7Kuw9rHpYIzYqpEt_RaxPeFoBIBeCSGy8VCvsAjg_qIo73BVrtVDcbjNvguGRP2Zur8T0Sq9Zk4Pw5LooY7PpAgNFPEAzmjJvDjZKL8sh6Z_koHOHwmhKTnLXVCIiCgaosi5T3YWrpE-lYLBVStOWuHW_PjowclCIepIwqa-sDrw5WTItUISV2Zam_W5kqKMCCSpmg_xXb0JXTvKLchLE9eKqT4qUyrcZwWLShxMLW3elWpKWagmGQFIH8xYVvEgdSfCAlejxdOF18OSmcXruI1Nr9i8mnB3ZSg5S4qxeQZrSqGxCmGBZiUuVS356gpS_ko79NQaVZobtoc8K5HzOhUtyzHddH0gSWjWH5iAeWNtgqy-Uq9p9i6XFGs8qZjIzlNin8v3JxDwXDH1dsYyT_-4Ic73p64pxK-n4uvlkAgYnxnUAh2_rlqmRW_Zlls9KqI005kzS-XI9NyxlB3iYCuNv4bVQW684BcLjbkNKvXelWS9_9tfizKvKSu7o9k=w959-h639-no'),(2,'medi',3,1,'Palu',5000,'Palu terbaik di Indonesia',3,0,0,5000,'2018/03/04','false',15000,'https://lh3.googleusercontent.com/mE-7ValWSLuSWew55LSJws6Gk_57Er8FJWP8ShtuwOhSjIzfg0V8CX5nDv2AdBFuIzJxoP2iQNWOGRI7DXn9Kfcf3XoFWEqaB2GuyP9ZYBuih_SR__Zvfa-Q8ZX6jdONdF2J0XEQ32UpGq9A4pFtrSmlR51Zi2Br8V0_99QFg1aGnOFmBIdlx93nJqFsFnD8r3Gb8MQVx0IVdErIidJrN2Qrl2eq6T94srIbyibHx1Ep90_qAYzls6aznmpEFmEJoM9teG0T8ZyOyd5_XaZlOEeVPxF7nElpO7zZrmSwcvPCUDDtP9OrHQycEh-o4k-zjC_J9xGLx6Nmsg0kvJmCXVvy3i30WU3swBUtW9RKtf-Emie13djVXBTbXIJMtVvj8l7CXVdAjPi3TJybXutaIzb0bx40hJ8Pw4hPyeXH_a0503K7rH9TsVFQDN-i0swVgPEO1VMUgbpiZAN7RnKu_n3w3f7XKTGfpLhpvRslI-teWlFdHFMufpNOMIdP1lW4nl_AzH1XwPTRvayIoP2Yku1VyO8NHEwqxd0Wmgp5936munk0EfIgHtiXk4wyySwraP42TeDCzIxNYZeN78FQUHWXr5Db0NrzxHsHOXJ5z0c0yEMtSoxhFMtO9hz3D8vpTTpC26Cz0gKvwhGlLq4MmqCCwQ1mHCc=w960-h607-no'),(3,'medi',4,1,'Kompressor',500000,'Kompressor terbaik di Indonesia',3,0,1,500000,'2018/03/04','false',1500000,'https://lh3.googleusercontent.com/qunULxIxnRN4nwIXM7Ilh1SXu5Fj7TLizi0MZHnFXDgX7UQAU05ZmtCWxjNvDwkpRlsbZizCCcwE2JNdfhk94qcSsS1itU8Q1X_Y3hpYMLnd7ushzUkq7A4rztR1-Cxg872SbNksF93cq12BhAz3fTP1vhtaEvSdyQIsODqSWehZGmHih4e4NHDGj4qd_O835ztG_G2bgsO32uNa82TmmE25ECR1KFEBSFQf1a7Dhacke4aT0AtHSx-bZhPct1e4AQk9UHU0gOwoFp6dcCP6A0GC8d1zXOz1NLWI9Z2SdO8t4eFM8zM7u26FErPE-_Uqv7Cul4PU_8I234G2BDt59wpU0a77j4T3LJygZ2gHbhe38niEF-0zF49tOsWEz3_sGHdox2Q6sbE9iTUocHsN0CDvn2VDAaprCTMh4vqML2VTvBEGY-1BziCPDDlgTj7v5gwXogy2kiTdYBsNBxK3IvLW9I1yVH4xoi-dtogk7c4zB5tSm3T5zLc5kfx3nuHy70hIo2HPR_9L_akG7U_uv1xfREQWYL-wWxgxBxsj82eV_g9vtepsV-3yFRsEAovqi2Q0vuSdFp83BjGluo9jf_ODO3NISsNvbcjFv56LniclWkg26x61k7h83vqF0zUK3S6m9uWuVDlV9FHqdE_yzE15RBQur8A=w955-h639-no'),(4,'medi',5,1,'Headset Noise',100000,'Headset terbaik di Indonesia',3,0,1,100000,'2018/03/04','false',300000,'https://lh3.googleusercontent.com/0GmuOrgcaC9i6CYWhJn-UT8hqNCmFMH43j83BjuMI549Dkmk9CYk61r9bcXrPNl_tpGJ73VLi6vDFNyCjC0KBiQwOq4JD4KbR4_JS15ba07h5uCIg80M0oPL0x01sWwtqcp-jZjOM88CfXj2UIACFfrvZva4d5rxqXvnk7XtXDEN7Cx_NM31WXJHiOYY6yLVETA9UOzwaE2sZSV1mNxYPjvHysqufb9SaPNUbOVK5eRgYIxceXq235LTb60XedwWV5idJ_aqAo_cINVPMJUJtOhSRtzckL6xMGscwQPfKt1BwoCpSYxIGyjYAzVN0Ke74bPLrvMuV7fqJ2iQ4TGRC11XipG5WXG7jKPndqxFPsmXp5ahV716D1iiClUlJceONaRA66zfgtUN6jG8oVSb1vf2Z0NTQd_2xrF_700IFeYlTdK3kCvzH3iLydkJDf6PXRSGibZo2sfUPL8k0qvcAkQChZdHtPC5z-E_nQNZpkUvPBkn-aOlppoVgp5rOoWMT6d2y4Nd5euWYXK-o3ILlbhv6ZAyrW34_sSRU6SEeHcQyr_osdsc7R_a_XasDRcXvac_7GZVZi_2-0-qpwgGc1t99d2PxKS4EKhXE5hWEVHtufuVzhwdaCjjYinmcFPi-_ugWtH1PCvQw9_yqwI3fynok09aBl8=w959-h639-no'),(5,'medi',1,1,'Mata Bor',40000,'Mata bor terbaik di Indonesia',1,1,5,20000,'2019-3-25','false',20000,'https://lh3.googleusercontent.com/MHzE2AHU-sXnp4bScbC64yHkYYgVDxmrNQYd70YmmQZFzqM7t44zk5xyPKolc1bjB3DZmeHRg_u2hmtMhJdZNP_GhAYUJ7vDlKrOa2pYpE3YLuZO2jigKdkWk0JOp9BGrIbVu2gmycKax7IMYln-V38k4H8K-gWdp8Xl-Lx1iZBd17IjapGQ2O3A1R-DHlwgTIXSjddaSziZkVRUXt-NXUBaE1Fr7sMjc0e5tGIaJbaVQ-mQa1J0Kfib4z_js0MpBI2K6HgXZfVeEsf1ZhsEbpBkis27AMSwVf2q3RkWDAjrFLm3zlZbmyTHxoW6KmfHuIm69ipa5YXbJ4amYPg0weonnPdop39Df_ZzzXQXGlkdvMOIs8FtXxqQ0BCULg4E1OC_uUdTZJ7lUeg7Kky2CnbWuUrkDhyj2nWvJvLwPEW55HX_ErMBij8c134qOCm7YSBhrBjOx3YXmzywWZo8iObRzwKb1hEm_jV_JI4K-83tNwvWn6nStWVvynKUfXNgK-rJWnvshQeUWzg84rF-HEFu1KktgUPFg0D3mCg8cNGW1V_b1yh3X69uw6exWJJ4NWl99gNDTUOGkrxjPaNQeLcCiNDAHLYhn4YJWmjgdTAFpgB0mt3RxQEW1B6ERQm-8a8F02Z8_0bxMP0BBzCF5MJZQdEtjck=w955-h639-no'),(6,'medi',1,1,'Mata Bor',40000,'Mata bor terbaik di Indonesia',7,1,5,20000,'2019-3-25','false',140000,'https://lh3.googleusercontent.com/MHzE2AHU-sXnp4bScbC64yHkYYgVDxmrNQYd70YmmQZFzqM7t44zk5xyPKolc1bjB3DZmeHRg_u2hmtMhJdZNP_GhAYUJ7vDlKrOa2pYpE3YLuZO2jigKdkWk0JOp9BGrIbVu2gmycKax7IMYln-V38k4H8K-gWdp8Xl-Lx1iZBd17IjapGQ2O3A1R-DHlwgTIXSjddaSziZkVRUXt-NXUBaE1Fr7sMjc0e5tGIaJbaVQ-mQa1J0Kfib4z_js0MpBI2K6HgXZfVeEsf1ZhsEbpBkis27AMSwVf2q3RkWDAjrFLm3zlZbmyTHxoW6KmfHuIm69ipa5YXbJ4amYPg0weonnPdop39Df_ZzzXQXGlkdvMOIs8FtXxqQ0BCULg4E1OC_uUdTZJ7lUeg7Kky2CnbWuUrkDhyj2nWvJvLwPEW55HX_ErMBij8c134qOCm7YSBhrBjOx3YXmzywWZo8iObRzwKb1hEm_jV_JI4K-83tNwvWn6nStWVvynKUfXNgK-rJWnvshQeUWzg84rF-HEFu1KktgUPFg0D3mCg8cNGW1V_b1yh3X69uw6exWJJ4NWl99gNDTUOGkrxjPaNQeLcCiNDAHLYhn4YJWmjgdTAFpgB0mt3RxQEW1B6ERQm-8a8F02Z8_0bxMP0BBzCF5MJZQdEtjck=w955-h639-no'),(7,'medi',1,1,'Mata Bor',40000,'Mata bor terbaik di Indonesia',10,1,5,20000,'2019-3-25','false',200000,'https://lh3.googleusercontent.com/MHzE2AHU-sXnp4bScbC64yHkYYgVDxmrNQYd70YmmQZFzqM7t44zk5xyPKolc1bjB3DZmeHRg_u2hmtMhJdZNP_GhAYUJ7vDlKrOa2pYpE3YLuZO2jigKdkWk0JOp9BGrIbVu2gmycKax7IMYln-V38k4H8K-gWdp8Xl-Lx1iZBd17IjapGQ2O3A1R-DHlwgTIXSjddaSziZkVRUXt-NXUBaE1Fr7sMjc0e5tGIaJbaVQ-mQa1J0Kfib4z_js0MpBI2K6HgXZfVeEsf1ZhsEbpBkis27AMSwVf2q3RkWDAjrFLm3zlZbmyTHxoW6KmfHuIm69ipa5YXbJ4amYPg0weonnPdop39Df_ZzzXQXGlkdvMOIs8FtXxqQ0BCULg4E1OC_uUdTZJ7lUeg7Kky2CnbWuUrkDhyj2nWvJvLwPEW55HX_ErMBij8c134qOCm7YSBhrBjOx3YXmzywWZo8iObRzwKb1hEm_jV_JI4K-83tNwvWn6nStWVvynKUfXNgK-rJWnvshQeUWzg84rF-HEFu1KktgUPFg0D3mCg8cNGW1V_b1yh3X69uw6exWJJ4NWl99gNDTUOGkrxjPaNQeLcCiNDAHLYhn4YJWmjgdTAFpgB0mt3RxQEW1B6ERQm-8a8F02Z8_0bxMP0BBzCF5MJZQdEtjck=w955-h639-no'),(8,'rosa',1,1,'Mata Bor',40000,'Mata bor terbaik di Indonesia',2,1,5,20000,'2018/04/04','false',40000,'https://lh3.googleusercontent.com/MHzE2AHU-sXnp4bScbC64yHkYYgVDxmrNQYd70YmmQZFzqM7t44zk5xyPKolc1bjB3DZmeHRg_u2hmtMhJdZNP_GhAYUJ7vDlKrOa2pYpE3YLuZO2jigKdkWk0JOp9BGrIbVu2gmycKax7IMYln-V38k4H8K-gWdp8Xl-Lx1iZBd17IjapGQ2O3A1R-DHlwgTIXSjddaSziZkVRUXt-NXUBaE1Fr7sMjc0e5tGIaJbaVQ-mQa1J0Kfib4z_js0MpBI2K6HgXZfVeEsf1ZhsEbpBkis27AMSwVf2q3RkWDAjrFLm3zlZbmyTHxoW6KmfHuIm69ipa5YXbJ4amYPg0weonnPdop39Df_ZzzXQXGlkdvMOIs8FtXxqQ0BCULg4E1OC_uUdTZJ7lUeg7Kky2CnbWuUrkDhyj2nWvJvLwPEW55HX_ErMBij8c134qOCm7YSBhrBjOx3YXmzywWZo8iObRzwKb1hEm_jV_JI4K-83tNwvWn6nStWVvynKUfXNgK-rJWnvshQeUWzg84rF-HEFu1KktgUPFg0D3mCg8cNGW1V_b1yh3X69uw6exWJJ4NWl99gNDTUOGkrxjPaNQeLcCiNDAHLYhn4YJWmjgdTAFpgB0mt3RxQEW1B6ERQm-8a8F02Z8_0bxMP0BBzCF5MJZQdEtjck=w955-h639-no'),(9,'medi',1,1,'Mata Bor',40000,'Mata bor terbaik di Indonesia',1,1,5,20000,'2019-3-25','false',20000,'https://lh3.googleusercontent.com/MHzE2AHU-sXnp4bScbC64yHkYYgVDxmrNQYd70YmmQZFzqM7t44zk5xyPKolc1bjB3DZmeHRg_u2hmtMhJdZNP_GhAYUJ7vDlKrOa2pYpE3YLuZO2jigKdkWk0JOp9BGrIbVu2gmycKax7IMYln-V38k4H8K-gWdp8Xl-Lx1iZBd17IjapGQ2O3A1R-DHlwgTIXSjddaSziZkVRUXt-NXUBaE1Fr7sMjc0e5tGIaJbaVQ-mQa1J0Kfib4z_js0MpBI2K6HgXZfVeEsf1ZhsEbpBkis27AMSwVf2q3RkWDAjrFLm3zlZbmyTHxoW6KmfHuIm69ipa5YXbJ4amYPg0weonnPdop39Df_ZzzXQXGlkdvMOIs8FtXxqQ0BCULg4E1OC_uUdTZJ7lUeg7Kky2CnbWuUrkDhyj2nWvJvLwPEW55HX_ErMBij8c134qOCm7YSBhrBjOx3YXmzywWZo8iObRzwKb1hEm_jV_JI4K-83tNwvWn6nStWVvynKUfXNgK-rJWnvshQeUWzg84rF-HEFu1KktgUPFg0D3mCg8cNGW1V_b1yh3X69uw6exWJJ4NWl99gNDTUOGkrxjPaNQeLcCiNDAHLYhn4YJWmjgdTAFpgB0mt3RxQEW1B6ERQm-8a8F02Z8_0bxMP0BBzCF5MJZQdEtjck=w955-h639-no'),(10,'medi',6,1,'Kunci Set',900000,'Kunci set terbaik di Indonesia',3,0,1,900000,'2019-3-25','false',2700000,'https://lh3.googleusercontent.com/rx_EHyC42gblIfVTVwyIGMVA9KGqDWfRPC0HrBO0CABzn-Nkyxin7kc8eRvqAge88kXdG6k2jQgC7fln6R47dAitUWJzL8a1CYMKcHDzzdDB2uq4Z71pyzey5wc95_vJ6X6nzAcK0OncDWdDqmPXn-C1y3UUvRKKuMz2Qke5six4WXXcFrfj5WWI2r7RIrEZSQrwzBBbeKG6-C_gG5pyL0AXNMI-WwkMSh4gdojNnra_TmSru0jurHCLG8cwFqVE2ZdExF-u7o7D3Ldgav0Ljp2f3muAIy8RwHCs86DI3kqd-ERNH6gMAnJiBh-cRS15Bj1zUdtpFSPZ-9_SwzcsBS4QxijRpA-C_lxdtz9h1hX1fjA2k6Jd3sAnYg_gazruppRV5Jzaxe5zls57iaYgfnL604Uh3Yik_PglbLJy5Xe0GyBbe0ZPorNiol_xmwT4ohoMmcKS9vMLygcymSZR21MFu9-XNvuVLVJl_qSSIEDIWRzHrJRjYlEUxPtcdAAwIWif5LvfCaXIklQgGIfKe1Et0O94QBLXZzuYFJIheJyqoknPWHERdPae5gJ9uq8Lq1hbfavsG3PuAt7KVYXo-_M2SgmlEfAhEut4-gw5bXrKXxeyHX0EfP4gaXu951NwDd-CPpbTvksSx-27IjT3e5viukAdflY=w960-h539-no'),(11,'medi',13,1,'Kabel Aki',8000,'Kabel Aki terbaik di Indonesia',7,1,9,800,'2019-3-25','false',5600,'https://lh3.googleusercontent.com/PUXkbogfuIl7YgYicujF7qAtKJXELbEhR0WNjploj7fObM32ZTRKahrmmMfXhqjbf_DL9ToLKHoGiMUnUah56KHxYP7Puh3-tCvJbyJyccArRfXd1rkvoQkUCpx1vCl0v-QDOQHsRMIrEtVjetj3d9i4eYE5dvuoNzxHdoqZhbXL_CRY-FV8AGmNnx27KKgdBgEQKbOnFCjqx78CZPx0D40RtZnsNkLEkO7yOLKbMvICp2Qk0DZmm1rRXEKmGExatnZJHy2NSo0NrOstfxxcmb0folCAxhF1LvhDgKLsxgtEbgL0IlsX3-OzSNQ037asoE-ArcQo9uKoQfULGEPlK90rV01Nk8h_VQ9aKrVetGKAA2h7laIxoday4Z8JNttBvdfvHlmt7-DEQ_HSgHh1QYLxl4iRHVvezSYu1KYMkG8B_sQX4xlq4xtwQRPBAXhD04bF6cJHbS1XyDSsm49PzwJqWQhex5wT3aqdR3u-DgRPk48syQpkeW5838A9CspxX0l51r5L6LWjfxGJy7UbguPbImhuSdUOrFJvPIGlvlgob_Cz3GV1n6j4u8CZfrVDSmMghsmBhw6I_wAnzla5UFxwDHXUKhCv7PITwjy-KO_5JIHF-CK0IzSoapzvVR7grsiFS713e0uPb7L-_KDRwq-SCdGuUvg=w852-h639-no'),(12,'medi',4,1,'Kompressor',500000,'Kompressor terbaik di Indonesia',1,0,1,500000,'2019-3-25','false',500000,'https://lh3.googleusercontent.com/qunULxIxnRN4nwIXM7Ilh1SXu5Fj7TLizi0MZHnFXDgX7UQAU05ZmtCWxjNvDwkpRlsbZizCCcwE2JNdfhk94qcSsS1itU8Q1X_Y3hpYMLnd7ushzUkq7A4rztR1-Cxg872SbNksF93cq12BhAz3fTP1vhtaEvSdyQIsODqSWehZGmHih4e4NHDGj4qd_O835ztG_G2bgsO32uNa82TmmE25ECR1KFEBSFQf1a7Dhacke4aT0AtHSx-bZhPct1e4AQk9UHU0gOwoFp6dcCP6A0GC8d1zXOz1NLWI9Z2SdO8t4eFM8zM7u26FErPE-_Uqv7Cul4PU_8I234G2BDt59wpU0a77j4T3LJygZ2gHbhe38niEF-0zF49tOsWEz3_sGHdox2Q6sbE9iTUocHsN0CDvn2VDAaprCTMh4vqML2VTvBEGY-1BziCPDDlgTj7v5gwXogy2kiTdYBsNBxK3IvLW9I1yVH4xoi-dtogk7c4zB5tSm3T5zLc5kfx3nuHy70hIo2HPR_9L_akG7U_uv1xfREQWYL-wWxgxBxsj82eV_g9vtepsV-3yFRsEAovqi2Q0vuSdFp83BjGluo9jf_ODO3NISsNvbcjFv56LniclWkg26x61k7h83vqF0zUK3S6m9uWuVDlV9FHqdE_yzE15RBQur8A=w955-h639-no'),(13,'medi',9,1,'Pyrex',9000,'Pyrex terbaik di Indonesia',100,1,5,4500,'2019-3-26','false',450000,'https://lh3.googleusercontent.com/sgi2rX6D_H6bDksktbon9KkfPkI7svzyZr93X5jKxkoGQSqkCUhRk_2AsVhOGEUv3U-P-b5I4RFGVJJv8U3Y4xMJ7IlysYY72VufXvx4O2sU8UCTcn970lANObWKRupqWG1bxcB5SjEnz4Y0x_UNlGX118Jenn7RmCgwApeKaRk8aFo_flHxL0rjZNotniYtH9C0_mQUzHUf4_u5sv1OI5QnSinBLsUt2QZxs5f76ok6qiEPPWZCjXdMiBVcpZ1UnmdIBwz3A_Ys2A_U9HD9i_kGQtMNyL_fIMivcoYEQ5C84p1m4mf-v0rO-UdxkhOYJootYckrIVRPS7vX4rAWtd0J8M7Y2L2mLl_NwNpzYcWGoPRrVZkofQP1NkWfPZUQI5e-aFIgZ7RFtWpyXM2htFOF1imYKaKs9KbjlX5uI-uR2zngFwY0TUukDyrsaTo83GIM45deFGxrMiias8aF8FszS0ZDVWAtKOEKc6m-Dyp4-14CcpyjB_UpfLzlQtkGTvGv06NguIL6pDOKPNKWMldsFlrGJ-dCT-S3asjjPrNSMVCjemWy1cBPlKRXpGHtk9rPJJYCVLrahIyTohlumolJu1uhlyMkDf_GlwMKKBMXnNutMj01t-BGFx5LgT5-cd14CviSQppFssX_X6h5-k-djP-_aA=w222-h227-no'),(14,'medi',9,1,'Pyrex',9000,'Pyrex terbaik di Indonesia',100,1,5,4500,'2019-3-26','false',450000,'https://lh3.googleusercontent.com/sgi2rX6D_H6bDksktbon9KkfPkI7svzyZr93X5jKxkoGQSqkCUhRk_2AsVhOGEUv3U-P-b5I4RFGVJJv8U3Y4xMJ7IlysYY72VufXvx4O2sU8UCTcn970lANObWKRupqWG1bxcB5SjEnz4Y0x_UNlGX118Jenn7RmCgwApeKaRk8aFo_flHxL0rjZNotniYtH9C0_mQUzHUf4_u5sv1OI5QnSinBLsUt2QZxs5f76ok6qiEPPWZCjXdMiBVcpZ1UnmdIBwz3A_Ys2A_U9HD9i_kGQtMNyL_fIMivcoYEQ5C84p1m4mf-v0rO-UdxkhOYJootYckrIVRPS7vX4rAWtd0J8M7Y2L2mLl_NwNpzYcWGoPRrVZkofQP1NkWfPZUQI5e-aFIgZ7RFtWpyXM2htFOF1imYKaKs9KbjlX5uI-uR2zngFwY0TUukDyrsaTo83GIM45deFGxrMiias8aF8FszS0ZDVWAtKOEKc6m-Dyp4-14CcpyjB_UpfLzlQtkGTvGv06NguIL6pDOKPNKWMldsFlrGJ-dCT-S3asjjPrNSMVCjemWy1cBPlKRXpGHtk9rPJJYCVLrahIyTohlumolJu1uhlyMkDf_GlwMKKBMXnNutMj01t-BGFx5LgT5-cd14CviSQppFssX_X6h5-k-djP-_aA=w222-h227-no'),(15,'medi',8,1,'Agriculture Drone',1500000,'Drone Pertanian terbaik di Indonesia',5,0,5,1500000,'2019-3-26','true',7500000,'https://lh3.googleusercontent.com/SQf66rFg_t5OPFElPyFtPIYzXt98Oan0avSQWb0zJi18Ha799x3lr9Tp2Ln4pWUdTxA40RKTWqXbDGOM_asncAye3fr7nzvO6_Tfa89SqGWnPPUsWH1mezwQQHn7GmKzR9zGBkCvti78fmlU_Geipginvmy34jVVcoUARngD1nsj-IXPfL079xvCLipfF3aeW-p79YfjKmBMIOlLcOQDxjleBZaDhg1KxDGqNEYTn73RMgpTHMJfYhONy03sPCpZi2jyi7DWtAUc8yIkvaYXCcU_NHXFCKezuTCsVrakmg9-stP2h9mRwoFO4tBpJ1mtQFlIdchdz4zacxqrGAOOUBfsaJkFbTNCSx4COWfEzCG4YB60iQEVS1ZZ22rxcmWxZR2XyDOFHAsOaikWw14_9ilvd9nZCfLjXgkNUWQk26L84vI3vDsGCuVxkXBr-r0hm8ySY8lbosOydULrpjwh_aq7zuKeL4faefB14ewy2ssRPQ00KbpHahjr573g3Ao_EHQJ0OlMa0Jjt0JSJLyKcCwXeKc3Cq51QbjPR9fj4ylwh3j_LGj0mCn9fLYa4cIMCjFFiLUFvi3H90Qi69AjjCy3F4Zmk4XAZWrR9UgnERlaMv-Bzau-sXP2gMcK9bDWu7fHIjhJZqnI54RzH07J0pMUYqh3ag=w800-h513-no'),(16,'rosa',19,2,'Voice recorder',20000,'voice rec Indo',10,0,0,20000,'2019-3-26','true',200000,'https://lh3.googleusercontent.com/KT8Q91NkR-yIcw7wmqQkwZhA7NOtKIEHylZjY6_m3BjwjNO1X_wibEzLm2wJqq3aZmMMJve7KM0k6PM0bFzKT6Dj04AJ6M5TlCsK_Hs8DIBj3-MQz39A_ktLU9wbJ7AkNV964teRzBeXXeTmgvoJ-1MvM0io5ReLR-CDtdl44WT1WKNFVyG_FL9W7dJ1JRrr_GtePIt1HT_vWKlOAlCACVBp8RbdWyfEld1MpA_PUm5Io7ZCP-AvczNt84_AE8swyu_-mCCBzaVMPsdjWrCUixE_RnstXkc1A0T11gBmSeWOAqyL1oDHFhm4OWlj1upxKhrXXe-mn376onewjkp8UnP1WptYtigQ7irlr2S_SxdLTiTEUC_Gn5sWN8cAWEYJ4pwt91mg2O-cbkD9tNgbYUxFvK1eZnXWGn-QXtk_9CuCX4rh9T033R9aBplyEISa3JKD37wUiEoW41GKZEhG7KWulkhI0LoFnQX4MXTSIYl56WtSFM_g7lV6y6WzGBJEjbwWrFVMA2tfWLcQNzATsgb4gOvuwMCyApRF8mcJfZUAAyb2pAGeYxiVRv1CT1Qhzm9Cyl4Iw78pC6jGewGxmHf94jCJZjrthwJWFAvXRjNW8CQS1gBN3nNgn7S5nm3IQOE9ZTdmlTqiVSpMml6r6S1mxtAOA-8=w755-h450-no');
/*!40000 ALTER TABLE `transaksiPembeli` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-26 16:50:11
