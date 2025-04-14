CREATE DATABASE  IF NOT EXISTS `s201_lvl1ex1_opticalshop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `s201_lvl1ex1_opticalshop`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: s201_lvl1ex1_opticalshop
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name_client` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `register_date` date NOT NULL,
  `id_employee` int DEFAULT NULL,
  `recommended_by` int DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `fk_recommended_by_idx` (`recommended_by`),
  CONSTRAINT `fk_recommended_by` FOREIGN KEY (`recommended_by`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Juanito','C/San Ramón 12','666111222','juanito@gmail.com','2023-12-31',3,NULL),(2,'Maria','Av. Libertador 123','655443322','maria@gmail.com','2023-01-20',2,NULL),(3,'Carlos','Calle Falsa 456','612345678','carlos@yahoo.com','2023-05-15',1,2),(4,'Lucía','Calle Sol 789','633344455','lucia@hotmail.com','2022-08-10',4,3),(5,'Pedro','Calle Luna 321','688899900','pedro@gmail.com','2023-02-25',5,1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` int NOT NULL,
  `name_empl` varchar(45) NOT NULL,
  `adress_empl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Pedro García','Calle Falsa 123'),(2,'Ana Martínez','Av. del Sol 456'),(3,'Luis López','Calle Sol 789'),(4,'María Pérez','Calle Luna 101'),(5,'Javier Ruiz','Av. Libertador 202');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `id_glasses` int NOT NULL AUTO_INCREMENT,
  `fk_id_supplier` int NOT NULL,
  `brand` varchar(45) NOT NULL,
  `frame_type` varchar(45) NOT NULL,
  `frame_color` varchar(45) NOT NULL,
  `left_glass_color` varchar(45) NOT NULL,
  `right_glass_color` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `left_glass_graduation` double NOT NULL,
  `right_glass_graduation` double NOT NULL,
  PRIMARY KEY (`id_glasses`),
  KEY `id_supplier_idx` (`fk_id_supplier`),
  CONSTRAINT `fk_idSupplier` FOREIGN KEY (`fk_id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (11,1,'Ray-Ban','Round','Black','Gray','Gray','150.00',2.5,2),(12,1,'Oakley','Square','Silver','Blue','Blue','180.00',1,1),(13,2,'Gucci','Cat-eye','Gold','Green','Green','250.00',3,2.8),(14,2,'Prada','Oval','Red','Brown','Brown','220.00',1.5,1.2),(15,1,'Nike','Rectangle','Blue','Yellow','Yellow','170.00',0.5,0.8);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id_sale` int NOT NULL AUTO_INCREMENT,
  `fk_id_client` int NOT NULL,
  `date_sale` date DEFAULT NULL,
  `employee_id_employee` int NOT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `id_client_idx` (`fk_id_client`) /*!80000 INVISIBLE */,
  KEY `fk_sale_employee1_idx` (`employee_id_employee`),
  CONSTRAINT `fk_id_client` FOREIGN KEY (`fk_id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_sale_employee1` FOREIGN KEY (`employee_id_employee`) REFERENCES `employee` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (5,1,'2023-04-08',1),(6,2,'2023-04-08',2),(7,1,'2025-04-12',5);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_details` (
  `quantity_sale_detaills` int DEFAULT NULL,
  `fk_id_sale` int NOT NULL AUTO_INCREMENT,
  `fk_sale_glasses` int NOT NULL,
  PRIMARY KEY (`fk_id_sale`,`fk_sale_glasses`),
  KEY `fk_id_sale_idx` (`fk_id_sale`),
  KEY `fk_id_glasses_idx` (`fk_sale_glasses`),
  CONSTRAINT `fk_id_sale` FOREIGN KEY (`fk_id_sale`) REFERENCES `sale` (`id_sale`),
  CONSTRAINT `fk_sale_glasses` FOREIGN KEY (`fk_sale_glasses`) REFERENCES `glasses` (`id_glasses`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_details`
--

LOCK TABLES `sale_details` WRITE;
/*!40000 ALTER TABLE `sale_details` DISABLE KEYS */;
INSERT INTO `sale_details` VALUES (3,5,11),(2,6,12),(1,7,13);
/*!40000 ALTER TABLE `sale_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `street_name` varchar(45) NOT NULL,
  `street_number` varchar(45) NOT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `door` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `NIF` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Supplier A','Main St','123','1','A','Madrid','28001','España','912345678','910123456','A12345678'),(2,'Supplier B','Oak Avenue','456','2','B','Barcelona','08001','España','933456789','933123456','B23456789');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 's201_lvl1ex1_opticalshop'
--

--
-- Dumping routines for database 's201_lvl1ex1_opticalshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 23:47:57
