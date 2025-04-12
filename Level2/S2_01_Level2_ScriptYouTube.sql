CREATE DATABASE  IF NOT EXISTS `s2_1_level2_youtube` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `s2_1_level2_youtube`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: s2_1_level2_youtube
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
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `id_channel` int NOT NULL,
  `channel_name` varchar(45) NOT NULL,
  `channel_description` varchar(45) NOT NULL,
  `create_on_channel` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id_user` int NOT NULL,
  PRIMARY KEY (`id_channel`),
  KEY `fk_channel_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_channel_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'Canal de Cocina','Recetas fáciles para todos','2025-04-12 17:36:25',1),(2,'Canal de Yoga','Full yoggers','2025-04-12 17:36:25',2),(3,'Canal de MySQL','Como no morir usando MySQL','2025-04-12 17:36:25',3);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(120) NOT NULL,
  `create_comment_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id_user` int NOT NULL,
  `video_id_video` int NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_comment_user1_idx` (`user_id_user`),
  KEY `fk_comment_video1_idx` (`video_id_video`),
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_video1` FOREIGN KEY (`video_id_video`) REFERENCES `video` (`id_video`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'¡Me encanta la receta de la tortilla!','2025-04-12 17:57:37',1,1),(2,'¡Buen video de yoga para principiantes, muy útil!','2025-04-12 17:57:37',2,2),(3,'Gracias a tu tutorial no me he sucidado! gracias','2025-04-12 17:57:37',3,3),(4,'¡Es la mejor tortilla que jamas vi, es espectacular!','2025-04-12 17:57:37',1,1),(5,'Me parece que poca idea de yoga tienes novata...','2025-04-12 17:57:37',1,2),(6,'Imprescindible para no morir!','2025-04-12 17:57:37',1,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id_playlist` int NOT NULL,
  `name_playlist` varchar(45) NOT NULL,
  `create_playlist_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visibility` enum('public','private') NOT NULL,
  `user_id_user` int NOT NULL,
  PRIMARY KEY (`id_playlist`),
  KEY `fk_playlist_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_playlist_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Mi Playlist de Cocina','2025-04-12 17:50:59','public',1),(2,'Mi Playlist de Yoga','2025-04-12 17:50:59','private',2),(3,'Mi Playlist de MySQL','2025-04-12 17:50:59','public',3);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_has_video`
--

DROP TABLE IF EXISTS `playlist_has_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_has_video` (
  `playlist_id_playlist` int NOT NULL,
  `video_id_video` int NOT NULL,
  PRIMARY KEY (`playlist_id_playlist`,`video_id_video`),
  KEY `fk_playlist_has_video_video1_idx` (`video_id_video`),
  KEY `fk_playlist_has_video_playlist1_idx` (`playlist_id_playlist`),
  CONSTRAINT `fk_playlist_has_video_playlist1` FOREIGN KEY (`playlist_id_playlist`) REFERENCES `playlist` (`id_playlist`) ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_video_video1` FOREIGN KEY (`video_id_video`) REFERENCES `video` (`id_video`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_has_video`
--

LOCK TABLES `playlist_has_video` WRITE;
/*!40000 ALTER TABLE `playlist_has_video` DISABLE KEYS */;
INSERT INTO `playlist_has_video` VALUES (1,1),(1,2),(2,2),(3,3);
/*!40000 ALTER TABLE `playlist_has_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name_user` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(6) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `country` varchar(45) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Pepe','pepe@gmail.com','123456','1990-05-14','male','Venezuela','28001'),(2,'Ana','ana@gmail.com','abcdef','1985-09-22','female','España','08002'),(3,'Luis','luisito@correo.com','qwerty','2000-01-10','male','Portugal','41003');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_video`
--

DROP TABLE IF EXISTS `user_has_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_video` (
  `user_id_user` int NOT NULL,
  `video_id_video` int NOT NULL,
  `vote_user` enum('like','dislike') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id_user`,`video_id_video`),
  KEY `fk_user_has_video_video1_idx` (`video_id_video`),
  KEY `fk_user_has_video_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_user_has_video_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_video_video1` FOREIGN KEY (`video_id_video`) REFERENCES `video` (`id_video`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_video`
--

LOCK TABLES `user_has_video` WRITE;
/*!40000 ALTER TABLE `user_has_video` DISABLE KEYS */;
INSERT INTO `user_has_video` VALUES (1,1,'like','2025-04-12 17:43:19'),(1,2,'dislike','2025-04-12 17:43:19'),(2,2,'like','2025-04-12 17:43:19'),(2,3,'like','2025-04-12 17:43:19'),(3,1,'like','2025-04-12 17:43:19'),(3,3,'dislike','2025-04-12 17:43:19');
/*!40000 ALTER TABLE `user_has_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id_video` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `size_in_mb` float(12,2) NOT NULL,
  `file_name` varchar(45) NOT NULL,
  `duration` int NOT NULL,
  `thumbnail` mediumblob,
  `reproductions` int NOT NULL DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `dislikes` int NOT NULL DEFAULT '0',
  `visibility` enum('public','unlisted','private') NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id_video`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'Cómo hacer una tortilla','Paso a paso para hacer una tortilla de patatas.',55.30,'tortilla.mp4',480,NULL,230,45,3,'public'),(2,'Yoga para principiantes','Clase de yoga suave para empezar el día.',100.75,'yoga_basico.mp4',900,NULL,1200,300,10,'public'),(3,'Tutorial MySql','Cómo crear una estructura de datos y no morir en el intento...',200.20,'tutorial_mysql.mp4',1500,NULL,9800,540,12,'unlisted');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_has_video_tag`
--

DROP TABLE IF EXISTS `video_has_video_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_has_video_tag` (
  `video_id_video` int NOT NULL,
  `video_tag_id_video_tag` int NOT NULL,
  PRIMARY KEY (`video_id_video`,`video_tag_id_video_tag`),
  KEY `fk_video_has_video_tag_video_tag1_idx` (`video_tag_id_video_tag`),
  KEY `fk_video_has_video_tag_video_idx` (`video_id_video`),
  CONSTRAINT `fk_video_has_video_tag_video` FOREIGN KEY (`video_id_video`) REFERENCES `video` (`id_video`) ON UPDATE CASCADE,
  CONSTRAINT `fk_video_has_video_tag_video_tag1` FOREIGN KEY (`video_tag_id_video_tag`) REFERENCES `video_tag` (`id_video_tag`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_has_video_tag`
--

LOCK TABLES `video_has_video_tag` WRITE;
/*!40000 ALTER TABLE `video_has_video_tag` DISABLE KEYS */;
INSERT INTO `video_has_video_tag` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `video_has_video_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_tag`
--

DROP TABLE IF EXISTS `video_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_tag` (
  `id_video_tag` int NOT NULL AUTO_INCREMENT,
  `video_tag_name` varchar(45) NOT NULL,
  `create_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_video_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_tag`
--

LOCK TABLES `video_tag` WRITE;
/*!40000 ALTER TABLE `video_tag` DISABLE KEYS */;
INSERT INTO `video_tag` VALUES (1,'cocina','2025-04-12 17:39:42'),(2,'yoga','2025-04-12 17:39:42'),(3,'mysql','2025-04-12 17:39:42');
/*!40000 ALTER TABLE `video_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 's2_1_level2_youtube'
--

--
-- Dumping routines for database 's2_1_level2_youtube'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 18:56:54
