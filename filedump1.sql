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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,'demiapabro','demiGod');
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
INSERT INTO `pembeli` VALUES (2,'rahmedirosa@gmail.com','123456rahmedi','medi','Rahmedi Rosa','male','Jakarta','Dokter'),(3,'rosa@gmail.com','123456rosa','rosa','Rosa Rosa','male','Bandung','Teknik'),(4,'rosa@gmail.com2','123456rosa2','rosa2','Rosa Rosa2','male2','Bandung2','Tekni2');
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
  PRIMARY KEY (`penjual_id`),
  UNIQUE KEY `penjual_email` (`penjual_email`),
  UNIQUE KEY `penjual_password` (`penjual_password`),
  UNIQUE KEY `penjual_username` (`penjual_username`),
  UNIQUE KEY `penjual_namaLengkap` (`penjual_namaLengkap`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjual`
--

LOCK TABLES `penjual` WRITE;
/*!40000 ALTER TABLE `penjual` DISABLE KEYS */;
INSERT INTO `penjual` VALUES (1,'muhammadridhorosa@gmail.com','123456rosa','ridhorosa','Muhammad Ridho Rosa','male','Jakarta'),(3,'cindya@gmail.com','123456cindya','cindya','Cindya Perthy Iswandi','female','Bandung');
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
  `produk_gambar` varchar(100) DEFAULT NULL,
  `produk_stok` int(11) DEFAULT NULL,
  `produk_kategori` varchar(50) DEFAULT NULL,
  `produk_subkategori` varchar(50) DEFAULT NULL,
  `produk_statusPromo` int(11) DEFAULT NULL,
  `produk_diskon` int(11) DEFAULT NULL,
  `produk_hargaDiskon` int(11) DEFAULT NULL,
  `produk_tanggalPost` varchar(50) DEFAULT NULL,
  `produk_Jumlahdibeli` int(11) DEFAULT NULL,
  PRIMARY KEY (`produk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,3,'Obat Jantung3',400000,'This is the best heart dieases cure','https://abc.com',5,'Dokter','Jantung',0,0,400000,'2018/02/10',68),(2,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',32),(3,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',99,'Teknik','Electrical',1,4,2400000,'2018/01/20',202),(4,3,'Obat Pilek',5000,'This is the best cold dieases cure','https://abc.com',100,'Dokter','Penyakit Dalam',1,6,2000,'2018/02/10',0),(6,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(7,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(8,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(9,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(10,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(11,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(12,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(13,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(14,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(15,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(16,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(18,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(19,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(20,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(21,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(22,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(23,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(24,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(25,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(26,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(27,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(28,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(29,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(30,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(31,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(32,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(33,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(34,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(35,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(36,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(37,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(38,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(39,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(40,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(41,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(42,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(43,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(44,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(45,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(46,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(47,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(48,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(49,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(50,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(51,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(52,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(53,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(54,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(55,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(56,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(57,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(58,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(59,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(60,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(61,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(62,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(63,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(64,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(65,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(66,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(67,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(68,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(69,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(70,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(71,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(72,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(73,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(74,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(75,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(76,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(77,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(78,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(79,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(80,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(81,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(82,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(83,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(84,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(85,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(86,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(87,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(88,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(89,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(90,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(91,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(92,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(93,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(94,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(95,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(96,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(97,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(98,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(99,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(100,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(101,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(102,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(103,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(104,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(105,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(106,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(107,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(108,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(109,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(110,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(111,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(112,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(113,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(114,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(115,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(116,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(117,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(118,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(119,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(120,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(121,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(122,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(123,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(124,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(125,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(126,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(127,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(128,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(129,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(130,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(131,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(132,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(133,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(134,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(135,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(136,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(137,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(138,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(139,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(140,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(141,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(142,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(143,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(144,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(145,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(146,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(147,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(148,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(149,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(150,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(151,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(152,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(153,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(154,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(155,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(156,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(157,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(158,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(159,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(160,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(161,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(162,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(163,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(164,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(165,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(166,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(167,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(168,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(169,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(170,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(171,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(172,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(173,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(174,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(175,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(176,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(177,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(178,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(179,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(180,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(181,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(182,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(183,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(184,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(185,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(186,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(187,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(188,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(189,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(190,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(191,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(192,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(193,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(194,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(195,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(196,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(197,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(198,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(199,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(200,1,'Drone3',4000000,'This drone can fly 24/7','https://wxyz.com',300,'Teknik','Electrical',1,4,2400000,'2018/01/20',0),(201,3,'Obat Pilek',5000,'This is the best cold dieases cure','https://abc.com',100,'Dokter','Penyakit Dalam',1,6,2000,'2018/02/10',0);
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
  PRIMARY KEY (`transaksiPembeli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksiPembeli`
--

LOCK TABLES `transaksiPembeli` WRITE;
/*!40000 ALTER TABLE `transaksiPembeli` DISABLE KEYS */;
INSERT INTO `transaksiPembeli` VALUES (1,'medi',2,3,'Obat Jantung2',400000,'This is the best heart dieases cure',10,0,0,400000,'2018/02/15','false',4000000),(2,'rosa',1,3,'Obat Jantung3',400000,'This is the best heart dieases cure',10,0,0,400000,'2018/02/15','false',4000000),(3,'rosa',1,3,'Obat Jantung3',400000,'This is the best heart dieases cure',10,0,0,400000,'2018/02/15','false',4000000),(4,'medi',2,3,'Obat Jantung2',400000,'This is the best heart dieases cure',2,0,0,400000,'2018/02/15','false',800000),(5,'medi',1,3,'Obat Jantung3',400000,'This is the best heart dieases cure',1,0,0,400000,'2018/02/15','false',400000),(6,'rosa',1,3,'Obat Jantung3',400000,'This is the best heart dieases cure',1,0,0,400000,'2018/02/15','false',400000),(7,'rosa',3,1,'Drone3',4000000,'This drone can fly 24/7',1,0,0,4000000,'2018/02/15','false',4000000),(8,'rosa',3,1,'Drone3',4000000,'This drone can fly 24/7',100,0,0,4000000,'2018/02/15','false',400000000),(9,'medi',1,3,'Obat Jantung3',400000,'This is the best heart dieases cure',1,0,0,400000,'2018/02/15','true',400000),(10,'rosa',3,1,'Drone3',4000000,'This drone can fly 24/7',100,0,0,4000000,'2018/02/15','false',400000000),(11,'rosa',3,1,'Drone3',4000000,'This drone can fly 24/7',1,0,0,4000000,'2018/02/15','false',4000000);
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

-- Dump completed on 2019-03-20  8:37:18
