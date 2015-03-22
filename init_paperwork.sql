-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: paperwork
-- ------------------------------------------------------
-- Server version	5.5.40-1

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
-- Table structure for table `attachment_version`
--

DROP TABLE IF EXISTS `attachment_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_version` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attachment_id` bigint(20) unsigned NOT NULL,
  `version_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `attachment_version_attachment_id_foreign` (`attachment_id`),
  KEY `attachment_version_version_id_foreign` (`version_id`),
  CONSTRAINT `attachment_version_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attachment_version_version_id_foreign` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_version`
--

LOCK TABLES `attachment_version` WRITE;
/*!40000 ALTER TABLE `attachment_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filename` varchar(255) NOT NULL,
  `fileextension` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  `filesize` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_user`
--

DROP TABLE IF EXISTS `language_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `language_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `language_user_user_id_foreign` (`user_id`),
  KEY `language_user_language_id_foreign` (`language_id`),
  CONSTRAINT `language_user_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `language_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_user`
--

LOCK TABLES `language_user` WRITE;
/*!40000 ALTER TABLE `language_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language_code` char(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'afr','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(2,'ara','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(3,'aze','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(4,'bel','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(5,'ben','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(6,'bul','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(7,'cat','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(8,'ces','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(9,'chi-sim','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(10,'chi-tra','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(11,'chr','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(12,'dan','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(13,'deu','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(14,'ell','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(15,'eng','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(16,'enm','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(17,'epo','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(18,'equ','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(19,'est','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(20,'eus','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(21,'fin','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(22,'fra','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(23,'frk','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(24,'frm','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(25,'glg','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(26,'grc','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(27,'heb','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(28,'hin','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(29,'hrv','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(30,'hun','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(31,'ind','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(32,'isl','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(33,'ita','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(34,'jpn','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(35,'kan','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(36,'kor','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(37,'lav','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(38,'lit','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(39,'mal','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(40,'mkd','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(41,'mlt','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(42,'msa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(43,'nld','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(44,'nor','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(45,'pol','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(46,'por','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(47,'ron','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(48,'rus','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(49,'slk','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(50,'slv','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(51,'spa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(52,'sqi','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(53,'srp','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(54,'swa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(55,'swe','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(56,'tam','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(57,'tel','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(58,'tgl','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(59,'tha','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(60,'tur','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(61,'ukr','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),(62,'vie','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_07_22_194050_initialize',1),('2014_07_24_103915_create_password_reminders_table',1),('2014_10_08_203732_add_visibility_to_tags_table',1),('2015_01_21_034728_add_admin_to_users',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_user`
--

DROP TABLE IF EXISTS `note_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `note_id` bigint(20) unsigned NOT NULL,
  `umask` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `note_user_user_id_foreign` (`user_id`),
  KEY `note_user_note_id_foreign` (`note_id`),
  CONSTRAINT `note_user_note_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `note_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_user`
--

LOCK TABLES `note_user` WRITE;
/*!40000 ALTER TABLE `note_user` DISABLE KEYS */;
INSERT INTO `note_user` VALUES (1,1,1,7,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `note_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notebook_user`
--

DROP TABLE IF EXISTS `notebook_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notebook_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `notebook_id` bigint(20) unsigned NOT NULL,
  `umask` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `notebook_user_user_id_foreign` (`user_id`),
  KEY `notebook_user_notebook_id_foreign` (`notebook_id`),
  CONSTRAINT `notebook_user_notebook_id_foreign` FOREIGN KEY (`notebook_id`) REFERENCES `notebooks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notebook_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notebook_user`
--

LOCK TABLES `notebook_user` WRITE;
/*!40000 ALTER TABLE `notebook_user` DISABLE KEYS */;
INSERT INTO `notebook_user` VALUES (1,1,1,7,'2015-02-11 16:49:54','2015-02-11 16:49:54');
/*!40000 ALTER TABLE `notebook_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notebooks`
--

DROP TABLE IF EXISTS `notebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notebooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `notebooks_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `notebooks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notebooks`
--

LOCK TABLES `notebooks` WRITE;
/*!40000 ALTER TABLE `notebooks` DISABLE KEYS */;
INSERT INTO `notebooks` VALUES (1,NULL,0,'Welcome','2015-02-11 16:49:54','2015-02-11 16:49:54',NULL);
/*!40000 ALTER TABLE `notebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notebook_id` bigint(20) unsigned NOT NULL,
  `version_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_notebook_id_foreign` (`notebook_id`),
  KEY `notes_version_id_foreign` (`version_id`),
  CONSTRAINT `notes_notebook_id_foreign` FOREIGN KEY (`notebook_id`) REFERENCES `notebooks` (`id`),
  CONSTRAINT `notes_version_id_foreign` FOREIGN KEY (`version_id`) REFERENCES `versions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1,3,'2015-02-11 16:49:54','2015-02-15 15:40:45',NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reminders`
--

DROP TABLE IF EXISTS `password_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reminders` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reminders`
--

LOCK TABLES `password_reminders` WRITE;
/*!40000 ALTER TABLE `password_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `ui_language` char(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_user_id_foreign` (`user_id`),
  CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,1,'en','2015-02-11 16:49:54','2015-02-11 16:49:54',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortcuts`
--

DROP TABLE IF EXISTS `shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcuts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `notebook_id` bigint(20) unsigned NOT NULL,
  `sortkey` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `shortcuts_user_id_foreign` (`user_id`),
  KEY `shortcuts_notebook_id_foreign` (`notebook_id`),
  CONSTRAINT `shortcuts_notebook_id_foreign` FOREIGN KEY (`notebook_id`) REFERENCES `notebooks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shortcuts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortcuts`
--

LOCK TABLES `shortcuts` WRITE;
/*!40000 ALTER TABLE `shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_note`
--

DROP TABLE IF EXISTS `tag_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_note` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_note_note_id_foreign` (`note_id`),
  KEY `tag_note_tag_id_foreign` (`tag_id`),
  CONSTRAINT `tag_note_note_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_note_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_note`
--

LOCK TABLES `tag_note` WRITE;
/*!40000 ALTER TABLE `tag_note` DISABLE KEYS */;
INSERT INTO `tag_note` VALUES (2,1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,4,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tag_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_user`
--

DROP TABLE IF EXISTS `tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_user_user_id_foreign` (`user_id`),
  KEY `tag_user_tag_id_foreign` (`tag_id`),
  CONSTRAINT `tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_user`
--

LOCK TABLES `tag_user` WRITE;
/*!40000 ALTER TABLE `tag_user` DISABLE KEYS */;
INSERT INTO `tag_user` VALUES (1,1,1,'2015-02-11 16:49:54','2015-02-11 16:49:54'),(2,1,2,'2015-02-15 15:40:45','2015-02-15 15:40:45'),(3,1,3,'2015-02-15 15:40:45','2015-02-15 15:40:45'),(4,1,4,'2015-02-15 15:40:45','2015-02-15 15:40:45');
/*!40000 ALTER TABLE `tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visibility` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,0,'welcome','2015-02-11 16:49:54','2015-02-11 16:49:54',NULL),(2,0,'sandstorm','2015-02-15 15:40:45','2015-02-15 15:40:45',NULL),(3,0,'port','2015-02-15 15:40:45','2015-02-15 15:40:45',NULL),(4,0,'awesome','2015-02-15 15:40:45','2015-02-15 15:40:45',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `is_admin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jan@jambor.pro','$2y$10$y.qWPB5TuLo7NWBObozPkO5f8s9RGhwWCJ51ZrfL5AlVo9.EYfa2i','Jan','Jambor',1,'NhHjp5wriXlloMZ41TLwUzTgnvpz7xuQveHptV6fWTpQkUcYuNpmNGayydGv','2015-02-11 16:49:54','2015-02-11 17:34:37',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `previous_id` bigint(20) unsigned DEFAULT NULL,
  `next_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content_preview` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `previous_id` (`previous_id`),
  KEY `next_id` (`next_id`),
  CONSTRAINT `versions_ibfk_1` FOREIGN KEY (`previous_id`) REFERENCES `versions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `versions_ibfk_2` FOREIGN KEY (`next_id`) REFERENCES `versions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,NULL,2,'Welcome to Paperwork','Hi there, welcome to Paperwork, the open source note-taking solution. This is your first note and we&#39;d like to explain to you some features we hope you&#39;ll find veryinteresting.NotesNotes are the basic form of writing in Paperwork.Notes are saved i','<p>Hi there, <strong>welcome to Paperwork</strong>, the open source note-taking solution. This is your first note and we&#39;d like to explain to you some features we hope you&#39;ll find veryinteresting.</p><h3><strong>Notes</strong></h3><p>Notes are the basic form of writing in Paperwork.Notes are saved inside notebooks. You already have one named &#39;Welcome&#39; in which this note is stored. You can create as much notebooks and notes as you want by using the <a id=\"file_click_handler\" href=\"#\">File menu</a>.</p><h3><strong>Attachments</strong></h3><p>You can also add attachments to your notes. This allows you to embed important information and have it there when you need it. Just click its link, and you&#39;ll be sent to the file. And since Paperwork is self hosted, you have better privacy too.</p> <h3><strong>Tags</strong></h3><p>Tags are one of Paperwork&#39;s powerful features. Tags allow you to search for related notes but which are not in the same notebook. Do you have an idea and want to save it for later now? Put it in a notebook (like &#39;dinner cooking&#39;) and tag it with cooking. Later, when you&#39;ve got time you can just click on cooking from the sidebar and all cooking-related notes are there, no matter if they&#39;re for lunch,dinner or breakfast.</p><h3><strong>Search</strong></h3><p>If you want to search with a more detailed criteria, you can use Paperwork&#39;s search feature. Just <a id=\"search_handler\" href=\"#\">write your query</a> and Paperwork will show you the results from all your notes, no matter in which notebook they are or tag they have.</p><h3><strong>Version Control</strong></h3><p>Everytime you save a note in Paperwork, a new version is created. This feature allows you to be able to see what changed throughout the life of your note in a detailed manner.</p><h3><strong>Shareable</strong></h3><p>Each note you write on Paperwork can be shared with any other user of Paperwork. Are you a company employee and would like to share those draft guidelines for that project? No worries, just sare the note with those users you want to share it with while keeping total control of your note. You can control who sees and edits the note and you can also who did what thanks to version control.</p><p>We hope that you like your experience with Paperwork. If you have any feedback or encounter any issues, just submit an issue <a href=\"https://github.com/twostairs/paperwork/issues/new\">on Github</a>. If you want to be informed on what we&#39;re planning for Paperwork and be able to participate in the discussion, please join our mailing list <a href=\"mailto:paperwork-dev@googlegroups.com\">here</a>.</p><p><strong>Thanks for choosing Paperwork,</strong></p><p><strong>The Paperwork Team. </strong></p>','2015-02-11 16:49:54','2015-02-12 19:49:37',NULL),(2,1,3,'Sandstorm.io port · Paperwork - Evernote alternative','TODO(JJ) Lesen:&nbsp;Sandstorm App Developer Handbook&nbsp;https://github.com/sandstorm-io/sandstorm/wiki/Sandstorm-App-Developer-Handbook&mdash;&gt; weiter bei &bdquo;Platform security philosophy&quot;&nbsp;(JJ) Porting Guide&nbsp;https://github.com/sand','<div><strong>TODO</strong></div><div>(JJ) Lesen:&nbsp;Sandstorm App Developer Handbook<a href=\"https://github.com/sandstorm-io/sandstorm/wiki/Sandstorm-App-Developer-Handbook\">&nbsp;</a><a href=\"https://github.com/sandstorm-io/sandstorm/wiki/Sandstorm-App-Developer-Handbook\">https://github.com/sandstorm-io/sandstorm/wiki/Sandstorm-App-Developer-Handbook</a></div><div>&mdash;&gt; weiter bei &bdquo;Platform security philosophy&quot;</div><div>&nbsp;</div><div>(JJ) Porting Guide&nbsp;<a href=\"https://github.com/sandstorm-io/sandstorm/wiki/Porting-Guide\">https://github.com/sandstorm-io/sandstorm/wiki/Porting-Guide</a></div><div>(JJ) Training mit Asheesh</div><div>&nbsp;</div><div>(Paperwork) Evernote Import:&nbsp;<a href=\"https://github.com/twostairs/paperwork/issues/13\">https://github.com/twostairs/paperwork/issues/13</a></div><div>&nbsp;</div><div>Punkte f&uuml;r den Port</div><div>User &uuml;bernehmen</div><div>X-Sandstorm-User-Id (Hex String) //&nbsp;X-Sandstorm-Username (display name) //&nbsp;X-Sandstorm-Permissions (admin, owner, read, write, &nbsp;etc) via HTTP request header &gt; Beispiel:&nbsp;Sandstorm plugin for GNU MediaGoblin. (See the <a href=\"https://github.com/jparyani/mediagoblin/blob/sandstorm-master/mediagoblin/plugins/sandstorm/views.py#L29\">source code</a>.)</div><div>&nbsp;</div><div>Test Paperwork:</div><div><a href=\"https://paperwork.pandorica.centur.io/login\">https://paperwork.pandorica.centur.io/login</a></div><div>&nbsp;</div><div>Ein paar Infos zum Portieren von MySQL</div><div><a href=\"https://groups.google.com/forum/#!topic/sandstorm-dev/JQOES2qAMjY\">https://groups.google.com/forum/#!topic/sandstorm-dev/JQOES2qAMjY</a></div><div>You just have to configure MySQL to write somewhere under /var.</div><div>&nbsp;</div><div>TinyTinyRSS macht es mit Docker und dann in Sandstorm App:</div><div><a href=\"https://github.com/jparyani/Tiny-Tiny-RSS\">https://github.com/jparyani/Tiny-Tiny-RSS</a></div><div>&nbsp;</div><div><strong>11.02.2015 JJ</strong></div><div>Zusammenfassung f&uuml;r Asheesh</div><div>&nbsp;</div><div>Hi Asheesh,</div><div>&nbsp;</div><div>Thanks again for your help by mentoring my first app port.</div><div>&nbsp;</div><div>I&rsquo;d like to give you a short status:</div><div>- Sandstorm server for app building up and running</div><div>- I have developed an test meteor app here already, worked pretty good and easy</div><div>- I have ported simple apps e.g.&nbsp;<a href=\"https://github.com/kueblboe/parley\">https://github.com/kueblboe/parley</a>&nbsp;which is pretty useless without the sharing capabilities of sandstorm</div><div>- So easy so far</div><div>- Now I have forked and cloned&nbsp;<a href=\"https://github.com/twostairs/paperwork\">https://github.com/twostairs/paperwork</a></div><div>- Installed it along with the requirements (mysql, php, apache, gulp)</div><div>- Changed mysql to save everything in /var</div><div>- Paperwork is now working on my server</div><div>&nbsp;</div><div>Now I&rsquo;m reading a bit more today and tomorrow about sandstorm basics and the porting guide. I did it already several times but there are too&nbsp;many loose ends in my head. I hope I&rsquo;m up to speed on Friday to make our time together as efficient as possible.</div><div>&nbsp;</div><div>Gruss</div><div>JJ</div><div>&nbsp;</div><div><strong>11.02.2015 JJ</strong></div><div>Fertigstellung der Installation von Paperwork</div><div>&nbsp;</div><div><strong>09.02.2015 JJ</strong></div><div><strong>Versuch 1 de</strong><strong>s Ports:</strong></div><div>Vom Sandstorm-Dev Server aus getestet wo Apps getestete und entwickelt werden.</div><div>&nbsp;</div><div>Fork des Repositories erstellt</div><div>&nbsp;</div><div>Start im Home Verzeichnis (JJ).</div><div>Clonen des Repos</div><div># git clone&nbsp;<a href=\"https://github.com/JamborJan/paperwork\">https://github.com/JamborJan/paperwork</a></div><div>&nbsp;</div><div>PHP ist schon installiert gewesen,&nbsp;test:</div><div>#&nbsp;php -v</div><div>PHP 5.6.4-4 (cli) (built: Jan&nbsp; 8 2015 18:39:50)</div><div>Sonst installieren und auch GD mit dazu</div><div># apt-get install php5</div><div># apt-get install php5-gd</div><div># apt-get install php5-fpm</div><div># apt-get install php5-mcrypt</div><div># apt-get install php5-mysql</div><div>#&nbsp;apt-get install apache2</div><div># apt-get install libapache2-mod-php5</div><div>&nbsp;</div><div>In Projektverzeichnis gehen (paperwork)</div><div>&nbsp;</div><div>Composer Dep Manager for PHP wird ben&ouml;tigt</div><div><a href=\"https://getcomposer.org/\">https://getcomposer.org/</a></div><div>#&nbsp;curl -sS <a href=\"https://getcomposer.org/installer\">https://getcomposer.org/installer</a> | php</div><div># cd frontend/</div><div># php ../composer.phar install</div><div>&nbsp;</div><div>Als root:</div><div># npm install -g gulp</div><div>&nbsp;</div><div>As user:</div><div># cd /home/jj/paperwork/frontend</div><div>#&nbsp;npm install</div><div>#&nbsp;gulp</div><div>&nbsp;</div><div>MySQL Installieren:</div><div># apt-get install mysql-server mysql-client</div><div>&nbsp;</div><div>In config dabei alles auf /var umbiegen danach sicher stellen, dass alles auch existiert bzw. folder umkopieren.</div><div># nano /etc/mysql/my.cnf</div><div>&nbsp;</div><div>#basedir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = /usr</div><div>basedir &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = /var</div><div>#tmpdir &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = /tmp</div><div>tmpdir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = /var/tmp</div><div>#lc-messages-dir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = /usr/share/mysql</div><div>lc-messages-dir = /var/share/mysql</div><div>&nbsp;</div><div># mkdir /var/share</div><div># cp -R /usr/share/mysql /var/share/mysql/</div><div># /etc/init.d/mysql restart</div><div>&nbsp;</div><div>Bei der MySQL DB anmelden:</div><div>&nbsp;</div><div>#&nbsp;mysql -u root -p</div><div>DROP DATABASE IF EXISTS paperwork; CREATE DATABASE IF NOT EXISTS paperwork DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;</div><div>GRANT ALL PRIVILEGES ON paperwork.* TO &#39;paperwork&#39;@&#39;localhost&#39; IDENTIFIED BY &#39;paperwork&#39; WITH GRANT OPTION; FLUSH PRIVILEGES;</div><div>&nbsp;</div><div>With these settings, you won&#39;t need to modify the database.php configuration file.</div><div>In App folder paperwork:</div><div>#&nbsp;php artisan migrate</div><div>&nbsp;</div><div>Liste aller User und den Webserver User raus fischen:</div><div># awk -F&#39;:&#39; &#39;{ print $1}&#39; /etc/passwd</div><div>Sollte&nbsp; www-data&nbsp;sein, der auch in der Gruppe ist.</div><div>&nbsp;</div><div>Das ging nicht irgendwie:</div><div>chown www-data:www-data -R /home/jj/paperwork/frontend/app/storage/attachments/</div><div>chown www-data:www-data -R /home/jj/paperwork/frontend/app/storage/cache/</div><div>chown www-data:www-data -R /home/jj/paperwork/frontend/app/storage/logs/</div><div>chown www-data:www-data -R /home/jj/paperwork/frontend/app/storage/sessions/</div><div>&nbsp;</div><div>Aber das:&nbsp; chmod -R 777 storage/</div><div>&nbsp;</div><div><strong>Change Document Root</strong><strong>&nbsp;+ set rewrite base</strong></div><div><a href=\"http://www.lavluda.com/2007/07/15/how-to-enable-mod_rewrite-in-apache22-debian/\">http://www.lavluda.com/2007/07/15/how-to-enable-mod_rewrite-in-apache22-debian/</a></div><div># nano /etc/apache2/sites-available/000-default.conf</div><div>DocumentRoot /home/jj/paperwork/frontend/public</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Directory /home/jj/paperwork/frontend/public/ &gt;</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RewriteEngine On</div><div>&nbsp;</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Redirect Trailing Slashes...</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RewriteRule ^(.*)/$ /$1 [L,R=301]</div><div>&nbsp;</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Handle Front Controller...</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RewriteCond %{REQUEST_FILENAME} !-d</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RewriteCond %{REQUEST_FILENAME} !-f</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RewriteRule ^ index.php [L]</div><div>&nbsp;</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # RewriteBase /</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # RewriteCond %{REQUEST_URI} !paperwork/frontend/public/</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # RewriteRule (.*) /paperwork/frontend/public/$1 [L]</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/Directory&gt;</div><div>&nbsp;</div><div>Rewrite aktivieren:</div><div>a2enmod rewrite</div><div>&nbsp;</div><div>Restart Apache</div><div>/etc/init.d/apache2 restart</div><div>&nbsp;</div><div><strong>App Suggestion - Paperwork - Evernote alternative</strong></div><div>&nbsp;</div><div>01:06</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:5eadfae0c3994c76350c81acb93bb676\" /></div><div><strong>Tiago Freitas</strong></div><div>&nbsp;</div><div>One of the apps I would love to have a self-hosted alternative to is Evernote.</div><div>It will take a while to replicate it&#39;s features though.</div><div>&nbsp;</div><div>Paperwork sounds like a good candidate:</div><div>OpenSource note-taking &amp; archiving alternative to Evernote, Microsoft OneNote &amp; Google Keep</div><div><a href=\"http://paperwork.rocks/\">paperwork.rocks</a></div><div>&nbsp;</div><div>It&#39;s PHP, I would love it to be ported to use Sandstorm api...but should each note/clip be an instance? Or each notebook?</div><div>Which way do you think has more advantages?</div><div>Still getting used to the Sandstorm model.</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:29e73a7ca9d4e031665126e12a303966\" /></div><div>01:19</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:5eadfae0c3994c76350c81acb93bb676\" /></div><div><strong>Tiago Freitas</strong></div><div>&nbsp;</div><div>Other candidates I found:</div><div><a href=\"https://magpie-notes.readthedocs.org/\">https://magpie-notes.</a></div><div><a href=\"https://magpie-notes.readthedocs.org/\">readthedocs.org</a></div><div>&nbsp;</div><div><a href=\"https://laverna.cc/\">https://laverna.cc</a></div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:29e73a7ca9d4e031665126e12a303966\" /></div><div>05:11</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:5eadfae0c3994c76350c81acb93bb676\" /></div><div><strong>Jade Q Wang</strong></div><div>&nbsp;</div><div>Hi Tiago,</div><div>&nbsp;</div><div>Great suggestions! I&#39;ve noticed that Laverna is already pretty high on the <a href=\"http://sandstorm.io/vote\">App Committee&#39;s voting list</a>&nbsp;(color indicates status of being ported).&nbsp;Anyone can nominate apps, but only the App Committee can vote.</div><div>&nbsp;</div><div>A bit of context: the <a href=\"https://groups.google.com/forum/#!forum/sandstorm-app-committee\">App Committee</a> are a group of awesome individuals who democratically elect which apps we work on porting, as a perk of backing the Sandstorm Indiegogo campaign at particular tiers. The priority of apps we&#39;ve ported after the campaign have been decided by the committee.</div><div>&nbsp;</div><div>As for the granularity of the instance (a.k.a. grain!), it&#39;s really about the appropriate level for sharing and access control. Is the common use case that each note/clip has a particular set of users with access? Or is it the case that a notebook has a particular set of users with access (e.g., my private notebook)? My own past usage patterns of Evernote (actually, predominantly Skitch) would make the former more appropriate, but I&#39;m interested to learn if that&#39;s the case for your (and other people&#39;s) usage habits.</div><div>&nbsp;</div><div>Cheers,</div><div>Jade</div><div>--</div><div><a href=\"http://sandstorm.io/\">Sandstorm.io</a> - a radically easier way to host personal web apps</div><div>&nbsp;</div><div>- zitierten Text einblenden -</div><div>- zitierten Text einblenden -</div><div>--</div><div>You received this message because you are subscribed to the Google Groups &quot;Sandstorm Development&quot; group.</div><div>To unsubscribe from this group and stop receiving emails from it, send an email to sandstorm-de...@</div><div>googlegroups.com</div><div>.</div><div>For more options, visit <a href=\"https://groups.google.com/d/optout\">https://groups.google.com/d/</a></div><div><a href=\"https://groups.google.com/d/optout\">optout</a></div><div>.</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:29e73a7ca9d4e031665126e12a303966\" /></div><div>20:35</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:5eadfae0c3994c76350c81acb93bb676\" /></div><div><strong>Tiago Freitas</strong></div><div>&nbsp;</div><div>Hi Jade,</div><div>&nbsp;</div><div>In case a full port is done to use the sandstorm api.</div><div>&nbsp;</div><div>Sharing granularity should be the individual notes, but it would be good to have the option to share a notebook too. How does that work to have both?</div><div>&nbsp;</div><div>And how does the app support things like searching for notes by tag/text/etc?</div><div>If the grain is the note the app still has easy access to all grains? Or a separate search app needs to be used?</div><div>And the picker needs to be provided by sandstorm or can be implemented by the app?</div><div>I like the modularity but not sure how an app can have a consistent and integrated UI when the grain is small.</div><div>- zitierten Text einblenden -</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:29e73a7ca9d4e031665126e12a303966\" /></div><div>20:52</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:f08e127163e23be0e1bd80b848de32f4\" /></div><div><strong>David Chizmadia</strong></div><div>&nbsp;</div><div>One of my consistent thought experiments for Sandstorm is designing (and maybe eventually coding) a recipe/cookbook/menu management system - which led to exactly the same set of questions brought up by this thread of discussion. I keep coming back to a need for either a library or a micro-service to manage collections of grains (capabilities). To myself, I&#39;ve given this collection manager the name Sandbag. ;-)</div><div>&nbsp;</div><div>The pattern of having fine grained objects that can be incorporated into arbitrary collections is very common in OO programming and therefore will be popular in Sandstorm. If there is any interest, I&#39;ll try to write up and share some of my thoughts on Sandbag this weekend to get a community discussion started.</div><div>&nbsp;</div><div>:-Dave</div><div>- zitierten Text einblenden -</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:29e73a7ca9d4e031665126e12a303966\" /></div><div>20:58</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:5bc82c91ea78f514e6094cbc8727c4c1\" /></div><div><strong>Jake Weisz</strong></div><div>&nbsp;</div><div>+1 for Sandbag. :D</div><div>&nbsp;</div><div>I&#39;ve been bleeding for some sort of &quot;folders&quot; in the UI for a while, without any particular need for the sharing concerns of such a thing. But anything in that area would be very interesting to me.</div><div>&nbsp;</div><div>-Jake Weisz</div><div>- zitierten Text einblenden -</div><div>&nbsp;</div><div><img alt=\"\" src=\"cid:29e73a7ca9d4e031665126e12a303966\" /></div><div>jan.jambor.pro@gmail.com &nbsp;-&nbsp; <a href=\"https://accounts.google.com/Logout?continue=https://groups.google.com/forum/m/&amp;hl=de&amp;service=groups2\">Abmelden</a> &nbsp;-&nbsp; Desktop</div><div>&nbsp;</div><div><strong>Sandstorm.io port</strong> <strong>#199</strong></div><div>&nbsp;</div><div><img alt=\"CoolkcaH\" src=\"cid:6591186bca276224c17ce8d482165be3\" /></div><div><strong><a href=\"https://github.com/CoolkcaH\">CoolkcaH</a></strong> opened this issue</div><div>4 days ago</div><div>&nbsp;</div><div><strong><a href=\"https://github.com/twostairs/paperwork/labels/question\">question</a></strong></div><div>&nbsp;</div><div>A port to Sandstorm.io would have many advantages. It&#39;s the future of web-apps.</div><div>A direct port is possible, but using the Sandstorm API would be much better and make the app easier to maintain and develop.</div><div>&nbsp;</div><div>See this thread I started:</div><div><a href=\"https://groups.google.com/forum/#!topic/sandstorm-dev/JXrDH8APlkU\">https://groups.google.com/forum/#!topic/sandstorm-dev/JXrDH8APlkU</a></div><div>&nbsp;</div><div>Apps currently ported:</div><div><a href=\"https://sandstorm.io/apps\">https://sandstorm.io/apps</a></div><div>&nbsp;</div><div><strong><a href=\"https://github.com/twostairs/paperwork/labels/wontfix\">wontfix</a></strong></div><div>&nbsp;</div><div><strong>Baldrs</strong> added this label</div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#event-229834460\">3 days ago</a></div><div>&nbsp;</div><div><img alt=\"Arseniy Lozicki\" src=\"cid:41cb02e0dc16071d9598723afd10a7eb\" /></div><div><strong><a href=\"https://github.com/Baldrs\">Baldrs</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72799621\">3 days ago</a></div><div>&nbsp;</div><div>It does not support php, I think? Why do we must port it to anything anyway? For one platform instead of billions running PHP? Or to nodejs while there are no reason? This is no-go.</div><div>&nbsp;</div><div><img alt=\"Jason Davis\" src=\"cid:153fc9ed874a4408912edaeca55323e9\" /></div><div><strong><a href=\"https://github.com/jasondavis\">jasondavis</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72828399\">3 days ago</a></div><div>&nbsp;</div><div>I agree, personally I love the fact that it is built in my language of choice: PHP and further on my favorite framework Laravel! My dream app on my favorite platform...perfect how it is in my opinion</div><div>&nbsp;</div><div><img alt=\"Arseniy Lozicki\" src=\"cid:41cb02e0dc16071d9598723afd10a7eb\" /></div><div><strong><a href=\"https://github.com/Baldrs\">Baldrs</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72839699\">3 days ago</a></div><div>&nbsp;</div><div>It seems to support PHP but it requires changes in the applications in some way, for example WordPress is not just run on that platform, it is changed in some way, and I, personally, don&#39;t like the way they changing things or losing cross-platform app to a single platform anyway. It may be good if someone will maintain and adapt Paperwork to work with that thing, but I see no reason to do this. If you need this, do it yourself, you are even welcome, as it is free and open source software.</div><div>&nbsp;</div><div><img alt=\"CoolkcaH\" src=\"cid:6591186bca276224c17ce8d482165be3\" /></div><div><strong><a href=\"https://github.com/CoolkcaH\">CoolkcaH</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72842589\">3 days ago</a></div><div>&nbsp;</div><div>Baldrs, this was meant as a suggestion to generate discussion. Marking as wontfix instead of enhancement is the kind of thing that can drive developers and users away. I am a dev and maybe would consider contributing to paperwork in the future. I am not affiliated with Sandstorm, but I&#39;m interest because I want to start running web-apps on my own and want a good platform I trust.</div><div>&nbsp;</div><div>If Paperwork is successful, it will be ported to Sandstorm. If the Paperwork devs want to collaborate it would be beneficial to both projects:</div><div>&nbsp;</div><div>Sandstorm does support PHP, in fact making a PHP app work is very easy.</div><div>From the website, &quot;Use any tech stack that runs on Linux &mdash; Node, Rails, PHP, Java, Python, whatever&quot;.</div><div>But the more functionality of the Sandstorm API is used, the more advantages it has.</div><div>&nbsp;</div><div>For example, you get notes or notebooks sharing between users and between other apps for free, with no development effort required, because all that work is done for you by Sandstorm. Easy connectivity to other apps would also enable a lot more features without extra development work.</div><ul><li>Security is Built-in<br />You don&#39;t have to implement login. You don&#39;t even have to implement sharing &mdash; Sandstorm does that for you. You can even export APIs and integrate with other apps without thinking about OAuth. Sandstorm protects you and your users from most common security problems, so you can rest easy.</li><li>For users, Sandstorm makes it very easy to install web-apps, will have an easy to use Web-app Store. They can pay for hosting or host in their server. For Paperwork, it&#39;s a good way to get donations from users because they will have a pay-what-you-want model if you wish to enable that.</li><li>For users, trusting security is always a problem. As a developer myself I know how hard it is to implement good security and authentication. Sandstorm is also open-source and because it will support many apps, a lot more people will be working on core security. Also the Sandstorm devs are respected and have a lot of experience working on the technologies being used (main dev is an ex-Google he developed Protocol Buffers v2 (RPC used by Google) and the new Cap&#39;n Proto used in Sandstorm, and Asheesh Laroia was a Security Engineer at Eventbrite.</li><li>You can keep developing the standalone Paperwork, but if you make it modular, by separating the core functionality (notes) from the rest (login. security, sharing, etc.) your code will be better and easier to keep cross-platform. If you already do that, using Sandstorm or any other platform is even easier.</li></ul><div><strong><a href=\"https://github.com/twostairs/paperwork/labels/wontfix\">wontfix</a></strong></div><div>&nbsp;</div><div><strong>Baldrs</strong> removed this label</div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#event-230016564\">3 days ago</a></div><div>&nbsp;</div><div><strong><a href=\"https://github.com/twostairs/paperwork/labels/question\">question</a></strong></div><div>&nbsp;</div><div><strong>Baldrs</strong> added this label</div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#event-230016567\">3 days ago</a></div><div>&nbsp;</div><div><img alt=\"Arseniy Lozicki\" src=\"cid:41cb02e0dc16071d9598723afd10a7eb\" /></div><div><strong><a href=\"https://github.com/Baldrs\">Baldrs</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72852464\">3 days ago</a></div><div>&nbsp;</div><div>Ok, lets ask <strong><a href=\"https://github.com/devilx\">@devilx</a></strong> about his opinion on this. This is not enhancement, this is the change of lot of the things and much of development effort anyway.</div><div>&nbsp;</div><div><img alt=\"CoolkcaH\" src=\"cid:6591186bca276224c17ce8d482165be3\" /></div><div><strong><a href=\"https://github.com/CoolkcaH\">CoolkcaH</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72857171\">3 days ago</a></div><div>&nbsp;</div><div>A basic port doesn&#39;t seem difficult. Since you already support Docker in Paperwork, it seems to be even easier.</div><div>Of course to take advantage of all the features instead of just running as is would take more effort.</div><div>&nbsp;</div><div><a href=\"https://blog.sandstorm.io/news/2014-05-12-easy-port.html\">https://blog.sandstorm.io/news/2014-05-12-easy-port.html</a></div><div>&nbsp;</div><div><a href=\"https://github.com/sandstorm-io/sandstorm/wiki/Porting-Guide\">https://github.com/sandstorm-io/sandstorm/wiki/Porting-Guide</a></div><div>&nbsp;</div><div><a href=\"https://groups.google.com/forum/#!searchin/sandstorm-dev/php/sandstorm-dev/fxFjqXUXht0/xRjHcWPKOtgJ\">https://groups.google.com/forum/#!searchin/sandstorm-dev/php/sandstorm-dev/fxFjqXUXht0/xRjHcWPKOtgJ</a></div><div>&nbsp;</div><div><img alt=\"Jason Davis\" src=\"cid:153fc9ed874a4408912edaeca55323e9\" /></div><div><strong><a href=\"https://github.com/jasondavis\">jasondavis</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72960874\">3 days ago</a></div><div>&nbsp;</div><div>Another thing to consider is most of the apps that it supports are matured apps that aren&#39;t being developed in their infancy stage. Perhaps if this were implemented if should be down the road, a year or more even. Just my thoughts out loud.</div><div>&nbsp;</div><div>Another thing is there are several similar projects to Sandstorm.io so if you do one, then you might be expected to do all of them?</div><div>&nbsp;</div><div><img alt=\"CoolkcaH\" src=\"cid:6591186bca276224c17ce8d482165be3\" /></div><div><strong><a href=\"https://github.com/CoolkcaH\">CoolkcaH</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-72972045\">3 days ago</a></div><div>&nbsp;</div><div>jasondavis,</div><div>It is possible now to run the whole Paperwork app without big modifications inside Sandstorm, just like it does now with Docker. Sandstorm supports the conversion of the Docker container.</div><div>So that is a way to make it run easily and it would probably be the easiest way for a end user to install Paperwork, especially after Sandstorm opens the Indie App Store.</div><div>&nbsp;</div><div>Right now for end-users it&#39;s not so easy to install webapps, even with Docker, they would prefer not to use the command line at all. It will be one-click when hosted by Sandstorm, and very easy to self-host too, they will even automate the DNS service.</div><div>&nbsp;</div><div>Using Sandstorm as a platform actually saves a lot of development effort because it supports security and authentication, and will support sharing between users and between apps (like open a note in an app that uses it for something else).</div><div>&nbsp;</div><div>However Sandstorm is still in development, it will be a few months before it is ready for all that.</div><div>The Powerbox for example that would allow for sharing of notes or notebooks is not ready yet.</div><div>&nbsp;</div><div>After that, it&#39;s a choice about how many Sandstorms features the devs want to use, I think it will allow devs to focus on core functionality (notes/clips) and less effort in things that are common to all apps. Scalability would also be taken care of.</div><div>&nbsp;</div><div><img alt=\"Arseniy Lozicki\" src=\"cid:41cb02e0dc16071d9598723afd10a7eb\" /></div><div><strong><a href=\"https://github.com/Baldrs\">Baldrs</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-73007718\">2 days ago</a></div><div>&nbsp;</div><div>Rule of thumb in open-source - you need it, you do it.</div><div>&nbsp;</div><div><img alt=\"Marius\" src=\"cid:69330c5146b82dfddb3cd253ede920ae\" /></div><div><strong><a href=\"https://github.com/devilx\">devilx</a></strong></div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#issuecomment-73332116\">about 19 hours ago</a></div><div>&nbsp;</div><div><strong><a href=\"https://github.com/CoolkcaH\">@CoolkcaH</a></strong> thank you for suggesting this. Let me tell you my honest opinion about Sandstorm.io as it is today.</div><div>&nbsp;</div><div>Basically, I find it an interesting concept: Building an <em>app store</em> for the open-source world (or more precisely for open-source web services, just like Paperwork is one) &ndash; at least, if I should have gotten the idea right, because there is no clear statement about what problem Sandstorm actually tries to solve. Neither sandstorm.io nor the GitHub readme provides detailed insights on this topic. Browsing through the rest of its documentation showed me, that not only the &quot;plot&quot; is missing, but also important practical documentation. Judging the very sophisticated idea sandstorm seems to follow, documentation is the number one thing needed by projects (like us) in order to consider porting.</div><div>&nbsp;</div><div>However, in search for more useful documentation about Sandstorm I stumbled across an interesting post in the <a href=\"https://blog.sandstorm.io/news/2014-08-19-why-not-run-docker-apps.html\">Sandstorm blog</a>, which outlines a few points:</div><div>&nbsp;</div><div>Every app must have a web interface, and they must expose all configuration options through that interface.</div><div>&nbsp;</div><div>Users expect their data to be organized in units of documents or other semantic objects, not in units of databases or relational tables. Apps must set up their own database and encapsulate it appropriately; the user won&rsquo;t do it for them.</div><div>&nbsp;</div><div>Users should not have to log into every app separately, especially when the app instance already belongs specifically to them and Sandstorm is already protecting access. So, apps must integrate with Sandstorm&rsquo;s unified login system.</div><div>&nbsp;</div><div>It would also be nice if users did not have to master a different sharing model for every app. Sandstorm supports fine-grained containers, such that every document can actually be in a separate container. This way, the platform can handle sharing consistently across all apps, by applying sharing to the containers. But, apps have to be designed for this.</div><div>&nbsp;</div><div>Permission grants must be expressed in a way that users can understand. A user does not know what it means to allow an app to communicate on port 25, but they do know what it means to allow an app to send and receive e-mail under a particular e-mail address. In order for such permissions to be enforceable, the platform&rsquo;s security model must actually operate in terms of these semantic permissions, not arbitrary TCP connections.</div><div>&nbsp;</div><div>Updating an app must be a one-click (or even automatic) process. This means there must be a clearly-defined separation between the app &ldquo;image&rdquo; and its instance data, so that the platform is able to replace the former without harming the latter.</div><div>&nbsp;</div><div>Users will install malicious apps from time to time, and they must be protected from these. The regular Linux kernel interface is far too wide, and critical exploits are found too often. We must instead present a much narrower interface and force apps to adapt. See our previous post on this.</div><div>&nbsp;</div><div>These points clearly show, that Sandstorm is not designed for a wide variety of customers but rather one specific sort, that prefers comfort over (apparent) complexity. With Paperwork though, I (and probably a couple of more devs contributing to the project) want to allow a huge variety of people to use Paperwork, without taking control away from them. Not only people who want to run Paperwork on their own Linux machine at home, but also the guys that want to use it inside their embedded systems (e.g. NAS) or the admins that plan to introduce Paperwork in their enterprise should be able to set up and run the project.</div><div>&nbsp;</div><div>At the current state of the Sandstorm project, I don&#39;t see how all these different persons would benefit from having this additional abstraction layer between them and Paperwork &ndash; not to mention that several of Sandstorm&#39;s philosophies just won&#39;t work in certain environments. Which corporate admin prefer some reinvented wheel in terms of single-sign-on (<em>Sandstorm&rsquo;s unified login system</em>) when they could just integrate Paperwork (or whatever service) into their existing LDAP/Active Directory infrastructure? Which typical <em>Debian stable admin</em> would want to run a whole bunch of software, that wasn&#39;t packaged and provided through a (gpg signed) package management source, but instead installed by executing curl https://install.meteor.com/ | sh, curl https://install.sandstorm.io | bash or whatever similar command? How could Paperwork be packaged for <em>.deb/</em>.rpm based systems, with a dependency like Sandstorm? How could it ever be built as a SynologyCommunity package?</div><div>&nbsp;</div><div>Another good point concerns security. With an additional layer like Sandstorm in between, security becomes an even harder to manage topic. Especially, since Sandstorm&#39;s base is partially built using lower level languages like C and C++. These languages aren&#39;t known for being very fault-tolerant and mistakes in memory/buffer management can lead to serious security issues there. And the Sandstorm website really didn&#39;t take away the fear from me, since the <a href=\"https://sandstorm.io/#security\">&quot;Security&quot; section</a> contains of nothing more than buzzwords and marketing <em>blabla</em>. It does not give any insight on <strong>how</strong> Sandstorm actually enhances security. Telling that developers are stupid and write bugs (quote: <em>most developers don&#39;t think enough about security, and they end up producing apps that have bugs allowing hackers to get in.</em>) doesn&#39;t make Sandstorm a secure platform. The only thing it does is insult &quot;most developers&quot;.</div><div>&nbsp;</div><div>Now, what about for example scalability? Or high-availability? How does Sandstorm allow implementing highly available or even scalable setups? I could go on like this for hours. There are just too many questions with (right now) too little or no answers at all.</div><div>&nbsp;</div><div>To come to an end, this uncertainty is what keeps me from saying <em>&quot;Yes, we&#39;re going to support Sandstorm!&quot;</em>. In addition to all these technical thoughts, I&#39;m also unsure whether I like the way Sandstorm.io wants to build a business for themselves.</div><div>&nbsp;</div><div>From what I understood, the hosted variant of Sandstorm.io will allow you to easily use all the open-source projects that were ported to Sandstorm on a pre-installed environment ran by Sanstorm, Inc. (or whatever the company is called). Basically, Sandstorm tries to convince open-source projects to invest time and work for adopting its specific structure and then generates profits by providing open-source projects as a service. And, due to the fact that it&#39;s licensed under the Apache License 2.0, Sandstorm could include features within their SaaS service, which are exclusive to them and won&#39;t be made open-source, attracting more users to their hosted environment. So, how do the actual open-source projects themselves benefit from the whole thing in the end? In my opinion, they don&#39;t benefit at all.</div><div>&nbsp;</div><div>I will close this request for now. I&#39;m not saying that Sandstorm won&#39;t ever be supported by Paperwork, but I would want to wait and see, how Sandstorm evolves. Time will tell, whether it&#39;ll be the &quot;next big thing&quot; in open-source hosting and &ndash; what&#39;s more important for us &ndash; whether for example Laravel would jump the Sandstorm-train by providing a native integration to it. This is probably the first step that Sandstorm-evangelists should work on anyway.</div><div>&nbsp;</div><div><strong>Closed</strong></div><div>&nbsp;</div><div><strong>devilx</strong> closed this issue</div><div><a href=\"https://github.com/twostairs/paperwork/issues/199#event-231831813\">about 19 hours ago</a></div><div>&nbsp;</div><div><strong>Comment</strong></div><div>&nbsp;</div><div>You&#39;re not receiving notifications from this thread.</div><div>&nbsp;</div><div><strong>Subscribe</strong></div><ul><li>Desktop version</li></ul><div><strong>App Suggestion - Paperwork - Evernote alternative&ndash;Google Groups</strong></div><div><strong>Source URL:</strong> <a href=\"https://groups.google.com/forum/m/#!topic/sandstorm-dev/JXrDH8APlkU\">https://groups.google.com/forum/m/#!topic/sandstorm-dev/JXrDH8APlkU</a></div><div>App Voting Committee List</div><div><a href=\"https://alpha.sandstorm.io/grain/yjNpfjNjCHS9rqM34MGnbs\">https://alpha.sandstorm.io/grain/yjNpfjNjCHS9rqM34MGnbs</a></div>','2015-02-12 19:49:37','2015-02-15 15:40:45',NULL),(3,2,NULL,'Sandstorm.io port · Paperwork - Evernote alternative','This is the port of paperwork for sandstorm.io!','<p>This is the port of paperwork for sandstorm.io!</p>','2015-02-15 15:40:45','2015-02-15 15:40:45',NULL);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-18 10:52:32
