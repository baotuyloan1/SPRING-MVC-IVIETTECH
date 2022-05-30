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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `howToRoast` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `preparation` varchar(255) DEFAULT NULL,
  `particleSize` varchar(255) DEFAULT NULL,
  `netWeight` int(11) NOT NULL,
  `createAt` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ekr2tfsm0ukcajg4ovoafhis` (`category_id`),
  KEY `FKaxeo9fj1sfah36yd9bujs8qft` (`producer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,7,1,'Caffein > 1.5%','Rang nâu','Arabica Đặc Biệt',331,' pha với Espresso, pha phin uống với đường hay sữa tùy thích.','Sàn 18, hạt nát <3%',1000,'2018-07-05 07:30:21','Sử dụng tốt nhất 06 tháng kể từ ngày đóng gói.','còn hàng'),(2,6,1,'Caffein > 2.5%','Rang nâu','Truyền Thống số 1',213,'Pha với đường hoặc sữa, dùng với đá hoặc nóng.','Hạt sàn 20, tỉ lệ hạt nát 5%.',1000,'2018-07-05 07:30:21','Sử dụng tốt nhất 06 tháng kể từ ngày đóng gói.','còn hàng'),(3,6,1,'Caffein > 2.5%','Rang nâu','Truyền thống số 2',227,'Pha với đường hoặc sữa, dùng với đá hoặc nóng.','Hạt sàn 20, tỉ lệ hạt nát 5%.',1000,'2018-07-05 07:30:21','Sử dụng tốt nhất 06 tháng kể từ ngày đóng gói.','còn hàng'),(4,6,1,'Caffein > 2.5%','Rang nâu','Truyền thống số 3',234,'Pha với đường hoặc sữa, dùng với đá hoặc nóng.','Hạt sàn 20, tỉ lệ hạt nát 5%',1000,'2018-07-05 07:30:21','Sử dụng tốt nhất 06 tháng kể từ ngày đóng gói.','còn hàng'),(6,6,1,'Caffein > 2.2%','Rang nâu','Culi Đặc Biệt',217,'Pha với đường hoặc sữa, dùng với đá hoặc nóng','Hạt sàn 18, tỉ lệ hạt nát <3%',1000,'2018-07-05 07:30:21','Sử dụng tốt nhất 06 tháng kể từ ngày đóng gói.','còn hàng'),(7,1,1,'Caffein > 2%','Rang nâu','Moka Cầu Đất',543,'Pha Espresso hoặc Americano, dùng với đá hoặc nóng.','Hạt sàn 20, tỉ lệ hạt nát 5%.',1000,'2018-07-05 07:30:21','Sử dụng tốt nhất 06 tháng kể từ ngày đóng gói.','còn hàng'),(8,5,2,'	Caffein > 2.3%','	Rang nâu','Robusta Đặc Biệt',183,'Pha với đường hoặc sữa, dùng với đá hoặc nóng.','Hạt sàn 18, tỉ lệ hạt nát 5%.',1000,'2018-07-05 07:30:21','Sử dụng tốt nhất 06 tháng kể từ ngày đóng gói.','còn hàng');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-23 22:10:28
