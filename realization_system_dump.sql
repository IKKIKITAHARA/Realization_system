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
INSERT INTO `likes` VALUES (10,3,3),(12,1,3);
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realizations`
--

LOCK TABLES `realizations` WRITE;
/*!40000 ALTER TABLE `realizations` DISABLE KEYS */;
INSERT INTO `realizations` VALUES (1,'自ら気付きにいこうとする姿勢あるかないかが、成長できるかどうかの分かれ道。\r\n\r\n鬱蒼とした雑木林を手入れがされていない不快な場所として見るのか。\r\nそれとも、数十年度に森林になるための成長過程であり、雑木林の中ではあらゆる生態系の連鎖が起こっていて、\r\nガイドとして伝えるべき・見に行くべき事象が起こっているかも知れない。\r\n\r\n「何か気付きがあるはずだ」という姿勢で見るか見ないかの違いは明らか。\r\n\r\nもし自分には関係ないと思ってしまった時、たまには立ち止まって見るのが良いかも知れない。','2020-09-18 16:47:50',2,0,'2020-09-18','自ら気付きにいこうとする姿勢','2020-09-27 22:22:08',1),(3,'違いは魅力である。\r\n「○○の魅力を感じたい」と思ったときは、”違い”に注目をすれば良い。\r\nクスノキは、自分の葉っぱに・・・・。\r\n一方で桜は、・・・・。\r\n同じ葉っぱなのに、生存戦略が違っている。\r\nこれが魅力である。\r\n\r\n樹木には限らず、仕事でも同じこと。\r\n人間の習性として、長く同じ場所に居たり、関わっていたり、ネガティブな感情を抱いている時は、\r\nついつい自分・自社の魅力を忘れがちになってしまう。\r\nそんなときは、”違い”に着目してみよう。\r\nもし他社とは異なるサービスを自社が提供していたり、他社には居ないような人材が集まっているとしたら、\r\nそれは違いであり、魅力かも知れない。','2020-09-18 16:48:33',2,1,'2020-09-18','違いは魅力','2020-09-27 22:22:25',1),(7,'①\r\n②\r\n③\r\n④','2020-09-29 07:17:09',0,2,'2020-09-14','伝え方4ヶ条','2020-09-29 07:17:09',3),(8,'初めは感動しても、何度も同じことを経験するうちにだんだんとその感動は薄れていってしまう。\r\nガイドは、その感動を伝える必要がある。\r\nだからこそ、『どうして感動したのか？』『何に感動したのか？』『どう感動したのか？』など、瞬間瞬間の気持ちの動きを\r\n記録しておくことが大事である。\r\n','2020-09-29 19:51:24',2,1,'2020-09-25','感動を記録する','2020-09-29 19:51:24',13);
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,'001',0,'2020-09-14 00:48:22','Kilian','3890B16C6682548A071D2740487E8BD68BA846FAF2421CD2B62AFD803E1AE0A5',NULL,'2020-09-27 17:18:13'),(2,0,'002',0,'2020-09-14 00:54:37','Julien','3A01132568E241AE37034EE3460C1F20F9DC1CA330A4FD5B8DEF2A2A2FF8C001',NULL,'2020-09-29 19:52:09'),(3,1,'003',0,'2020-09-14 00:54:48','管理者','23A6DA66C1F6E7008A39D056B037E25428D9F82655FDF07EE79B297EBD5D7E67','管理者です！!！!\r\n\r\n\r\n\r\n\r\n\r\n','2020-09-29 19:51:53'),(13,0,'005',0,'2020-09-29 19:48:42','いっき','E5C7108299ED281F2425849F3EE670FFC3D0A0F69BC3C1CDDFD7136691CFEBEA',NULL,'2020-09-29 19:48:42'),(12,0,'998',1,'2020-09-19 02:06:15','998','0FCA10682BB19F614E300EAEE23D9D10309E8280B5151320ADE3F0965ADE36FE',NULL,'2020-09-27 17:17:49'),(11,0,'999',1,'2020-09-19 02:00:50','999','600D5333B3C8100E7C1C2E362293D1AB1336CAF26558E34289773B8DCE79CEBA',NULL,'2020-09-27 17:17:55');
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

-- Dump completed on 2020-09-29 23:36:56
