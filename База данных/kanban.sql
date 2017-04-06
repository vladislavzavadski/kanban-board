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
  `at_date` datetime NOT NULL,
  `at_size` int(20) NOT NULL,
  `at_task_id` int(11) NOT NULL,
  `at_owner` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`at_id`),
  KEY `fk_attachement_1_idx` (`at_owner`),
  KEY `fk_attachement_2_idx` (`at_task_id`),
  CONSTRAINT `fk_attachement_1` FOREIGN KEY (`at_owner`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attachement_2` FOREIGN KEY (`at_task_id`) REFERENCES `task` (`ta_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `change_status_permission`
--

DROP TABLE IF EXISTS `change_status_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_status_permission` (
  `csp_perm_id` int(11) NOT NULL,
  `csp_status_from` int(11) NOT NULL,
  `csp_status_to` int(11) NOT NULL,
  PRIMARY KEY (`csp_perm_id`),
  KEY `fk_change_status_permission_2_idx` (`csp_status_from`),
  KEY `fk_change_status_permission_3_idx` (`csp_status_to`),
  CONSTRAINT `fk_change_status_permission_1` FOREIGN KEY (`csp_perm_id`) REFERENCES `permission` (`pe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_change_status_permission_2` FOREIGN KEY (`csp_status_from`) REFERENCES `task_status` (`ts_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_change_status_permission_3` FOREIGN KEY (`csp_status_to`) REFERENCES `task_status` (`ts_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_status_permission`
--

LOCK TABLES `change_status_permission` WRITE;
/*!40000 ALTER TABLE `change_status_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_status_permission` ENABLE KEYS */;
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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `co_id` int(11) NOT NULL,
  `co_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_logo` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `co_owner` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`co_id`),
  KEY `fk_company_1_idx` (`co_owner`),
  CONSTRAINT `fk_company_1` FOREIGN KEY (`co_owner`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logged_work`
--

DROP TABLE IF EXISTS `logged_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logged_work` (
  `lw_id` int(11) NOT NULL,
  `lw_hours_count` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lw_comment` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lw_log_time` datetime NOT NULL,
  `lw_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lw_task_id` int(11) NOT NULL,
  PRIMARY KEY (`lw_id`),
  KEY `fk_logged_work_1_idx` (`lw_username`),
  KEY `fk_logged_work_2_idx` (`lw_task_id`),
  CONSTRAINT `fk_logged_work_1` FOREIGN KEY (`lw_username`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_logged_work_2` FOREIGN KEY (`lw_task_id`) REFERENCES `task` (`ta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logged_work`
--

LOCK TABLES `logged_work` WRITE;
/*!40000 ALTER TABLE `logged_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `logged_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `pe_id` int(11) NOT NULL,
  `pe_project_id` int(11) NOT NULL,
  `pe_type` enum('asign_to_other','comment','attachmanet','change_status') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pe_id`),
  KEY `fk_permission_1_idx` (`pe_project_id`),
  CONSTRAINT `fk_permission_1` FOREIGN KEY (`pe_project_id`) REFERENCES `project` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
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
  `pr_company_id` int(11) NOT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `project_user_us_username_fk` (`pr_lead`),
  KEY `fk_project_1_idx` (`pr_company_id`),
  CONSTRAINT `fk_project_1` FOREIGN KEY (`pr_company_id`) REFERENCES `company` (`co_id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_user` (
  `pu_project_id` int(11) NOT NULL,
  `pu_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pu_project_id`,`pu_username`),
  KEY `fk_project_user_2` (`pu_username`),
  CONSTRAINT `fk_project_user_1` FOREIGN KEY (`pu_project_id`) REFERENCES `project` (`pr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_user_2` FOREIGN KEY (`pu_username`) REFERENCES `user` (`us_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ro_id` int(11) NOT NULL,
  `ro_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ro_project_id` int(11) NOT NULL,
  `ro_max_task_number` int(3) NOT NULL,
  PRIMARY KEY (`ro_id`),
  KEY `fk_role_1_idx` (`ro_project_id`),
  CONSTRAINT `fk_role_1` FOREIGN KEY (`ro_project_id`) REFERENCES `project` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `rp_role_id` int(11) NOT NULL,
  `rp_permission_id` int(11) NOT NULL,
  PRIMARY KEY (`rp_role_id`,`rp_permission_id`),
  KEY `fk_role_permission_2_idx` (`rp_permission_id`),
  CONSTRAINT `fk_role_permission_1` FOREIGN KEY (`rp_role_id`) REFERENCES `role` (`ro_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_permission_2` FOREIGN KEY (`rp_permission_id`) REFERENCES `permission` (`pe_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `ru_username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ru_role_id` int(11) NOT NULL,
  PRIMARY KEY (`ru_username`,`ru_role_id`),
  KEY `fk_role_user_2_idx` (`ru_role_id`),
  CONSTRAINT `fk_role_user_1` FOREIGN KEY (`ru_username`) REFERENCES `user` (`us_username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_user_2` FOREIGN KEY (`ru_role_id`) REFERENCES `role` (`ro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
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
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `lb_id` int(11) NOT NULL,
  `lb_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lb_color` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lb_project_id` int(11) NOT NULL,
  PRIMARY KEY (`lb_id`),
  KEY `fk_tag_1_idx` (`lb_project_id`),
  CONSTRAINT `fk_tag_1` FOREIGN KEY (`lb_project_id`) REFERENCES `project` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_task`
--

DROP TABLE IF EXISTS `tag_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_task` (
  `tt_tag_id` int(11) NOT NULL,
  `tt_task_id` int(11) NOT NULL,
  PRIMARY KEY (`tt_tag_id`,`tt_task_id`),
  KEY `fk_tag_task_2_idx` (`tt_task_id`),
  CONSTRAINT `fk_tag_task_1` FOREIGN KEY (`tt_tag_id`) REFERENCES `tag` (`lb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tag_task_2` FOREIGN KEY (`tt_task_id`) REFERENCES `task` (`ta_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_task`
--

LOCK TABLES `tag_task` WRITE;
/*!40000 ALTER TABLE `tag_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_task` ENABLE KEYS */;
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
  `us_create_project` tinyint(4) NOT NULL,
  `us_company_id` int(11) NOT NULL,
  PRIMARY KEY (`us_username`),
  UNIQUE KEY `user_us_email_uindex` (`us_email`),
  KEY `fk_user_1_idx` (`us_company_id`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`us_company_id`) REFERENCES `company` (`co_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

-- Dump completed on 2017-04-05 21:24:14
