-- MySQL dump 10.13  Distrib 8.0.27, for macos11.6 (arm64)
--
-- Host: localhost    Database: jam_jam
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `jam_jam`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jam_jam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `jam_jam`;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `follow_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_user_follow_user_id` (`user_id`),
  KEY `fk_user_follow_following` (`follow_user_id`),
  CONSTRAINT `fk_user_follow_following` FOREIGN KEY (`follow_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_user_follow_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `skill_level` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `biography` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `instrument` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `music_sample` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_profiles` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (6,6,'https://dummyimage.com/200x280','Berlin','52.5094201','13.3340932','beginner',NULL,NULL,NULL,'giutar','rock',NULL),(7,7,'https://dummyimage.com/200x280','Berlin','52.5088673','13.3891173','beginner',NULL,NULL,NULL,'bass','blues',NULL),(8,8,'https://dummyimage.com/200x280','Berlin','52.5260965','13.4236683','beginr',NULL,NULL,NULL,'bass','blues',NULL),(12,11,'https://dummyimage.com/200x280','Berlin','52.5433028','13.4065609','beginner',NULL,NULL,NULL,'Violin','blues',NULL),(13,12,'https://dummyimage.com/200x280','Berlin','52.4952698','13.4284234','beginner',NULL,NULL,NULL,'banjo','classical',NULL),(14,13,'https://dummyimage.com/200x280','Berlin','52.5451792','13.3547416','advanced',NULL,NULL,NULL,'banjo','blues',NULL),(15,14,'https://dummyimage.com/200x280','Berlin','52.5483204','13.3784226','Advanced',NULL,NULL,NULL,'Guitar','Blues',NULL),(16,16,NULL,'',NULL,NULL,'beginner','','','','singing','rock',NULL),(17,16,NULL,'',NULL,NULL,'beginner','','','','singing','rock',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','1234','user1@gmail.com'),(2,'user2','1234','user2@gmail.com'),(3,'user3','1234','user3@gmail.com'),(4,'user4','1234','user4@gmail.com'),(5,'user5','1234','user5@gmail.com'),(6,'Marta','1234','@'),(7,'Anna','1234','@'),(8,'Eike','1234','@'),(11,'Claudia','1234','@'),(12,'Berd','1234','@'),(13,'Lena','1234','@'),(14,'Ugo','1234','@'),(15,'Mez','1234','@'),(16,'Pilar','$2b$10$sxr9bxqztmoTWkMTZfaUIu1ukW01yuseh22GFtGkJ4lK5L.X6WYQW','@'),(17,'vitalii','$2b$10$.s5ibGwBEy2qHg8EPSV6C.RFf6Eac0zkb00c08f0JW6osKWhYoJwm',NULL),(18,'Vitalii1','$2b$10$ipCVUbnRLAX5pAgeegW2Dew6OOzr4CQv7AxMNqOghim9hvP3qDccS',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-26 15:32:32
