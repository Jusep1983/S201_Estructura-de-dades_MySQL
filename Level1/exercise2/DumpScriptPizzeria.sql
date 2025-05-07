CREATE DATABASE  IF NOT EXISTS `s2_1_level1ex2_pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `s2_1_level1ex2_pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: s2_1_level1ex2_pizzeria
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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `fk_id_province` int NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `fk_id_province` (`fk_id_province`),
  CONSTRAINT `fk_id_province` FOREIGN KEY (`fk_id_province`) REFERENCES `province` (`id_province`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Cerdanyola del Valles','08290',1),(3,'Reus','43201',3),(4,'Terrassa','08221',1),(5,'Blanes','17300',2),(6,'Lloret de Mar','17310',2);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name_client` varchar(45) NOT NULL,
  `surnames_client` varchar(45) NOT NULL,
  `address_client` varchar(45) NOT NULL,
  `phone_number` int NOT NULL,
  `fk_id_city` int NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `fk_client_city_idx` (`fk_id_city`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_client_city` FOREIGN KEY (`fk_id_city`) REFERENCES `city` (`id_city`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Carlos','Gómez Ruiz','Calle Mayor 15',612345678,1),(2,'Lucía','Fernández López','Avda. Diagonal 120',698765432,4),(3,'Marc','Sánchez Vidal','Passeig Marítim 22',623456789,5),(4,'Anna','Martí Puig','Riera 12',634567890,6),(5,'Joan','Ferrer Bosch','Carrer de la Pau 7',645678901,3);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `name_employee` varchar(45) NOT NULL,
  `surname_employee` varchar(45) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `phone_number` int NOT NULL,
  `type_employee` enum('delivery_man','cook') NOT NULL,
  `fk_id_store` int NOT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `fk_employee_store1_idx` (`fk_id_store`),
  CONSTRAINT `fk_employee_store1` FOREIGN KEY (`fk_id_store`) REFERENCES `store` (`id_store`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (7,'Jordi','Sánchez','12345678A',612345678,'cook',1),(8,'Marta','Gómez','87654321B',698765432,'cook',2),(9,'Luis','Fernández','23456789C',623456789,'cook',3),(10,'Carlos','López','34567890D',634567890,'delivery_man',1),(11,'Sara','Martínez','45678901E',645678901,'delivery_man',2),(12,'Ana','Rodríguez','56789012F',656789012,'delivery_man',3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `fk_id_order` int NOT NULL,
  `fk_id_product` int NOT NULL,
  `amount` int NOT NULL,
  `price_products_order` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_unit_price` decimal(10,2) DEFAULT '0.00',
  KEY `fk_order_details_orders1_idx` (`fk_id_order`),
  KEY `fk_id_product_idx` (`fk_id_product`),
  CONSTRAINT `fk_id_product` FOREIGN KEY (`fk_id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_details_orders1` FOREIGN KEY (`fk_id_order`) REFERENCES `orders` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,5,46.00,9.20),(1,5,1,7.50,7.50),(2,4,4,38.00,9.50),(3,5,2,15.00,7.50),(4,6,4,28.80,7.20),(1,2,1,9.20,9.20),(1,3,3,27.00,9.00),(1,1,2,17.00,8.50),(1,1,2,17.00,8.50),(1,1,3,25.50,8.50),(1,9,2,3.60,1.80),(1,10,1,1.20,1.20),(1,11,3,7.50,2.50),(2,12,1,1.90,1.90);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_details_BEFORE_INSERT` BEFORE INSERT ON `order_details` FOR EACH ROW BEGIN
   -- Obtener el precio unitario del producto desde la tabla 'product'
    DECLARE product_unit_price DECIMAL(10,2);
    SELECT price INTO product_unit_price
    FROM product
    WHERE id_product = NEW.fk_id_product;
    
	 -- Asignar el precio unitario al campo correspondiente
    SET NEW.product_unit_price = product_unit_price;

    -- Calcular el precio total del producto multiplicando por la cantidad
    SET NEW.price_products_order = product_unit_price * NEW.amount;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_details_AFTER_INSERT` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
   -- Declarar variable para el precio total de la orden
    DECLARE total_price DECIMAL(10,2);

    -- Calcular el precio total de la orden sumando los precios de los productos
    SELECT SUM(price_products_order) INTO total_price
    FROM order_details
    WHERE fk_id_order = NEW.fk_id_order;

    -- Actualizar el precio total en la tabla 'orders'
    UPDATE orders
    SET total_price_order = total_price
    WHERE id_order = NEW.fk_id_order;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_details_BEFORE_UPDATE` BEFORE UPDATE ON `order_details` FOR EACH ROW BEGIN
-- Obtener el precio unitario del producto desde la tabla 'product'
    DECLARE product_unit_price DECIMAL(10,2);
    SELECT price INTO product_unit_price
    FROM product
    WHERE id_product = NEW.fk_id_product;
    
	 -- Asignar el precio unitario al campo correspondiente
    SET NEW.product_unit_price = product_unit_price;

    -- Calcular el precio total del producto multiplicando por la cantidad
    SET NEW.price_products_order = product_unit_price * NEW.amount;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_details_AFTER_UPDATE` AFTER UPDATE ON `order_details` FOR EACH ROW BEGIN
 -- Declarar variable para el precio total de la orden
    DECLARE total_price DECIMAL(10,2);

    -- Calcular el precio total de la orden sumando los precios de los productos
    SELECT SUM(price_products_order) INTO total_price
    FROM order_details
    WHERE fk_id_order = NEW.fk_id_order;

    -- Actualizar el precio total en la tabla 'orders'
    UPDATE orders
    SET total_price_order = total_price
    WHERE id_order = NEW.fk_id_order;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `order_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_method` enum('in_home','in_store') NOT NULL,
  `total_price_order` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fk_id_client` int NOT NULL,
  `fk_id_employee` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_orders_client1_idx` (`fk_id_client`),
  KEY `fk_orders_employee1_idx` (`fk_id_employee`),
  CONSTRAINT `fk_orders_client1` FOREIGN KEY (`fk_id_client`) REFERENCES `client` (`id_client`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_employee1` FOREIGN KEY (`fk_id_employee`) REFERENCES `employee` (`id_employee`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-04-12 01:21:21','in_home',161.50,1,10),(2,'2025-04-12 10:00:00','in_store',39.90,1,11),(3,'2025-04-12 10:30:00','in_store',15.00,2,12),(4,'2025-04-12 11:00:00','in_home',28.80,3,10),(5,'2025-04-12 12:30:00','in_store',12.50,2,12),(6,'2025-04-12 14:00:00','in_store',20.00,4,11);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_category`
--

DROP TABLE IF EXISTS `pizza_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_category` (
  `id_pizza_category` int NOT NULL,
  `type_pizza` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pizza_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_category`
--

LOCK TABLES `pizza_category` WRITE;
/*!40000 ALTER TABLE `pizza_category` DISABLE KEYS */;
INSERT INTO `pizza_category` VALUES (1,'Clásica'),(2,'Especial'),(3,'Vegana'),(4,'Picante');
/*!40000 ALTER TABLE `pizza_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `type` enum('pizza','burger','drink') NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `image` mediumblob,
  `price` decimal(10,2) NOT NULL,
  `fk_id_pizza_category` int DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `fk_product_pizza_category1_idx` (`fk_id_pizza_category`),
  CONSTRAINT `fk_product_pizza_category1` FOREIGN KEY (`fk_id_pizza_category`) REFERENCES `pizza_category` (`id_pizza_category`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'pizza','Margarita','Tomate y mozzarella',NULL,8.50,1),(2,'pizza','Especial de la Casa','Quesos y jamón',NULL,9.20,2),(3,'pizza','Vegana Suprema','Tofu, verduras y tomate',NULL,9.00,3),(4,'pizza','Diabla','Salami picante y jalapeños',NULL,9.50,4),(5,'burger','Cheeseburger','Carne de vacuno, queso cheddar, lechuga y tomate',NULL,7.50,NULL),(6,'burger','Chicken Burger','Pollo empanado, lechuga, tomate y mayonesa',NULL,7.20,NULL),(7,'burger','Veggie Burger','Hamburguesa vegetal con aguacate y rúcula',NULL,7.80,NULL),(8,'burger','Bacon BBQ Burger','Carne, bacon, queso, salsa barbacoa',NULL,8.00,NULL),(9,'drink','Coca-Cola','Refresco con gas 33cl',NULL,1.80,NULL),(10,'drink','Agua Mineral','Botella de agua 50cl',NULL,1.20,NULL),(11,'drink','Cerveza Artesanal','Lata de cerveza tostada 33cl',NULL,2.50,NULL),(12,'drink','Té Helado','Té frío con sabor a limón',NULL,1.90,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id_province` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_province`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Barcelona'),(2,'Girona'),(3,'Tarragona');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id_store` int NOT NULL AUTO_INCREMENT,
  `address_store` varchar(255) NOT NULL,
  `fk_id_city` int NOT NULL,
  PRIMARY KEY (`id_store`),
  KEY `fk_id_city` (`fk_id_city`),
  CONSTRAINT `fk_id_city` FOREIGN KEY (`fk_id_city`) REFERENCES `city` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Carrer Sant Ramon, 10',1),(2,'Plaça del Mercadal, 5',3),(3,'Rambla Egara, 45',4),(4,'Avinguda dels Pins, 21',5),(5,'Carrer de la Vila, 12',6),(6,'Calle Pizza 123',1);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 's2_1_level1ex2_pizzeria'
--

--
-- Dumping routines for database 's2_1_level1ex2_pizzeria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07 13:40:57
