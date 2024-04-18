-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: beautytracker
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_name` varchar(30) NOT NULL,
  `b_description` varchar(512) DEFAULT NULL,
  `country_of_origin` varchar(40) DEFAULT NULL,
  `founding_year` int DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `founder` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`brand_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES ('Brand1','Description1','Country1',2000,'email1@example.com','1234567890','Founder1'),('Brand2','Description2','Country2',2010,'email2@example.com','9876543210','Founder2');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concern`
--

DROP TABLE IF EXISTS `concern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concern` (
  `concern_name` varchar(30) NOT NULL,
  `c_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`concern_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concern`
--

LOCK TABLES `concern` WRITE;
/*!40000 ALTER TABLE `concern` DISABLE KEYS */;
INSERT INTO `concern` VALUES ('Concern1','Concern1 Description'),('Concern2','Concern2 Description');
/*!40000 ALTER TABLE `concern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_table`
--

DROP TABLE IF EXISTS `function_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_table` (
  `f_name` varchar(30) NOT NULL,
  `f_description` varchar(512) DEFAULT NULL,
  `type_name` enum('skincare','makeup','haircare','fragrances','bath&body','tools&brushes') NOT NULL,
  PRIMARY KEY (`f_name`),
  KEY `type_name` (`type_name`),
  CONSTRAINT `function_table_ibfk_1` FOREIGN KEY (`type_name`) REFERENCES `type` (`type_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_table`
--

LOCK TABLES `function_table` WRITE;
/*!40000 ALTER TABLE `function_table` DISABLE KEYS */;
INSERT INTO `function_table` VALUES ('Function1','Function1 Description','skincare'),('Function2','Function2 Description','makeup');
/*!40000 ALTER TABLE `function_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredient_name` varchar(50) DEFAULT NULL,
  `is_cruelty_free` tinyint(1) DEFAULT NULL,
  `is_clean_beauty` tinyint(1) DEFAULT NULL,
  `is_fragrance_free` tinyint(1) DEFAULT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  KEY `idx_ingredient_product` (`product_name`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES ('Ingredient2',0,1,1,'Product2');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `color` varchar(50) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `refill_available` tinyint(1) DEFAULT '0',
  `sustainable_package` tinyint(1) DEFAULT '0',
  `product_name` varchar(30) DEFAULT NULL,
  KEY `idx_package_product` (`product_name`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`product_name`) REFERENCES `product` (`product_name`) ON DELETE CASCADE,
  CONSTRAINT `package_chk_1` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES ('Blue','Glass',0.30,0,0,'Product2');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_name` varchar(30) NOT NULL,
  `price` varchar(512) NOT NULL,
  `size` varchar(10) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `concern_name` varchar(30) NOT NULL,
  `type_name` enum('skincare','makeup','haircare','fragrances','bath&body','tools&brushes') NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  PRIMARY KEY (`product_name`),
  KEY `idx_product_concern` (`concern_name`),
  KEY `idx_product_type` (`type_name`),
  KEY `idx_product_brand` (`brand_name`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`concern_name`) REFERENCES `concern` (`concern_name`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`type_name`) REFERENCES `type` (`type_name`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`brand_name`) REFERENCES `brand` (`brand_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Product2','$10','10ml','http://product2.com','2023-11-30','Concern2','makeup','Brand2');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `type_name` enum('skincare','makeup','haircare','fragrances','bath&body','tools&brushes') NOT NULL,
  PRIMARY KEY (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES ('skincare'),('makeup'),('haircare'),('fragrances'),('bath&body'),('tools&brushes');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 23:48:37
