-- MySQL dump 10.13  Distrib 5.7.31, for macos10.14 (x86_64)
--
-- Host: localhost    Database: realization_system
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `likedRealization_id` int(11) NOT NULL,
  `likedUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2o9hj4hwrfrhpxd3pc0ipj47c` (`likedRealization_id`),
  KEY `FK4ue6d7t31f91pbjwgfihd5en2` (`likedUser_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (10,3,3),(11,2,3),(12,1,3);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realizations`
--

DROP TABLE IF EXISTS `realizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `evalution` int(11) NOT NULL,
  `fixation` int(11) NOT NULL,
  `realization_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh1eqghgxtga0p33edhkrt5ks3` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realizations`
--

LOCK TABLES `realizations` WRITE;
/*!40000 ALTER TABLE `realizations` DISABLE KEYS */;
INSERT INTO `realizations` VALUES (1,'気付きにいく','2020-09-18 16:47:50',0,0,'2020-09-18','気付きにいく','2020-09-18 16:47:50',1),(2,'現場を見る','2020-09-18 16:48:06',1,1,'2020-09-18','現場を見る','2020-09-18 16:48:06',1),(3,'アウトプット','2020-09-18 16:48:33',2,0,'2020-09-18','アウトプット','2020-09-18 16:48:33',1);
/*!40000 ALTER TABLE `realizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_flag` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_71vrxovabe8x9tom8xwefi3e7` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,'001',0,'2020-09-14 00:48:22','001','3890B16C6682548A071D2740487E8BD68BA846FAF2421CD2B62AFD803E1AE0A5',NULL,'2020-09-14 12:33:09'),(2,0,'002',0,'2020-09-14 00:54:37','002','3A01132568E241AE37034EE3460C1F20F9DC1CA330A4FD5B8DEF2A2A2FF8C001',NULL,'2020-09-14 00:54:37'),(3,1,'003',0,'2020-09-14 00:54:48','003','23A6DA66C1F6E7008A39D056B037E25428D9F82655FDF07EE79B297EBD5D7E67',NULL,'2020-09-14 00:54:48'),(12,0,'998',0,'2020-09-19 02:06:15','998','0FCA10682BB19F614E300EAEE23D9D10309E8280B5151320ADE3F0965ADE36FE',NULL,'2020-09-19 02:06:15'),(11,0,'999',0,'2020-09-19 02:00:50','999','600D5333B3C8100E7C1C2E362293D1AB1336CAF26558E34289773B8DCE79CEBA',NULL,'2020-09-19 02:00:50');
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

-- Dump completed on 2020-09-24 20:35:42
