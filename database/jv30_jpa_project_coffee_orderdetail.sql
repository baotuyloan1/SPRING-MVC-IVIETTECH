-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: jv30_jpa_project_coffee
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlcynrjxtlp5kft57u85tk7vwi` (`order_id`),
  KEY `FKdubukg3j0fymgci0idnd72k0` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (130,96,3,1,205,'Truyền thống số 2'),(129,96,2,1,192,'Truyền Thống số 1'),(128,96,1,7,298,'Arabica Đặc Biệt'),(138,103,1,5,298,'Arabica Đặc Biệt'),(139,104,1,1,298,'Arabica Đặc Biệt'),(140,105,1,1,298,'Arabica Đặc Biệt'),(141,106,1,1,298,'Arabica Đặc Biệt'),(142,107,1,1,298,'Arabica Đặc Biệt'),(143,108,1,2,298,'Arabica Đặc Biệt'),(144,108,2,2,192,'Truyền Thống số 1'),(145,109,1,1,298,'Arabica Đặc Biệt'),(146,109,7,3,543,'Moka Cầu Đất'),(147,110,2,1,192,'Truyền Thống số 1'),(148,111,1,2,298,'Arabica Đặc Biệt'),(149,112,1,2,298,'Arabica Đặc Biệt'),(150,113,1,2,298,'Arabica Đặc Biệt'),(151,114,1,3,298,'Arabica Đặc Biệt'),(152,114,3,1,205,'Truyền thống số 2'),(154,116,1,1,298,'Arabica Đặc Biệt'),(155,116,2,1,192,'Truyền Thống số 1'),(156,117,1,3,298,'Arabica Đặc Biệt'),(157,117,3,1,205,'Truyền thống số 2'),(158,118,1,3,298,'Arabica Đặc Biệt'),(159,118,3,1,205,'Truyền thống số 2'),(160,118,7,1,543,'Moka Cầu Đất'),(161,118,2,1,192,'Truyền Thống số 1');
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-23 22:10:27
