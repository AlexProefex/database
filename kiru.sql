-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: kiru
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1

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
-- Table structure for table `agreements`
--

DROP TABLE IF EXISTS `agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreements`
--

LOCK TABLES `agreements` WRITE;
/*!40000 ALTER TABLE `agreements` DISABLE KEYS */;
/*!40000 ALTER TABLE `agreements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2020-05-05 02:26:11','2020-05-05 02:26:11'),(2,NULL,1,'Category 2','category-2','2020-05-05 02:26:11','2020-05-05 02:26:11');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_histories`
--

DROP TABLE IF EXISTS `clinic_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_histories`
--

LOCK TABLES `clinic_histories` WRITE;
/*!40000 ALTER TABLE `clinic_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulting_room`
--

DROP TABLE IF EXISTS `consulting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulting_room` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_charge_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_charge_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulting_room`
--

LOCK TABLES `consulting_room` WRITE;
/*!40000 ALTER TABLE `consulting_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulting_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Nombre',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Correo Electrónico',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Contraseña',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Token de Recuerdo',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Creado',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Actualizado',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Rol',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'locale','text','Locale',0,1,1,1,1,0,NULL,12),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(14,2,'name','text','Nombre',1,1,1,1,1,1,NULL,2),(15,2,'created_at','timestamp','Creado',0,0,0,0,0,0,NULL,3),(16,2,'updated_at','timestamp','Actualizado',0,0,0,0,0,0,NULL,4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','Nombre',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','Creado',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','Actualizado',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','Nombre a Mostrar',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','Rol',1,1,1,1,1,1,NULL,9),(23,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(24,4,'parent_id','select_dropdown','Padre',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(25,4,'order','text','Orden',1,1,1,1,1,1,'{\"default\":1}',3),(26,4,'name','text','Nombre',1,1,1,1,1,1,NULL,4),(27,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(28,4,'created_at','timestamp','Creado',0,0,1,0,0,0,NULL,6),(29,4,'updated_at','timestamp','Actualizado',0,0,0,0,0,0,NULL,7),(30,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(31,5,'author_id','text','Autor',1,0,1,1,0,1,NULL,2),(32,5,'category_id','text','Categoría',1,0,1,1,1,0,NULL,3),(33,5,'title','text','Título',1,1,1,1,1,1,NULL,4),(34,5,'excerpt','text_area','Extracto',1,0,1,1,1,1,NULL,5),(35,5,'body','rich_text_box','Cuerpo',1,0,1,1,1,1,NULL,6),(36,5,'image','image','Imagen del Post',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(37,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(38,5,'meta_description','text_area','Meta Descripción',1,0,1,1,1,1,NULL,9),(39,5,'meta_keywords','text_area','Meta Palabras Clave',1,0,1,1,1,1,NULL,10),(40,5,'status','select_dropdown','Estatus',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(41,5,'created_at','timestamp','Creado',0,1,1,0,0,0,NULL,12),(42,5,'updated_at','timestamp','Actualizado',0,0,0,0,0,0,NULL,13),(43,5,'seo_title','text','Título SEO',0,1,1,1,1,1,NULL,14),(44,5,'featured','checkbox','Destacado',1,1,1,1,1,1,NULL,15),(45,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(46,6,'author_id','text','Autor',1,0,0,0,0,0,NULL,2),(47,6,'title','text','Título',1,1,1,1,1,1,NULL,3),(48,6,'excerpt','text_area','Extracto',1,0,1,1,1,1,NULL,4),(49,6,'body','rich_text_box','Cuerpo',1,0,1,1,1,1,NULL,5),(50,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(51,6,'meta_description','text','Meta Descripción',1,0,1,1,1,1,NULL,7),(52,6,'meta_keywords','text','Meta Palabras Clave',1,0,1,1,1,1,NULL,8),(53,6,'status','select_dropdown','Estatus',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(54,6,'created_at','timestamp','Creado',1,1,1,0,0,0,NULL,10),(55,6,'updated_at','timestamp','Actualizado',1,0,0,0,0,0,NULL,11),(56,6,'image','image','Imagen de la página',0,1,1,1,1,1,NULL,12),(57,7,'id','number','id',1,0,0,0,0,0,NULL,1),(58,7,'name','text','Nombres',1,1,1,1,1,1,NULL,4),(59,7,'last_name','text','Apellidos',1,1,1,1,1,1,NULL,4),(60,7,'document_number','text','Número de Documento',1,1,1,1,1,1,NULL,4),(61,7,'phone_number','text','seeders.data_rows.phone_number',1,0,1,1,1,1,NULL,4),(62,7,'email','text','Email',1,0,1,1,1,1,NULL,4),(63,7,'birthdate','text','Fecha de Nacimiento',1,0,1,1,1,1,NULL,4),(64,7,'speciality','text','Especialidad',1,0,1,1,1,1,NULL,4),(65,7,'in_charge_name','text','Nombre del tutor',0,0,1,1,1,1,NULL,4),(66,7,'state','text','Estado',0,1,1,1,1,1,NULL,4),(67,7,'odontograma','text','Odontograma',0,1,1,1,1,1,NULL,4),(68,7,'created_at','text','Creado',0,0,0,0,0,0,NULL,5),(69,7,'updated_at','text','Actualizado',0,0,0,0,0,0,NULL,5),(70,8,'id','number','id',1,0,0,0,0,0,NULL,1),(71,8,'company','text','Empresa',1,1,1,1,1,1,NULL,4),(72,8,'contact_name','text','Nombre del contacto',1,1,1,1,1,1,NULL,4),(73,8,'payment_method','text','Forma de Pago',1,1,1,1,1,1,NULL,4),(74,8,'created_at','text','Creado',0,0,0,0,0,0,NULL,5),(75,8,'updated_at','text','Actualizado',0,0,0,0,0,0,NULL,5),(76,9,'id','number','id',1,0,0,0,0,0,NULL,1),(77,9,'name','text','Nombres',1,1,1,1,1,1,NULL,4),(78,9,'company_name','text','Empresa',1,1,1,1,1,1,NULL,4),(79,9,'discount','text','Descuento',1,1,1,1,1,1,NULL,4),(80,9,'state','text','Estado',1,1,1,1,1,1,NULL,4),(81,9,'created_at','text','Creado',0,0,0,0,0,0,NULL,5),(82,9,'updated_at','text','Actualizado',0,0,0,0,0,0,NULL,5),(83,10,'id','number','id',1,0,0,0,0,0,NULL,1),(84,10,'name','text','Nombres',1,1,1,1,1,1,NULL,4),(85,10,'brand_name','text','Marca',1,1,1,1,1,1,NULL,4),(86,10,'quantity','text','Cantidad',1,1,1,1,1,1,NULL,4),(87,10,'unit','text','Unidad',1,1,1,1,1,1,NULL,4),(88,10,'consulting_room','text','Consultorio',1,1,1,1,1,1,NULL,4),(89,10,'created_at','text','Creado',0,0,0,0,0,0,NULL,5),(90,10,'updated_at','text','Actualizado',0,0,0,0,0,0,NULL,5),(91,11,'id','number','id',1,0,0,0,0,0,NULL,1),(92,11,'name','text','Nombres',1,1,1,1,1,1,NULL,4),(93,11,'in_charge_name','text','Nombre del tutor',1,1,1,1,1,1,NULL,4),(94,11,'in_charge_last_name','text','seeders.data_rows.in_charge_last_name',1,1,1,1,1,1,NULL,4),(95,11,'start_time','text','Hora de Inicio',1,1,1,1,1,1,NULL,4),(96,11,'end_time','text','Hora Fin',1,1,1,1,1,1,NULL,4),(97,11,'created_at','text','Creado',0,0,0,0,0,0,NULL,5),(98,11,'updated_at','text','Actualizado',0,0,0,0,0,0,NULL,5),(99,12,'id','number','ID',1,1,1,0,0,0,'{}',1),(100,12,'website_id','text','Website Id',1,1,1,0,0,0,'{}',2),(101,12,'fqdn','text','Domain name',1,1,1,1,1,1,'{\"description\":\"A Fully-qualified domain name. No protocol. Only domain name itself.\",\"validation\":{\"rule\":\"unique:hostnames,fqdn\"}}',3),(102,12,'redirect_to','text','Redirect To',0,0,0,0,0,0,'{}',4),(103,12,'force_https','text','Force Https',1,0,0,0,0,0,'{\"default\":\"0\",\"options\":[\"No\",\"Yes\"]}',5),(104,12,'under_maintenance_since','timestamp','Under Maintenance Since',0,0,0,0,0,0,'{}',6),(105,12,'created_at','timestamp','created_at',0,1,1,0,0,0,'{}',7),(106,12,'updated_at','timestamp','updated_at',0,1,1,0,0,0,'{}',8),(107,12,'deleted_at','timestamp','Deleted At',0,0,0,0,0,0,'{}',9);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','Usuario','Usuarios','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(2,'menus','menus','Menú','Menús','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(3,'roles','roles','Rol','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(4,'categories','categories','Categoría','Categorías','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(6,'pages','pages','Página','Páginas','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(7,'patients','patients','Paciente','Pacientes','voyager-news','App\\Patients','TCG\\Voyager\\Policies\\PostPolicy','','',1,1,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(8,'laboratories','laboratories','Laboratorio','Laboratorios','voyager-news','App\\Laboratories','TCG\\Voyager\\Policies\\PostPolicy','','',1,1,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(9,'agreements','agreements','Convenio','Convenios','voyager-news','App\\Agreements','TCG\\Voyager\\Policies\\PostPolicy','','',1,1,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(10,'product','product','Producto','Inventario','voyager-news','App\\Product','TCG\\Voyager\\Policies\\PostPolicy','','',1,1,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(11,'consulting_room','consulting_room','Consultorio','Consultorios','voyager-news','App\\ConsultingRoom','TCG\\Voyager\\Policies\\PostPolicy','','',1,1,NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(12,'hostnames','hostnames','Hostname','Hostnames','voyager-ship','App\\Hostname',NULL,'\\App\\Http\\Controllers\\VoyagerTenantsController','',1,0,'null','2020-05-05 02:26:17','2020-05-05 02:26:17');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_histories`
--

DROP TABLE IF EXISTS `detail_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clinic_history_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `consultory_room` int(11) NOT NULL,
  `treatment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_histories`
--

LOCK TABLES `detail_histories` WRITE;
/*!40000 ALTER TABLE `detail_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostnames`
--

DROP TABLE IF EXISTS `hostnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostnames` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fqdn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `force_https` tinyint(1) NOT NULL DEFAULT '0',
  `under_maintenance_since` timestamp NULL DEFAULT NULL,
  `website_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostnames_fqdn_unique` (`fqdn`),
  KEY `hostnames_website_id_foreign` (`website_id`),
  CONSTRAINT `hostnames_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostnames`
--

LOCK TABLES `hostnames` WRITE;
/*!40000 ALTER TABLE `hostnames` DISABLE KEYS */;
INSERT INTO `hostnames` VALUES (1,'admin.kirudent.com',NULL,0,NULL,NULL,'2020-05-05 02:26:06','2020-05-05 02:26:06',NULL),(29,'test.kirudent.com',NULL,0,NULL,28,'2020-11-16 06:49:26','2020-11-16 06:49:26',NULL),(31,'proefexperu.kirudent.com',NULL,0,NULL,30,'2020-11-18 14:55:53','2020-11-18 14:56:12',NULL),(32,'corioja.kirudent.com',NULL,0,NULL,31,'2020-11-23 14:35:36','2020-11-23 14:35:36',NULL),(33,'prueba4.kirudent.com',NULL,0,NULL,32,'2022-04-13 20:20:50','2022-04-13 20:20:50',NULL),(34,'otro.test',NULL,0,NULL,33,'2022-04-13 20:36:24','2022-04-13 20:36:24',NULL),(36,'test-01.kirudent.com',NULL,0,NULL,35,'2022-05-06 15:12:11','2022-05-06 15:12:11',NULL);
/*!40000 ALTER TABLE `hostnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratories`
--

DROP TABLE IF EXISTS `laboratories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratories`
--

LOCK TABLES `laboratories` WRITE;
/*!40000 ALTER TABLE `laboratories` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Tablero','','_self','voyager-boat',NULL,NULL,1,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.dashboard',NULL),(2,1,'Multimedia','','_self','voyager-images',NULL,NULL,5,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.media.index',NULL),(3,1,'Usuarios','','_self','voyager-person',NULL,NULL,3,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.roles.index',NULL),(5,1,'Herramientas','','_self','voyager-tools',NULL,NULL,9,'2020-05-05 02:26:10','2020-05-05 02:26:10',NULL,NULL),(6,1,'Diseñador de Menús','','_self','voyager-list',NULL,5,10,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.menus.index',NULL),(7,1,'Base de Datos','','_self','voyager-data',NULL,5,11,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.database.index',NULL),(8,1,'Compás','','_self','voyager-compass',NULL,5,12,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.bread.index',NULL),(10,1,'Parámetros','','_self','voyager-settings',NULL,NULL,14,'2020-05-05 02:26:10','2020-05-05 02:26:10','voyager.settings.index',NULL),(11,1,'Categorías','','_self','voyager-categories',NULL,NULL,8,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.categories.index',NULL),(12,1,'Posts','','_self','voyager-news',NULL,NULL,6,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.posts.index',NULL),(13,1,'Páginas','','_self','voyager-file-text',NULL,NULL,7,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.pages.index',NULL),(14,1,'Pacientes','','_self','voyager-categories',NULL,NULL,8,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.patients.index',NULL),(15,1,'Laboratorios','','_self','voyager-categories',NULL,NULL,8,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.laboratories.index',NULL),(16,1,'Convenio','','_self','voyager-categories',NULL,NULL,8,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.agreements.index',NULL),(17,1,'Producto','','_self','voyager-categories',NULL,NULL,8,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.product.index',NULL),(18,1,'Consultorio','','_self','voyager-categories',NULL,NULL,8,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.consulting_room.index',NULL),(19,1,'Hooks','','_self','voyager-hook',NULL,NULL,13,'2020-05-05 02:26:11','2020-05-05 02:26:11','voyager.hooks',NULL),(20,1,'Hostnames','','_self','voyager-ship',NULL,NULL,1,'2020-05-05 02:26:17','2020-05-05 02:26:17','voyager.hostnames.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2020-05-05 02:26:10','2020-05-05 02:26:10'),(2,'admin_app','2020-05-05 02:26:10','2020-05-05 02:26:10');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (181,'2014_10_12_000000_create_users_table',1),(182,'2014_10_12_100000_create_password_resets_table',1),(183,'2016_01_01_000000_add_voyager_user_fields',1),(184,'2016_01_01_000000_create_data_types_table',1),(185,'2016_01_01_000000_create_pages_table',1),(186,'2016_01_01_000000_create_posts_table',1),(187,'2016_02_15_204651_create_categories_table',1),(188,'2016_05_19_173453_create_menu_table',1),(189,'2016_06_01_000001_create_oauth_auth_codes_table',1),(190,'2016_06_01_000002_create_oauth_access_tokens_table',1),(191,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(192,'2016_06_01_000004_create_oauth_clients_table',1),(193,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(194,'2016_10_21_190000_create_roles_table',1),(195,'2016_10_21_190000_create_settings_table',1),(196,'2016_11_30_135954_create_permission_table',1),(197,'2016_11_30_141208_create_permission_role_table',1),(198,'2016_12_26_201236_data_types__add__server_side',1),(199,'2017_01_01_000003_tenancy_websites',1),(200,'2017_01_01_000005_tenancy_hostnames',1),(201,'2017_01_13_000000_add_route_to_menu_items_table',1),(202,'2017_01_14_005015_create_translations_table',1),(203,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(204,'2017_03_06_000000_add_controller_to_data_types_table',1),(205,'2017_04_11_000000_alter_post_nullable_fields_table',1),(206,'2017_04_21_000000_add_order_to_data_rows_table',1),(207,'2017_07_05_210000_add_policyname_to_data_types_table',1),(208,'2017_08_05_000000_add_group_to_settings_table',1),(209,'2017_11_26_013050_add_user_role_relationship',1),(210,'2017_11_26_015000_create_user_roles_table',1),(211,'2018_03_11_000000_add_user_settings',1),(212,'2018_03_14_000000_add_details_to_data_types_table',1),(213,'2018_03_16_000000_make_settings_value_nullable',1),(214,'2018_04_06_000001_tenancy_websites_needs_db_host',1),(215,'2019_12_14_000001_create_personal_access_tokens_table',1),(216,'2020_05_02_222826_create_consulting_room_table',1),(217,'2020_05_02_222959_create_laboratories_table',1),(218,'2020_05_02_223008_create_products_table',1),(219,'2020_05_03_062851_create_agreements_table',1),(220,'2020_05_03_064025_create_patients_table',1),(221,'2020_05_03_064524_create_clinic_histories_table',1),(222,'2020_05_03_064633_create_detail_histories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2020-05-05 02:26:11','2020-05-05 02:26:11');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_charge_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `odontograma` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(2,'browse_bread',NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(3,'browse_database',NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(4,'browse_media',NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(5,'browse_compass',NULL,'2020-05-05 02:26:10','2020-05-05 02:26:10'),(6,'browse_menus','menus','2020-05-05 02:26:10','2020-05-05 02:26:10'),(7,'read_menus','menus','2020-05-05 02:26:10','2020-05-05 02:26:10'),(8,'edit_menus','menus','2020-05-05 02:26:10','2020-05-05 02:26:10'),(9,'add_menus','menus','2020-05-05 02:26:10','2020-05-05 02:26:10'),(10,'delete_menus','menus','2020-05-05 02:26:10','2020-05-05 02:26:10'),(11,'browse_roles','roles','2020-05-05 02:26:10','2020-05-05 02:26:10'),(12,'read_roles','roles','2020-05-05 02:26:10','2020-05-05 02:26:10'),(13,'edit_roles','roles','2020-05-05 02:26:10','2020-05-05 02:26:10'),(14,'add_roles','roles','2020-05-05 02:26:10','2020-05-05 02:26:10'),(15,'delete_roles','roles','2020-05-05 02:26:10','2020-05-05 02:26:10'),(16,'browse_users','users','2020-05-05 02:26:10','2020-05-05 02:26:10'),(17,'read_users','users','2020-05-05 02:26:10','2020-05-05 02:26:10'),(18,'edit_users','users','2020-05-05 02:26:10','2020-05-05 02:26:10'),(19,'add_users','users','2020-05-05 02:26:10','2020-05-05 02:26:10'),(20,'delete_users','users','2020-05-05 02:26:10','2020-05-05 02:26:10'),(21,'browse_settings','settings','2020-05-05 02:26:10','2020-05-05 02:26:10'),(22,'read_settings','settings','2020-05-05 02:26:10','2020-05-05 02:26:10'),(23,'edit_settings','settings','2020-05-05 02:26:10','2020-05-05 02:26:10'),(24,'add_settings','settings','2020-05-05 02:26:10','2020-05-05 02:26:10'),(25,'delete_settings','settings','2020-05-05 02:26:10','2020-05-05 02:26:10'),(26,'browse_categories','categories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(27,'read_categories','categories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(28,'edit_categories','categories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(29,'add_categories','categories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(30,'delete_categories','categories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(31,'browse_posts','posts','2020-05-05 02:26:11','2020-05-05 02:26:11'),(32,'read_posts','posts','2020-05-05 02:26:11','2020-05-05 02:26:11'),(33,'edit_posts','posts','2020-05-05 02:26:11','2020-05-05 02:26:11'),(34,'add_posts','posts','2020-05-05 02:26:11','2020-05-05 02:26:11'),(35,'delete_posts','posts','2020-05-05 02:26:11','2020-05-05 02:26:11'),(36,'browse_pages','pages','2020-05-05 02:26:11','2020-05-05 02:26:11'),(37,'read_pages','pages','2020-05-05 02:26:11','2020-05-05 02:26:11'),(38,'edit_pages','pages','2020-05-05 02:26:11','2020-05-05 02:26:11'),(39,'add_pages','pages','2020-05-05 02:26:11','2020-05-05 02:26:11'),(40,'delete_pages','pages','2020-05-05 02:26:11','2020-05-05 02:26:11'),(41,'browse_patients','patients','2020-05-05 02:26:11','2020-05-05 02:26:11'),(42,'read_patients','patients','2020-05-05 02:26:11','2020-05-05 02:26:11'),(43,'edit_patients','patients','2020-05-05 02:26:11','2020-05-05 02:26:11'),(44,'add_patients','patients','2020-05-05 02:26:11','2020-05-05 02:26:11'),(45,'delete_patients','patients','2020-05-05 02:26:11','2020-05-05 02:26:11'),(46,'browse_laboratories','laboratories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(47,'read_laboratories','laboratories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(48,'edit_laboratories','laboratories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(49,'add_laboratories','laboratories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(50,'delete_laboratories','laboratories','2020-05-05 02:26:11','2020-05-05 02:26:11'),(51,'browse_agreements','agreements','2020-05-05 02:26:11','2020-05-05 02:26:11'),(52,'read_agreements','agreements','2020-05-05 02:26:11','2020-05-05 02:26:11'),(53,'edit_agreements','agreements','2020-05-05 02:26:11','2020-05-05 02:26:11'),(54,'add_agreements','agreements','2020-05-05 02:26:11','2020-05-05 02:26:11'),(55,'delete_agreements','agreements','2020-05-05 02:26:11','2020-05-05 02:26:11'),(56,'browse_product','product','2020-05-05 02:26:11','2020-05-05 02:26:11'),(57,'read_product','product','2020-05-05 02:26:11','2020-05-05 02:26:11'),(58,'edit_product','product','2020-05-05 02:26:11','2020-05-05 02:26:11'),(59,'add_product','product','2020-05-05 02:26:11','2020-05-05 02:26:11'),(60,'delete_product','product','2020-05-05 02:26:11','2020-05-05 02:26:11'),(61,'browse_consulting_room','consulting_room','2020-05-05 02:26:11','2020-05-05 02:26:11'),(62,'read_consulting_room','consulting_room','2020-05-05 02:26:11','2020-05-05 02:26:11'),(63,'edit_consulting_room','consulting_room','2020-05-05 02:26:11','2020-05-05 02:26:11'),(64,'add_consulting_room','consulting_room','2020-05-05 02:26:11','2020-05-05 02:26:11'),(65,'delete_consulting_room','consulting_room','2020-05-05 02:26:11','2020-05-05 02:26:11'),(66,'browse_hooks',NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(67,'browse_hostnames','hostnames','2020-05-05 02:26:17','2020-05-05 02:26:17'),(68,'read_hostnames','hostnames','2020-05-05 02:26:17','2020-05-05 02:26:17'),(69,'edit_hostnames','hostnames','2020-05-05 02:26:17','2020-05-05 02:26:17'),(70,'add_hostnames','hostnames','2020-05-05 02:26:17','2020-05-05 02:26:17'),(71,'delete_hostnames','hostnames','2020-05-05 02:26:17','2020-05-05 02:26:17');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2020-05-05 02:26:11','2020-05-05 02:26:11'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2020-05-05 02:26:11','2020-05-05 02:26:11');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consulting_room` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrador','2020-05-05 02:26:10','2020-05-05 02:26:10'),(2,'user','Usuario Normal','2020-05-05 02:26:10','2020-05-05 02:26:10');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Título del sitio','Título del sitio','','text',1,'Site'),(2,'site.description','Descripción del sitio','Descripción del sitio','','text',2,'Site'),(3,'site.logo','Logo del sitio','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','ID de rastreo de Google Analytics','','','text',4,'Site'),(5,'admin.bg_image','Imagen de fondo del administrador','','','image',5,'Admin'),(6,'admin.title','Título del administrador','Voyager','','text',1,'Admin'),(7,'admin.description','Descripción del administrador','Bienvenido a Voyager. El administrador que le faltaba a Laravel','','text',2,'Admin'),(8,'admin.loader','Imagen de carga del administrador','','','image',3,'Admin'),(9,'admin.icon_image','Ícono del administrador','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','ID de Cliente para Google Analytics (usado para el tablero de administrador)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'es','Post','2020-05-05 02:26:11','2020-05-05 02:26:11'),(2,'data_types','display_name_singular',6,'es','Página','2020-05-05 02:26:11','2020-05-05 02:26:11'),(3,'data_types','display_name_singular',1,'es','Usuario','2020-05-05 02:26:11','2020-05-05 02:26:11'),(4,'data_types','display_name_singular',4,'es','Categoria','2020-05-05 02:26:11','2020-05-05 02:26:11'),(5,'data_types','display_name_singular',2,'es','Menu','2020-05-05 02:26:11','2020-05-05 02:26:11'),(6,'data_types','display_name_singular',3,'es','Rol','2020-05-05 02:26:11','2020-05-05 02:26:11'),(7,'categories','slug',1,'es','categoria-1','2020-05-05 02:26:11','2020-05-05 02:26:11'),(8,'categories','name',1,'es','Categoria 1','2020-05-05 02:26:11','2020-05-05 02:26:11'),(9,'categories','slug',2,'es','categoria-2','2020-05-05 02:26:11','2020-05-05 02:26:11'),(10,'categories','name',2,'es','Categoria 2','2020-05-05 02:26:11','2020-05-05 02:26:11'),(11,'pages','title',1,'es','Olá Mundo','2020-05-05 02:26:11','2020-05-05 02:26:11'),(12,'pages','slug',1,'es','ola-mundo','2020-05-05 02:26:11','2020-05-05 02:26:11'),(13,'pages','body',1,'es','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2020-05-05 02:26:11','2020-05-05 02:26:11'),(14,'menu_items','title',1,'es','Panel de Control','2020-05-05 02:26:11','2020-05-05 02:26:11'),(15,'menu_items','title',2,'es','Media','2020-05-05 02:26:11','2020-05-05 02:26:11'),(16,'menu_items','title',12,'es','Publicaciones','2020-05-05 02:26:11','2020-05-05 02:26:11'),(17,'menu_items','title',3,'es','Utilizadores','2020-05-05 02:26:11','2020-05-05 02:26:11'),(18,'menu_items','title',11,'es','Categorias','2020-05-05 02:26:11','2020-05-05 02:26:11'),(19,'menu_items','title',13,'es','Páginas','2020-05-05 02:26:11','2020-05-05 02:26:11'),(20,'menu_items','title',4,'es','Roles','2020-05-05 02:26:11','2020-05-05 02:26:11'),(21,'menu_items','title',5,'es','Herramientas','2020-05-05 02:26:11','2020-05-05 02:26:11'),(22,'menu_items','title',6,'es','Menus','2020-05-05 02:26:11','2020-05-05 02:26:11'),(23,'menu_items','title',7,'es','Base de datos','2020-05-05 02:26:11','2020-05-05 02:26:11'),(24,'menu_items','title',10,'es','Configuraciones','2020-05-05 02:26:11','2020-05-05 02:26:11');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin','admin@admin.com','users/default.png',NULL,'$2y$10$M2.414VFkL.YyYKVPk7q1uXpRfnTjdDv2xwCDkoBOZiFnWgmXzPhy','Ss65vP2HBt5ZBgjuJokMXzTBDZzbFErvqvlu2iO0icEvmfezzZf5OM8uWaDM',NULL,'2020-05-05 02:26:11','2020-05-05 02:26:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websites`
--

DROP TABLE IF EXISTS `websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `managed_by_database_connection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'References the database connection key in your database.php',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websites`
--

LOCK TABLES `websites` WRITE;
/*!40000 ALTER TABLE `websites` DISABLE KEYS */;
INSERT INTO `websites` VALUES (28,'dd909fe313994670973faf62bffd7021','2020-11-16 06:49:26','2020-11-16 06:49:26',NULL,NULL),(30,'d84d468aa45a4441919955c73cbd2df8','2020-11-18 14:55:53','2020-11-18 14:55:53',NULL,NULL),(31,'3945971c6721455a9e4f1d3458c952ad','2020-11-23 14:35:36','2020-11-23 14:35:36',NULL,NULL),(32,'4a2d9cb7967b466e8f120639e5f897b5','2022-04-13 20:20:49','2022-04-13 20:20:49',NULL,NULL),(33,'9a1d9f539d334ef79cae7f4412184cb6','2022-04-13 20:36:24','2022-04-13 20:36:24',NULL,NULL),(35,'18325524b57c4a1591512a0c671938e8','2022-05-06 15:12:11','2022-05-06 15:12:11',NULL,NULL);
/*!40000 ALTER TABLE `websites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03 20:03:54
