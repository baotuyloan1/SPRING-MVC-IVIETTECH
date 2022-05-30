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
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `net_weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'Nước ta trồng cà phê Catimor là chủ yếu, sau khi thu hoạch được ngâm nước cho lên men rồi rửa sạch đem đi sấy. Chính vì vậy mà vị của cà phê này thường có vị chua như chanh, nhưng sau đó sẽ thấy vị đắng của vỏ.','100% Cà phê sạch Arabica','còn hàng',NULL,0),(2,'Một loại cà phê có hạt tròn to bóng mẩy, đặc biệt là nó chỉ có một hạt duy nhất trong một trái. Cà phê culi vị đắng ngắt, hương thơm say lòng người, nước đen sóng sánh, là kết tinh đồng nhất của quá trình hình thành.','Cà phê Culi','còn hàng',NULL,0),(3,'Cà phê Cherry hay còn gọi là cà phê mít, gồm hai loại là Liberica và Exelsa. Tuy không được sử dụng phổ biến vì vị của nó rất chua nhưng loại này có năng suất rất cao bởi khả năng chống chịu sâu bệnh rất tốt.','Cà phê Cherry (cà phê mít)','còn hàng',NULL,0),(4,'Cà phê Moka là một một loại café thuộc chi Arabica, trồng tại Đà Lạt, Lâm Đồng. Trong các họ cà phê thì loại này là giống khó trồng nhất; bởi khả năng bị sâu bệnh rất cao đòi hỏi quy trình chăm sóc tỉ mỉ.','Cà phê Moka','còn hàng',NULL,0),(5,'Hạt của Robusta khá nhỏ, nhỏ hơn cả Arabica. Cà phê Robusta được sấy trực tiếp chứ không phải lên men, chính vì vậy loại cà phê này có vị khá đắng, uống đậm đà, rất phù hợp với cánh đàn ông.','100% Cà phê sạch Robusta','còn hàng',NULL,0),(6,'Cà phê Sạch Culi Thượng Hạng có vị đắng đậm mạnh, mùi hương thơm nồng, cafein nhiều, chát, hậu vị ngọt.','100% Cà phê Sạch Robusta, Arabica','còn hàng',NULL,0),(7,'Cafe Sạch Arabica Nâu Medium có vị ngọt, chua thanh thoảng và mùi hương thơm nồng, mùi vị thơm ngọt kết hợp với vị đăng nhẹ, cafein thấp, hậu vị ngọt.','70% Cà phê sạch Arabica, 30% Cà phê sạch Robusta','còn hàng',NULL,0);
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
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
