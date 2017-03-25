-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: kanban_board
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.22-MariaDB

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
-- Table structure for table `attachement`
--

DROP TABLE IF EXISTS `attachement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachement` (
  `at_id` int(11) NOT NULL,
  `at_url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `at_date` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `at_size` int(20) NOT NULL,
  `at_task_id` int(11) NOT NULL,
  `at_owner` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`at_id`),
  KEY `fk_attachement_1_idx` (`at_owner`),
  CONSTRAINT `fk_attachement_1` FOREIGN KEY (`at_owner`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachement`
--

LOCK TABLES `attachement` WRITE;
/*!40000 ALTER TABLE `attachement` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `co_id` int(11) NOT NULL,
  `co_task_id` int(11) NOT NULL,
  `co_creator` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_date` datetime NOT NULL,
  `co_content` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`co_id`),
  KEY `fk_comment_1_idx` (`co_creator`),
  KEY `fk_comment_2_idx` (`co_task_id`),
  CONSTRAINT `fk_comment_1` FOREIGN KEY (`co_creator`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_2` FOREIGN KEY (`co_task_id`) REFERENCES `task` (`ta_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `lb_id` int(11) NOT NULL,
  `lb_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lb_color` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lb_task_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_id`),
  KEY `fk_label_1_idx` (`lb_task_id`),
  CONSTRAINT `fk_label_1` FOREIGN KEY (`lb_task_id`) REFERENCES `task` (`ta_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `max_task_number`
--

DROP TABLE IF EXISTS `max_task_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `max_task_number` (
  `mtn_id` int(11) NOT NULL,
  `task_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`mtn_id`),
  CONSTRAINT `fk_max_task_number_1` FOREIGN KEY (`mtn_id`) REFERENCES `role_permission` (`rp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `max_task_number`
--

LOCK TABLES `max_task_number` WRITE;
/*!40000 ALTER TABLE `max_task_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `max_task_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pr_lead` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pr_description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pr_logo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `project_user_us_username_fk` (`pr_lead`),
  CONSTRAINT `project_user_us_username_fk` FOREIGN KEY (`pr_lead`) REFERENCES `user` (`us_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_group`
--

DROP TABLE IF EXISTS `project_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_group` (
  `pg_project_id` int(11) NOT NULL,
  `pg_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pg_project_id`,`pg_username`),
  KEY `project_group___fk1` (`pg_username`),
  CONSTRAINT `project_group___fk1` FOREIGN KEY (`pg_username`) REFERENCES `user` (`us_username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_group_project_pr_id_fk` FOREIGN KEY (`pg_project_id`) REFERENCES `project` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_group`
--

LOCK TABLES `project_group` WRITE;
/*!40000 ALTER TABLE `project_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_role`
--

DROP TABLE IF EXISTS `project_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_role` (
  `prro_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prro_project_id` int(11) NOT NULL,
  `prro_role_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`prro_project_id`,`prro_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_role`
--

LOCK TABLES `project_role` WRITE;
/*!40000 ALTER TABLE `project_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `rp_id` int(11) NOT NULL,
  `rp_project_id` int(11) NOT NULL,
  `rp_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rp_permission_type` enum('CREATE_TASK','ASIGN_TO_OTHER','CHANGE_STATUS_FROM','CHANGE_STATUS_TO','ADD_COMMENT_TO_TASK_IN_STATUS','ADD_ATTACHMENT_TO_TASK_IN_STATUS','ADD_ATTACHENT_TO_OWN_TASK','ADD_COMMENT_TO_OWN_TASK') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rp_id`),
  KEY `fk_role_permissiouytrecn_1_idx` (`rp_project_id`,`rp_username`),
  CONSTRAINT `fk_role_permissiouytrecn_1` FOREIGN KEY (`rp_project_id`, `rp_username`) REFERENCES `project_role` (`prro_project_id`, `prro_username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_permission`
--

DROP TABLE IF EXISTS `status_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_permission` (
  `st_permission_id` int(11) NOT NULL,
  `st_task_status` int(11) NOT NULL,
  PRIMARY KEY (`st_permission_id`,`st_task_status`),
  KEY `fk_status_permission_2_idx` (`st_task_status`),
  CONSTRAINT `fk_status_permission_1` FOREIGN KEY (`st_permission_id`) REFERENCES `role_permission` (`rp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_permission_2` FOREIGN KEY (`st_task_status`) REFERENCES `task_status` (`ts_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_permission`
--

LOCK TABLES `status_permission` WRITE;
/*!40000 ALTER TABLE `status_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_role` (
  `sr_id` int(11) NOT NULL,
  `sr_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`sr_id`),
  KEY `fk_system_role_1_idx` (`sr_username`),
  CONSTRAINT `fk_system_role_1` FOREIGN KEY (`sr_username`) REFERENCES `user` (`us_username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `ta_id` int(11) NOT NULL,
  `ta_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ta_summary` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ta_description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ta_priority` enum('NORMAL','LOW','HIGH','CRITICAL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ta_status` int(11) NOT NULL,
  `ta_creator` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ta_executor` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ta_create_time` datetime NOT NULL,
  `ta_progress_start_time` datetime DEFAULT NULL,
  `ta_progress_end_time` datetime DEFAULT NULL,
  `ta_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`ta_id`),
  KEY `fk_task_1_idx` (`ta_creator`),
  KEY `fk_task_2_idx` (`ta_executor`),
  KEY `fk_task_3_idx` (`ta_status`),
  CONSTRAINT `fk_task_1` FOREIGN KEY (`ta_creator`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_2` FOREIGN KEY (`ta_executor`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_3` FOREIGN KEY (`ta_status`) REFERENCES `task_status` (`ts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_history`
--

DROP TABLE IF EXISTS `task_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_history` (
  `th_id` int(11) NOT NULL,
  `th_time` datetime NOT NULL,
  `th_task_id` int(11) NOT NULL,
  `th_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `th_task_status` int(11) NOT NULL,
  PRIMARY KEY (`th_id`),
  KEY `fk_task_history_1_idx` (`th_task_id`),
  KEY `fk_task_history_2_idx` (`th_username`),
  KEY `fk_task_history_3_idx` (`th_task_status`),
  CONSTRAINT `fk_task_history_1` FOREIGN KEY (`th_task_id`) REFERENCES `task` (`ta_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_task_history_2` FOREIGN KEY (`th_username`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_history_3` FOREIGN KEY (`th_task_status`) REFERENCES `task_status` (`ts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_history`
--

LOCK TABLES `task_history` WRITE;
/*!40000 ALTER TABLE `task_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_status` (
  `ts_id` int(11) NOT NULL,
  `ts_project` int(11) NOT NULL,
  `ts_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ts_description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ts_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`ts_id`),
  KEY `fk_task_status_1_idx` (`ts_project`),
  CONSTRAINT `fk_task_status_1` FOREIGN KEY (`ts_project`) REFERENCES `project` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `us_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `us_email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `us_first_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `us_last_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`us_username`),
  UNIQUE KEY `user_us_email_uindex` (`us_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-25 17:46:51
