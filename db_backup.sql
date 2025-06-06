-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: test_django
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance_attendancerecord`
--

DROP TABLE IF EXISTS `attendance_attendancerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_attendancerecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `in_1` time(6) DEFAULT NULL,
  `out_1` time(6) DEFAULT NULL,
  `in_2` time(6) DEFAULT NULL,
  `out_2` time(6) DEFAULT NULL,
  `in_3` time(6) DEFAULT NULL,
  `out_3` time(6) DEFAULT NULL,
  `in_4` time(6) DEFAULT NULL,
  `out_4` time(6) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attendance_attendancerecord_employee_id_date_ad4160fa_uniq` (`employee_id`,`date`),
  CONSTRAINT `attendance_attendanc_employee_id_e7066fe9_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_attendancerecord`
--

LOCK TABLES `attendance_attendancerecord` WRITE;
/*!40000 ALTER TABLE `attendance_attendancerecord` DISABLE KEYS */;
INSERT INTO `attendance_attendancerecord` VALUES (1,'2025-04-25','17:12:20.021033','17:12:20.267943','17:12:20.452717','17:12:20.620511','17:12:20.873344',NULL,NULL,NULL,1),(13,'2025-04-29','17:40:31.287375',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `attendance_attendancerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add department',6,'add_department'),(22,'Can change department',6,'change_department'),(23,'Can delete department',6,'delete_department'),(24,'Can view department',6,'view_department'),(25,'Can add user',7,'add_customuser'),(26,'Can change user',7,'change_customuser'),(27,'Can delete user',7,'delete_customuser'),(28,'Can view user',7,'view_customuser'),(29,'Can add employee',8,'add_employee'),(30,'Can change employee',8,'change_employee'),(31,'Can delete employee',8,'delete_employee'),(32,'Can view employee',8,'view_employee'),(33,'Can add attendance record',9,'add_attendancerecord'),(34,'Can change attendance record',9,'change_attendancerecord'),(35,'Can delete attendance record',9,'delete_attendancerecord'),(36,'Can view attendance record',9,'view_attendancerecord'),(37,'Can add department',10,'add_department'),(38,'Can change department',10,'change_department'),(39,'Can delete department',10,'delete_department'),(40,'Can view department',10,'view_department'),(41,'Can add employee',11,'add_employee'),(42,'Can change employee',11,'change_employee'),(43,'Can delete employee',11,'delete_employee'),(44,'Can view employee',11,'view_employee'),(45,'Can add production plan',12,'add_productionplan'),(46,'Can change production plan',12,'change_productionplan'),(47,'Can delete production plan',12,'delete_productionplan'),(48,'Can view production plan',12,'view_productionplan'),(49,'Can add department',13,'add_department'),(50,'Can change department',13,'change_department'),(51,'Can delete department',13,'delete_department'),(52,'Can view department',13,'view_department'),(53,'Can add maintenance report',14,'add_maintenancereport'),(54,'Can change maintenance report',14,'change_maintenancereport'),(55,'Can delete maintenance report',14,'delete_maintenancereport'),(56,'Can view maintenance report',14,'view_maintenancereport'),(57,'Can add machine',15,'add_machine'),(58,'Can change machine',15,'change_machine'),(59,'Can delete machine',15,'delete_machine'),(60,'Can view machine',15,'view_machine'),(61,'Can add mechanic',16,'add_mechanic'),(62,'Can change mechanic',16,'change_mechanic'),(63,'Can delete mechanic',16,'delete_mechanic'),(64,'Can view mechanic',16,'view_mechanic');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_employees_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_employees_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `employees_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'attendance','attendancerecord'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'employees','customuser'),(6,'employees','department'),(8,'employees','employee'),(13,'maintenance','department'),(15,'maintenance','machine'),(14,'maintenance','maintenancereport'),(16,'maintenance','mechanic'),(10,'production','department'),(11,'production','employee'),(12,'production','productionplan'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-25 13:20:10.295123'),(2,'contenttypes','0002_remove_content_type_name','2025-04-25 13:20:10.324945'),(3,'auth','0001_initial','2025-04-25 13:20:10.444556'),(4,'auth','0002_alter_permission_name_max_length','2025-04-25 13:20:10.468901'),(5,'auth','0003_alter_user_email_max_length','2025-04-25 13:20:10.472921'),(6,'auth','0004_alter_user_username_opts','2025-04-25 13:20:10.479091'),(7,'auth','0005_alter_user_last_login_null','2025-04-25 13:20:10.479091'),(8,'auth','0006_require_contenttypes_0002','2025-04-25 13:20:10.479091'),(9,'auth','0007_alter_validators_add_error_messages','2025-04-25 13:20:10.489175'),(10,'auth','0008_alter_user_username_max_length','2025-04-25 13:20:10.489175'),(11,'auth','0009_alter_user_last_name_max_length','2025-04-25 13:20:10.499410'),(12,'auth','0010_alter_group_name_max_length','2025-04-25 13:20:10.512924'),(13,'auth','0011_update_proxy_permissions','2025-04-25 13:20:10.517568'),(14,'auth','0012_alter_user_first_name_max_length','2025-04-25 13:20:10.520705'),(15,'employees','0001_initial','2025-04-25 13:20:10.706858'),(16,'admin','0001_initial','2025-04-25 13:20:10.764237'),(17,'admin','0002_logentry_remove_auto_add','2025-04-25 13:20:10.773884'),(18,'admin','0003_logentry_add_action_flag_choices','2025-04-25 13:20:10.778892'),(19,'attendance','0001_initial','2025-04-25 13:20:10.792905'),(20,'attendance','0002_initial','2025-04-25 13:20:10.826764'),(21,'employees','0002_remove_employee_department_remove_employee_position','2025-04-25 13:20:11.119651'),(22,'production','0001_initial','2025-04-25 13:20:11.221288'),(23,'sessions','0001_initial','2025-04-25 13:20:11.244725'),(24,'employees','0003_alter_employee_contact_alter_employee_employee_id','2025-04-28 09:01:13.807373'),(25,'employees','0004_alter_employee_name','2025-04-28 09:04:15.038940'),(27,'maintenance','0001_initial','2025-04-28 11:57:10.822690');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0sanmmdcfkfrolcibxghb7oo55rypfz4','.eJxVjMsOwiAQRf-FtSEwDENx6d5vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiZ2ZZKffLfj4yG0H6e7brfPY27rMge8KP-jg157y83K4fwfVj_qtETQVY7Ui0AiBFGmjMhDIgjBBslFZFKhhsjEYEoZs0FJ5tCWJQMTeH40CNdo:1u9o7t:qFL2YmZAlPjTuITGRzX_Q-aiHThaRnaI6-VsCsNba68','2025-05-13 16:48:09.594393'),('9rfj7lj2x8cmlu11xwiwyrw7dvg85i9p','.eJxVjMsOwiAQRf-FtSEwDENx6d5vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiZ2ZZKffLfj4yG0H6e7brfPY27rMge8KP-jg157y83K4fwfVj_qtETQVY7Ui0AiBFGmjMhDIgjBBslFZFKhhsjEYEoZs0FJ5tCWJQMTeH40CNdo:1u9l5l:mkBhF-G0gAyrtscGy1tBguWaipwN8fYeH8hSv_gCWww','2025-05-13 13:33:45.330191'),('b33m7c1v96z0wtr844nitcf7k652d364','.eJxVjMsOwiAQRf-FtSEwDENx6d5vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiZ2ZZKffLfj4yG0H6e7brfPY27rMge8KP-jg157y83K4fwfVj_qtETQVY7Ui0AiBFGmjMhDIgjBBslFZFKhhsjEYEoZs0FJ5tCWJQMTeH40CNdo:1uLzlx:UEbPxo6ElXH5rOFxvUGp38iZiPWLsv55HoImtrA_tss','2025-06-16 07:39:53.558329');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_customuser`
--

DROP TABLE IF EXISTS `employees_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_customuser`
--

LOCK TABLES `employees_customuser` WRITE;
/*!40000 ALTER TABLE `employees_customuser` DISABLE KEYS */;
INSERT INTO `employees_customuser` VALUES (1,'pbkdf2_sha256$1000000$C3uv5aly3qZHYeWiwHbWYR$/zLH0kJ+u0TOOdfRw4MV4rRqzEwPOoucWtgMiCI+Hp4=','2025-06-02 07:39:53.553934',1,'admin','','','',1,1,'2025-04-25 13:21:36.564507',0);
/*!40000 ALTER TABLE `employees_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_customuser_groups`
--

DROP TABLE IF EXISTS `employees_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_customuser_groups_customuser_id_group_id_c8ad628f_uniq` (`customuser_id`,`group_id`),
  KEY `employees_customuser_groups_group_id_79a904d2_fk_auth_group_id` (`group_id`),
  CONSTRAINT `employees_customuser_customuser_id_351006dc_fk_employees` FOREIGN KEY (`customuser_id`) REFERENCES `employees_customuser` (`id`),
  CONSTRAINT `employees_customuser_groups_group_id_79a904d2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_customuser_groups`
--

LOCK TABLES `employees_customuser_groups` WRITE;
/*!40000 ALTER TABLE `employees_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_customuser_user_permissions`
--

DROP TABLE IF EXISTS `employees_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_customuser_use_customuser_id_permission_48fb991e_uniq` (`customuser_id`,`permission_id`),
  KEY `employees_customuser_permission_id_4a182de6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `employees_customuser_customuser_id_ee550a71_fk_employees` FOREIGN KEY (`customuser_id`) REFERENCES `employees_customuser` (`id`),
  CONSTRAINT `employees_customuser_permission_id_4a182de6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_customuser_user_permissions`
--

LOCK TABLES `employees_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `employees_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_department`
--

DROP TABLE IF EXISTS `employees_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_department`
--

LOCK TABLES `employees_department` WRITE;
/*!40000 ALTER TABLE `employees_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_employee`
--

DROP TABLE IF EXISTS `employees_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `qr_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee`
--

LOCK TABLES `employees_employee` WRITE;
/*!40000 ALTER TABLE `employees_employee` DISABLE KEYS */;
INSERT INTO `employees_employee` VALUES (1,'1','Mayur','258','qrcodes/qr_1.png'),(12,'1001','Sidhu','1234567890','qrcodes/qr_1001.png'),(13,'1002','Koki','1234567890','qrcodes/qr_1002.png'),(14,'1004','Gergana','1234567890','qrcodes/qr_1004.png'),(15,'1005','Mandeep','1234567890','qrcodes/qr_1005.png'),(16,'1006','Abu','1234567890','qrcodes/qr_1006.png'),(17,'1007','Yulina','1234567890','qrcodes/qr_1007.png'),(18,'1008','Georgi','1234567890','qrcodes/qr_1008.png'),(19,'1009','Shirin','1234567890','qrcodes/qr_1009.png'),(20,'1010','Zarkov','1234567890','qrcodes/qr_1010.png'),(21,'1011','Ikiea','1234567890','qrcodes/qr_1011.png'),(22,'1012','Donka','1234567890','qrcodes/qr_1012.png'),(23,'1013','Mitko','1234567890','qrcodes/qr_1013.png'),(24,'1015','Dimiter','1234567890','qrcodes/qr_1015.png'),(25,'1021','Vesli','1234567890','qrcodes/qr_1021.png'),(26,'22','Fanivesli','1234567890','qrcodes/qr_22.png'),(27,'23','Fanka','1234567890','qrcodes/qr_23.png'),(28,'24','Milena','1234567890','qrcodes/qr_24.png'),(29,'25','Daria','1234567890','qrcodes/qr_25.png'),(30,'26','Naeem','1234567890','qrcodes/qr_26.png'),(31,'27','Rayna','1234567890','qrcodes/qr_27.png'),(32,'28','Rayna','1234567890','qrcodes/qr_28.png'),(33,'29','Aatur','1234567890','qrcodes/qr_29.png'),(34,'30','Bozena','1234567890','qrcodes/qr_30.png'),(35,'31','Martin','1234567890','qrcodes/qr_31.png'),(36,'32','Patrek','1234567890','qrcodes/qr_32.png'),(37,'33','Johana','1234567890','qrcodes/qr_33.png'),(38,'34','Dani','1234567890','qrcodes/qr_34.png'),(39,'35','Milen','1234567890','qrcodes/qr_35.png'),(40,'36','vasil','1234567890','qrcodes/qr_36.png'),(41,'37','Aman','1234567890','qrcodes/qr_37.png'),(42,'38','jail','1234567890','qrcodes/qr_38.png'),(43,'39','Paviter','1234567890','qrcodes/qr_39.png'),(44,'40','rambo','1234567890','qrcodes/qr_40.png'),(45,'41','Bahitsen','1234567890','qrcodes/qr_41.png'),(46,'42','Ilia','1234567890','qrcodes/qr_42.png'),(47,'43','Harjinder','1234567890','qrcodes/qr_43.png'),(48,'44','Simratpal','1234567890','qrcodes/qr_44.png'),(49,'45','Donewa Gergana','1234567890','qrcodes/qr_45.png'),(50,'46','Iikay','1234567890','qrcodes/qr_46.png'),(51,'47','Pablo','1234567890','qrcodes/qr_47.png'),(52,'48','Gelan','1234567890','qrcodes/qr_48.png'),(53,'49','Kuka','1234567890','qrcodes/qr_49.png'),(54,'50','salim','1234567890','qrcodes/qr_50.png'),(55,'51','Reddy','1234567890','qrcodes/qr_51.png'),(56,'52','Mariyka','1234567890','qrcodes/qr_52.png'),(57,'53','Vanesa','1234567890','qrcodes/qr_53.png'),(58,'54','Sashko','1234567890','qrcodes/qr_54.png'),(59,'55','Sashko','1234567890','qrcodes/qr_55.png'),(60,'57','Dancho','1234567890','qrcodes/qr_57.png'),(61,'58','Kamil','1234567890','qrcodes/qr_58.png'),(62,'59','Filipov','1234567890','qrcodes/qr_59.png'),(63,'60','Yorden','1234567890','qrcodes/qr_60.png'),(64,'61','kalinka','1234567890','qrcodes/qr_61.png'),(65,'62','Patrycia','1234567890','qrcodes/qr_62.png'),(66,'63','Karsi','1234567890','qrcodes/qr_63.png'),(67,'64','Gosho','1234567890','qrcodes/qr_64.png'),(68,'70','Milka','1234567890','qrcodes/qr_70.png'),(69,'71','Manjit','1234567890','qrcodes/qr_71.png'),(70,'72','Gurpreet','1234567890','qrcodes/qr_72.png'),(71,'73','Sukhchain singh','1234567890','qrcodes/qr_73.png'),(72,'74','Muayad','1234567890','qrcodes/qr_74.png'),(73,'75','Prempal singh','1234567890','qrcodes/qr_75.png'),(74,'76','Balvinder singh','1234567890','qrcodes/qr_76.png'),(75,'77','Umutcan','1234567890','qrcodes/qr_77.png');
/*!40000 ALTER TABLE `employees_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_department`
--

DROP TABLE IF EXISTS `maintenance_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_department`
--

LOCK TABLES `maintenance_department` WRITE;
/*!40000 ALTER TABLE `maintenance_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_machine`
--

DROP TABLE IF EXISTS `maintenance_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_machine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_machine_department_id_68c7e63b_fk_maintenan` (`department_id`),
  CONSTRAINT `maintenance_machine_department_id_68c7e63b_fk_maintenan` FOREIGN KEY (`department_id`) REFERENCES `maintenance_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_machine`
--

LOCK TABLES `maintenance_machine` WRITE;
/*!40000 ALTER TABLE `maintenance_machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_maintenancereport`
--

DROP TABLE IF EXISTS `maintenance_maintenancereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_maintenancereport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `note` longtext NOT NULL,
  `date` date NOT NULL,
  `language` varchar(2) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `machine_id` bigint(20) NOT NULL,
  `mechanic_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_maintena_department_id_0692c824_fk_maintenan` (`department_id`),
  KEY `maintenance_maintena_machine_id_5af464e9_fk_maintenan` (`machine_id`),
  KEY `maintenance_maintena_mechanic_id_55f31b92_fk_maintenan` (`mechanic_id`),
  CONSTRAINT `maintenance_maintena_department_id_0692c824_fk_maintenan` FOREIGN KEY (`department_id`) REFERENCES `maintenance_department` (`id`),
  CONSTRAINT `maintenance_maintena_machine_id_5af464e9_fk_maintenan` FOREIGN KEY (`machine_id`) REFERENCES `maintenance_machine` (`id`),
  CONSTRAINT `maintenance_maintena_mechanic_id_55f31b92_fk_maintenan` FOREIGN KEY (`mechanic_id`) REFERENCES `maintenance_mechanic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_maintenancereport`
--

LOCK TABLES `maintenance_maintenancereport` WRITE;
/*!40000 ALTER TABLE `maintenance_maintenancereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_maintenancereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_mechanic`
--

DROP TABLE IF EXISTS `maintenance_mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_mechanic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_mechanic`
--

LOCK TABLES `maintenance_mechanic` WRITE;
/*!40000 ALTER TABLE `maintenance_mechanic` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_department`
--

DROP TABLE IF EXISTS `production_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_department`
--

LOCK TABLES `production_department` WRITE;
/*!40000 ALTER TABLE `production_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `production_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_employee`
--

DROP TABLE IF EXISTS `production_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_employee_department_id_7576e2e6_fk_productio` (`department_id`),
  CONSTRAINT `production_employee_department_id_7576e2e6_fk_productio` FOREIGN KEY (`department_id`) REFERENCES `production_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_employee`
--

LOCK TABLES `production_employee` WRITE;
/*!40000 ALTER TABLE `production_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `production_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_productionplan`
--

DROP TABLE IF EXISTS `production_productionplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_productionplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `production_productionpla_date_department_id_emplo_0a1bde00_uniq` (`date`,`department_id`,`employee_id`),
  KEY `production_productio_department_id_9d2991d2_fk_productio` (`department_id`),
  KEY `production_productio_employee_id_ec4aa6af_fk_productio` (`employee_id`),
  CONSTRAINT `production_productio_department_id_9d2991d2_fk_productio` FOREIGN KEY (`department_id`) REFERENCES `production_department` (`id`),
  CONSTRAINT `production_productio_employee_id_ec4aa6af_fk_productio` FOREIGN KEY (`employee_id`) REFERENCES `production_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_productionplan`
--

LOCK TABLES `production_productionplan` WRITE;
/*!40000 ALTER TABLE `production_productionplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `production_productionplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 12:45:38
