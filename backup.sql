-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: agendadb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Persona',7,'add_person'),(26,'Can change Persona',7,'change_person'),(27,'Can delete Persona',7,'delete_person'),(28,'Can view Persona',7,'view_person'),(29,'Can add Hobby',8,'add_hobby'),(30,'Can change Hobby',8,'change_hobby'),(31,'Can delete Hobby',8,'delete_hobby'),(32,'Can view Hobby',8,'view_hobby'),(33,'Can add Reunion',9,'add_reunion'),(34,'Can change Reunion',9,'change_reunion'),(35,'Can delete Reunion',9,'delete_reunion'),(36,'Can view Reunion',9,'view_reunion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$Lbx7Lvs1amavQliOxYSbxt$UD33bftKS0a+RsJIVx8zrLD5TyiONuaCKg0ePlkXxZA=','2025-01-09 22:54:11.186660',1,'David','','','prueba@gmail.com',1,1,'2024-07-04 02:32:49.943832');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-07-04 02:51:31.931850','1','Joaqui',1,'[{\"added\": {}}]',7,1),(2,'2024-07-04 02:52:01.636461','1','Joaquin Leyba',2,'[{\"changed\": {\"fields\": [\"Nombres\", \"Trabajo\", \"Email\", \"Telefono\"]}}]',7,1),(3,'2024-07-04 04:14:53.531095','2','Ferrnanada Ferreira',1,'[{\"added\": {}}]',7,1),(4,'2024-07-04 04:15:36.833306','3','Aidee Ramirez',1,'[{\"added\": {}}]',7,1),(5,'2024-07-04 04:16:13.156958','4','Genaro Coria',1,'[{\"added\": {}}]',7,1),(6,'2024-07-11 21:00:36.218297','1','Futbol',1,'[{\"added\": {}}]',8,1),(7,'2024-07-11 21:00:40.802308','2','Videojuegos',1,'[{\"added\": {}}]',8,1),(8,'2024-07-11 21:00:44.017831','3','Leer',1,'[{\"added\": {}}]',8,1),(9,'2024-07-11 21:00:49.226376','4','Cocinar',1,'[{\"added\": {}}]',8,1),(10,'2024-07-11 21:00:55.465938','5','Estudiar',1,'[{\"added\": {}}]',8,1),(11,'2024-07-11 21:01:09.096631','6','Ejercicio',1,'[{\"added\": {}}]',8,1),(12,'2024-07-11 21:01:30.005658','4','Genaro Coria',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(13,'2024-07-11 21:01:34.355967','3','Aidee Ramirez',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(14,'2024-07-11 21:01:37.763195','2','Ferrnanada Ferreira',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(15,'2024-07-11 21:01:43.276357','1','Joaquin Leyba',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(16,'2024-07-11 21:02:22.342099','1','Plan de estudios',1,'[{\"added\": {}}]',9,1),(17,'2024-07-11 21:02:37.798241','2','Hacer ejercicio',1,'[{\"added\": {}}]',9,1),(18,'2024-07-11 21:03:07.135050','3','Estudiar para el Examen',1,'[{\"added\": {}}]',9,1),(19,'2024-07-11 21:03:20.018124','1','Plan de estudios',2,'[{\"changed\": {\"fields\": [\"Persona\"]}}]',9,1),(20,'2024-07-11 21:03:38.436471','4','salir a correr',1,'[{\"added\": {}}]',9,1),(21,'2024-07-12 07:36:59.401573','4','Genaro Coria',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(22,'2024-07-12 07:37:06.839106','3','Aidee Ramirez',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(23,'2024-07-12 07:37:14.700651','2','Ferrnanada Ferreira',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(24,'2024-07-12 07:37:22.684726','1','Joaquin Leyba',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(25,'2024-08-06 23:17:45.445728','4','salir a correr',2,'[]',9,1),(26,'2024-08-06 23:51:43.395715','5','Cesar',1,'[{\"added\": {}}]',7,1),(27,'2024-08-06 23:51:57.190675','5','Cesar Hernandez',2,'[{\"changed\": {\"fields\": [\"Nombres\"]}}]',7,1),(28,'2024-08-06 23:52:40.938727','6','Alejandro Gomez',1,'[{\"added\": {}}]',7,1),(29,'2025-01-09 22:55:15.012331','6','Alejandro Gomez',2,'[{\"changed\": {\"fields\": [\"Hobbies\"]}}]',7,1),(30,'2025-01-16 07:21:26.886085','2','Ferrnanda Ferreira',2,'[{\"changed\": {\"fields\": [\"Nombres\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'persona','hobby'),(7,'persona','person'),(9,'persona','reunion'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-07-04 02:22:34.704480'),(2,'auth','0001_initial','2024-07-04 02:22:40.907192'),(3,'admin','0001_initial','2024-07-04 02:22:41.668463'),(4,'admin','0002_logentry_remove_auto_add','2024-07-04 02:22:41.715678'),(5,'admin','0003_logentry_add_action_flag_choices','2024-07-04 02:22:41.778171'),(6,'contenttypes','0002_remove_content_type_name','2024-07-04 02:22:42.091814'),(7,'auth','0002_alter_permission_name_max_length','2024-07-04 02:22:42.468511'),(8,'auth','0003_alter_user_email_max_length','2024-07-04 02:22:42.593876'),(9,'auth','0004_alter_user_username_opts','2024-07-04 02:22:42.641145'),(10,'auth','0005_alter_user_last_login_null','2024-07-04 02:22:42.891920'),(11,'auth','0006_require_contenttypes_0002','2024-07-04 02:22:42.939217'),(12,'auth','0007_alter_validators_add_error_messages','2024-07-04 02:22:43.001705'),(13,'auth','0008_alter_user_username_max_length','2024-07-04 02:22:43.283586'),(14,'auth','0009_alter_user_last_name_max_length','2024-07-04 02:22:43.613275'),(15,'auth','0010_alter_group_name_max_length','2024-07-04 02:22:43.707016'),(16,'auth','0011_update_proxy_permissions','2024-07-04 02:22:43.754327'),(17,'auth','0012_alter_user_first_name_max_length','2024-07-04 02:22:44.021158'),(18,'persona','0001_initial','2024-07-04 02:22:44.350455'),(19,'persona','0002_alter_person_id','2024-07-04 02:22:44.585596'),(20,'sessions','0001_initial','2024-07-04 02:22:45.087007'),(21,'persona','0003_hobby_reunion_person_hobbies','2024-07-11 20:59:14.232993'),(22,'persona','0004_alter_reunion_fecha','2024-08-06 23:17:29.335207');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3vstx8qka0esu1buc8sxhmjgi9tagzvi','.eJxVjE0OwiAYBe_C2pBIKRSX7j0D-f6QqoGktCvj3aVJF7p9M_PeKsK25rg1WeLM6qLO6vS7IdBTyg74AeVeNdWyLjPqXdEHbfpWWV7Xw_07yNByr10Qb9mKc6M4QWYSGnEKjgKwJErsrUsJULxgJ4aAjQm2K8PkB1KfLy9rOdk:1sPCKu:hDoCL6yIoo6azklpdbmgmx1aJghx5QqJH7ep4ZLdEVI','2024-07-18 02:36:40.152251'),('9odsnw2o8g330ndvq1up86elskuowtdn','.eJxVjE0OwiAYBe_C2pBIKRSX7j0D-f6QqoGktCvj3aVJF7p9M_PeKsK25rg1WeLM6qLO6vS7IdBTyg74AeVeNdWyLjPqXdEHbfpWWV7Xw_07yNByr10Qb9mKc6M4QWYSGnEKjgKwJErsrUsJULxgJ4aAjQm2K8PkB1KfLy9rOdk:1tW1Pn:Qg6bQ2CJZWZjCd_v9XwlQsYTCHRefuPcn7_iI5JjAw8','2025-01-23 22:54:11.259346'),('bptaodhflannch8rlpbrt0jhtxxmdvxu','.eJxVjE0OwiAYBe_C2pBIKRSX7j0D-f6QqoGktCvj3aVJF7p9M_PeKsK25rg1WeLM6qLO6vS7IdBTyg74AeVeNdWyLjPqXdEHbfpWWV7Xw_07yNByr10Qb9mKc6M4QWYSGnEKjgKwJErsrUsJULxgJ4aAjQm2K8PkB1KfLy9rOdk:1sbTKt:7OZldyTzHxsGROBZlU22CGRaqwWnGq1VKgwTAW26ZdM','2024-08-20 23:11:23.883670');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_hobby`
--

DROP TABLE IF EXISTS `persona_hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_hobby` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `hobby` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_hobby`
--

LOCK TABLES `persona_hobby` WRITE;
/*!40000 ALTER TABLE `persona_hobby` DISABLE KEYS */;
INSERT INTO `persona_hobby` VALUES (1,'2024-07-11 21:00:36.216299','2024-07-11 21:00:36.216299','Futbol'),(2,'2024-07-11 21:00:40.801312','2024-07-11 21:00:40.801312','Videojuegos'),(3,'2024-07-11 21:00:44.015837','2024-07-11 21:00:44.015837','Leer'),(4,'2024-07-11 21:00:49.225380','2024-07-11 21:00:49.225380','Cocinar'),(5,'2024-07-11 21:00:55.464941','2024-07-11 21:00:55.464941','Estudiar'),(6,'2024-07-11 21:01:09.095631','2024-07-11 21:01:09.095631','Ejercicio');
/*!40000 ALTER TABLE `persona_hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_person`
--

DROP TABLE IF EXISTS `persona_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_person` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `job` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_person`
--

LOCK TABLES `persona_person` WRITE;
/*!40000 ALTER TABLE `persona_person` DISABLE KEYS */;
INSERT INTO `persona_person` VALUES (1,'2024-07-04 02:51:31.928837','2024-07-12 07:37:22.682763','Joaquin Leyba','Programador','joaquin@gmail.com','5563636363'),(2,'2024-07-04 04:14:53.526603','2025-01-16 07:21:26.882552','Ferrnanda Ferreira','Contador','Fernanda@gmail.com','5587295612'),(3,'2024-07-04 04:15:36.831309','2024-07-12 07:37:06.834782','Aidee Ramirez','Actuaria','aidee@gmail.com','5547484946'),(4,'2024-07-04 04:16:13.154955','2024-07-12 07:36:59.317970','Genaro Coria','Matematico','genadrio@gmail.com','5512131415'),(5,'2024-08-06 23:51:43.340908','2024-08-06 23:51:57.188773','Cesar Hernandez','Actor','Cesar@gmail.com','5567676767'),(6,'2024-08-06 23:52:40.933755','2025-01-09 22:55:14.697790','Alejandro Gomez','Maestro','Ale@gmail.com','5532323232');
/*!40000 ALTER TABLE `persona_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_person_hobbies`
--

DROP TABLE IF EXISTS `persona_person_hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_person_hobbies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `person_id` bigint NOT NULL,
  `hobby_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_person_hobbies_person_id_hobby_id_13291a2b_uniq` (`person_id`,`hobby_id`),
  KEY `persona_person_hobbies_hobby_id_61185604_fk_persona_hobby_id` (`hobby_id`),
  CONSTRAINT `persona_person_hobbies_hobby_id_61185604_fk_persona_hobby_id` FOREIGN KEY (`hobby_id`) REFERENCES `persona_hobby` (`id`),
  CONSTRAINT `persona_person_hobbies_person_id_35ebc5e5_fk_persona_person_id` FOREIGN KEY (`person_id`) REFERENCES `persona_person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_person_hobbies`
--

LOCK TABLES `persona_person_hobbies` WRITE;
/*!40000 ALTER TABLE `persona_person_hobbies` DISABLE KEYS */;
INSERT INTO `persona_person_hobbies` VALUES (4,1,2),(11,1,6),(9,2,1),(10,2,5),(3,2,6),(2,3,3),(7,3,4),(8,3,6),(5,4,2),(1,4,5),(6,4,6),(12,5,3),(14,6,4),(13,6,5);
/*!40000 ALTER TABLE `persona_person_hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_reunion`
--

DROP TABLE IF EXISTS `persona_reunion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_reunion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `fecha` date NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `persona_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_reunion_persona_id_b9f91fa8_fk_persona_person_id` (`persona_id`),
  CONSTRAINT `persona_reunion_persona_id_b9f91fa8_fk_persona_person_id` FOREIGN KEY (`persona_id`) REFERENCES `persona_person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_reunion`
--

LOCK TABLES `persona_reunion` WRITE;
/*!40000 ALTER TABLE `persona_reunion` DISABLE KEYS */;
INSERT INTO `persona_reunion` VALUES (1,'2024-07-11 21:02:22.241909','2024-07-11 21:03:20.016129','2024-08-06','Plan de estudios',4),(2,'2024-07-11 21:02:37.793251','2024-07-11 21:02:37.793251','2024-08-06','Hacer ejercicio',2),(3,'2024-07-11 21:03:07.132022','2024-07-11 21:03:07.132022','2024-08-06','Estudiar para el Examen',3),(4,'2024-07-11 21:03:38.432453','2024-08-06 23:17:45.438721','2024-08-06','salir a correr',1);
/*!40000 ALTER TABLE `persona_reunion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-16  1:46:05
