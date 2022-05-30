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
-- Table structure for table `customerinfo`
--

DROP TABLE IF EXISTS `customerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `phoneNumber` varchar(12) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbi7kolyg49ch6ojqiqyyo4qr5` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerinfo`
--

LOCK TABLES `customerinfo` WRITE;
/*!40000 ALTER TABLE `customerinfo` DISABLE KEYS */;
INSERT INTO `customerinfo` VALUES (60,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Van A','MALE','0788049042',1),(62,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao','MALE','0788049042',1),(68,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao','FEMALE','0788049042',1),(69,'khong dang nhap','nguyenducbaokey@gmail.com','khong dang nhap','MALE','2312412',NULL),(70,'khong dang nhap','nguyenducbaokey@gmail.com','khong dang nhap','MALE','2312412',NULL),(71,'khong dang nhap','nguyenducbaokey@gmail.com','Bao','MALE','2134123',NULL),(72,'khong dang nhap','nguyenducbaokey@gmail.com','Bao','FEMALE','2312312',NULL),(73,'khong dang nhap','nguyenducbaokey@gmail.com','khong dang nhap','MALE','123123',NULL),(74,'test003','nguyenducbaokey@gmail.com','test003','MALE','0905624657',NULL),(75,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao','FEMALE','0788049042',1),(76,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao','FEMALE','0788049042',1),(77,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao',NULL,'0788049042',1),(78,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao',NULL,'0788049042',1),(79,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao',NULL,'0788049042',1),(80,'test005','nguyenducbaokey@gmail.com','Nguyen Van A','MALE','09788049042',NULL),(82,'Hoa Phong','nguyenducbaokey@gmail.com','Nguyen Duc Bao','FEMALE','0788049042',1),(83,'test final','nguyenducbaokey@gmail.com','test final','FEMALE','0905624653',NULL),(84,'Hoa Phong','nguyenducbaokey@gmail.com','test final','MALE','0788049042',1);
/*!40000 ALTER TABLE `customerinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-23 22:10:29
