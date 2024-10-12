-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_doan
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birth_day` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_non_locked` tinyint NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `customer_id` bigint NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_k9qlqijt38kmryafdhhq04lon` (`code`),
  KEY `FKd4vb66o896tay3yy52oqxr9w0` (`role_id`),
  KEY `FKnnwpo0lfq4xai1rs6887sx02k` (`customer_id`),
  CONSTRAINT `FKd4vb66o896tay3yy52oqxr9w0` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKnnwpo0lfq4xai1rs6887sx02k` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (6,NULL,'TK0006','2024-08-28 21:39:08.628222','tavanloi660@gmail.com',1,'$2a$10$I073.6VXa3Ca6HZiM2ohOeCIcMwfd8ghcRyVY83cRrRGeULeRqo8e',NULL,4,2),(7,NULL,'TK0007','2024-08-28 23:37:54.121541','nguyendieulinh16112004@gmail.com',1,'$2a$10$KbtQdr1lHgdSoNxGS5xTVO7uLiKTVj96pRNLpJSYHM9ILIiNJzIQK',NULL,5,1),(8,NULL,'TK0008','2024-09-13 09:51:20.448241','thaibinh@gmail.com',1,'$2a$10$5jPk0EO0kKwwz370BkJf9.1OajXhs7M4BLDU/KDZM7OQ4mtCPIBoC',NULL,6,3),(9,NULL,'TK0009','2024-09-24 04:20:20.959585','le123@gmail.com',1,'$2a$10$cpYJi.Iej6.xUkaeKgqjI.rOttq57xQDNwU7TvK0KxKtcCVm6QdLC',NULL,7,3);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

--
-- Table structure for table `address_shipping`
--

DROP TABLE IF EXISTS `address_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_shipping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq133otkfjvualo1uhtdimlsj0` (`customer_id`),
  CONSTRAINT `FKq133otkfjvualo1uhtdimlsj0` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_shipping`
--

/*!40000 ALTER TABLE `address_shipping` DISABLE KEYS */;
INSERT INTO `address_shipping` VALUES (3,'13, Thị trấn Tây Đằng, Huyện Ba Vì, Hà Nội',4),(4,'126 Vĩnh Hưng, Phường Lĩnh Nam, Quận Hoàng Mai, Hà Nội',5),(5,'294 Lĩnh Nam, Phường Lĩnh Nam, Quận Hoàng Mai, Hà Nội',6),(6,'17 Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Hà Nội',7);
/*!40000 ALTER TABLE `address_shipping` ENABLE KEYS */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `invoice_type` varchar(255) DEFAULT NULL,
  `promotion_price` double NOT NULL,
  `return_status` tinyint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `discount_code_id` bigint DEFAULT NULL,
  `payment_method_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcdveik90g4pvk7m249scu73pg` (`customer_id`),
  KEY `FKmn36kcnhdokvrm6ueo3raqi9k` (`payment_method_id`),
  KEY `FKqjtxrp32iyvl31q2cr3l3refa` (`discount_code_id`),
  CONSTRAINT `FKcdveik90g4pvk7m249scu73pg` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKmn36kcnhdokvrm6ueo3raqi9k` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FKqjtxrp32iyvl31q2cr3l3refa` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (5,21000000,'126 Vĩnh Hưng, Phường Lĩnh Nam, Quận Hoàng Mai, Hà Nội','HD001','2024-09-13 07:52:32.888686','ONLINE',0,0,'HOAN_THANH','2024-09-13 07:55:56.311324',5,NULL,1),(6,21000000,'294 Lĩnh Nam, Phường Lĩnh Nam, Quận Hoàng Mai, Hà Nội','HD002','2024-09-13 09:57:36.910702','ONLINE',0,0,'HOAN_THANH','2024-09-13 16:50:23.940510',6,NULL,1),(8,6000000,'','HD003','2024-09-19 01:59:25.149012','OFFLINE',300000,0,'HOAN_THANH','2024-09-19 01:59:25.149012',NULL,3,1),(9,6000000,'17 Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Hà Nội','HD004','2024-09-24 04:23:10.150987','ONLINE',0,0,'HUY','2024-10-11 23:32:51.768863',7,NULL,1),(10,21000000,'13, Thị trấn Tây Đằng, Huyện Ba Vì, Hà Nội','HD005','2024-10-05 09:23:32.773455','ONLINE',0,0,'HOAN_THANH','2024-10-11 23:32:49.082046',4,NULL,3),(11,19000000,'13, Thị trấn Tây Đằng, Huyện Ba Vì, Hà Nội','HD006','2024-10-05 09:24:17.244884','ONLINE',0,0,'HOAN_THANH','2024-10-05 09:27:10.209955',4,NULL,1),(12,21000000,'','HD007','2024-10-11 23:31:39.006014','OFFLINE',2000000,0,'HOAN_THANH','2024-10-11 23:31:39.006014',NULL,1,1),(13,625000,'','HD008','2024-10-11 23:56:44.103386','OFFLINE',50000,0,'HOAN_THANH','2024-10-11 23:56:44.103386',NULL,3,3);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `moment_price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `return_quantity` int DEFAULT NULL,
  `bill_id` bigint DEFAULT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5wgs68xq0wq0ebia10snilq9v` (`product_detail_id`),
  KEY `FKeolgwyayei3o80bb7rj7t207q` (`bill_id`),
  CONSTRAINT `FK5wgs68xq0wq0ebia10snilq9v` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`),
  CONSTRAINT `FKeolgwyayei3o80bb7rj7t207q` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (5,21000000,1,NULL,5,19),(6,21000000,1,NULL,6,19),(8,6000000,1,NULL,8,42),(9,6000000,1,NULL,9,41),(10,21000000,1,NULL,10,19),(11,19000000,1,NULL,11,25),(12,21000000,1,NULL,12,20),(13,625000,1,NULL,13,52);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;

--
-- Table structure for table `bill_return`
--

DROP TABLE IF EXISTS `bill_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_return` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `is_cancel` tinyint NOT NULL,
  `percent_fee_exchange` int DEFAULT NULL,
  `return_date` datetime(6) DEFAULT NULL,
  `return_money` double DEFAULT NULL,
  `return_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `return_status` int NOT NULL,
  `bill_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmt15w62mdy6k5x6i1a3297egn` (`bill_id`),
  CONSTRAINT `FKmt15w62mdy6k5x6i1a3297egn` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_return`
--

/*!40000 ALTER TABLE `bill_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_return` ENABLE KEYS */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int NOT NULL,
  `delete_flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'NH1','ATYS',0,0),(2,'NH2','Owen',0,0),(3,'NH3','Dior',0,0),(4,'NH4','Luis Vutton',0,0),(5,'NH5','Adidas',0,0),(6,'NH6','Gucci',0,0),(7,'NH7','Burberry',0,0),(8,'NH8','Channel',0,0),(9,'NH9','Hermes',0,0),(10,'NH10','Givenchy',1,0);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `quantity` int NOT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4pljlvncf45mr98etwpubxvbt` (`account_id`),
  KEY `FK874r4t3ct18p0rfjwdkn4p0xe` (`product_detail_id`),
  CONSTRAINT `FK4pljlvncf45mr98etwpubxvbt` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK874r4t3ct18p0rfjwdkn4p0xe` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (7,'2024-09-13 08:05:34.788469',1,'2024-09-13 08:05:34.788469',7,22);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int NOT NULL,
  `delete_flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'LSP1','Áo Len',0,0),(2,'LSP2','Áo Polo',0,0),(3,'LSP3','Áo Hoodie',0,0),(4,'LSP4','Váy',0,0),(5,'LSP5','Áo phông',0,0),(6,'LSP6','Quần dài',0,0),(7,'LSP7','Áo dài',0,0),(8,'LSP8','Áo ngắn tay',0,0),(9,'LSP9','Quần đùi',0,0),(10,'LSP10','Áo sơ mi',0,0),(11,'LSP11','Áo khoác',1,0),(12,'LSP12','Quần Short',1,0),(13,'LSP13','Áo thun',1,0),(14,'LSP14','Bộ quần áo dài tay',1,0),(15,'LSP15','Bộ quần áo ngắn tay',1,0),(16,'LSP16','Chân váy',1,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'M1','Màu Đỏ',0x00),(2,'M2','Màu Xanh',NULL),(3,'M3','Màu Đen',0x00),(4,'M4','Màu Trắng',0x00),(5,'M5','Màu Hồng',NULL),(6,'M6','Màu Tím',0x00),(7,'M7','Navy',0x00),(8,'M8','Kem',0x00),(9,'M9','Xanh Rêu',0x00),(10,'M10','Nâu',0x00),(11,'M11','Xám',0x00),(12,'M12','Màu cam',0x00);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (4,'KH0004',NULL,'Tạ văn lợi','0352321004'),(5,'KH0005',NULL,'Nguyễn Diệu Linh','0971211744'),(6,'KH0006',NULL,'Nguyễn Thái Bình','0352222222'),(7,'KH0007',NULL,'Vũ Thị Lê','0337275545'),(8,'KH0008',NULL,'Hoàng Huy Hoàng','0352999999');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

--
-- Table structure for table `discount_code`
--

DROP TABLE IF EXISTS `discount_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_code` (
  `id` bigint NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `delete_flag` bit(1) NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `discount_amount` float DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `maximum_amount` int DEFAULT NULL,
  `maximum_usage` int DEFAULT NULL,
  `minimum_amount_in_cart` float DEFAULT NULL,
  `percentage` int DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `status` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_code`
--

/*!40000 ALTER TABLE `discount_code` DISABLE KEYS */;
INSERT INTO `discount_code` VALUES (1,'Sinh nhật 1 tuổi',0x00,NULL,NULL,'2024-12-31 00:00:00.000000',2000000,49,20000000,10,'2024-09-05 00:00:00.000000',1,1),(2,'Noel',0x00,NULL,NULL,'2024-12-01 00:00:00.000000',100000,50,1000000,10,'2024-09-01 00:00:00.000000',1,1),(3,'Hoan Hỉ',0x00,NULL,NULL,'2024-12-05 00:00:00.000000',50000,49,500000,10,'2024-09-05 00:00:00.000000',1,1),(4,'vip',0x00,NULL,NULL,'2024-12-05 00:00:00.000000',3000000,50,30000000,10,'2024-09-05 00:00:00.000000',1,1);
/*!40000 ALTER TABLE `discount_code` ENABLE KEYS */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (5);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgpextbyee3uk9u6o2381m7ft1` (`product_id`),
  CONSTRAINT `FKgpextbyee3uk9u6o2381m7ft1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (22,'2024-09-02 14:21:54.044755','image/webp','uploads/1725261714043_ao-phong-dior-relaxed-fit-in-black-logo-embroidered-293j659a0554-mau-den-63bce31067c0e-10012023110120.webp','1725261714043_ao-phong-dior-relaxed-fit-in-black-logo-embroidered-293j659a0554-mau-den-63bce31067c0e-10012023110120.webp','2024-09-02 14:21:54.044755',9),(24,'2024-09-02 14:22:54.990428','image/webp','uploads/1725261774989_ao-phong-dior-relaxed-fit-in-black-logo-embroidered-293j659a0554-mau-den-63bce3106dd7f-10012023110120.webp','1725261774989_ao-phong-dior-relaxed-fit-in-black-logo-embroidered-293j659a0554-mau-den-63bce3106dd7f-10012023110120.webp','2024-09-02 14:22:54.990428',9),(26,'2024-09-02 14:34:18.070988','image/webp','uploads/1725262458069_ao-hoodie-nam-dior-black-with-cd-logo-embroidered-113j698a0531-989-mau-den-6553356b0bb90-14112023155259.webp','1725262458069_ao-hoodie-nam-dior-black-with-cd-logo-embroidered-113j698a0531-989-mau-den-6553356b0bb90-14112023155259.webp','2024-09-02 14:34:18.070988',10),(27,'2024-09-02 14:34:18.079426','image/webp','uploads/1725262458070_ao-hoodie-nam-dior-black-with-cd-logo-embroidered-113j698a0531-989-mau-den-6553356b0c38b-14112023155259.webp','1725262458070_ao-hoodie-nam-dior-black-with-cd-logo-embroidered-113j698a0531-989-mau-den-6553356b0c38b-14112023155259.webp','2024-09-02 14:34:18.079426',10),(28,'2024-09-02 14:34:18.081422','image/webp','uploads/1725262458080_ao-hoodie-nam-dior-black-with-cd-logo-embroidered-113j698a0531-989-mau-den-6553356b0c5ee-14112023155259.webp','1725262458080_ao-hoodie-nam-dior-black-with-cd-logo-embroidered-113j698a0531-989-mau-den-6553356b0c5ee-14112023155259.webp','2024-09-02 14:34:18.081422',10),(29,'2024-09-02 14:47:27.840819','image/webp','uploads/1725263247835_ao-so-mi-nam-dior-embroidered-cotton-shirt-mau-trang-658403c52ca29-21122023162213.webp','1725263247835_ao-so-mi-nam-dior-embroidered-cotton-shirt-mau-trang-658403c52ca29-21122023162213.webp','2024-09-02 14:47:27.840819',11),(30,'2024-09-02 14:47:27.841817','image/webp','uploads/1725263247840_ao-so-mi-nam-dior-embroidered-cotton-shirt-mau-trang-658403d9207e7-21122023162233.webp','1725263247840_ao-so-mi-nam-dior-embroidered-cotton-shirt-mau-trang-658403d9207e7-21122023162233.webp','2024-09-02 14:47:27.841817',11),(31,'2024-09-02 14:47:27.842178','image/webp','uploads/1725263247842_ao-so-mi-nam-dior-embroidered-cotton-shirt-mau-trang-658403602987f-21122023162032.webp','1725263247842_ao-so-mi-nam-dior-embroidered-cotton-shirt-mau-trang-658403602987f-21122023162032.webp','2024-09-02 14:47:27.842178',11),(32,'2024-09-02 14:51:32.512192','image/webp','uploads/1725263492511_ao-phong-dior-relaxed-fit-in-black-logo-embroidered-293j659a0554-mau-den-63bce3106ab70-10012023110120.webp','1725263492511_ao-phong-dior-relaxed-fit-in-black-logo-embroidered-293j659a0554-mau-den-63bce3106ab70-10012023110120.webp','2024-09-02 14:51:32.512192',9),(33,'2024-09-02 15:01:14.901860','image/jpeg','uploads/1725264074900_sg-11134201-7rccv-lsqs50r5txlq69.jpeg','1725264074900_sg-11134201-7rccv-lsqs50r5txlq69.jpeg','2024-09-02 15:01:14.901860',12),(34,'2024-09-02 15:01:14.902822','image/jpeg','uploads/1725264074901_sg-11134201-7rcdu-lsqs506coduqd4.jpeg','1725264074901_sg-11134201-7rcdu-lsqs506coduqd4.jpeg','2024-09-02 15:01:14.902822',12),(35,'2024-09-02 15:01:14.903930','image/jpeg','uploads/1725264074902_sg-11134201-7rccv-lsqs4zxr0zjv2f.jpeg','1725264074902_sg-11134201-7rccv-lsqs4zxr0zjv2f.jpeg','2024-09-02 15:01:14.903930',12),(36,'2024-09-02 15:07:10.554158','image/jpeg','uploads/1725264430553_vn-11134207-7r98o-lnn5gdddq9a2e4.jpeg','1725264430553_vn-11134207-7r98o-lnn5gdddq9a2e4.jpeg','2024-09-02 15:07:10.554158',13),(37,'2024-09-02 15:07:10.555186','image/jpeg','uploads/1725264430554_vn-11134207-7r98o-lnn5gdddrnuib3.jpeg','1725264430554_vn-11134207-7r98o-lnn5gdddrnuib3.jpeg','2024-09-02 15:07:10.555186',13),(38,'2024-09-02 15:07:10.556152','image/jpeg','uploads/1725264430555_vn-11134207-7r98o-lnn5gdddt2ey76.jpeg','1725264430555_vn-11134207-7r98o-lnn5gdddt2ey76.jpeg','2024-09-02 15:07:10.556152',13),(39,'2024-09-02 15:14:25.760644','image/webp','uploads/1725264865760_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f04ee2-24102023135527.webp','1725264865760_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f04ee2-24102023135527.webp','2024-09-02 15:14:25.761643',14),(40,'2024-09-02 15:14:25.761643','image/webp','uploads/1725264865761_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f05119-24102023135527.webp','1725264865761_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f05119-24102023135527.webp','2024-09-02 15:14:25.761643',14),(41,'2024-09-02 15:14:25.762640','image/webp','uploads/1725264865762_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f04bd3-24102023135527.webp','1725264865762_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f04bd3-24102023135527.webp','2024-09-02 15:14:25.762640',14),(42,'2024-09-02 15:14:25.763637','image/webp','uploads/1725264865763_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f05331-24102023135527.webp','1725264865763_ao-khoac-nam-burberry-with-gold-zip-8061649-mau-den-size-44-65376a5f05331-24102023135527.webp','2024-09-02 15:14:25.763637',14),(43,'2024-09-02 16:10:54.296749','image/webp','uploads/1725268254295_ao-len-burberry-mermaid-intarsia-wool-sweater-mau-xanh-navy-size-xs-653778ab84a05-24102023145627.webp','1725268254295_ao-len-burberry-mermaid-intarsia-wool-sweater-mau-xanh-navy-size-xs-653778ab84a05-24102023145627.webp','2024-09-02 16:10:54.296749',15),(44,'2024-09-02 16:10:54.297747','image/webp','uploads/1725268254296_ao-len-burberry-mermaid-intarsia-wool-sweater-mau-xanh-navy-size-xs-653778ab774cc-24102023145627.webp','1725268254296_ao-len-burberry-mermaid-intarsia-wool-sweater-mau-xanh-navy-size-xs-653778ab774cc-24102023145627.webp','2024-09-02 16:10:54.297747',15),(45,'2024-09-02 16:10:54.298743','image/webp','uploads/1725268254297_ao-len-burberry-mermaid-intarsia-wool-sweater-mau-xanh-navy-size-xs-653778ab844da-24102023145627.webp','1725268254297_ao-len-burberry-mermaid-intarsia-wool-sweater-mau-xanh-navy-size-xs-653778ab844da-24102023145627.webp','2024-09-02 16:10:54.298743',15),(46,'2024-09-02 16:18:57.197097','image/jpeg','uploads/1725268737195_vn-11134207-7r98o-lz0pkoj4nmox07.jpeg','1725268737195_vn-11134207-7r98o-lz0pkoj4nmox07.jpeg','2024-09-02 16:18:57.197097',16),(47,'2024-09-02 16:18:57.198096','image/jpeg','uploads/1725268737198_vn-11134207-7r98o-lz0pkoiuo11pc5.jpeg','1725268737198_vn-11134207-7r98o-lz0pkoiuo11pc5.jpeg','2024-09-02 16:18:57.198096',16),(48,'2024-09-02 16:18:57.199094','image/jpeg','uploads/1725268737199_vn-11134207-7r98o-lz0pkoj4nmfhf0.jpeg','1725268737199_vn-11134207-7r98o-lz0pkoj4nmfhf0.jpeg','2024-09-02 16:18:57.199094',16),(49,'2024-09-02 16:23:14.433461','image/jpeg','uploads/1725268994431_vn-11134207-7qukw-lhrqn34qv4at3e.jpeg','1725268994431_vn-11134207-7qukw-lhrqn34qv4at3e.jpeg','2024-09-02 16:23:14.433461',17),(50,'2024-09-02 16:23:14.436516','image/jpeg','uploads/1725268994434_vn-11134207-7qukw-lhrqn34qsb5x4e.jpeg','1725268994434_vn-11134207-7qukw-lhrqn34qsb5x4e.jpeg','2024-09-02 16:23:14.436516',17),(51,'2024-09-02 16:23:14.438616','image/jpeg','uploads/1725268994436_vn-11134207-7qukw-lhrqn34qtpqdfd.jpeg','1725268994436_vn-11134207-7qukw-lhrqn34qtpqdfd.jpeg','2024-09-02 16:23:14.438616',17),(52,'2024-09-02 16:35:19.727403','image/webp','uploads/1725269719726_quan-shorts-burberry-vintage-check-print-swim-8017295-mau-nau-62c7af2eef691-08072022111438.webp','1725269719726_quan-shorts-burberry-vintage-check-print-swim-8017295-mau-nau-62c7af2eef691-08072022111438.webp','2024-09-02 16:35:19.727403',18),(53,'2024-09-02 16:35:19.728400','image/webp','uploads/1725269719727_quan-shorts-burberry-vintage-check-print-swim-8017295-mau-nau-62c7a90c70485-08072022104828.webp','1725269719727_quan-shorts-burberry-vintage-check-print-swim-8017295-mau-nau-62c7a90c70485-08072022104828.webp','2024-09-02 16:35:19.728400',18),(54,'2024-09-02 16:35:19.729399','image/webp','uploads/1725269719728_quan-shorts-burberry-vintage-check-print-swim-8017295-mau-nau-62c7a90c76872-08072022104828.webp','1725269719728_quan-shorts-burberry-vintage-check-print-swim-8017295-mau-nau-62c7a90c76872-08072022104828.webp','2024-09-02 16:35:19.729399',18),(55,'2024-09-02 16:45:00.892207','image/webp','uploads/1725270300890_ar240056dt.webp','1725270300890_ar240056dt.webp','2024-09-02 16:45:00.892207',19),(56,'2024-09-02 16:45:00.895224','image/webp','uploads/1725270300893_ar240056dt....webp','1725270300893_ar240056dt....webp','2024-09-02 16:45:00.895224',19),(57,'2024-09-02 16:45:00.896773','image/webp','uploads/1725270300895_ar240056dt..webp','1725270300895_ar240056dt..webp','2024-09-02 16:45:00.896773',19),(58,'2024-09-02 16:48:33.584505','image/webp','uploads/1725270513583_apv243608.webp','1725270513583_apv243608.webp','2024-09-02 16:48:33.584505',20),(59,'2024-09-02 16:48:33.586083','image/webp','uploads/1725270513584_apv243608...webp','1725270513584_apv243608...webp','2024-09-02 16:48:33.586083',20),(60,'2024-09-02 16:48:33.588675','image/webp','uploads/1725270513586_apv243608..webp','1725270513586_apv243608..webp','2024-09-02 16:48:33.588675',20),(61,'2024-09-02 16:52:42.683419','image/webp','uploads/1725270762681_qjs230156.webp','1725270762681_qjs230156.webp','2024-09-02 16:52:42.683419',21),(62,'2024-09-02 16:52:42.686526','image/webp','uploads/1725270762684_qjs230156...webp','1725270762684_qjs230156...webp','2024-09-02 16:52:42.686526',21),(63,'2024-09-02 16:52:42.690554','image/webp','uploads/1725270762687_qjs230156..webp','1725270762687_qjs230156..webp','2024-09-02 16:52:42.690554',21),(64,'2024-09-02 17:09:42.992233','image/webp','uploads/1725271782992_ald220772_1.webp','1725271782992_ald220772_1.webp','2024-09-02 17:09:42.992233',22),(65,'2024-09-02 17:09:43.008547','image/webp','uploads/1725271782992_ald220772_1_.webp','1725271782992_ald220772_1_.webp','2024-09-02 17:09:43.008547',22),(66,'2024-09-02 17:09:43.009164','image/webp','uploads/1725271783009_ald220772_2_.webp','1725271783009_ald220772_2_.webp','2024-09-02 17:09:43.009164',22),(67,'2024-09-02 17:15:00.301475','image/webp','uploads/1725272100301_sv242436.webp','1725272100301_sv242436.webp','2024-09-02 17:15:00.301475',23),(68,'2024-09-02 17:15:00.301475','image/webp','uploads/1725272100301_sv242436...webp','1725272100301_sv242436...webp','2024-09-02 17:15:00.301475',23),(69,'2024-09-02 17:15:00.301475','image/webp','uploads/1725272100301_sv242436..webp','1725272100301_sv242436..webp','2024-09-02 17:15:00.301475',23),(70,'2024-09-03 23:35:49.031778','image/webp','uploads/1725381349030_ao-croptop-nu-gucci-equestrian-jacquard-polo-top-743328xkc42-mau-trang-hoa-tiet-size-s-669875884ec84-18072024085312.webp','1725381349030_ao-croptop-nu-gucci-equestrian-jacquard-polo-top-743328xkc42-mau-trang-hoa-tiet-size-s-669875884ec84-18072024085312.webp','2024-09-03 23:35:49.032775',24),(71,'2024-09-03 23:35:49.036016','image/webp','uploads/1725381349034_ao-croptop-nu-gucci-equestrian-jacquard-polo-top-743328xkc42-mau-trang-hoa-tiet-size-s-669875884f1ac-18072024085312.webp','1725381349034_ao-croptop-nu-gucci-equestrian-jacquard-polo-top-743328xkc42-mau-trang-hoa-tiet-size-s-669875884f1ac-18072024085312.webp','2024-09-03 23:35:49.036016',24),(72,'2024-09-03 23:35:49.038860','image/webp','uploads/1725381349036_ao-croptop-nu-gucci-equestrian-jacquard-polo-top-743328xkc42-mau-trang-hoa-tiet-size-s-669875884f71e-18072024085312.webp','1725381349036_ao-croptop-nu-gucci-equestrian-jacquard-polo-top-743328xkc42-mau-trang-hoa-tiet-size-s-669875884f71e-18072024085312.webp','2024-09-03 23:35:49.038860',24),(73,'2024-09-03 23:39:06.860020','image/webp','uploads/1725381546859_vay-gucci-gg-jacquard-dress-mau-xanh-do-62e4ac54352ab-30072022105812.webp','1725381546859_vay-gucci-gg-jacquard-dress-mau-xanh-do-62e4ac54352ab-30072022105812.webp','2024-09-03 23:39:06.860020',25),(74,'2024-09-03 23:43:09.229036','image/webp','uploads/1725381789224_ao-phong-nu-gucci-navy-with-gg-lame-logo-printed-tshirt-526759-x9w83-4921-mau-xanh-phoi-vang-65052f1220621-16092023112906.webp','1725381789224_ao-phong-nu-gucci-navy-with-gg-lame-logo-printed-tshirt-526759-x9w83-4921-mau-xanh-phoi-vang-65052f1220621-16092023112906.webp','2024-09-03 23:43:09.229036',26),(75,'2024-09-03 23:43:09.230821','image/webp','uploads/1725381789229_ao-phong-nu-gucci-navy-with-gg-lame-logo-printed-tshirt-526759-x9w83-4921-mau-xanh-phoi-vang-65052f1220b78-16092023112906.webp','1725381789229_ao-phong-nu-gucci-navy-with-gg-lame-logo-printed-tshirt-526759-x9w83-4921-mau-xanh-phoi-vang-65052f1220b78-16092023112906.webp','2024-09-03 23:43:09.231007',26),(76,'2024-09-03 23:43:09.232975','image/webp','uploads/1725381789231_ao-phong-nu-gucci-navy-with-gg-lame-logo-printed-tshirt-526759-x9w83-4921-mau-xanh-phoi-vang-65052f1220d92-16092023112906.webp','1725381789231_ao-phong-nu-gucci-navy-with-gg-lame-logo-printed-tshirt-526759-x9w83-4921-mau-xanh-phoi-vang-65052f1220d92-16092023112906.webp','2024-09-03 23:43:09.232975',26),(77,'2024-09-03 23:48:06.274513','image/webp','uploads/1725382086272_ao-khoac-nam-gucci-gg-jacquard-cotton-jacket-496919-x9v05-4245-mau-xanh-blue-size-s-654871962be76-06112023115446.webp','1725382086272_ao-khoac-nam-gucci-gg-jacquard-cotton-jacket-496919-x9v05-4245-mau-xanh-blue-size-s-654871962be76-06112023115446.webp','2024-09-03 23:48:06.274513',27),(78,'2024-09-03 23:48:06.275510','image/webp','uploads/1725382086274_ao-khoac-nam-gucci-gg-jacquard-cotton-jacket-496919-x9v05-4245-mau-xanh-blue-size-s-654871962c2b4-06112023115446.webp','1725382086274_ao-khoac-nam-gucci-gg-jacquard-cotton-jacket-496919-x9v05-4245-mau-xanh-blue-size-s-654871962c2b4-06112023115446.webp','2024-09-03 23:48:06.276477',27),(79,'2024-09-03 23:48:06.277864','image/webp','uploads/1725382086276_ao-khoac-nam-gucci-gg-jacquard-cotton-jacket-496919-x9v05-4245-mau-xanh-blue-size-s-654871962c5a5-06112023115446.webp','1725382086276_ao-khoac-nam-gucci-gg-jacquard-cotton-jacket-496919-x9v05-4245-mau-xanh-blue-size-s-654871962c5a5-06112023115446.webp','2024-09-03 23:48:06.277864',27),(80,'2024-09-03 23:53:24.168342','image/webp','uploads/1725382404166_ao-phong-nam-gucci-tshirt-in-white-mau-trang-647dab1bbcbf9-05062023163003.webp','1725382404166_ao-phong-nam-gucci-tshirt-in-white-mau-trang-647dab1bbcbf9-05062023163003.webp','2024-09-03 23:53:24.168342',28),(81,'2024-09-03 23:53:24.169337','image/webp','uploads/1725382404168_ao-phong-nam-gucci-tshirt-in-white-mau-trang-647dab1bd0c3b-05062023163003.webp','1725382404168_ao-phong-nam-gucci-tshirt-in-white-mau-trang-647dab1bd0c3b-05062023163003.webp','2024-09-03 23:53:24.169622',28),(82,'2024-09-03 23:53:24.170618','image/webp','uploads/1725382404169_ao-phong-nam-gucci-tshirt-in-white-mau-trang-647dab1bd9479-05062023163003.webp','1725382404169_ao-phong-nam-gucci-tshirt-in-white-mau-trang-647dab1bd9479-05062023163003.webp','2024-09-03 23:53:24.170618',28),(83,'2024-09-04 00:13:14.328303','image/webp','uploads/1725383594327_ao-so-mi-nu-louis-vuitton-lv-dress-shirt-mau-trang-size-34-66988a5323221-18072024102155.webp','1725383594327_ao-so-mi-nu-louis-vuitton-lv-dress-shirt-mau-trang-size-34-66988a5323221-18072024102155.webp','2024-09-04 00:13:14.328303',29),(84,'2024-09-04 00:13:14.330300','image/webp','uploads/1725383594328_ao-so-mi-nu-louis-vuitton-lv-dress-shirt-mau-trang-size-34-66988a5324051-18072024102155.webp','1725383594328_ao-so-mi-nu-louis-vuitton-lv-dress-shirt-mau-trang-size-34-66988a5324051-18072024102155.webp','2024-09-04 00:13:14.330300',29),(85,'2024-09-04 00:13:14.332776','image/webp','uploads/1725383594330_ao-so-mi-nu-louis-vuitton-lv-dress-shirt-mau-trang-size-34-66988a532378a-18072024102155.webp','1725383594330_ao-so-mi-nu-louis-vuitton-lv-dress-shirt-mau-trang-size-34-66988a532378a-18072024102155.webp','2024-09-04 00:13:14.332810',29),(86,'2024-09-04 00:21:29.256260','image/webp','uploads/1725384089256_ao-hoodie-nu-louis-vuitton-lv-monogram-1aakv0-mau-den-hoa-tiet-658650c2a7051-23122023101514.webp','1725384089256_ao-hoodie-nu-louis-vuitton-lv-monogram-1aakv0-mau-den-hoa-tiet-658650c2a7051-23122023101514.webp','2024-09-04 00:21:29.256260',30),(87,'2024-09-04 00:21:29.256260','image/webp','uploads/1725384089256_ao-hoodie-nu-louis-vuitton-lv-monogram-1aakv0-mau-den-hoa-tiet-658650c2a6acb-23122023101514.webp','1725384089256_ao-hoodie-nu-louis-vuitton-lv-monogram-1aakv0-mau-den-hoa-tiet-658650c2a6acb-23122023101514.webp','2024-09-04 00:21:29.256260',30),(88,'2024-09-04 00:21:29.256260','image/webp','uploads/1725384089256_ao-hoodie-nu-louis-vuitton-lv-monogram-1aakv0-mau-den-hoa-tiet-658650c2a746c-23122023101514.webp','1725384089256_ao-hoodie-nu-louis-vuitton-lv-monogram-1aakv0-mau-den-hoa-tiet-658650c2a746c-23122023101514.webp','2024-09-04 00:21:29.256260',30),(89,'2024-09-04 00:29:44.937897','image/webp','uploads/1725384584937_ao-phong-nam-louis-vuitton-lv-red-with-logo-embroidered-tshirt-1afjeb-mau-do-65faa1a59ca25-20032024154317.webp','1725384584937_ao-phong-nam-louis-vuitton-lv-red-with-logo-embroidered-tshirt-1afjeb-mau-do-65faa1a59ca25-20032024154317.webp','2024-09-04 00:29:44.937897',31),(90,'2024-09-04 00:29:44.953118','image/webp','uploads/1725384584937_ao-phong-nam-louis-vuitton-lv-red-with-logo-embroidered-tshirt-1afjeb-mau-do-65faa1a59cf50-20032024154317.webp','1725384584937_ao-phong-nam-louis-vuitton-lv-red-with-logo-embroidered-tshirt-1afjeb-mau-do-65faa1a59cf50-20032024154317.webp','2024-09-04 00:29:44.953118',31),(91,'2024-09-04 00:29:44.954508','image/webp','uploads/1725384584953_ao-phong-nam-louis-vuitton-lv-red-with-logo-embroidered-tshirt-1afjeb-mau-do-65faa1a59d285-20032024154317.webp','1725384584953_ao-phong-nam-louis-vuitton-lv-red-with-logo-embroidered-tshirt-1afjeb-mau-do-65faa1a59d285-20032024154317.webp','2024-09-04 00:29:44.954508',31),(92,'2024-09-04 00:42:00.080975','image/jpeg','uploads/1725385320078_vn-11134201-7r98o-lz670e4uq9whd4.jfif','1725385320078_vn-11134201-7r98o-lz670e4uq9whd4.jfif','2024-09-04 00:42:00.080975',32),(93,'2024-09-04 00:42:00.081972','image/jpeg','uploads/1725385320080_vn-11134201-7r98o-lz670o5a2u1tc7.jfif','1725385320080_vn-11134201-7r98o-lz670o5a2u1tc7.jfif','2024-09-04 00:42:00.081972',32),(94,'2024-09-04 00:46:57.304639','image/webp','uploads/1725385617304_ao-hoodie-louis-vuitton-lv-1af382-printed-cotton-mau-xam-dam-656d55b99bf78-04122023112945.webp','1725385617304_ao-hoodie-louis-vuitton-lv-1af382-printed-cotton-mau-xam-dam-656d55b99bf78-04122023112945.webp','2024-09-04 00:46:57.304639',33),(95,'2024-09-05 16:31:36.869943','image/webp','uploads/1725528696866_ao-dai-tay-nu-adidas-run-cru-sweatshirt-dq1923-mau-xam-size-s-61a725d58d29f-01122021143549.webp','1725528696866_ao-dai-tay-nu-adidas-run-cru-sweatshirt-dq1923-mau-xam-size-s-61a725d58d29f-01122021143549.webp','2024-09-05 16:31:36.869943',34),(96,'2024-09-05 16:31:36.874134','image/webp','uploads/1725528696872_ao-dai-tay-nu-adidas-run-cru-sweatshirt-dq1923-mau-xam-size-s-61a725d597e92-01122021143549.webp','1725528696872_ao-dai-tay-nu-adidas-run-cru-sweatshirt-dq1923-mau-xam-size-s-61a725d597e92-01122021143549.webp','2024-09-05 16:31:36.874134',34),(97,'2024-09-05 16:31:36.876593','image/webp','uploads/1725528696875_ao-dai-tay-nu-adidas-run-cru-sweatshirt-dq1923-mau-xam-size-s-61a725d58813e-01122021143549.webp','1725528696875_ao-dai-tay-nu-adidas-run-cru-sweatshirt-dq1923-mau-xam-size-s-61a725d58813e-01122021143549.webp','2024-09-05 16:31:36.876593',34),(98,'2024-09-05 16:50:24.145432','image/webp','uploads/1725529824143_ao-thun-nu-adidas-originals-3-stripe-slim-tshirt-clay-strata-ic5464-mau-cam-dat-size-s-66bc53e26e384-14082024135114.webp','1725529824143_ao-thun-nu-adidas-originals-3-stripe-slim-tshirt-clay-strata-ic5464-mau-cam-dat-size-s-66bc53e26e384-14082024135114.webp','2024-09-05 16:50:24.145432',35),(99,'2024-09-05 16:50:24.147433','image/webp','uploads/1725529824146_ao-thun-nu-adidas-originals-3-stripe-slim-tshirt-clay-strata-ic5464-mau-cam-dat-size-s-66bc53e26ec4c-14082024135114.webp','1725529824146_ao-thun-nu-adidas-originals-3-stripe-slim-tshirt-clay-strata-ic5464-mau-cam-dat-size-s-66bc53e26ec4c-14082024135114.webp','2024-09-05 16:50:24.147433',35),(100,'2024-09-05 16:50:24.148805','image/webp','uploads/1725529824147_ao-thun-nu-adidas-originals-3-stripe-slim-tshirt-clay-strata-ic5464-mau-cam-dat-size-s-66bc53e26f006-14082024135114.webp','1725529824147_ao-thun-nu-adidas-originals-3-stripe-slim-tshirt-clay-strata-ic5464-mau-cam-dat-size-s-66bc53e26f006-14082024135114.webp','2024-09-05 16:50:24.148805',35),(101,'2024-09-05 16:56:35.313295','image/webp','uploads/1725530195312_vay-adidas-adicolor-70s-v-neck-dress-ik7860-mau-hong-size-xs-667d1838ac07e-27062024144352.webp','1725530195312_vay-adidas-adicolor-70s-v-neck-dress-ik7860-mau-hong-size-xs-667d1838ac07e-27062024144352.webp','2024-09-05 16:56:35.314009',36),(102,'2024-09-05 16:56:35.315005','image/webp','uploads/1725530195314_vay-adidas-adicolor-70s-v-neck-dress-ik7860-mau-hong-size-xs-667d1838aca71-27062024144352.webp','1725530195314_vay-adidas-adicolor-70s-v-neck-dress-ik7860-mau-hong-size-xs-667d1838aca71-27062024144352.webp','2024-09-05 16:56:35.315005',36),(103,'2024-09-05 16:56:35.316004','image/webp','uploads/1725530195315_vay-adidas-adicolor-70s-v-neck-dress-ik7861-mau-den-size-m-667d0338e1cbb-27062024131416.webp','1725530195315_vay-adidas-adicolor-70s-v-neck-dress-ik7861-mau-den-size-m-667d0338e1cbb-27062024131416.webp','2024-09-05 16:56:35.316004',36),(104,'2024-09-05 16:56:35.321698','image/webp','uploads/1725530195316_vay-adidas-adicolor-70s-v-neck-dress-ik7862-mau-be-size-xs-667d1acaa6da8-27062024145450.webp','1725530195316_vay-adidas-adicolor-70s-v-neck-dress-ik7862-mau-be-size-xs-667d1acaa6da8-27062024145450.webp','2024-09-05 16:56:35.321698',36),(105,'2024-09-05 16:56:35.322696','image/webp','uploads/1725530195321_vay-adidas-adicolor-70s-v-neck-dress-ik7862-mau-be-size-xs-667d1acaa646f-27062024145450.webp','1725530195321_vay-adidas-adicolor-70s-v-neck-dress-ik7862-mau-be-size-xs-667d1acaa646f-27062024145450.webp','2024-09-05 16:56:35.322696',36),(106,'2024-09-05 17:00:57.353328','image/webp','uploads/1725530457351_bo-the-thao-adidas-adicolor-classics-firebird-track-top-mau-den-be-65e15d36344ec-01032024114438.webp','1725530457351_bo-the-thao-adidas-adicolor-classics-firebird-track-top-mau-den-be-65e15d36344ec-01032024114438.webp','2024-09-05 17:00:57.353328',37),(107,'2024-09-05 17:03:41.334668','image/webp','uploads/1725530621333_bo-the-thao-adidas-training-essential-pique-3-stripes-mau-xanh-la-size-xs-664c6ae8b2904-21052024163536.webp','1725530621333_bo-the-thao-adidas-training-essential-pique-3-stripes-mau-xanh-la-size-xs-664c6ae8b2904-21052024163536.webp','2024-09-05 17:03:41.334668',38),(108,'2024-09-05 17:15:57.834460','image/jpeg','uploads/1725531357832_sg-11134201-22100-mkn6r3joryivd9.jfif','1725531357832_sg-11134201-22100-mkn6r3joryivd9.jfif','2024-09-05 17:15:57.834460',39),(109,'2024-09-05 17:15:57.836621','image/jpeg','uploads/1725531357834_sg-11134201-22100-9aoew7fnryive2.jfif','1725531357834_sg-11134201-22100-9aoew7fnryive2.jfif','2024-09-05 17:15:57.836621',39),(110,'2024-09-05 17:15:57.838888','image/jpeg','uploads/1725531357836_sg-11134201-22100-68eidocnryiv45.jfif','1725531357836_sg-11134201-22100-68eidocnryiv45.jfif','2024-09-05 17:15:57.838888',39),(111,'2024-09-05 17:19:57.633823','image/jpeg','uploads/1725531597631_vn-11134207-7r98o-lywhz7r917ilad.jfif','1725531597631_vn-11134207-7r98o-lywhz7r917ilad.jfif','2024-09-05 17:19:57.633823',40),(112,'2024-09-05 17:23:03.463412','image/webp','uploads/1725531783461_chan-vay-nu-givenchy-black-with-silver-logo-monogram-printed-h13190-09b-mau-den-65129721c8c9a-26092023153233.webp','1725531783461_chan-vay-nu-givenchy-black-with-silver-logo-monogram-printed-h13190-09b-mau-den-65129721c8c9a-26092023153233.webp','2024-09-05 17:23:03.463412',41),(113,'2024-09-05 17:30:45.654924','image/jpeg','uploads/1725532245653_vn-11134201-7r98o-llx5e4seq09r1f.jfif','1725532245653_vn-11134201-7r98o-llx5e4seq09r1f.jfif','2024-09-05 17:30:45.654924',42),(114,'2024-09-05 17:30:45.658202','image/jpeg','uploads/1725532245654_vn-11134201-7r98o-llx5e8xyn5jzd0.jfif','1725532245654_vn-11134201-7r98o-llx5e8xyn5jzd0.jfif','2024-09-05 17:30:45.658202',42),(115,'2024-09-05 17:33:07.718292','image/webp','uploads/1725532387718_ao-phong-nu-givenchy-red-with-logo-printed-tshirt-h25447991-mau-do-64d4b3d0cd917-10082023165424.webp','1725532387718_ao-phong-nu-givenchy-red-with-logo-printed-tshirt-h25447991-mau-do-64d4b3d0cd917-10082023165424.webp','2024-09-05 17:33:07.718292',43),(116,'2024-09-05 17:33:07.719515','image/webp','uploads/1725532387719_ao-phong-nu-givenchy-red-with-logo-printed-tshirt-h25447991-mau-do-64d4b3d102323-10082023165425.webp','1725532387719_ao-phong-nu-givenchy-red-with-logo-printed-tshirt-h25447991-mau-do-64d4b3d102323-10082023165425.webp','2024-09-05 17:33:07.719515',43),(117,'2024-09-05 23:35:13.760365','image/png','uploads/1725554113757_1701705416077_IMG_3145.PNG','1725554113757_1701705416077_IMG_3145.PNG','2024-09-05 23:35:13.760365',44),(118,'2024-09-05 23:35:13.762458','image/png','uploads/1725554113760_1701705416083_IMG_3146.PNG','1725554113760_1701705416083_IMG_3146.PNG','2024-09-05 23:35:13.762458',44),(119,'2024-09-05 23:40:26.627538','image/webp','uploads/1725554426626_85a7f7ad-2c99-4918-b068-d8a56b077a8b.webp','1725554426626_85a7f7ad-2c99-4918-b068-d8a56b077a8b.webp','2024-09-05 23:40:26.627538',45),(120,'2024-09-05 23:40:26.628588','image/webp','uploads/1725554426627_z4623343581348-d7570b0aab92805df6807366e748ddc5.webp','1725554426627_z4623343581348-d7570b0aab92805df6807366e748ddc5.webp','2024-09-05 23:40:26.628588',45),(121,'2024-09-05 23:48:09.775741','image/webp','uploads/1725554889775_97ccb408-55f5-480b-b251-e57792cd63ff-jpeg-1713937038133.webp','1725554889775_97ccb408-55f5-480b-b251-e57792cd63ff-jpeg-1713937038133.webp','2024-09-05 23:48:09.775741',46),(122,'2024-09-05 23:48:09.777736','image/webp','uploads/1725554889776_a7303236.webp','1725554889776_a7303236.webp','2024-09-05 23:48:09.777736',46),(123,'2024-09-05 23:48:09.779730','image/webp','uploads/1725554889777_a7303240.webp','1725554889777_a7303240.webp','2024-09-05 23:48:09.779730',46),(124,'2024-09-05 23:55:26.200584','image/webp','uploads/1725555326199_9859643e-1209-4202-a0b0-6bf77d74a0a4.webp','1725555326199_9859643e-1209-4202-a0b0-6bf77d74a0a4.webp','2024-09-05 23:55:26.200584',47),(125,'2024-09-05 23:55:26.201582','image/webp','uploads/1725555326200_abc3a562-e610-47de-8639-40d5b72bef75.webp','1725555326200_abc3a562-e610-47de-8639-40d5b72bef75.webp','2024-09-05 23:55:26.201582',47),(126,'2024-09-05 23:58:43.286680','image/webp','uploads/1725555523285_atys-8-4eb087b5-29dc-442d-989b-50a975fe57b0.webp','1725555523285_atys-8-4eb087b5-29dc-442d-989b-50a975fe57b0.webp','2024-09-05 23:58:43.286680',48),(127,'2024-09-05 23:58:43.288755','image/webp','uploads/1725555523287_a7302282.webp','1725555523287_a7302282.webp','2024-09-05 23:58:43.288755',48),(128,'2024-09-05 23:58:43.289718','image/webp','uploads/1725555523288_a7302285.webp','1725555523288_a7302285.webp','2024-09-05 23:58:43.289718',48),(129,'2024-09-13 16:52:40.658563','image/jpeg','uploads/1726221160636_1701708919010_7(1).jpg','1726221160636_1701708919010_7(1).jpg','2024-09-13 16:52:40.658563',49),(130,'2024-09-24 04:26:31.929252','image/jpeg','uploads/1727126791919_1701708919011_7.jpg','1727126791919_1701708919011_7.jpg','2024-09-24 04:26:31.929252',50),(131,'2024-09-24 04:26:31.936292','image/jpeg','uploads/1727126791936_1701708919010_7(1).jpg','1727126791936_1701708919010_7(1).jpg','2024-09-24 04:26:31.936292',50);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int NOT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'CL1','Gấm',0,0x00),(2,'CL2','Lụa (Silk)',0,0x00),(3,'CL3','Hoa Văn (Jacquard)',0,0x00),(4,'CL4','Cotton',0,0x00),(5,'CL5','Kaki',0,0x00),(6,'CL6','Kate',0,0x00),(7,'CL7','Jeans',0,0x00),(8,'CL8','Denim',0,0x00),(9,'CL9','Lanh (Linen)',0,0x00),(10,'CL10','Nỉ (Flet)',0,0x00),(11,'CL11','Len (Wool)',0,0x00),(12,'CL12','Polyester (PE)',0,0x00),(13,'CL13','Voan (Voile)',0,0x00),(14,'CL14','Thô (Canvas)',0,0x00),(15,'CL15','Ren (Lance)',0,0x00),(16,'CL16','Đũi (Tussar/Tussah)',0,0x00),(17,'CL17','Bamboo',0,0x00),(18,'CL18','Nhung (Velvet)',0,0x00),(19,'CL19','Polo',0,0x00),(20,'CL20','Thun Lạnh (Cold Spandex)',0,0x00),(21,'CL21','Dù',1,0x00);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `status_exchange` int DEFAULT NULL,
  `bill_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhdc173udjyonn4mt1lgt1x2ce` (`bill_id`),
  CONSTRAINT `FKhdc173udjyonn4mt1lgt1x2ce` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (6,'2.1E7','Xu1BaIFi','1','2024-09-13 07:52:32.954367',0,5),(8,'2.1E7','u3KoF6vh','1','2024-09-13 09:57:36.938618',0,6),(17,'6000000.0','95PXj71n','1','2024-09-19 01:59:25.232350',0,8),(18,'6000000','55025045','0',NULL,0,NULL),(19,'6000000.0','zf7Wr4Ys','1','2024-09-24 04:23:10.181905',0,9),(20,'21000000','81362576','1','2024-10-05 09:23:32.455308',0,10),(21,'1.9E7','0yEUOeFD','1','2024-10-05 09:24:17.256819',0,11),(22,'2.1E7','L2OYNyxw','1','2024-10-11 23:31:39.636331',0,12),(23,'625000.0','0IxjCbjG','1','2024-10-11 23:56:44.142232',0,13);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'TIEN_MAT',1),(3,'CHUYEN_KHOAN',1),(4,'THE',1);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `delete_flag` bit(1) NOT NULL,
  `gender` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `price` float NOT NULL,
  `status` int NOT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `material_id` bigint DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FKs6cydsualtsrprvlf2bb3lcam` (`brand_id`),
  KEY `FKw04fq456sc4tk26tnbhvr59o` (`material_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKs6cydsualtsrprvlf2bb3lcam` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `FKw04fq456sc4tk26tnbhvr59o` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (9,'SP1','2024-09-02 14:51:32.539357',0x00,1,'Áo Phông Dior Relaxed-Fit In Black Logo Embroidered',21000000,1,'2024-09-02 14:51:32.539357',3,5,4,'Áo Phông Dior Relaxed-Fit In Black Logo Embroidered 293J659A0554 Màu Đen là mẫu áo dành cho nam đến từ thương hiệu Dior. Chiếc áo sở hữu gam màu thanh lịch cùng chất liệu cao cấp, mang đến cho người sở hữu vẻ đẹp của sự đẳng cấp, sang trọng và trẻ trung.'),(10,'SP2','2024-09-02 14:34:18.365723',0x00,1,'Áo Hoodie Nam Dior Black With CD Logo Embroidered',24000000,1,'2024-09-02 14:34:18.365723',3,3,10,'Áo Hoodie Nam Dior Black With CD Logo Embroidered 113J698A0531/989 Màu Đen là sản phẩm đến từ thương hiệu Dior nổi tiếng của Pháp. Áo thiết kế thời trang giúp các chàng trai toát lên vẻ trẻ trung, năng động và tràn đầy năng lượng.'),(11,'SP3','2024-09-02 14:49:58.332259',0x00,1,'Áo Sơ Mi Nam Dior Embroidered',19000000,1,'2024-09-02 14:49:58.332259',3,10,4,'Áo Sơ Mi Nam Dior Embroidered'),(12,'SP4','2024-09-02 17:16:07.361930',0x00,1,'Quần Dior Cao Cấp Mới Thu Đông',10000000,1,'2024-09-02 17:16:07.361930',3,6,8,'Dior Cao Cấp Mới Thu Đông Đơn Giản Châu Âu Cao Cấp Hợp Thời Trang Thương Hiệu Quần Jean Thủ Công Rửa Hàng Châu Âu S'),(13,'SP5','2024-09-02 17:18:15.285663',0x00,1,'Quần tây âu thêu dior cao cấp',8000000,1,'2024-09-02 17:18:15.285663',3,6,5,'- Quần âu nam cao cấp,,hàng đẹp,phù hợp với học sinh,,người đi làm.\r\n- Đường may tỉ mỉ, sắc nét, chỉnh chu.\r\n- Thiết kế hiện đại, trẻ trung, thời trang.'),(14,'SP6','2024-09-02 15:14:25.779232',0x00,1,'Áo Khoác Nam Burberry With Gold Zip',19000000,1,'2024-09-02 15:14:25.779232',7,11,12,'Áo Khoác Nam Burberry With Gold Ziplà chiếc áo dành cho nam được thiết kế vô cùng thời trang đến từ thương hiệu Burberry nổi tiếng. Sở hữu gam màu thanh lịch cùng chất liệu cao cấp áo mang lại cảm giác vô cùng thoải mái cho người mặc.'),(15,'SP7','2024-09-02 16:10:54.316476',0x00,3,'Áo Len Burberry Mermaid-Intarsia',11000000,1,'2024-09-02 16:10:54.316476',7,1,11,''),(16,'SP8','2024-09-02 16:18:57.223999',0x00,3,'Áo Khoác Burberry 2 Lớp Da Dày Dặn Chữ Thêu',13000000,1,'2024-09-02 16:18:57.223999',7,11,17,'Áo Khoác Burberry 2 Lớp Da Dày Dặn Chữ Thêu, Áo Khoác Gió Nam Nữ Burberry Phong Cách Trẻ Trung Lịch Lãm .'),(17,'SP9','2024-09-02 16:28:35.509007',0x00,2,'Váy sơ mi ngắn tay kẻ sọc thắt eo nữ cao cấp Burberry BBR thiết kế thanh lịch',6000000,1,'2024-09-02 16:28:35.509007',7,4,4,'Shop cam kết đem đến những sản phẩm chất lượng , hình ảnh thật do shop tự chụp 100%\r\nChúc quý khách có một trải nghiệm mua sắm tuyệt vời ạ!'),(18,'SP10','2024-09-02 17:20:42.642566',0x00,1,'Quần Shorts Burberry Vintage',7000000,1,'2024-09-02 17:20:42.642566',7,12,4,'Quần Shorts Burberry Vintage sở hữu kiểu dáng trẻ trung đến từ thương hiệu Burberry nổi tiếng của Anh. Quần Shorts Burberry Vintage ược làm từ chất liệu vải cao cấp với khả năng thấm hút mồ hôi tốt, mang đến cảm giác thoải mái cho người sử dụng.'),(19,'SP11','2024-09-02 16:45:00.908329',0x00,1,'Áo sơ mi - AR240056DT',690000,1,'2024-09-02 16:45:00.908329',2,10,12,'Áo sơ mi dài tay, kiểu dáng Regular Fit dễ mặc, hợp form dáng.\r\nMàu sắc và kiểu dáng trẻ trung, kiểu dáng hiện đại, dễ phối đồ.'),(20,'SP12','2024-09-02 16:48:33.602934',0x00,1,'Áo Polo - APV243608',650000,1,'2024-09-02 16:48:33.602934',2,2,20,'Áo Polo kiểu dáng body fit, tôn dáng người mặc.\r\nMàu sắc trung tính, dễ phối đồ.'),(21,'SP13','2024-09-02 17:19:28.343955',0x00,1,'Quần jeans - QJS230156',625000,1,'2024-09-02 17:19:28.343955',2,6,4,'Quần jeans dáng slimfit ôm dáng người mặc.\r\nMàu sắc trẻ trung dễ phối đồ.'),(22,'SP14','2024-09-02 17:09:43.009164',0x00,1,'Áo len - ALD220772',545000,1,'2024-09-02 17:09:43.009164',2,1,4,'Màu sắc thanh lịch, dễ phối đồ. \r\n\r\nKiểu dáng regular tôn dáng.'),(23,'SP15','2024-09-02 17:15:00.318298',0x00,1,'Quần short - SV242436',570000,1,'2024-09-02 17:15:00.318298',2,12,12,'Màu sắc trung tính dễ phối đồ. \r\nDáng trendy tôn dáng người mặc.'),(24,'SP16','2024-09-03 23:35:49.211169',0x00,2,'Áo Croptop Nữ Gucci Equestrian Jacquard',18000000,1,'2024-09-03 23:35:49.211169',6,8,4,'Áo Croptop Nữ Gucci Equestrian Jacquard  có thiết kế đẹp mắt đến từ thương hiệu Gucci của Ý. Áo sở hữu gam màu thanh lịch, trẻ trung cùng kiểu dáng sành điệu nên được rất nhiều các tín đồ thời trang yêu thích.'),(25,'SP17','2024-09-03 23:39:06.907310',0x00,2,'Váy Gucci GG Jacquard Dress',23000000,1,'2024-09-03 23:39:06.907310',6,4,4,'Váy Gucci GG Jacquard Dress  là chiếc váy cao cấp đến từ thương hiệu Gucci nổi tiếng Ý. Sở hữu gam màu thanh lịch, cùng kiểu dáng đơn giản, chiếc váy cho người mặc thêm trẻ trung và năng động hơn.'),(26,'SP18','2024-09-03 23:43:09.282872',0x00,2,'Áo Phông Nữ Gucci Navy With GG Lame',22000000,1,'2024-09-03 23:43:09.282872',6,5,4,'Áo Phông Nữ Gucci Navy With GG Lame  là chiếc áo thời trang dành cho nữ đến từ thương hiệu Gucci nổi tiếng. Mẫu áo thiết kế hiện đại, chất vải mềm mại thoáng khí giúp người dùng luôn cảm thấy thoải mái khi mặc đi học hay đi chơi với bạn bè.'),(27,'SP19','2024-09-03 23:48:06.293679',0x00,1,'Áo Khoác Nam Gucci GG Jacquard',32500000,1,'2024-09-03 23:48:06.293679',6,11,4,'Áo Khoác Nam Gucci GG Jacquard là chiếc áo thời trang dành cho nam đến từ thương hiệu Gucci nổi tiếng. Mẫu áo đẹp mắt hấp dẫn các tín đồ sành điệu nhờ vào vẻ ngoài thời thượng và không bao giờ lỗi mốt của mình.'),(28,'SP20','2024-09-03 23:53:24.359210',0x00,3,'Áo Phông Unisex Gucci Tshirt',13000000,1,'2024-09-03 23:53:24.359210',6,5,4,'Áo Phông Gucci Tshirt In White là chiếc áo thời trang đến từ thương hiệu Gucci nổi tiếng. Mẫu áo thiết kế hiện đại, chất vải mềm mại thoáng khí giúp người dùng luôn cảm thấy thoải mái khi mặc đi học hay đi chơi với bạn bè.'),(29,'SP21','2024-09-04 00:13:14.357560',0x00,2,'Áo Sơ Mi Nữ Louis Vuitton LV Dress Shirt',17000000,1,'2024-09-04 00:13:14.357560',4,10,4,'Áo Sơ Mi Nữ Louis Vuitton LV Dress Shirt  là một chiếc áo thời trang đến từ thương hiệu cao cấp Louis Vuitton nổi tiếng của Pháp. Áo được làm từ chất liệu cotton, mang lại sự thoải mái cho người mặc.'),(30,'SP22','2024-09-04 00:21:29.272498',0x00,2,'Áo Hoodie Nữ Louis Vuitton LV Monogram',58950000,1,'2024-09-04 00:21:29.272498',4,3,1,'Áo Hoodie Nữ Louis Vuitton LV Monogram là chiếc áo thời trang đến từ thương hiệu thời trang Louis Vuitton nổi tiếng của Pháp. Thiết kế này giúp các chàng trai trở nên trẻ trung, năng động và tràn đầy năng lượng.'),(31,'SP23','2024-09-04 00:29:44.971468',0x00,1,'Áo Phông Nam Louis Vuitton LV Red',30560000,1,'2024-09-04 00:29:44.971468',4,5,4,'Áo Phông Nam Louis Vuitton LV Red là một chiếc áo đến từ thương hiệu Louis Vuitton nổi tiếng của Pháp. Áo có thiết kế thời trang, chất vải mềm mịn thấm hút tốt, mang lại sự thoải mái cho người mặc.'),(32,'SP24','2024-09-04 00:42:37.305374',0x00,1,'Quần đùi nam lv, vải dệt quần short nam hottrend 2024',10000000,1,'2024-09-04 00:42:37.305374',4,9,4,''),(33,'SP25','2024-09-04 00:46:57.321443',0x00,3,'Áo Hoodie Louis Vuitton LV 1AF382',32000000,1,'2024-09-04 00:46:57.321443',4,3,4,'Áo Hoodie Louis Vuitton LV 1AF382 là chiếc áo thời trang đến từ thương hiệu thời trang Louis Vuitton nổi tiếng của Pháp. Thiết kế này giúp các chàng trai trở nên trẻ trung, năng động và tràn đầy năng lượng.'),(34,'SP26','2024-09-05 16:31:37.034878',0x00,2,'Áo Dài Tay Nữ Adidas Run Cru Sweatshirt',900000,1,'2024-09-05 16:31:37.034878',5,7,12,'Áo Dài Tay Nữ Adidas Run Cru Sweatshirt là một chiếc áo dài tay đến từ thương hiệu Adidas nổi tiếng của Đức. Mang vẻ đẹp trẻ trung nhưng không kém phần lịch lãm, Adidas Run Cru Sweatshirt đã chiếm được cảm tình của phái mạnh.'),(35,'SP27','2024-09-05 16:50:24.200033',0x00,2,'Áo Thun Nữ Adidas Originals 3-Stripe Slim Tshirt Clay Strata',1150000,1,'2024-09-05 16:50:24.200033',5,13,4,'Áo Thun Nữ Adidas Originals 3-Stripe Slim Tshirt Clay Strata à mẫu áo phông thể thao nữ đến từ thương hiệu Adidas nổi tiếng của Đức. Chiếc áo thiết kế kiểu dáng đơn giản, năng động cùng chất liệu cao cấp mang đến cho người dùng sự thoải mái và phong cách trẻ trung.'),(36,'SP28','2024-09-05 16:56:35.463655',0x00,2,'Váy Adidas Adicolor 70S V-Neck Dress',1350000,1,'2024-09-05 16:56:35.463655',5,4,4,'Váy Adidas Adicolor 70S V-Neck Dress được thiết kế kiểu dáng trẻ trung, hiện đại đến từ thương hiệu Adidas nổi tiếng. Váy được làm từ chất vải cao cấp mang lại cảm giác thoải mái, linh hoạt khi di chuyển.'),(37,'SP29','2024-09-05 17:00:57.384252',0x00,3,'Bộ Thể Thao Adidas Adicolor Classics Firebird Track Top',2800000,1,'2024-09-05 17:00:57.384252',5,14,18,'Bộ Thể Thao Adidas Adicolor Classics Firebird Track Top có thiết kế đẹp mắt đến từ thương hiệu Adidas nổi tiếng. Set đồ bộ dành cho phái mạnh này hiện rất được ưa chuộng nhờ vào thiết kế mang đậm màu sắc của sự năng động và trẻ trung.'),(38,'SP30','2024-09-05 17:03:41.368829',0x00,3,'Bộ Thể Thao Adidas Training Essential Pique 3-Stripes',1990000,1,'2024-09-05 17:03:41.368829',5,15,12,'Bộ Thể Thao Adidas Training Essential Pique 3-Stripes có thiết kế đẹp mắt đến từ thương hiệu Adidas nổi tiếng. Bộ thể thao với tông màu hiện đại trẻ trung, cùng chất liệu cao cấp, mang lại sự thoải mái cho người mặc.'),(39,'SP31','2024-09-05 17:15:57.867549',0x00,2,'Givenchy New Letter Logo Áo phông nữ cổ tròn ngắn tay',900000,1,'2024-09-05 17:15:57.868266',10,5,4,'Áo phông hoàn toàn mới \r\nCác thương hiệu thủy triều khác nhau\r\nChúng tôi cam kết mang đến cho bạn những sản phẩm chất lượng tốt nhất với giá tốt nhất.'),(40,'SP32','2024-09-05 17:19:57.645452',0x00,2,'Áo len Givenchy Klinnstoreee',1700000,1,'2024-09-05 17:19:57.645452',10,1,11,'Hàng freesize dưới 75kg bao vừa nha các nàng \r\nNhanh tay đặt hàng để nhận nhiều ưu đãi của shop các nàng ơi 💕'),(41,'SP33','2024-09-05 17:23:03.483521',0x00,2,'Chân Váy Nữ Givenchy Black With Silver Logo Monogram Printed',2300000,1,'2024-09-05 17:23:03.483521',10,16,10,'Chân Váy Nữ Givenchy Black With Silver Logo Monogram Printed  được thiết kế kiểu dáng trẻ trung, hiện đại đến từ thương hiệu Givenchy nổi tiếng. Chân váy Givenchy được làm từ chất vải cao cấp mang lại cảm giác thoải mái nhất cho người mặc.'),(42,'SP34','2024-09-05 17:30:45.699871',0x00,3,'Áo phông Givenchy Unisex cao cấp',1500000,1,'2024-09-05 17:30:45.699871',10,5,4,'Áo phông Givenchy Unisex cao cấp đến từ thương hiệu Givenchy nổi tiếng của Pháp. Áo Givenchy được các chàng trai yêu thích bởi kiểu dáng trẻ trung hiện đại, cùng chất vải cao cấp mềm mại, thoải mái trong các hoạt động hàng ngày.'),(43,'SP35','2024-09-05 17:33:07.757964',0x00,3,'Áo Phông Givenchy Red With Logo Printed Tshirt',3900000,1,'2024-09-05 17:33:07.757964',10,5,4,'Áo Phông Givenchy Red With Logo Printed Tshirt  đến từ thương hiệu Givenchy nổi tiếng của Pháp. Mẫu áo Givenchy Red With Logo Printed Tshirt được làm từ chất liệu cao cấp, mang lại cảm giác thoải mái cho người sử dụng.'),(44,'SP36','2024-09-05 23:35:13.785998',0x00,3,'ATYS KNIT COTTON CARDIGAN',570000,1,'2024-09-05 23:35:13.785998',1,1,4,'𝐊𝐍𝐈𝐓 𝐂𝐎𝐓𝐓𝐎𝐍 𝐂𝐀𝐑𝐃𝐈𝐆𝐀𝐍 Sau một năm tìm hiểu kỹ càng về chất liệu chúng mình chính thức cho ra mắt mẫu KNIT COTTON CARDIGAN với chất liệu được dệt bằng sợi cotton thích hợp cho các bạn vào các mùa trong năm . Đặc biệt không gây khó chịu cho da khi mang , các chi tiết được thêu bằng kĩ thuật số sắc nét đến từng chi tiết .'),(45,'SP37','2024-09-05 23:40:26.653744',0x00,3,'ATYS HOMELAND KNIT COTTON CARDIGAN T-SHIRT',590000,1,'2024-09-05 23:40:26.653744',1,5,4,'Một trong những sản phẩm mà 𝐀𝐓𝐘𝐒 ấp ủ từ rất lâu đến nay mới hoàn thiện chỉn chu nhất để ra mắt. Khác với các T- shirt trước đó, lần này 𝐀𝐓𝐘𝐒 lựa chọn chất liệu len dệt phù hợp mặc vào tất cả các mùa trong năm và đặc biệt không gây khó chịu cho da khi mặc.'),(46,'SP38','2024-09-05 23:48:09.798569',0x00,3,'ATYS TRI-COLOR ZIPPED KNIT COTTON BLOUSON JACKET',1200000,1,'2024-09-05 23:48:09.798569',1,11,4,'ATYS TRI-COLOR ZIPPED KNIT COTTON BLOUSON JACKET hiên bản thuộc dòng TRICOLORđược ATYS ấp ủ khá lâu để đi đến hoàn thiện cuối cùng. Với form blouson hoàn toàn mới mà bạn có thể sẽ chưa thấy ở bất kỳ sản phẩm nào. Các chi tiết và sản phẩm đều được dệt hoàn toàn với chất len dệt cotton 100% mang lại cảm giác thoáng mát và thoải mái khi mặc.'),(47,'SP39','2024-09-05 23:55:26.222064',0x00,3,'ATYS BILLOW PATTERN WINDBREAKER JACKET',970000,1,'2024-09-05 23:55:26.222064',1,11,21,'Một trong những điểm nhấn nổi bật của ATYS BILLOW PATTERN WINDBREAKER JACKET là túi được đặt ở vị trí tiện lợi để bạn có thể lưu trữ các vật phẩm nhỏ như điện thoại di động, ví tiền, hoặc chìa khóa Ngoài ra kỹ thuật may chắc chắn và phối mảng màu tinh tế không chỉ đảm bảo độ bền mà còn tạo phối màu lạ đẹp mắt.'),(48,'SP40','2024-09-05 23:58:43.299644',0x00,1,'ATYS POINTELLE KNIT SHORT',500000,1,'2024-09-05 23:58:43.299644',1,12,4,'ATYS POINTELLE KNIT SHORT Vẫn là chất len cotton quen thuộc, có độ dày vừa phải phù hợp mặc tất cả các mùa trong năm. Bên cạnh đó còn kết hợp kỹ thuật dệt len tạo hình lưới đan thoáng mát giúp bạn thoải mái khi hoạt động ngoài trời cả ngày dài.'),(49,'SP41','2024-09-13 16:52:40.955487',0x01,1,'áo dài việt nam',10000,1,'2024-09-13 16:52:40.955487',1,7,1,''),(50,'SP42','2024-09-24 04:26:32.197532',0x00,2,'áo dài',456000,1,'2024-09-24 04:26:32.198531',1,7,1,'đẹp');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  `color_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `size_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK99vj2np1gk1robp8n6htiweii` (`color_id`),
  KEY `FKcum8u2vfvebmmc4xo8de3k35s` (`size_id`),
  KEY `FKilxoi77ctyin6jn9robktb16c` (`product_id`),
  CONSTRAINT `FK99vj2np1gk1robp8n6htiweii` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `FKcum8u2vfvebmmc4xo8de3k35s` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `FKilxoi77ctyin6jn9robktb16c` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES (19,'393018775472',21000000,7,3,9,1),(20,'217152442235',21000000,9,3,9,5),(21,'112779056975',21000000,10,3,9,2),(22,'386310611435',24000000,10,3,10,1),(23,'774086783595',24000000,10,3,10,5),(24,'628838971149',24000000,10,3,10,2),(25,'554160904061',19000000,9,4,11,1),(26,'223134346363',19000000,10,4,11,5),(27,'448622669865',19000000,10,4,11,2),(28,'559655600570',10000000,10,9,12,6),(29,'751221434451',10000000,10,9,12,7),(30,'714756137771',8000000,10,3,13,6),(31,'790591792390',8000000,10,3,13,7),(32,'308312153586',19000000,10,3,14,5),(33,'991784609665',19000000,10,3,14,2),(34,'151415563196',19000000,10,3,14,4),(35,'803199804675',11000000,10,7,15,3),(36,'301579148769',11000000,10,7,15,1),(37,'217146708162',13000000,10,3,16,1),(38,'745919903430',13000000,10,3,16,5),(39,'871342083533',13000000,10,4,16,2),(40,'555069796510',13000000,10,4,16,3),(41,'496701270725',6000000,10,10,17,3),(42,'195527182933',6000000,9,10,17,1),(43,'116084717712',6000000,10,10,17,5),(44,'692813257159',7000000,10,10,18,6),(45,'996628128348',690000,10,2,19,2),(46,'764288022825',690000,10,2,19,4),(47,'994323531072',650000,10,4,20,1),(48,'604577287339',650000,10,4,20,5),(49,'464301929358',650000,10,4,20,2),(50,'888609494030',625000,10,2,21,6),(51,'779852436879',625000,10,2,21,7),(52,'397333325572',625000,9,2,21,8),(53,'932258769693',545000,10,11,22,3),(54,'646896691571',545000,10,11,22,1),(55,'536506949269',570000,10,10,23,6),(56,'319845171870',570000,10,10,23,7),(57,'163380954687',570000,10,10,23,8),(58,'212746661228',570000,10,10,23,9),(59,'668908339012',10000000,10,9,12,8),(60,'227830131873',10000000,10,9,12,9),(61,'139116373494',8000000,10,3,13,8),(62,'835898214558',625000,10,2,21,9),(63,'679463976938',625000,10,2,21,10),(64,'410636932481',7000000,10,10,18,7),(65,'284309649883',7000000,10,10,18,8),(66,'372199676643',18000000,10,4,24,3),(67,'711803803470',18000000,10,4,24,1),(68,'447733680529',23000000,10,2,25,3),(69,'788062638699',23000000,10,2,25,1),(70,'852634658741',23000000,10,2,25,5),(71,'724246581594',22000000,10,2,26,3),(72,'357319146260',22000000,10,2,26,1),(73,'458796055064',22000000,10,2,26,5),(74,'971202912115',32500000,10,2,27,1),(75,'305330724059',32500000,10,2,27,5),(76,'331927372607',13000000,10,4,28,3),(77,'847626312227',13000000,10,4,28,1),(78,'343982187747',13000000,10,4,28,5),(79,'407151317366',13000000,10,4,28,2),(80,'896429800804',17000000,10,4,29,3),(81,'324916890873',17000000,10,4,29,1),(82,'159160712111',17000000,10,4,29,5),(83,'887469987667',58950000,10,3,30,1),(84,'566748042062',58950000,10,3,30,5),(85,'574781529317',30560000,10,1,31,1),(86,'764946383471',30560000,10,1,31,5),(87,'289355272778',30560000,10,1,31,2),(88,'903871886952',10000000,10,2,32,6),(89,'805038846028',10000000,10,3,32,6),(90,'238733577073',10000000,10,2,32,7),(91,'236984350277',10000000,10,3,32,7),(92,'507456009477',32000000,10,11,33,1),(93,'892529197129',32000000,10,11,33,5),(94,'354578634441',32000000,10,11,33,2),(95,'513738168435',900000,10,11,34,1),(96,'999635500902',900000,10,11,34,5),(97,'979500352750',900000,10,11,34,2),(98,'867484313540',1150000,10,12,35,3),(99,'343861652600',1150000,10,12,35,1),(100,'499021069789',1150000,10,12,35,5),(101,'825894908468',1350000,10,5,36,3),(102,'273781258088',1350000,10,5,36,1),(103,'741747612812',1350000,10,5,36,5),(104,'767676413547',1350000,10,3,36,3),(105,'217249780708',1350000,10,3,36,1),(106,'801116814968',1350000,10,3,36,5),(107,'748595837530',1350000,10,4,36,3),(108,'291590542575',1350000,10,4,36,1),(109,'360715304571',1350000,10,4,36,5),(110,'603533173045',2800000,10,3,37,3),(111,'603947281465',2800000,10,3,37,1),(112,'110807694446',2800000,10,3,37,5),(113,'106176367238',1990000,10,2,38,3),(114,'936172775294',1990000,10,2,38,1),(115,'742176666119',1990000,10,2,38,5),(116,'274902459716',900000,10,4,39,1),(117,'698617040729',900000,10,5,39,1),(118,'557321475729',900000,10,3,39,1),(119,'755403958432',1700000,20,3,40,14),(120,'150387980550',2300000,10,3,41,3),(121,'281116811050',2300000,10,3,41,1),(122,'550194770354',1500000,10,3,42,1),(123,'656761136511',1500000,10,3,42,5),(124,'751037644011',1500000,10,4,42,1),(125,'842356486206',1500000,10,4,42,5),(126,'868029048334',3900000,10,1,43,1),(127,'292959211555',3900000,10,1,43,5),(128,'311404935569',3900000,10,1,43,2),(129,'446795100095',570000,10,7,44,3),(130,'242526823510',570000,10,7,44,1),(131,'549159203716',570000,10,7,44,5),(132,'263085442824',590000,10,3,45,1),(133,'928013067102',590000,10,3,45,5),(134,'360589969894',590000,10,3,45,2),(135,'323494260851',1200000,10,11,46,1),(136,'570723601362',1200000,10,11,46,5),(137,'749589182077',1200000,10,11,46,2),(138,'194208209557',1200000,10,11,46,4),(139,'687981466488',970000,10,3,47,1),(140,'181872870727',970000,10,3,47,5),(141,'970266241202',970000,10,4,47,1),(142,'551037411615',970000,10,4,47,5),(143,'554780473122',500000,10,3,48,1),(144,'999602725360',500000,10,3,48,5),(145,'845953107807',10000,10,1,49,14),(146,'564962862728',10000,10,2,49,14),(147,'942544481065',10000,10,3,49,14),(148,'630271433625',10000,10,7,49,14),(149,'417356460072',456000,10,1,50,1),(150,'976464167674',456000,10,2,50,5),(151,'503720395303',456000,10,3,50,2);
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;

--
-- Table structure for table `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `closed` bit(1) NOT NULL,
  `discounted_amount` float DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7v5t5uc0v7ww6ro8pxoustui6` (`product_detail_id`),
  CONSTRAINT `FK7v5t5uc0v7ww6ro8pxoustui6` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discount`
--

/*!40000 ALTER TABLE `product_discount` DISABLE KEYS */;
INSERT INTO `product_discount` VALUES (1,0x00,873000,'2024-12-30 07:00:00.000000','2024-09-13 07:00:00.000000',139);
/*!40000 ALTER TABLE `product_discount` ENABLE KEYS */;

--
-- Table structure for table `return_detail`
--

DROP TABLE IF EXISTS `return_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `moment_price_refund` float DEFAULT NULL,
  `quantity_return` int DEFAULT NULL,
  `return_id` bigint DEFAULT NULL,
  `product_detail_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1d0fsi5xn9qokf0vmd0ni28n` (`return_id`),
  KEY `FKkgwtlbgm9ho0njhx5nsq0s589` (`product_detail_id`),
  CONSTRAINT `FK1d0fsi5xn9qokf0vmd0ni28n` FOREIGN KEY (`return_id`) REFERENCES `bill_return` (`id`),
  CONSTRAINT `FKkgwtlbgm9ho0njhx5nsq0s589` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_detail`
--

/*!40000 ALTER TABLE `return_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_detail` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,'ROLE_ADMIN',NULL),(2,NULL,'ROLE_EMPLOYEE',NULL),(3,NULL,'ROLE_USER',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'KC1','M',NULL),(2,'KC2','XL',NULL),(3,'KC3','S',NULL),(4,'KC4','XXL',NULL),(5,'KC5','L',0x00),(6,'KC28','28',0x00),(7,'KC29','29',0x00),(8,'KC30','30',0x00),(9,'KC31','31',0x00),(10,'KC32','32',0x00),(11,'KC33','33',0x00),(12,'KC34','34',0x00),(13,'KC35','35',0x00),(14,'KC000','FreeSize',0x00);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;

--
-- Table structure for table `verification_code`
--

DROP TABLE IF EXISTS `verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `expiry_time` datetime(6) DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn1v88epjv0xug2pr7nwamcboh` (`account_id`),
  CONSTRAINT `FKn1v88epjv0xug2pr7nwamcboh` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_code`
--

/*!40000 ALTER TABLE `verification_code` DISABLE KEYS */;
INSERT INTO `verification_code` VALUES (1,'203094','2024-09-13 16:22:58.295069',6),(2,'223380','2024-09-14 00:02:58.095906',7),(3,'731763','2024-09-14 00:04:02.498837',7);
/*!40000 ALTER TABLE `verification_code` ENABLE KEYS */;

--
-- Dumping routines for database 'db_doan'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 23:59:03
