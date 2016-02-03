CREATE DATABASE  IF NOT EXISTS `summer_job` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `summer_job`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: summer_job
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comments` (
  `commentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `added` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `message` text NOT NULL,
  `posterID` int(10) unsigned DEFAULT NULL,
  `editorID` int(10) unsigned DEFAULT NULL,
  `posterName` varchar(255) DEFAULT NULL,
  `posterEmail` varchar(255) DEFAULT NULL,
  `posterWebsite` varchar(255) DEFAULT NULL,
  `postID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `FK_comments_1` (`postID`),
  CONSTRAINT `FK_comments_1` FOREIGN KEY (`postID`) REFERENCES `blog_posts` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comments`
--

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_posts` (
  `postID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `added` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `posterID` int(10) unsigned NOT NULL,
  `editorID` int(10) unsigned DEFAULT NULL,
  `readCount` int(10) unsigned NOT NULL DEFAULT '0',
  `split` tinyint(1) NOT NULL,
  `blogID` varchar(255) NOT NULL,
  PRIMARY KEY (`postID`),
  UNIQUE KEY `Index_2` (`alias`,`blogID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_posts`
--

LOCK TABLES `blog_posts` WRITE;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
INSERT INTO `blog_posts` VALUES (9,'sample post 1','2014-08-19 08:13:04',NULL,'A sample blog post','<p>Hello world</p>\r\n<p>Another line here.</p>',1,NULL,0,0,'default'),(10,'another-sample','2014-08-19 08:17:16','2014-08-19 08:43:44','Annother sample post','<p>A snippet from: <a href=\"http://en.wikipedia.org/wiki/Bill_Joy\">http://en.wikipedia.org/wiki/Bill_Joy</a></p>\r\n<p>According to a Salon article, during the early 1980s, DARPA had contracted the company Bolt, Beranek and Newman (BBN) to add TCP/IP to Berkeley UNIX. Joy had been instructed to plug BBN&#39;s stack into Berkeley Unix, but he refused to do so, as he had a low opinion of BBN&#39;s TCP/IP. So, Joy wrote his own high-performance TCP/IP stack. According to John Gage,</p>\r\n<blockquote>\r\n	<p>BBN had a big contract to implement TCP/IP, but their stuff didn&#39;t work, and grad student Joy&#39;s stuff worked. So they had this big meeting and this grad student in a T-shirt shows up, and they said, &quot;How did you do this?&quot; And Bill said, &quot;It&#39;s very simple &mdash; you read the protocol and write the code.&quot;</p>\r\n</blockquote>\r\n<p><br >&nbsp;</p>',1,1,1,0,'default');
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tags`
--

DROP TABLE IF EXISTS `blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tags` (
  `postID` int(10) unsigned NOT NULL,
  `tag` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`postID`,`tag`) USING BTREE,
  CONSTRAINT `FK_tags_1` FOREIGN KEY (`postID`) REFERENCES `blog_posts` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tags`
--

LOCK TABLES `blog_tags` WRITE;
/*!40000 ALTER TABLE `blog_tags` DISABLE KEYS */;
INSERT INTO `blog_tags` VALUES (9,'A tag'),(9,'Another tag'),(9,'One more tag'),(10,'A tag'),(10,'Another tag'),(10,'Dont whine'),(10,'Keep things simple'),(10,'Write good code');
/*!40000 ALTER TABLE `blog_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_korren_psi_waste_data`
--

DROP TABLE IF EXISTS `e_korren_psi_waste_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_korren_psi_waste_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `building` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `weight` double NOT NULL DEFAULT '0',
  `nyko` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `weight` (`weight`),
  KEY `building` (`building`),
  KEY `type` (`type`),
  KEY `nyko` (`nyko`),
  KEY `date` (`date`),
  KEY `date_id` (`date`,`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_korren_psi_waste_data`
--

LOCK TABLES `e_korren_psi_waste_data` WRITE;
/*!40000 ALTER TABLE `e_korren_psi_waste_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_korren_psi_waste_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hddtemp_drives`
--

DROP TABLE IF EXISTS `hddtemp_drives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hddtemp_drives` (
  `driveID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device` varchar(255) NOT NULL,
  `serverID` int(10) unsigned NOT NULL,
  `maxTemp` int(10) unsigned DEFAULT NULL,
  `minTemp` int(10) unsigned DEFAULT NULL,
  `lastAlarm` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`driveID`),
  UNIQUE KEY `Index_3` (`device`,`serverID`),
  KEY `FK_hddtempdrives_1` (`serverID`),
  CONSTRAINT `FK_hddtempdrives_1` FOREIGN KEY (`serverID`) REFERENCES `hddtemp_servers` (`serverID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hddtemp_drives`
--

LOCK TABLES `hddtemp_drives` WRITE;
/*!40000 ALTER TABLE `hddtemp_drives` DISABLE KEYS */;
/*!40000 ALTER TABLE `hddtemp_drives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hddtemp_servers`
--

DROP TABLE IF EXISTS `hddtemp_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hddtemp_servers` (
  `serverID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` varchar(5) NOT NULL,
  `monitor` tinyint(1) NOT NULL,
  `missingDriveWarning` tinyint(1) NOT NULL,
  PRIMARY KEY (`serverID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hddtemp_servers`
--

LOCK TABLES `hddtemp_servers` WRITE;
/*!40000 ALTER TABLE `hddtemp_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `hddtemp_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minimal_user_attributes`
--

DROP TABLE IF EXISTS `minimal_user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minimal_user_attributes` (
  `userID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(1024) NOT NULL,
  PRIMARY KEY (`userID`,`name`),
  KEY `Index_2` (`name`),
  CONSTRAINT `FK_minimal_user_attributes_1` FOREIGN KEY (`userID`) REFERENCES `minimal_users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minimal_user_attributes`
--

LOCK TABLES `minimal_user_attributes` WRITE;
/*!40000 ALTER TABLE `minimal_user_attributes` DISABLE KEYS */;
INSERT INTO `minimal_user_attributes` VALUES (2004,'Address','ESKADERVÄGEN 6'),(2004,'citizenIdentifier','198207157838'),(2004,'City','ALNÖ'),(2004,'MoveInDate','20140303'),(2004,'RealEstate','SELDONET 1');
/*!40000 ALTER TABLE `minimal_user_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minimal_user_groups`
--

DROP TABLE IF EXISTS `minimal_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minimal_user_groups` (
  `userID` int(10) unsigned NOT NULL,
  `groupID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userID`,`groupID`),
  CONSTRAINT `FK_minimal_user_groups_1` FOREIGN KEY (`userID`) REFERENCES `minimal_users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minimal_user_groups`
--

LOCK TABLES `minimal_user_groups` WRITE;
/*!40000 ALTER TABLE `minimal_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `minimal_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minimal_users`
--

DROP TABLE IF EXISTS `minimal_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minimal_users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `language` varchar(76) DEFAULT NULL,
  `preferedDesign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2005 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minimal_users`
--

LOCK TABLES `minimal_users` WRITE;
/*!40000 ALTER TABLE `minimal_users` DISABLE KEYS */;
INSERT INTO `minimal_users` VALUES (2004,'Niklas','Olsson',0,1,'2015-02-19 12:01:25','2015-02-19 12:11:18',NULL,NULL);
/*!40000 ALTER TABLE `minimal_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `date` time NOT NULL,
  `value` double NOT NULL,
  `parameter` varchar(45) NOT NULL,
  `station` varchar(45) NOT NULL,
  PRIMARY KEY (`date`,`parameter`,`station`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_aliases`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_aliases` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `listIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`alias`),
  CONSTRAINT `FK_backgroundmodulealiases_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_aliases`
--

LOCK TABLES `openhierarchy_background_module_aliases` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_aliases` DISABLE KEYS */;
INSERT INTO `openhierarchy_background_module_aliases` VALUES (1,'smex',0);
/*!40000 ALTER TABLE `openhierarchy_background_module_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_attributes` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`moduleID`,`name`),
  CONSTRAINT `FK_openhierarchy_background_module_attributes_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_attributes`
--

LOCK TABLES `openhierarchy_background_module_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_groups`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_groups` (
  `moduleID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`moduleID`,`groupID`),
  KEY `FK_backgroundmodulegroups_2` (`groupID`),
  CONSTRAINT `FK_backgroundmodulegroups_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_groups`
--

LOCK TABLES `openhierarchy_background_module_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_settings`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_settings` (
  `counter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleID` int(10) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`counter`),
  KEY `FK_backgroundmodulesettings_1` (`moduleID`),
  CONSTRAINT `FK_backgroundmodulesettings_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_settings`
--

LOCK TABLES `openhierarchy_background_module_settings` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_slots`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_slots` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slot` varchar(255) NOT NULL,
  PRIMARY KEY (`moduleID`,`slot`),
  CONSTRAINT `FK_backgroundmoduleslots_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_slots`
--

LOCK TABLES `openhierarchy_background_module_slots` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_users`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_users` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`userID`),
  CONSTRAINT `FK_backgroundmoduleusers_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_users`
--

LOCK TABLES `openhierarchy_background_module_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_modules`
--

DROP TABLE IF EXISTS `openhierarchy_background_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_modules` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `xslPath` text,
  `xslPathType` varchar(255) DEFAULT NULL,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `dataSourceID` int(10) unsigned DEFAULT NULL,
  `staticContentPackage` varchar(255) DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`),
  KEY `FK_backgroundmodules_1` (`sectionID`),
  KEY `FK_backgroundmodules_2` (`dataSourceID`),
  CONSTRAINT `FK_backgroundmodules_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_backgroundmodules_2` FOREIGN KEY (`dataSourceID`) REFERENCES `openhierarchy_data_sources` (`dataSourceID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_modules`
--

LOCK TABLES `openhierarchy_background_modules` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_modules` DISABLE KEYS */;
INSERT INTO `openhierarchy_background_modules` VALUES (1,'se.sundsvall.openetown.smex.SmexServiceHandlerModule','Smex',NULL,NULL,0,0,0,1,1,NULL,NULL,1);
/*!40000 ALTER TABLE `openhierarchy_background_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_data_sources`
--

DROP TABLE IF EXISTS `openhierarchy_data_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_data_sources` (
  `dataSourceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(45) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `driver` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `logAbandoned` tinyint(1) DEFAULT '0',
  `removeAbandoned` tinyint(1) DEFAULT '0',
  `removeTimeout` int(10) unsigned DEFAULT '30',
  `testOnBorrow` tinyint(1) DEFAULT '0',
  `validationQuery` varchar(255) DEFAULT 'SELECT 1',
  `maxActive` int(10) unsigned DEFAULT '30',
  `maxIdle` int(10) unsigned DEFAULT '8',
  `minIdle` int(10) unsigned DEFAULT '0',
  `maxWait` int(10) unsigned DEFAULT '0',
  `defaultCatalog` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataSourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_data_sources`
--

LOCK TABLES `openhierarchy_data_sources` WRITE;
/*!40000 ALTER TABLE `openhierarchy_data_sources` DISABLE KEYS */;
INSERT INTO `openhierarchy_data_sources` VALUES (4,'jdbc:mysql://localhost:3306','SystemManaged',1,'com.mysql.jdbc.Driver','root','root','FlowEngine',NULL,NULL,NULL,1,'SELECT 1',10,2,0,0,'flowengine-development');
/*!40000 ALTER TABLE `openhierarchy_data_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_aliases`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_aliases` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `listIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`alias`),
  CONSTRAINT `FK_filtermodulealiases_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_aliases`
--

LOCK TABLES `openhierarchy_filter_module_aliases` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_attributes` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`moduleID`,`name`),
  CONSTRAINT `FK_openhierarchy_filter_module_attributes_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_attributes`
--

LOCK TABLES `openhierarchy_filter_module_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_groups`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_groups` (
  `moduleID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`moduleID`,`groupID`),
  KEY `FK_filtermodulegroups_2` (`groupID`),
  CONSTRAINT `FK_filtermodulegroups_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_groups`
--

LOCK TABLES `openhierarchy_filter_module_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_settings`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_settings` (
  `counter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleID` int(10) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`counter`),
  KEY `FK_filtermodulesettings_1` (`moduleID`),
  CONSTRAINT `FK_filtermodulesettings_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_settings`
--

LOCK TABLES `openhierarchy_filter_module_settings` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_users`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_users` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`userID`),
  CONSTRAINT `FK_filtermoduleusers_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_users`
--

LOCK TABLES `openhierarchy_filter_module_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_modules`
--

DROP TABLE IF EXISTS `openhierarchy_filter_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_modules` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dataSourceID` int(10) unsigned DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`),
  KEY `FK_filtermodules_1` (`dataSourceID`),
  CONSTRAINT `FK_filtermodules_1` FOREIGN KEY (`dataSourceID`) REFERENCES `openhierarchy_data_sources` (`dataSourceID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_modules`
--

LOCK TABLES `openhierarchy_filter_modules` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_attributes` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`moduleID`,`name`),
  CONSTRAINT `FK_openhierarchy_foreground_module_attributes_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_attributes`
--

LOCK TABLES `openhierarchy_foreground_module_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_groups`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_groups` (
  `moduleID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`moduleID`,`groupID`),
  KEY `FK_modulegroups_2` (`groupID`),
  CONSTRAINT `FK_modulegroups_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_groups`
--

LOCK TABLES `openhierarchy_foreground_module_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_settings`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_settings` (
  `counter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleID` int(10) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`counter`),
  KEY `FK_modulesettings_1` (`moduleID`),
  CONSTRAINT `FK_modulesettings_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4834 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_settings`
--

LOCK TABLES `openhierarchy_foreground_module_settings` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_settings` DISABLE KEYS */;
INSERT INTO `openhierarchy_foreground_module_settings` VALUES (177,93,'changeEmail','true'),(178,93,'changeFirstname','false'),(179,93,'changeLastname','false'),(180,93,'changePassword','true'),(181,93,'changeUsername','true'),(260,8,'adminTimeout','120'),(261,8,'default','true'),(262,8,'logoutModuleAliases','/logout'),(263,8,'menuItemType','SECTION'),(264,8,'userTimeout','30'),(277,61,'menuItemType','MENUITEM'),(570,56,'menuItemType','MENUITEM'),(667,16,'allowAdminAdministration','true'),(668,16,'allowGroupAdministration','true'),(669,16,'filteringField','USERNAME'),(670,16,'menuItemType','MENUITEM'),(724,102,'adminUserIDs','1'),(725,102,'allowAnonymousComments','true'),(726,102,'archiveBundleLimit','10'),(727,102,'blogID','default'),(728,102,'blogPostsPerPage','3'),(729,102,'cssPath','/css/fck.css'),(730,102,'diskThreshold','100'),(731,102,'displayFullName','false'),(732,102,'enableRSSFeed','false'),(733,102,'feedDescription','Description of My Blog...'),(734,102,'feedItemsPerChannel','0'),(735,102,'feedLanguage','sv-se'),(736,102,'feedLinkToChannel','http://subdomain.domain.tld/blog'),(737,102,'feedTTL','60'),(738,102,'feedTitle','My Blog'),(739,102,'filestorePath','c:\\afolder\\anotherfolder'),(740,102,'maxCommentLength','1000'),(741,102,'menuItemType','MENUITEM'),(742,102,'ramThreshold','20'),(743,102,'showArchiveBundle','true'),(744,102,'showMainMenuitem','false'),(745,102,'showTagsBundle','true'),(746,102,'tagBundleLimit','10'),(749,95,'cssPath','/css/fck.css'),(750,95,'invitationModuleAlias','invitation'),(751,95,'invitationModuleName','Invitations'),(752,95,'invitationModuleXSLPath','InvitationModule.en.xsl'),(753,95,'invitationModuleXSLPathType','Classpath'),(754,95,'menuItemType','MENUITEM'),(875,116,'menuItemType','MENUITEM'),(876,116,'priority','0'),(1969,39,'csspath','/css/fck.css'),(1970,39,'disablePreview','false'),(1971,39,'diskThreshold','100'),(1972,39,'filestore','c:\\afolder\\anotherfolder'),(1973,39,'menuItemType','MENUITEM'),(1974,39,'pageViewModuleAlias','page'),(1975,39,'pageViewModuleName','Page viewer'),(1976,39,'pageViewModuleXSLPath','/se/sundsvall/ekorren/xsl/PageViewModule.sv.xsl'),(1977,39,'pageViewModuleXSLPathType','Classpath'),(1978,39,'ramThreshold','20'),(2287,71,'formStyleSheet','SimpleUserProviderForm.en.xsl'),(2288,71,'includeDebugData','false'),(2289,71,'menuItemType','MENUITEM'),(2290,71,'passwordAlgorithm','MySQL'),(2291,71,'priority','10'),(2292,71,'supportedAttributes','socialSecurityNumber'),(2293,71,'userTypeName','SimpleUser'),(2329,137,'emailFieldMode','DISABLED'),(2330,137,'formStyleSheet','MinimalUserProviderForm.en.xsl'),(2331,137,'includeDebugData','true'),(2332,137,'menuItemType','MENUITEM'),(2333,137,'passwordAlgorithm','SHA-1'),(2334,137,'passwordFieldMode','DISABLED'),(2335,137,'priority','200'),(2336,137,'userTypeName','MinimalUser'),(2337,137,'usernameFieldMode','DISABLED'),(2612,94,'menuItemType','MENUITEM'),(2621,139,'connectionTimeout','10000'),(2622,139,'host','172.16.254.222'),(2623,139,'menuItemType','MENUITEM'),(2624,139,'port','25'),(2625,139,'priority','0'),(2626,139,'secure','false'),(2627,139,'startTLS','false'),(2628,139,'useAuth','false'),(3614,9,'logoutMessage','<h1>Du är nu utloggad</h1>'),(3615,9,'menuItemType','SECTION'),(4676,135,'accountDisabledMessage','<h1>Account disabled</h1>\r\n<p>Your account is dsiabled, contact the system administrator for more information.</p>\r\n'),(4677,135,'addToLoginHandler','true'),(4678,135,'clearAndReAddRequestParameters','false'),(4679,135,'idpMetadataFilePath','d:\\saml-config\\IdP.login.sundsvall.se.xml'),(4680,135,'logXML','true'),(4681,135,'loginFailedMessage','<div class=\"modal-error-message\">\r\n <div>\r\n  <h1>Inloggningen misslyckades</h1>\r\n  <p>Inloggningen misslyckades, försök igen eller kontakta systemadministratören.</p>\r\n </div>\r\n</div>'),(4682,135,'menuItemType','MENUITEM'),(4683,135,'priority','1'),(4684,135,'requireSessionIndex','true'),(4685,135,'signAuthnRequests','false'),(4686,135,'spMetadataFilePath','d:\\saml-config\\SP.mittest.sundsvall.se.xml'),(4687,135,'updateLastLogin','false'),(4688,135,'userAdapterModuleID','136'),(4689,135,'userSessionTimeout','60'),(4728,170,'menuItemType','MENUITEM'),(4729,169,'menuItemType','MENUITEM'),(4733,171,'menuItemType','MENUITEM'),(4734,172,'menuItemType','MENUITEM'),(4743,166,'applicationExistsErrorMessage','Ett fel inträffade. Kontakta FAVI på 060-******* för mer information.'),(4744,166,'menuItemType','MENUITEM'),(4750,178,'editApplicationURL','add-municipality-job-application'),(4751,178,'listJobApplicationsURL','list-applications'),(4752,178,'menuItemType','BLANK'),(4753,175,'manageBusinessUrl','manage-business-app'),(4754,175,'manageMunicipalityUrl','manage-municipality-app'),(4755,175,'menuItemType','MENUITEM'),(4759,163,'manageBusinessUrl','manage-businesssector-job'),(4760,163,'manageMunicipalityUrl','manage-municipality-job'),(4761,163,'matchBusinessUrl','match-business-jobs'),(4762,163,'matchMunicipalityUrl','match-municipality-jobs'),(4763,163,'menuItemType','MENUITEM'),(4764,163,'rows','20'),(4766,174,'menuItemType','MENUITEM'),(4767,179,'menuItemType','MENUITEM'),(4769,180,'menuItemType','MENUITEM'),(4770,173,'menuItemType','MENUITEM'),(4771,173,'newFilePath','C:\\Users\\pettejoh\\Desktop\\Sommarjobb\\Dokument\\Omgjorda\\Testpopulering\\'),(4772,173,'templateFilePath','C:\\Users\\pettejoh\\Desktop\\Sommarjobb\\Dokument\\Omgjorda\\'),(4784,165,'menuItemType','MENUITEM'),(4785,164,'menuItemType','MENUITEM'),(4786,167,'manageBusinessJobUrl','manage-businesssector-job'),(4787,167,'manageMunicipalityJobUrl','manage-municipality-job'),(4788,167,'menuItemType','MENUITEM'),(4829,181,'businessAppExceeded','false'),(4830,181,'businessJobExceeded','false'),(4831,181,'menuItemType','MENUITEM'),(4832,181,'municipalityAppExceeded','false'),(4833,181,'municipalityJobExceeded','false');
/*!40000 ALTER TABLE `openhierarchy_foreground_module_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_users`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_users` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`userID`),
  CONSTRAINT `FK_moduleusers_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_users`
--

LOCK TABLES `openhierarchy_foreground_module_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_modules`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_modules` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `alias` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `description` text NOT NULL,
  `xslPath` text,
  `xslPathType` varchar(255) DEFAULT NULL,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `visibleInMenu` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `dataSourceID` int(10) unsigned DEFAULT NULL,
  `staticContentPackage` varchar(255) DEFAULT NULL,
  `requiredProtocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`moduleID`),
  UNIQUE KEY `Index_3` (`sectionID`,`alias`),
  KEY `FK_modules_1` (`sectionID`),
  KEY `FK_modules_2` (`dataSourceID`),
  CONSTRAINT `FK_modules_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_modules_2` FOREIGN KEY (`dataSourceID`) REFERENCES `openhierarchy_data_sources` (`dataSourceID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_modules`
--

LOCK TABLES `openhierarchy_foreground_modules` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_modules` DISABLE KEYS */;
INSERT INTO `openhierarchy_foreground_modules` VALUES (8,'se.unlogic.hierarchy.foregroundmodules.login.UserProviderLoginModule','Login','login','Login','LoginModule.en.xsl','Classpath',1,0,0,1,1,1,NULL,NULL,NULL),(9,'se.unlogic.hierarchy.foregroundmodules.logout.LogoutModule','Logout','logout','Logout','LogoutModule.en.xsl','Classpath',0,1,1,1,1,1,NULL,NULL,NULL),(16,'se.unlogic.hierarchy.foregroundmodules.useradmin.UserAdminModule','Users','useradmin','User administration','UserAdminModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(17,'se.unlogic.hierarchy.foregroundmodules.userprofile.UserProfileModule','User profile','userprofile','User profile','userprofile.xsl','Classpath',0,1,1,1,1,0,NULL,NULL,NULL),(37,'se.unlogic.hierarchy.foregroundmodules.menuadmin.MenuAdminModule','Menu','menuadmin','Menu administration','MenuAdminModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(39,'se.unlogic.hierarchy.foregroundmodules.pagemodules.PageAdminModule','Pages','pageadmin','Page administration','PageAdminModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontentadmin',NULL),(40,'se.unlogic.hierarchy.foregroundmodules.test.XSLReload','Reload XSL','xslreload','Module for reloading XSL stylesheet',NULL,NULL,0,0,1,1,1,4,NULL,'staticcontent',NULL),(56,'se.unlogic.hierarchy.foregroundmodules.runtimeinfo.RuntimeInfoModule','Runtime info','runtimeinfo','Visar info om minne och processorer','RuntimeInfoModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(61,'se.unlogic.hierarchy.foregroundmodules.systemadmin.SystemAdminModule','Modules & Sections','systemadmin','System administration','SystemAdminModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(64,'se.unlogic.hierarchy.foregroundmodules.threadinfo.ThreadInfoModule','Thread info','threadinfo','List all active threads','ThreadInfoModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(67,'se.unlogic.hierarchy.foregroundmodules.staticcontent.StaticContentModule','Staticcontent','static','Modul som m?jlig?r ?tkomt till statiska filer i classpath',NULL,NULL,1,1,1,1,0,1,NULL,NULL,NULL),(69,'se.unlogic.hierarchy.foregroundmodules.usersessionadmin.UserSessionAdminModule','Logged in users','sessionadmin','Currently logged in users','UserSessionAdminModule.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(70,'se.unlogic.hierarchy.foregroundmodules.groupadmin.GroupAdminModule','Groups','groups','Group administration','GroupAdminModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(71,'se.unlogic.hierarchy.foregroundmodules.userproviders.SimpleUserProviderModule','SimpleUserProvider','userprovider','Provides users and groups from multiple sources',NULL,NULL,0,1,0,1,0,4,NULL,'/se/unlogic/hierarchy/foregroundmodules/useradmin/staticcontent',NULL),(93,'se.unlogic.hierarchy.foregroundmodules.userprofile.UserProfileModule','Edit profile','profile','Edit your profile at unlogic.se','UserProfileModule.en.xsl','Classpath',0,1,1,1,0,1,NULL,NULL,NULL),(94,'se.unlogic.hierarchy.foregroundmodules.mailsenders.dummy.DummyEmailSenderModule','Dummy E-mail Sender','dummy-email-sender','Pretends sending e-mails',NULL,NULL,0,0,1,0,1,4,NULL,NULL,NULL),(95,'se.unlogic.hierarchy.foregroundmodules.invitation.SimpleInvitationAdminModule','Invitations','invitations','Administrates invitations','InvitationAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontentadmin',NULL),(102,'se.unlogic.hierarchy.foregroundmodules.blog.BlogModule','Blog','myblog','My blog','BlogModule.en.xsl','Classpath',1,1,1,1,1,12,NULL,'staticcontent',NULL),(108,'se.unlogic.hierarchy.foregroundmodules.resolver.ResolverModule','Resolver','resolver','Resolver module','ResolverModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,NULL,NULL),(109,'se.unlogic.hierarchy.foregroundmodules.datasourceadmin.DataSourceAdminModule','Datasources','datasources','Datasources','DataSourceAdminModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(116,'se.unlogic.hierarchy.foregroundmodules.groupproviders.SimpleGroupProviderModule','SimpleGroupProvider','simplegroupprovider','A group provider for simple groups',NULL,NULL,0,1,0,1,0,4,NULL,'staticcontent',NULL),(135,'com.nordicpeak.saml.SAMLLoginProviderModule','SAMLLoginProviderModule','saml','SAM LLogin Provider Module',NULL,'Classpath',1,1,1,0,1,1,NULL,'staticcontent',NULL),(137,'se.unlogic.hierarchy.foregroundmodules.minimaluser.MinimalUserProviderModule','Minimal User Provider Module','minimal-user','Minimal User Provider Module',NULL,'Classpath',0,0,1,0,0,1,NULL,NULL,NULL),(139,'se.unlogic.hierarchy.foregroundmodules.mailsenders.direct.DirectMailSender','Direct mail sender','direct-mail-sender','Direct mail sender',NULL,NULL,0,0,1,1,0,4,NULL,NULL,NULL),(163,'se.sogeti.summerjob.overview.SummerJobOverViewAdminModule','Sommarjobb överblick','summerjobs-overview','sommarjobb överblick','SummerJobOverViewAdminModuleTemplates.xsl','Classpath',0,1,1,1,0,1,NULL,NULL,NULL),(164,'se.sogeti.summerjob.addsummerjob.AddMunicipalitySummerJobModule','Add municipalitysummer job','add-municipality-job','Lägg till kommunalt sommarjobb','AddMunicipalitySummerJobModuleTemplates.xsl','Classpath',0,1,1,1,0,1,NULL,'staticcontent',NULL),(165,'se.sogeti.summerjob.addsummerjob.AddBusinessSectorSummerJobModule','lägg till sommarjobb näringsliv','add-business-sector-job','sommarjobb näringsliv formulär','AddBusinessSectorSummerJobModuleTemplates.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(166,'se.sogeti.summerjob.addsummerjobapplication.AddMunicipalitySummerJobApplicationModule','Ansök om kommunalt sommarjobb','add-municipality-job-application','Lägg till kommunalt sommarjobb','AddMunicipalitySummerJobApplicationModuleTemplates.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(167,'se.sogeti.summerjob.listjobs.ListSummerJobsAdminModule','Show summerjob overview','list-summerjobs','Lista sommarjobb','ListSummerJobsAdminModuleTemplates.xsl','Classpath',0,1,1,1,0,1,NULL,'staticcontent',NULL),(169,'se.sogeti.summerjob.managesummerjob.ManageBusinessSectorJobAdminModule','Hantera näringslivsjobb','manage-businesssector-job','Godkänn eller neka näringslivsjobb','ManageBusinessSectorJobAdminModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,'staticcontent',NULL),(170,'se.sogeti.summerjob.managesummerjob.ManageMunicipalityJobAdminModule','Hantera kommunala jobb','manage-municipality-job','Godkänn eller neka kommunala jobb','ManageMunicipalityJobAdminModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,'staticcontent',NULL),(171,'se.sogeti.summerjob.successview.SuccessView','SuccessView','success','SuccessView','SuccessViewTemplates.xsl','Classpath',1,1,1,1,0,1,NULL,NULL,NULL),(172,'se.sogeti.summerjob.addsummerjobapplication.BusinessSectorSummerJobApplicationModule','Ansök om näringslivsjobb','business-sector-job','Ansök om näringslivsjobb','BusinessSectorSummerJobApplicationModuleTemplates.xsl','Classpath',1,1,1,1,0,1,NULL,NULL,NULL),(173,'se.sogeti.summerjob.match.MatchMunicipalityJobsModule','Matcha kommunala jobb','match-municipality-jobs','Matcha kommunala jobb','MatchMunicipalityJobsModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,'staticcontent',NULL),(174,'se.sogeti.periodsadmin.view.PeriodViewModule','Adminsida','admin-manage','Hantera lön, perioder etc.','PeriodViewModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,'staticcontent',NULL),(175,'se.sogeti.summerjob.listapplications.ListApplicationsAdminModule','Översikt för ansökningar','list-applications','Översikt för ansökningar','ListApplicationsAdminModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,NULL,NULL),(176,'se.sogeti.summerjob.manageapplication.ManageMunicipalityApplicationAdminModule','Hantera kommunal ansökan','manage-municipality-app','Hantera kommunala ansökningar','ManageMunicipalityApplicationAdminModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,NULL,NULL),(178,'se.sogeti.summerjob.manageapplication.ManageBusinessApplicationAdminModule','Hantera närlingslivsansökan','manage-business-app','Hantera näringslivsansökningan','ManageBusinessApplicationAdminModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,NULL,NULL),(179,'se.sogeti.jobapplications.cv.CvServiceHandlerModule','CVServiceHandlerModule','cv','CVServiceHandlerModule',NULL,NULL,0,0,1,1,0,1,NULL,NULL,NULL),(180,'se.sogeti.summerjob.match.MatchBusinessJobsModule','Matcha näringslivsjobb','match-business-jobs','Matcha näringslivsjobb','MatchBusinessJobsModuleTemplates.xsl','Classpath',0,0,1,1,0,1,NULL,'staticcontent',NULL),(181,'se.sogeti.summerjob.welcome.SummerJobWelcomeModule','welcome','welcome','Välkomstmodul','SummerJobWelcomeModuleTemplates.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL);
/*!40000 ALTER TABLE `openhierarchy_foreground_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_menu_index`
--

DROP TABLE IF EXISTS `openhierarchy_menu_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_menu_index` (
  `menuIndexID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `menuIndex` int(10) unsigned NOT NULL DEFAULT '0',
  `moduleID` int(10) unsigned DEFAULT NULL,
  `uniqueID` varchar(255) DEFAULT NULL,
  `subSectionID` int(10) unsigned DEFAULT NULL,
  `menuItemID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`menuIndexID`),
  UNIQUE KEY `UniqueID / ModuleID` (`moduleID`,`uniqueID`,`sectionID`) USING BTREE,
  UNIQUE KEY `Index_5` (`sectionID`,`subSectionID`),
  KEY `FK_menuindex_3` (`subSectionID`),
  KEY `FK_menuindex_4` (`menuItemID`),
  CONSTRAINT `FK_menuindex_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menuindex_2` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menuindex_3` FOREIGN KEY (`subSectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menuindex_4` FOREIGN KEY (`menuItemID`) REFERENCES `openhierarchy_virtual_menu_items` (`menuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 206848 kB; (`sectionID`) REFER `foraldramotet-o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_menu_index`
--

LOCK TABLES `openhierarchy_menu_index` WRITE;
/*!40000 ALTER TABLE `openhierarchy_menu_index` DISABLE KEYS */;
INSERT INTO `openhierarchy_menu_index` VALUES (182,4,23,16,'16',NULL,NULL),(185,4,24,40,'40',NULL,NULL),(186,4,6,37,'se.unlogic.hierarchy.modules.menuadmin.MenuAdminModule',NULL,NULL),(188,4,25,39,'39',NULL,NULL),(190,1,31,NULL,NULL,4,NULL),(214,4,40,56,'56',NULL,NULL),(222,4,26,61,'61',NULL,NULL),(226,4,27,64,'64',NULL,NULL),(230,1,18,64,'64',NULL,NULL),(235,4,22,37,'37',NULL,NULL),(249,1,32,8,'8',NULL,NULL),(250,1,36,9,'9',NULL,NULL),(251,4,21,69,'69',NULL,NULL),(252,4,19,70,'70',NULL,NULL),(259,1,3,NULL,NULL,12,NULL),(289,1,29,93,'93',NULL,NULL),(292,4,28,94,'94',NULL,NULL),(293,4,29,95,'95',NULL,NULL),(295,4,39,NULL,NULL,NULL,1),(307,12,1,102,'102',NULL,NULL),(308,12,2,102,'archiveBundle',NULL,NULL),(309,12,3,102,'tagBundle',NULL,NULL),(320,4,34,39,'28',NULL,NULL),(336,1,33,NULL,NULL,NULL,2),(337,4,45,NULL,NULL,NULL,2),(338,1,34,108,'108',NULL,NULL),(339,4,46,108,'108',NULL,NULL),(349,1,35,39,'49',NULL,NULL),(350,4,17,109,'109',NULL,NULL),(356,4,43,39,'54',NULL,NULL),(365,1,38,39,'63',NULL,NULL),(377,4,41,NULL,NULL,NULL,6),(378,4,35,NULL,NULL,NULL,7),(381,1,43,NULL,NULL,31,NULL),(390,1,51,NULL,NULL,32,NULL),(392,32,2,39,'1',NULL,NULL),(393,32,3,39,'2',NULL,NULL),(394,32,4,39,'3',NULL,NULL),(395,1,52,39,'2',NULL,NULL),(396,1,53,135,'135',NULL,NULL),(397,1,54,167,'167',NULL,NULL);
/*!40000 ALTER TABLE `openhierarchy_menu_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_section_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_section_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_section_attributes` (
  `sectionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`sectionID`,`name`),
  CONSTRAINT `FK_openhierarchy_section_attributes_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_section_attributes`
--

LOCK TABLES `openhierarchy_section_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_section_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_section_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_section_groups`
--

DROP TABLE IF EXISTS `openhierarchy_section_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_section_groups` (
  `sectionID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`sectionID`,`groupID`),
  CONSTRAINT `FK_sectiongroups_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_section_groups`
--

LOCK TABLES `openhierarchy_section_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_section_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_section_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_section_users`
--

DROP TABLE IF EXISTS `openhierarchy_section_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_section_users` (
  `sectionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sectionID`,`userID`),
  CONSTRAINT `FK_sectionusers_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_section_users`
--

LOCK TABLES `openhierarchy_section_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_section_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_section_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_sections`
--

DROP TABLE IF EXISTS `openhierarchy_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_sections` (
  `sectionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentSectionID` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `visibleInMenu` tinyint(1) NOT NULL DEFAULT '0',
  `breadCrumb` tinyint(1) DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `anonymousDefaultURI` varchar(255) DEFAULT NULL,
  `userDefaultURI` varchar(255) DEFAULT NULL,
  `requiredProtocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sectionID`),
  UNIQUE KEY `Index_2` (`parentSectionID`,`alias`),
  CONSTRAINT `FK_sections_1` FOREIGN KEY (`parentSectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_sections`
--

LOCK TABLES `openhierarchy_sections` WRITE;
/*!40000 ALTER TABLE `openhierarchy_sections` DISABLE KEYS */;
INSERT INTO `openhierarchy_sections` VALUES (1,NULL,'OpenHierarchy sample site',1,1,1,1,1,1,'Home','Unlogic.se','/welcome','/welcome',NULL),(4,1,'administration',1,0,0,1,1,1,'Adm.','System administration','/sessionadmin','/sessionadmin',NULL),(12,1,'blogs',0,1,1,1,0,0,'Blog','My blog about varoius things in life','/myblog','/myblog',NULL),(31,1,'modules',1,1,1,1,1,1,'Modules','My modules','/modules','/modules',NULL),(32,1,'api',1,1,1,1,1,1,'API','api section',NULL,NULL,NULL);
/*!40000 ALTER TABLE `openhierarchy_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_virtual_menu_item_groups`
--

DROP TABLE IF EXISTS `openhierarchy_virtual_menu_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_virtual_menu_item_groups` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`menuItemID`,`groupID`) USING BTREE,
  CONSTRAINT `FK_virtualmenuitemgroups_1` FOREIGN KEY (`menuItemID`) REFERENCES `openhierarchy_virtual_menu_items` (`menuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_virtual_menu_item_groups`
--

LOCK TABLES `openhierarchy_virtual_menu_item_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_virtual_menu_item_users`
--

DROP TABLE IF EXISTS `openhierarchy_virtual_menu_item_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_virtual_menu_item_users` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`menuItemID`,`userID`),
  CONSTRAINT `FK_virtualmenuitemusers_1` FOREIGN KEY (`menuItemID`) REFERENCES `openhierarchy_virtual_menu_items` (`menuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_virtual_menu_item_users`
--

LOCK TABLES `openhierarchy_virtual_menu_item_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_virtual_menu_items`
--

DROP TABLE IF EXISTS `openhierarchy_virtual_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_virtual_menu_items` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `url` text,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuItemID`) USING BTREE,
  KEY `FK_menuadmin_1` (`sectionID`),
  CONSTRAINT `FK_virtualmenuitems_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_virtual_menu_items`
--

LOCK TABLES `openhierarchy_virtual_menu_items` WRITE;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_items` DISABLE KEYS */;
INSERT INTO `openhierarchy_virtual_menu_items` VALUES (1,'TITLE','Server status','Server status header',NULL,0,0,1,4),(2,'TITLE','Tools','Tools',NULL,0,0,1,4),(6,'BLANK',NULL,NULL,NULL,1,1,1,4),(7,'BLANK',NULL,NULL,NULL,1,1,1,4);
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_groups`
--

DROP TABLE IF EXISTS `page_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_groups` (
  `pageID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`pageID`,`groupID`),
  CONSTRAINT `FK_pagegroups_1` FOREIGN KEY (`pageID`) REFERENCES `pages` (`pageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_groups`
--

LOCK TABLES `page_groups` WRITE;
/*!40000 ALTER TABLE `page_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_users`
--

DROP TABLE IF EXISTS `page_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_users` (
  `pageID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pageID`,`userID`),
  CONSTRAINT `FK_pageusers_1` FOREIGN KEY (`pageID`) REFERENCES `pages` (`pageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_users`
--

LOCK TABLES `page_users` WRITE;
/*!40000 ALTER TABLE `page_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `pageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `enabled` varchar(45) NOT NULL DEFAULT '',
  `visibleInMenu` tinyint(1) NOT NULL DEFAULT '0',
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `breadCrumb` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pageID`),
  UNIQUE KEY `Index_3` (`sectionID`,`alias`),
  KEY `FK_pages_1` (`sectionID`),
  CONSTRAINT `FK_pages_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 191488 kB; (`sectionID`) REFER `fkdb-system/sec';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Api documentation','API Documentation ','	<div class=\"of-wrap of-block documentation\">\r\n		<header class=\"of-inner-padded-trl\">		\r\n			<h1>API dokumentation</h1>\r\n			<p>Allt data som är av kategorin öppna data inom e-tjänsten för avfallshantering finns tillgänglig via ett REST API för återanvändning. Datat kan hämtas både i JSON- och CSV-format från samma API. API:et finns med två varianter, ett där du får ut datat i JSON-format och ett där du får ut datat i CSV-format. Via JSON API:et kan du hämta och visa data direkt utefter valda parametrar, via CSV API:et genererar du en fil utefter dina parametrar som därefter kan laddas hem och bearbetas vidare.</p>		\r\n		</header>\r\n		\r\n		<article class=\"of-inner-padded-rbl\">\r\n				\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">JSON</h2>\r\n					<div>\r\n						<table class=\"of-table of-table-even-odd\" cellpadding=\"0\" cellspacing=\"0\">\r\n						  <thead>\r\n							<tr>\r\n							  <th>Parameter</th>\r\n							  <th>Beskrivning</th>							  \r\n							</tr>\r\n						  </thead>\r\n						  <tbody>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">URL</td>\r\n							  <td data-of-tr=\"Beskrivning\">http://ekorren.sundsvall.se/api/waste/v1/waste.json</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">HTTP metod</td>\r\n							  <td data-of-tr=\"Beskrivning\">GET</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">Innehåll</td>\r\n							  <td data-of-tr=\"Beskrivning\">application/json</td>			  \r\n							</tr>\r\n						</tbody>\r\n						</table>\r\n					</div>\r\n\r\n					\r\n\r\n				</div>\r\n				\r\n				<div class=\"of-inner-section\">\r\n				<p class=\"of-inner-padded-t\">Exempel på ett lyckat svar</p>\r\n					<div class=\"of-code-example\">					\r\n					<pre class=\"prettyprint prettyprinted\" style=\"\">					\r\n{\r\n  \"status\": \"success\",\r\n  \"data\": [\r\n    {\r\n      \"nyko\": 11,\r\n      \"date\": \"2014-01-01\",\r\n      \"building\": \"Verksamhetsavfall\",\r\n      \"weight\": 48.5,\r\n      \"type\": \"Brännbart\"\r\n    },\r\n    {\r\n      \"nyko\": 11,\r\n      \"date\": \"2014-01-01\",\r\n      \"building\": \"Verksamhetsavfall\",\r\n      \"weight\": 45.0,\r\n      \"type\": \"Brännbart\"\r\n    }\r\n  ]\r\n}\r\n					</pre>\r\n					</div>\r\n					<p class=\"of-inner-padded-t\">Exempel på ett misslyckat svar där från datum ej gick att parsa.</p>\r\n						<div class=\"of-code-example\">\r\n				\r\n					<pre class=\"prettyprint prettyprinted\" style=\"\">					\r\n{\r\n  \"status\": \"error\",\r\n  \"message\": \"Kunde inte parsa från datum.\"\r\n}\r\n					</pre>\r\n					</div>			\r\n				</div>			\r\n				\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">CSV</h2>				\r\n					<div>\r\n						<table class=\"of-table of-table-even-odd\" cellpadding=\"0\" cellspacing=\"0\">\r\n						  <thead>\r\n							<tr>\r\n							  <th>Parameter</th>\r\n							  <th>Beskrivning</th>							  \r\n							</tr>\r\n						  </thead>\r\n						  <tbody>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">URL</td>\r\n							  <td data-of-tr=\"Beskrivning\">http://ekorren.sundsvall.se/api/waste/v1/waste.csv</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">HTTP metod</td>\r\n							  <td data-of-tr=\"Beskrivning\">GET</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">Innehåll</td>\r\n							  <td data-of-tr=\"Beskrivning\">application/csv</td>			  \r\n							</tr>\r\n						</tbody>\r\n						</table>\r\n					</div>\r\n				</div>\r\n				\r\n				<div class=\"of-inner-section\">\r\n				<h2 class=\"of-inner-padded-t\">Parametrar i API</h2>\r\n				<p>Följande parametrar finns tillgängliga. Alla parametrar är valfria.</p>			\r\n					<div>\r\n						<table class=\"of-table of-table-even-odd\" cellpadding=\"0\" cellspacing=\"0\">\r\n						  <thead>\r\n							<tr>\r\n							  <th>Parameter</th>\r\n							  <th>Beskrivning</th>							  \r\n							</tr>\r\n						  </thead>\r\n						  <tbody>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">dateFrom</td>\r\n							  <td data-of-tr=\"Beskrivning\">Datum att hämta ifrån. Exempel: 2011-01-01</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">dateTo</td>\r\n							  <td data-of-tr=\"Beskrivning\">Datum att hämta till. Exempel: 2014-01-01</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">weightFrom</td>\r\n							  <td data-of-tr=\"Beskrivning\">Minska vikten >=. Exempel: 2.2</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">weightTo</td>\r\n							  <td data-of-tr=\"Beskrivning\">Tyngsta vikten <=. Exempel: 20.6</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">type</td>\r\n							  <td data-of-tr=\"Beskrivning\">Matavfall, Brannbart.</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">building</td>\r\n							  <td data-of-tr=\"Beskrivning\">Hyresfastighet, Verksamhetsavfall, Villor, Fritidshus,Special</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">nyko</td>\r\n							  <td data-of-tr=\"Beskrivning\">Nykonivå. Siffra 1-9 för nivå 1, 10-99 för nivå 2. exempel: nyko=1.</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Parameter\">pretty</td>\r\n							  <td data-of-tr=\"Beskrivning\">true, För pretty print. Endast JSON.</td>			  \r\n							</tr>				\r\n						  </tbody>\r\n						</table>\r\n					</div>\r\n				</div>\r\n				\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">Beskrivning av parametern building</h2>									\r\n					<div>\r\n						<table class=\"of-table of-table-even-odd\" cellpadding=\"0\" cellspacing=\"0\">\r\n						  <thead>\r\n							<tr>\r\n							  <th>Värde</th>\r\n							  <th>Beskrivning</th>							  \r\n							</tr>\r\n						  </thead>\r\n						  <tbody>\r\n							<tr>\r\n							  <td data-of-tr=\"Värde\">Villor</td>\r\n							  <td data-of-tr=\"Beskrivning\">Hushållsavfall från villor</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Värde\">Hyresfastighet</td>\r\n							  <td data-of-tr=\"Beskrivning\">Hushållsavfall från flerfamiljshus (bostadsrätter, hyreshus)</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Värde\">Verksamhetsavfall</td>\r\n							  <td data-of-tr=\"Beskrivning\">Hushållsavfall insamlat från olika typer av summer_jobheter/föreningar/företag</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Värde\">Fritidshus</td>\r\n							  <td data-of-tr=\"Beskrivning\">Hushållsavfall från fritidshus</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Värde\">Special</td>\r\n							  <td data-of-tr=\"Beskrivning\">Special anläggningar, ej hushållssopor</td>			  \r\n							</tr>\r\n						</tbody>\r\n						</table>\r\n					</div>\r\n				</div>\r\n				\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">Nyko nivå 1</h2>									\r\n					<div>\r\n						<table class=\"of-table of-table-even-odd\" cellpadding=\"0\" cellspacing=\"0\">\r\n						  <thead>\r\n							<tr>\r\n							  <th>Nyko</th>\r\n							  <th>Område</th>							  \r\n							</tr>\r\n						  </thead>\r\n						  <tbody>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">1</td>\r\n							  <td data-of-tr=\"Område\">Sundsvalls täto</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">2</td>\r\n							  <td data-of-tr=\"Område\">Alnö  kdel</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">3</td>\r\n							  <td data-of-tr=\"Område\">Kovland  kdel</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">4</td>\r\n							  <td data-of-tr=\"Område\">Njurunda täto</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">5</td>\r\n							  <td data-of-tr=\"Område\">Njurunda glesb</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">6</td>\r\n							  <td data-of-tr=\"Område\">Matfors kdel</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">7</td>\r\n							  <td data-of-tr=\"Område\">Stöde kdel</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">8</td>\r\n							  <td data-of-tr=\"Område\">IndalLiden kdel</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">9</td>\r\n							  <td data-of-tr=\"Område\">Hushållsavfall från fritidshus</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">11</td>\r\n							  <td data-of-tr=\"Område\">Restpost</td>			  \r\n							</tr>\r\n						</tbody>\r\n						</table>\r\n					</div>\r\n				</div>\r\n				\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">Nyko nivå 2</h2>									\r\n					<div>\r\n						<table class=\"of-table of-table-even-odd\" cellpadding=\"0\" cellspacing=\"0\">\r\n						  <thead>\r\n							<tr>\r\n							  <th>Nyko</th>\r\n							  <th>Område</th>							  \r\n							</tr>\r\n						  </thead>\r\n						  <tbody>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">11</td>\r\n							  <td data-of-tr=\"Område\">GranloBergså</td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">12</td>\r\n							  <td data-of-tr=\"Område\">BirstaLjustad\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">13</td>\r\n							  <td data-of-tr=\"Område\">HagaBosvSkönsb\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">14</td>\r\n							  <td data-of-tr=\"Område\">Skönsmon\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">15</td>\r\n							  <td data-of-tr=\"Område\">NackstaSöderm\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">16</td>\r\n							  <td data-of-tr=\"Område\">City\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">21</td>\r\n							  <td data-of-tr=\"Område\">ViUsland\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">22</td>\r\n							  <td data-of-tr=\"Område\">Ankarsvik\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">23</td>\r\n							  <td data-of-tr=\"Område\">Alnötäts omland\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">31</td>\r\n							  <td data-of-tr=\"Område\">Kovland\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">32</td>\r\n							  <td data-of-tr=\"Område\">Kovlands omland\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">41</td>\r\n							  <td data-of-tr=\"Område\">Bredsand\r\n\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">42</td>\r\n							  <td data-of-tr=\"Område\">Svartvik\r\n\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">43</td>\r\n							  <td data-of-tr=\"Område\">Kvissleby\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">44</td>\r\n							  <td data-of-tr=\"Område\">Klockarberget\r\n\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">45</td>\r\n							  <td data-of-tr=\"Område\">NjubomMjösund\r\n\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">46</td>\r\n							  <td data-of-tr=\"Område\">SkottsNyland\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">47</td>\r\n							  <td data-of-tr=\"Område\">Essvik\r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">51</td>\r\n							  <td data-of-tr=\"Område\">JuniBergaVNolby\r\n							  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">52</td>\r\n							  <td data-of-tr=\"Område\">ÄngomArmsjön\r\n							  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">61</td>\r\n							  <td data-of-tr=\"Område\">Matfors\r\n							  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">62</td>\r\n							  <td data-of-tr=\"Område\">Lucksta \r\n							  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">63</td>\r\n							  <td data-of-tr=\"Område\">Lucksta omland							  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">64</td>\r\n							  <td data-of-tr=\"Område\">Matfors omland\r\n							  						  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">71</td>\r\n							  <td data-of-tr=\"Område\">Stöde							  						  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">72</td>\r\n							  <td data-of-tr=\"Område\">S Stöde omland\r\n							  					  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">73</td>\r\n							  <td data-of-tr=\"Område\">N Stöde omland\r\n							  					  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">74</td>\r\n							  <td data-of-tr=\"Område\">Nedansjö\r\n							  						  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">81</td>\r\n							  <td data-of-tr=\"Område\">Indal\r\n							  						  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">82</td>\r\n							  <td data-of-tr=\"Område\">Liden\r\n							  					  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">83</td>\r\n							  <td data-of-tr=\"Område\">Indal omland\r\n							  					  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">84</td>\r\n							  <td data-of-tr=\"Område\">Holm omland							  					  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">85</td>\r\n							  <td data-of-tr=\"Område\">Liden omland							  					  \r\n							  </td>			  \r\n							</tr>\r\n							<tr>\r\n							  <td data-of-tr=\"Nyko\">99</td>\r\n							  <td data-of-tr=\"Område\">Restpost\r\n							  					  \r\n							  </td>			  \r\n							</tr>\r\n						\r\n						</tbody>\r\n						</table>\r\n					</div>\r\n				</div>\r\n				\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">Exempel</h2>\r\n					<p>Några exempel</p>\r\n					<div class=\"of-example\">\r\n						<pre class=\"prettyprint\">\r\nhttp://ekorren.sundsvall.se/api/waste/v1/waste.json/?dateFrom=2012-01-03&dateTo=2012-01-04\r\n&nyko=1&building=Verksamhetsavfall&building=Hyresfastighet\r\n&type=Matavfall&weightFrom=3&weightTo=13&pretty=true\r\n						</pre>\r\n					</div>\r\n					<div class=\"of-code-example\">\r\n					<pre class=\"prettyprint\">\r\n{\r\n  \"status\": \"success\",\r\n  \"data\": [\r\n    {\r\n      \"nyko\": 11,\r\n      \"date\": \"2012-01-03\",\r\n      \"building\": \"Hyresfastighet\",\r\n      \"weight\": 12.0,\r\n      \"type\": \"Matavfall\"\r\n    },\r\n    {\r\n      \"nyko\": 11,\r\n      \"date\": \"2012-01-03\",\r\n      \"building\": \"Hyresfastighet\",\r\n      \"weight\": 7.0,\r\n      \"type\": \"Matavfall\"\r\n    },\r\n    {\r\n      \"nyko\": 11,\r\n      \"date\": \"2012-01-03\",\r\n      \"building\": \"Hyresfastighet\",\r\n      \"weight\": 9.0,\r\n      \"type\": \"Matavfall\"\r\n    },\r\n    {\r\n      \"nyko\": 11,\r\n      \"date\": \"2012-01-03\",\r\n      \"building\": \"Hyresfastighet\",\r\n      \"weight\": 6.0,\r\n      \"type\": \"Matavfall\"\r\n    }\r\n  ]\r\n}						\r\n						</pre>\r\n					</div>\r\n				</div>\r\n				\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">Licens för användning</h2>\r\n					<p>Informationen om avfallsmängder kan återanvändas fritt. Det gäller all information som ges tillgång via API, både gällande avfallsmängder och nyckelkodsområden. Informationen lyder under en Creative commons CC-0-licens <a href=\"http://creativecommons.org/about/cc0\">http://creativecommons.org/about/cc0</a>.</p>\r\n				</div>\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">Uppdateringar och ändringar i API</h2>\r\n					<p>Alla uppdateringar och ändringar av detta API kommer att publiceras på Sundsvalls kommuns utvecklingsblogg (utveckling.sundsvall.se). Uppdateringar på utvecklingsbloggen kan följas via RSS.</p>\r\n				</div>\r\n				<div class=\"of-inner-section\">\r\n					<h2 class=\"of-inner-padded-t\">Kända brister i datamängd</h2>\r\n					<p>De tömningar som har nyckelkodsområde \"0\" innebär att tömningen är gjord på en fastighet som inte går att matcha till ett nyckelkodsområde. Detta beror på hur ett avfallskärl är knytet till fastighet  och fel rättas löpande i källdatat.</p>\r\n					<p>Den andra bristen gäller att vissa tömningar har 0 kg eller t om ett negativt värde. Detta beror på att mätutrustningen varit felande vid tömningstillfället.</p>\r\n				</div>\r\n		</article>		\r\n	</div>','1',1,1,1,1,32,'documentation',1),(2,'Smex är nere','Sida som förklarar att det inte är någon ide att logga in.','<p style=\"text-align: center;\"><span style=\"font-size:20px;\"><strong>Tyv&auml;rr &auml;r det ingen id&eacute; att logga in nu f&ouml;r personlig data kan inte visas just nu.&nbsp;</strong></span></p>\r\n','1',1,1,1,1,1,'smex-nere',1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_group_attributes`
--

DROP TABLE IF EXISTS `simple_group_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_group_attributes` (
  `groupID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`groupID`,`name`),
  CONSTRAINT `FK_simple_group_attributes_1` FOREIGN KEY (`groupID`) REFERENCES `simple_groups` (`groupID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_group_attributes`
--

LOCK TABLES `simple_group_attributes` WRITE;
/*!40000 ALTER TABLE `simple_group_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_group_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_groups`
--

DROP TABLE IF EXISTS `simple_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_groups`
--

LOCK TABLES `simple_groups` WRITE;
/*!40000 ALTER TABLE `simple_groups` DISABLE KEYS */;
INSERT INTO `simple_groups` VALUES (8,'Default group','Default group',1),(10,'Administrators','Group for administrators',1);
/*!40000 ALTER TABLE `simple_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_user_attributes`
--

DROP TABLE IF EXISTS `simple_user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_user_attributes` (
  `userID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`userID`,`name`) USING BTREE,
  KEY `Index_2` (`name`),
  CONSTRAINT `FK_simple_user_attributes_1` FOREIGN KEY (`userID`) REFERENCES `simple_users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_user_attributes`
--

LOCK TABLES `simple_user_attributes` WRITE;
/*!40000 ALTER TABLE `simple_user_attributes` DISABLE KEYS */;
INSERT INTO `simple_user_attributes` VALUES (1,'address','Riddargatan 19'),(1,'moveInDate','2013-02-01'),(1,'realEstate','LILLHÄLLOM 1:107'),(1,'socialSecurityNumber','198207157838'),(2,'myAttributeTest','foobar'),(2,'socialSecurityNumber','198111060615'),(3,'socialSecurityNumber','196705117544'),(4,'socialSecurityNumber','198205077814'),(5,'socialSecurityNumber','197804187891');
/*!40000 ALTER TABLE `simple_user_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_user_groups`
--

DROP TABLE IF EXISTS `simple_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_user_groups` (
  `userID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`userID`,`groupID`),
  KEY `FK_usergroups_2` (`groupID`),
  CONSTRAINT `FK_usergroups_1` FOREIGN KEY (`userID`) REFERENCES `simple_users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_user_groups`
--

LOCK TABLES `simple_user_groups` WRITE;
/*!40000 ALTER TABLE `simple_user_groups` DISABLE KEYS */;
INSERT INTO `simple_user_groups` VALUES (1,8),(8,8),(1,10);
/*!40000 ALTER TABLE `simple_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_users`
--

DROP TABLE IF EXISTS `simple_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `language` varchar(76) DEFAULT NULL,
  `preferedDesign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Users table;InnoDB free: 274432 kB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_users`
--

LOCK TABLES `simple_users` WRITE;
/*!40000 ALTER TABLE `simple_users` DISABLE KEYS */;
INSERT INTO `simple_users` VALUES (1,'openhierarchy','*18CEC0B12394150D87DD1C214207742851272BA6','John','Doe','foo@bar.not.set',1,1,'2008-01-27 19:43:42','2015-10-28 09:06:54',NULL,NULL),(2,'Jari','*80F645356BE43796E62E20C487FF00F6E1412553','Jari','K','jari.koponen@sundsvall.se',1,1,'2015-01-13 10:29:01','2015-09-03 09:04:14',NULL,NULL),(3,'Eva-Marie','*3562DACDBD574A58319C62BFC98A8EBD7C7D1D25','Eva','T','eva-marie.tyberg@sundsvall.se',0,1,'2015-01-13 10:30:46','2015-02-03 13:21:32',NULL,NULL),(4,'Robert','*A14C02465C2ED43BDB89ACC6C7213C1D00617758','Robert','O','robert.olofsson@nordicpeak.com',0,1,'2015-01-13 10:32:09',NULL,NULL,NULL),(5,'Jimmy','*1E7F320B8F580AADC02E8A70285E46A8CFDA3359','Jimmy','G','jimmy.granlund@sundsvall.se',0,1,'2015-01-29 10:04:15','2015-08-28 12:31:59',NULL,NULL),(6,'petter','0000000000000000000000000000000000000000','John','Doe','foo@bar.not.set',1,1,'2008-01-27 19:43:42','2015-06-05 08:10:42',NULL,NULL),(7,'test','*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29','test','test','gunilla.ejdenius-edlund@skola.sundsvall.se',1,1,'2015-08-18 12:57:06','2016-02-03 09:40:03',NULL,NULL),(8,'petro','*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29','Petter','Johansson','ej@admin.se',0,1,'2015-12-11 12:21:45','2016-02-03 09:25:59',NULL,NULL);
/*!40000 ALTER TABLE `simple_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_accounting_entries`
--

DROP TABLE IF EXISTS `summer_job_accounting_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_accounting_entries` (
  `id` int(10) unsigned NOT NULL,
  `isPrio` tinyint(1) unsigned DEFAULT NULL,
  `ansvar` varchar(45) DEFAULT NULL,
  `verksamhet` varchar(45) DEFAULT NULL,
  `aktivitet` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_accounting_entries`
--

LOCK TABLES `summer_job_accounting_entries` WRITE;
/*!40000 ALTER TABLE `summer_job_accounting_entries` DISABLE KEYS */;
INSERT INTO `summer_job_accounting_entries` VALUES (1,1,'22200000','610910','2339'),(2,0,'22200000','610920','2339');
/*!40000 ALTER TABLE `summer_job_accounting_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_areas`
--

DROP TABLE IF EXISTS `summer_job_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `canBeChosenInApplication` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_areas`
--

LOCK TABLES `summer_job_areas` WRITE;
/*!40000 ALTER TABLE `summer_job_areas` DISABLE KEYS */;
INSERT INTO `summer_job_areas` VALUES (1,'Barnomsorg','Du kan exempelvis arbeta inom förskola, fritids.',1),(2,'Äldreomsorg','Du kan exempelvis arbeta inom hemtjänst, servicehus och äldreboenden.',1),(3,'Omsorg','Du kommer att vara delaktig i den dagliga verksamheten med vuxna eller barn med funktionsnedsättning.',1),(4,'Städ','Du tillhör en lokalvårdsgrupp och kan få göra allt från daglig lokalvård på kontor till grovstädning vid renoveringar.',1),(5,'Kök','Kan innefatta förberedelse, tillredning och paketering av mat inom barnomsorg, äldreomsorg eller storkök. ',1),(6,'Utemiljö','Du arbetar utomhus med exempelvis: gräsklippning, renhållning av parker, skötsel av planteringar, städ/skräpplockning.',1),(7,'Turism','Du kan exempelvis arbeta med guidning, värdskap, marknadsundersökningar, informationsarbete.',1),(8,'Miljöarbete','Kan innebära att ta vattenprover, göra kontroller av livsmedelshantering, mätningar av partiklar i luften.',1),(9,'Vaktmästeri / Fastighetsskötsel / Fordon','Du arbetar med fastighetsskötsel eller fordon. Ange i ditt personliga brev vilken inriktning du helst vill ha. Arbete med fordon kräver B-körkort. Flytt av möbler och annat.',1),(10,'Kommunservice','Detta arbete är mer åt det administrativa hållet och kan bland annat vara på bibliotek, göra inventeringar, marknadsundersökningar, statistik m.m. ',1),(11,'Förening','Ej valbar av ungdom.',0);
/*!40000 ALTER TABLE `summer_job_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_business_sector_job`
--

DROP TABLE IF EXISTS `summer_job_business_sector_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_business_sector_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` date NOT NULL,
  `updated` date DEFAULT NULL,
  `workTitle` varchar(255) NOT NULL,
  `workDescription` mediumtext NOT NULL,
  `numberOfWorkersNeeded` int(10) unsigned NOT NULL,
  `approvedDate` date DEFAULT NULL,
  `approvedByUser` varchar(45) DEFAULT NULL,
  `manager_id` int(10) unsigned DEFAULT NULL,
  `mustBeOverEighteen` tinyint(1) unsigned NOT NULL,
  `freeTextRequirements` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `streetAddress` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `controlled` tinyint(1) DEFAULT NULL,
  `driversLicenseTypeId` int(10) unsigned DEFAULT NULL,
  `controlledDate` date DEFAULT NULL,
  `initiatedByUser` varchar(45) DEFAULT NULL,
  `adminNotes` varchar(45) DEFAULT NULL,
  `addedByUser` varchar(45) DEFAULT NULL,
  `lastApplicationDay` date DEFAULT NULL,
  `isOpen` tinyint(1) DEFAULT '1',
  `corporateNumber` varchar(45) DEFAULT NULL,
  `descriptionForEmploymentPapers` varchar(255) DEFAULT NULL,
  `freeText` text,
  `inChargeOfInterviews` tinyint(1) DEFAULT NULL,
  `mentor_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_summer_job_business_sector_job_3_idx` (`manager_id`),
  KEY `fk_summer_job_business_sector_job_1_idx` (`driversLicenseTypeId`),
  KEY `fk_summer_job_business_sector_job_2_idx` (`mentor_id`),
  CONSTRAINT `fk_summer_job_business_sector_job_1` FOREIGN KEY (`driversLicenseTypeId`) REFERENCES `summer_job_driverslicensetype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_business_sector_job_2` FOREIGN KEY (`mentor_id`) REFERENCES `summer_job_business_sector_mentors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_business_sector_job_3` FOREIGN KEY (`manager_id`) REFERENCES `summer_job_business_sector_managers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_business_sector_job`
--

LOCK TABLES `summer_job_business_sector_job` WRITE;
/*!40000 ALTER TABLE `summer_job_business_sector_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_business_sector_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_business_sector_job_application`
--

DROP TABLE IF EXISTS `summer_job_business_sector_job_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_business_sector_job_application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jobId` int(10) unsigned NOT NULL,
  `enrolledHighSchool` tinyint(1) unsigned DEFAULT '0',
  `highSchoolProgram` varchar(64) DEFAULT NULL,
  `ranking` int(10) unsigned DEFAULT '0',
  `hasAccessToVehicle` tinyint(1) unsigned DEFAULT '0',
  `experienceInCare` tinyint(1) unsigned DEFAULT '0',
  `personalLetter` mediumtext,
  `cvFilename` varchar(255) DEFAULT NULL,
  `socialSecurityNumber` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `streetAddress` varchar(255) NOT NULL,
  `zipCode` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `driversLicenseTypeId` int(11) unsigned NOT NULL,
  `schoolType` varchar(45) DEFAULT NULL,
  `controlled` tinyint(1) DEFAULT NULL,
  `controlledByUser` varchar(45) DEFAULT NULL,
  `isOverEighteen` tinyint(1) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `skvCity` varchar(45) DEFAULT NULL,
  `controlledDate` date DEFAULT NULL,
  `schoolName` varchar(45) DEFAULT NULL,
  `adminNotes` varchar(45) DEFAULT NULL,
  `addedByUser` varchar(45) DEFAULT NULL,
  `birthDate` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `timeForInformation` varchar(45) DEFAULT NULL,
  `callStatus` varchar(45) DEFAULT NULL,
  `applicationType` varchar(45) DEFAULT NULL,
  `personApplicationId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_summer_job_business_sector_application_1_idx` (`jobId`),
  KEY `fk_summer_job_business_sector_job_application_1_idx` (`personApplicationId`),
  CONSTRAINT `fk_summer_job_business_sector_application_1` FOREIGN KEY (`jobId`) REFERENCES `summer_job_business_sector_job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_business_sector_job_application_1` FOREIGN KEY (`personApplicationId`) REFERENCES `summer_job_person_applications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_business_sector_job_application`
--

LOCK TABLES `summer_job_business_sector_job_application` WRITE;
/*!40000 ALTER TABLE `summer_job_business_sector_job_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_business_sector_job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_business_sector_managers`
--

DROP TABLE IF EXISTS `summer_job_business_sector_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_business_sector_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_business_sector_managers`
--

LOCK TABLES `summer_job_business_sector_managers` WRITE;
/*!40000 ALTER TABLE `summer_job_business_sector_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_business_sector_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_business_sector_mentors`
--

DROP TABLE IF EXISTS `summer_job_business_sector_mentors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_business_sector_mentors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_business_sector_mentors`
--

LOCK TABLES `summer_job_business_sector_mentors` WRITE;
/*!40000 ALTER TABLE `summer_job_business_sector_mentors` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_business_sector_mentors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_contact_person`
--

DROP TABLE IF EXISTS `summer_job_contact_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_contact_person` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_contact_person`
--

LOCK TABLES `summer_job_contact_person` WRITE;
/*!40000 ALTER TABLE `summer_job_contact_person` DISABLE KEYS */;
INSERT INTO `summer_job_contact_person` VALUES (1,'Kommun','060123456'),(2,'Privat','060123456');
/*!40000 ALTER TABLE `summer_job_contact_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_driverslicensetype`
--

DROP TABLE IF EXISTS `summer_job_driverslicensetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_driverslicensetype` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_driverslicensetype`
--

LOCK TABLES `summer_job_driverslicensetype` WRITE;
/*!40000 ALTER TABLE `summer_job_driverslicensetype` DISABLE KEYS */;
INSERT INTO `summer_job_driverslicensetype` VALUES (1,'Inget körkort','Inget körkort'),(2,'AM','Moped klass 1'),(3,'A1','Lätt motorcykel'),(4,'A2','Mellanstor motorcykel'),(5,'A','Tung motorcykel'),(6,'B','Personbil och lätt lastbil'),(7,'BE','Personbil med tungt släp'),(8,'C1/C1E','Medeltung lastbil'),(9,'C/CE','Tung lastbil'),(10,'D1/D1E','Mellanstor buss'),(11,'D/DE','Buss');
/*!40000 ALTER TABLE `summer_job_driverslicensetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_geo_area`
--

DROP TABLE IF EXISTS `summer_job_geo_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_geo_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `nyko` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_geo_area`
--

LOCK TABLES `summer_job_geo_area` WRITE;
/*!40000 ALTER TABLE `summer_job_geo_area` DISABLE KEYS */;
INSERT INTO `summer_job_geo_area` VALUES (1,'Granlo / Granloholm / Bergsåker','Granlo, Bergsåker, Selånger, Granloholm, Huli','11'),(2,'Birsta / Ljustadalen','Birsta, Ljustadalen, Sundsbruk, Finsta, Tunadal','12'),(3,'Haga / Bosvedjan / Skönsberg','Haga, Bosvedjan, Skönsberg, Ortviken, Bydalen','13'),(4,'Skönsmon','Skönsmon','14'),(5,'Nacksta / Södermalm','Nacksta, Södermalm, Sidsjön, Sörnacksta, Sallyhill','15'),(6,'Sundsvalls centrum','Centrum, Norra Berget','16'),(7,'Alnön','Alnön','21, 22, 23'),(8,'Kovland','Kovland, Sättna','31, 32'),(9,'Bredsand / Stockvik','Bredsand, Stockvik','41'),(10,'Kvissleby','Kvissleby, Svartvik, Skottsund, Nyland, Essvik','42, 43, 46, 47'),(11,'Njurundabommen','Njurundabommen, Klockarberget, Mjösund, Juni, Bergafjärden, Nolby, Ängom, Armsjön','44, 45, 51, 52'),(12,'Matfors / Lucksta','Matfors, Lucksta','61, 62, 63, 64'),(13,'Stöde / Nedansjö','Stöde, Nedansjö','71, 72, 73, 74'),(14,'Indal','Indal','81, 83'),(15,'Liden','Liden','82, 85'),(16,'Holm','Holm','84'),(17,'Allsta / Klingsta','Allsta, Klingsta','64');
/*!40000 ALTER TABLE `summer_job_geo_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_municipality_job`
--

DROP TABLE IF EXISTS `summer_job_municipality_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_municipality_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` date NOT NULL,
  `updated` date DEFAULT NULL,
  `areaId` int(10) unsigned NOT NULL,
  `workDescription` mediumtext NOT NULL,
  `numberOfWorkersNeeded` int(10) unsigned NOT NULL,
  `periodId` int(10) unsigned NOT NULL,
  `approved` tinyint(1) unsigned NOT NULL,
  `controlledDate` date DEFAULT NULL,
  `approvedByUser` varchar(45) DEFAULT NULL,
  `manager_id` int(10) unsigned DEFAULT NULL,
  `mustBeOverEighteen` tinyint(1) unsigned NOT NULL,
  `freeTextRequirements` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `administration` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `streetAddress` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `driversLicenseTypeId` int(10) unsigned NOT NULL,
  `geoAreaId` int(11) unsigned NOT NULL,
  `controlled` tinyint(1) unsigned NOT NULL,
  `initiatedByUser` varchar(45) DEFAULT NULL,
  `adminNotes` mediumtext,
  `addedByUser` varchar(45) DEFAULT NULL,
  `descriptionForEmploymentPapers` varchar(255) DEFAULT NULL,
  `isOpen` tinyint(1) DEFAULT NULL,
  `descriptionForCallPapers` varchar(255) DEFAULT NULL,
  `freeText` text,
  PRIMARY KEY (`id`),
  KEY `fk_municipalityjob_period_idx` (`periodId`),
  KEY `fk_municipalityjob_area_idx` (`areaId`),
  KEY `fk_summer_job_municipality_job_1_idx` (`manager_id`),
  KEY `fk_summer_job_municipality_job_2_idx` (`geoAreaId`),
  KEY `fk_summer_job_municipality_job_3_idx` (`driversLicenseTypeId`),
  CONSTRAINT `fk_municipalityjob_area` FOREIGN KEY (`areaId`) REFERENCES `summer_job_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipalityjob_period` FOREIGN KEY (`periodId`) REFERENCES `summer_job_periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_summer_job_municipality_job_1` FOREIGN KEY (`manager_id`) REFERENCES `summer_job_municipality_managers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_2` FOREIGN KEY (`geoAreaId`) REFERENCES `summer_job_geo_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_municipality_job`
--

LOCK TABLES `summer_job_municipality_job` WRITE;
/*!40000 ALTER TABLE `summer_job_municipality_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_municipality_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_municipality_job_application`
--

DROP TABLE IF EXISTS `summer_job_municipality_job_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_municipality_job_application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jobId` int(10) unsigned DEFAULT NULL,
  `ranking` int(10) unsigned DEFAULT '0',
  `personalLetter` mediumtext,
  `cvFilename` varchar(255) DEFAULT NULL,
  `prefered_area_1` int(10) unsigned DEFAULT NULL,
  `prefered_area_2` int(10) unsigned DEFAULT NULL,
  `prefered_area_3` int(10) unsigned DEFAULT NULL,
  `prefered_geo_area_1` int(10) unsigned DEFAULT NULL,
  `prefered_geo_area_2` int(10) unsigned DEFAULT NULL,
  `prefered_geo_area_3` int(10) unsigned DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  `controlledDate` date DEFAULT NULL,
  `controlledByUser` varchar(45) DEFAULT NULL,
  `socialSecurityNumber` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `streetAddress` varchar(255) NOT NULL,
  `zipCode` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `driversLicenseTypeId` int(10) unsigned DEFAULT NULL,
  `controlled` tinyint(1) unsigned NOT NULL,
  `created` date NOT NULL,
  `schoolName` varchar(60) DEFAULT NULL,
  `schoolType` varchar(10) DEFAULT NULL,
  `skvCity` varchar(45) DEFAULT NULL,
  `adminNotes` varchar(45) DEFAULT NULL,
  `addedByUser` varchar(45) DEFAULT NULL,
  `noPreferedArea` tinyint(1) unsigned NOT NULL,
  `birthDate` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `timeForInformation` varchar(45) DEFAULT NULL,
  `personalMentorId` int(10) unsigned DEFAULT NULL,
  `callStatus` varchar(45) DEFAULT NULL,
  `applicationType` varchar(45) DEFAULT NULL,
  `preferedPeriod` varchar(45) DEFAULT NULL,
  `personApplicationId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_application_municipalityJob_idx` (`jobId`),
  KEY `fk_summer_job_municipality_job_application_1_idx` (`prefered_area_1`),
  KEY `fk_summer_job_municipality_job_application_2_idx` (`prefered_area_2`),
  KEY `fk_summer_job_municipality_job_application_3_idx` (`prefered_area_3`),
  KEY `fk_summer_job_municipality_job_application_4_idx` (`prefered_geo_area_1`),
  KEY `fk_summer_job_municipality_job_application_5_idx` (`prefered_geo_area_2`),
  KEY `fk_summer_job_municipality_job_application_6_idx` (`prefered_geo_area_3`),
  KEY `fk_summer_job_municipality_job_application_7_idx` (`driversLicenseTypeId`),
  KEY `fk_summer_job_municipality_job_application_8_idx` (`socialSecurityNumber`),
  KEY `fk_summer_job_municipality_job_application_8_idx1` (`personalMentorId`),
  KEY `fk_summer_job_municipality_job_application_9_idx` (`personalMentorId`),
  KEY `fk_summer_job_municipality_job_application_9_idx1` (`personApplicationId`),
  CONSTRAINT `fk_application_municipalityJob` FOREIGN KEY (`jobId`) REFERENCES `summer_job_municipality_job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_1` FOREIGN KEY (`prefered_area_1`) REFERENCES `summer_job_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_10` FOREIGN KEY (`personApplicationId`) REFERENCES `summer_job_person_applications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_2` FOREIGN KEY (`prefered_area_2`) REFERENCES `summer_job_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_3` FOREIGN KEY (`prefered_area_3`) REFERENCES `summer_job_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_4` FOREIGN KEY (`prefered_geo_area_1`) REFERENCES `summer_job_geo_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_5` FOREIGN KEY (`prefered_geo_area_2`) REFERENCES `summer_job_geo_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_6` FOREIGN KEY (`prefered_geo_area_3`) REFERENCES `summer_job_geo_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_7` FOREIGN KEY (`driversLicenseTypeId`) REFERENCES `summer_job_driverslicensetype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_8` FOREIGN KEY (`personalMentorId`) REFERENCES `summer_job_municipality_mentors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_summer_job_municipality_job_application_9` FOREIGN KEY (`personApplicationId`) REFERENCES `summer_job_person_applications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_municipality_job_application`
--

LOCK TABLES `summer_job_municipality_job_application` WRITE;
/*!40000 ALTER TABLE `summer_job_municipality_job_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_municipality_job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_municipality_managers`
--

DROP TABLE IF EXISTS `summer_job_municipality_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_municipality_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_municipality_managers`
--

LOCK TABLES `summer_job_municipality_managers` WRITE;
/*!40000 ALTER TABLE `summer_job_municipality_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_municipality_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_municipality_mentors`
--

DROP TABLE IF EXISTS `summer_job_municipality_mentors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_municipality_mentors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jobId` int(10) unsigned NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_summer_job_municipality_mentors_1_idx` (`jobId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_municipality_mentors`
--

LOCK TABLES `summer_job_municipality_mentors` WRITE;
/*!40000 ALTER TABLE `summer_job_municipality_mentors` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_municipality_mentors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_periods`
--

DROP TABLE IF EXISTS `summer_job_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_periods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `isUnique` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_periods`
--

LOCK TABLES `summer_job_periods` WRITE;
/*!40000 ALTER TABLE `summer_job_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_person_applications`
--

DROP TABLE IF EXISTS `summer_job_person_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_person_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `socialSecurityNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialSecurityNumber_UNIQUE` (`socialSecurityNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_person_applications`
--

LOCK TABLES `summer_job_person_applications` WRITE;
/*!40000 ALTER TABLE `summer_job_person_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `summer_job_person_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_place_for_information`
--

DROP TABLE IF EXISTS `summer_job_place_for_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_place_for_information` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_place_for_information`
--

LOCK TABLES `summer_job_place_for_information` WRITE;
/*!40000 ALTER TABLE `summer_job_place_for_information` DISABLE KEYS */;
INSERT INTO `summer_job_place_for_information` VALUES (1,'Trädgårdsgatan 17, Sundsvall');
/*!40000 ALTER TABLE `summer_job_place_for_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summer_job_salary`
--

DROP TABLE IF EXISTS `summer_job_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summer_job_salary` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `amountInSEK` int(11) NOT NULL,
  `overEighteen` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summer_job_salary`
--

LOCK TABLES `summer_job_salary` WRITE;
/*!40000 ALTER TABLE `summer_job_salary` DISABLE KEYS */;
INSERT INTO `summer_job_salary` VALUES (1,'Under 18',58,0),(2,'Över 18',71,1);
/*!40000 ALTER TABLE `summer_job_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_versions`
--

DROP TABLE IF EXISTS `table_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_versions` (
  `tableGroupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tableGroupName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_versions`
--

LOCK TABLES `table_versions` WRITE;
/*!40000 ALTER TABLE `table_versions` DISABLE KEYS */;
INSERT INTO `table_versions` VALUES ('se.unlogic.hierarchy.core.daos.implementations.mysql.MySQLCoreDAOFactory',34),('se.unlogic.hierarchy.foregroundmodules.forum.daos.mysql.MySQLForumDAOFactory',3),('se.unlogic.hierarchy.foregroundmodules.registration.AnnotatedConfirmationRegistrationModule',2),('se.unlogic.hierarchy.foregroundmodules.userproviders.SimpleUserProviderModule',5),('se.unlogic.hierarchy.foregroundmodules.pagemodules.daos.annotated.AnnotatedPageDAOFactory',3),('se.unlogic.hierarchy.foregroundmodules.blog.daos.mysql.MySQLBlogDAOFactory',2),('com.nordicpeak.filearchive.FileArchiveModule',3),('se.unlogic.hierarchy.foregroundmodules.invitation.SimpleInvitationAdminModule',2),('com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',4),('com.nordicpeak.flowengine.dao.FlowEngineDAOFactory',3),('se.unlogic.hierarchy.foregroundmodules.groupproviders.SimpleGroupProviderModule',3),('se.sundsvall.openetown.waste.nykoselect.NykoSelectModule',1),('se.unlogic.hierarchy.foregroundmodules.hddtemp.HDDTempModule',1),('se.sundsvall.openetown.waste.psidata.ImportPSIWasteModule',2),('se.sundsvall.openetown.waste.nyko.NykoSelectModule',2),('se.sundsvall.openetown.waste.WasteModule',3),('se.unlogic.hierarchy.foregroundmodules.minimaluser.MinimalUserProviderModule',3),('se.sundsvall.openetown.waste.beans.RegisterBioSort',2),('se.sundsvall.openetown.waste.importdata.psidata.RekoPsiDataImportModule',2),('se.sundsvall.openetown.air.CleanAirAPIModule',1),('se.sundsvall.summer_job.upload.ImportCsvModule',2);
/*!40000 ALTER TABLE `table_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  `uniqueKey` varchar(45) NOT NULL,
  `passwordSalt` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_roleId_idx` (`roleId`),
  CONSTRAINT `fk_user_role_roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invitation_attributes`
--

DROP TABLE IF EXISTS `user_invitation_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invitation_attributes` (
  `invitationID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`invitationID`,`name`) USING BTREE,
  CONSTRAINT `FK_user_invitation_attributes_1` FOREIGN KEY (`invitationID`) REFERENCES `user_invitations` (`invitationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invitation_attributes`
--

LOCK TABLES `user_invitation_attributes` WRITE;
/*!40000 ALTER TABLE `user_invitation_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invitation_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invitation_type_groups`
--

DROP TABLE IF EXISTS `user_invitation_type_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invitation_type_groups` (
  `invitationTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`invitationTypeID`,`groupID`) USING BTREE,
  CONSTRAINT `FK_invitationtypegroups_1` FOREIGN KEY (`invitationTypeID`) REFERENCES `user_invitation_types` (`invitationTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invitation_type_groups`
--

LOCK TABLES `user_invitation_type_groups` WRITE;
/*!40000 ALTER TABLE `user_invitation_type_groups` DISABLE KEYS */;
INSERT INTO `user_invitation_type_groups` VALUES (1,4),(2,7),(3,6),(4,5);
/*!40000 ALTER TABLE `user_invitation_type_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invitation_types`
--

DROP TABLE IF EXISTS `user_invitation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invitation_types` (
  `invitationTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `senderName` varchar(255) NOT NULL,
  `senderEmail` varchar(255) NOT NULL,
  `registrationText` text NOT NULL,
  `registeredText` text NOT NULL,
  PRIMARY KEY (`invitationTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invitation_types`
--

LOCK TABLES `user_invitation_types` WRITE;
/*!40000 ALTER TABLE `user_invitation_types` DISABLE KEYS */;
INSERT INTO `user_invitation_types` VALUES (1,'OpenHierarchy Developers','OpenHierarchy developer invitation','Hello $recipient-firstname!\r\n\r\nYou have been invited to Unlogic.se (www.unlogic.se) as an OpenHierarchy developer.\r\n\r\nClick on the link below to create an account:\r\n\r\n$invitation-link\r\n\r\nWith your account at Unlogic.se you will be able to access the issuetracker for OpenHierarchy, Utils and other related projects.\r\n\r\n/Robert \"Unlogic\" Olofsson','Robert \"Unlogic\" Olofsson','unlogic@unlogic.se','',''),(2,'Patrik Hermanssons svensexa','Bilder och filmer fr?n svensexan!','Hej $recipient-firstname!\r\n\r\nH?r kommer en inbjudan till min hemsida (www.unlogic.se).\r\n\r\nKlicka p? p? l?nken nedan f?r v?lja anv?ndarnamn och l?senord:\r\n\r\n$invitation-link\r\n\r\nEfter att du registrerat dig och loggat in kommer du att kunna se dom bilder som ?vriga deltagarna p? svensexan laddat upp, ladda upp dina egna bilder samt skriva bild kommentarer.\r\n\r\nInom kort kommer ?ven filmen fr?n svensexan att publiceras p? hemsida. \r\n\r\n/Robban','Robert Olofsson','unlogic@unlogic.se','',''),(3,'Relatives','Inbjudan till min hemsida!','Hej $recipient-firstname, h?r kommer en inbjudan till min hemsida!\r\n\r\nJag h?ller p? att l?gga ut alla de bilder som Malin och jag kn?ppt genom ?ren p? min hemsida. Det ?r bilder fr?n Julfiranden, f?delsedagar, Oliver mm.\r\n\r\nF?r att inte vem som helst ska komma ?t bilderna har jag gjort s? att man m?ste ha ett konto p? min hemsida f?r att se bilderna s? d?rf?r kommer h?r en inbjudan.\r\n\r\nKlicka p? l?nken nedan f?r att skapa ett konto p? min hemsida:\r\n\r\n$invitation-link\r\n\r\nEfter att du skapat ditt konto ?r det bara trycka p? \"Login\" l?nken uppe till h?ger p? sidan och logga in.\r\n\r\nN?r du gjort detta kommer du ?t m?ngder med bilder i de olika gallerierna som du hittar under \"Galleries\" l?nken som ligger strax under logotypen p? sidan.\r\n\r\nSidan ?r till stora delar p? utrikiska (Engelska) men dom flesta bild gallerier ?r p? svenska och det g?r alldeles utm?rkt att skriva svenska kommentarer till bilderna i galleriet.\r\n\r\nPs. H?r av dig om det ?r n?got du funderar ?ver!\r\n\r\n/Robban','Robert Olofsson','unlogic@unlogic.se','',''),(4,'Friends (swedish)','Inbjudan till Unlogic.se','Hej $recipient-firstname!\r\n\r\nH?r kommer en inbjudan till min hemsida Unlogic.se!\r\n\r\nKlicka p? l?nken nedan f?r skapa ett konto:\r\n\r\n$invitation-link\r\n\r\n/Robban\r\n','Robert Olofsson','unlogic@unlogic.se','','');
/*!40000 ALTER TABLE `user_invitation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invitations`
--

DROP TABLE IF EXISTS `user_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invitations` (
  `invitationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invitationTypeID` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `linkID` varchar(36) NOT NULL,
  `sendCount` int(10) unsigned NOT NULL,
  `lastSent` datetime DEFAULT NULL,
  PRIMARY KEY (`invitationID`),
  UNIQUE KEY `Index_3` (`email`),
  KEY `FK_Invitations_1` (`invitationTypeID`),
  CONSTRAINT `FK_Invitations_1` FOREIGN KEY (`invitationTypeID`) REFERENCES `user_invitation_types` (`invitationTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invitations`
--

LOCK TABLES `user_invitations` WRITE;
/*!40000 ALTER TABLE `user_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'summer_job'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-03 10:51:25
