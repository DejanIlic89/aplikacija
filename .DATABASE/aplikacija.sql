/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP DATABASE IF EXISTS `aplikacija`;
CREATE DATABASE IF NOT EXISTS `aplikacija` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aplikacija`;

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`) VALUES
	(1, 'dejanilic', '18F94E0E8472D0558A8B2C8BC832C7D22B378B50DF8DA2F0AC1F34FB4AF4EC85392B2B41A956153D86E87F7547C1B19BC9808C3F9878202F063399975852165D'),
	(2, 'test_user', '345lkjkl345jk3h4543534kljhklj34h'),
	(3, 'pperic', '6A4C0DC4FCC43BDEA28963DF73E4F8351BCDAE08FDA1516234E8D764AF8178A610BCCA2813D204DFF92A43F0511EB0016C7682CCF7B343D99E01739FC26EF104'),
	(5, 'mmilic', '98591F9BB770809A2AD2FDD3639199D94AAA9DE31F0E767E5FC9EA461F224BE326890EF4CCAEA46A9A1A9F8B854ABF316D14802DC2827AA513DFA3AAEBF099A1'),
	(7, 'admin', 'C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC'),
	(8, 'test', 'EE26B0DD4AF7E749AA1A8EE3C10AE9923F618980772E473F8819A5D4940E0DB27AC185F8A0E1D5F84F88BC887FD67B143732C304CC5FA9AD8E6F57F50028A8FF'),
	(9, 'milan', '45BD33D7FCBCF1057519F17F8601344F227AD54A637ABC64FED606B0944A3C18D4615E188F458F52A532B87A104CC97CA4DD4A6D7808CDBD6CC4821D506DE896');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  `excerpt` varchar(255) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `status` enum('available','visible','hidden') NOT NULL DEFAULT 'available',
  `is_promoted` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `fk_article_category_id` (`category_id`),
  CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_id`, `name`, `category_id`, `excerpt`, `description`, `status`, `is_promoted`, `created_at`) VALUES
	(1, 'ACME HDD 512GB', 8, 'Kratak opis...', 'Detaljan opis...', 'available', 0, '2020-05-05 15:32:21'),
	(2, 'ACME HD11 1024GB', 8, 'Neki kratak tekst 2...', 'Neki malo duzi tekst o proizvodu 2', 'visible', 1, '2020-05-06 23:48:42'),
	(3, 'ACME HD11 2TB', 8, 'Neki kratak tekst...', 'Neki malo duzi tekst o proizvodu', 'available', 0, '2020-05-06 23:51:34');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_feature`;
CREATE TABLE IF NOT EXISTS `article_feature` (
  `article_feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `feature_id` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_feature_id`),
  UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  KEY `fk_article_feature_feature_id` (`feature_id`),
  CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_feature`;
/*!40000 ALTER TABLE `article_feature` DISABLE KEYS */;
INSERT INTO `article_feature` (`article_feature_id`, `article_id`, `feature_id`, `value`) VALUES
	(1, 1, 1, '512GB'),
	(2, 1, 2, 'SATA3'),
	(3, 1, 3, 'SSD'),
	(6, 3, 1, '1TB'),
	(7, 3, 3, 'SSD'),
	(8, 2, 1, '1024GB'),
	(9, 2, 2, 'SATA 3.0');
/*!40000 ALTER TABLE `article_feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_price`;
CREATE TABLE IF NOT EXISTS `article_price` (
  `article_price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_price_id`),
  KEY `fk_article_price_article_id` (`article_id`),
  CONSTRAINT `fk_article_price_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_price`;
/*!40000 ALTER TABLE `article_price` DISABLE KEYS */;
INSERT INTO `article_price` (`article_price_id`, `article_id`, `price`, `created_at`) VALUES
	(1, 1, 45.00, '2020-05-06 19:44:29'),
	(2, 1, 43.56, '2020-05-06 19:45:01'),
	(3, 2, 56.89, '2020-05-06 23:48:42'),
	(4, 3, 56.89, '2020-05-06 23:51:34'),
	(5, 2, 57.11, '2020-05-08 23:54:30');
/*!40000 ALTER TABLE `article_price` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart_article`;
CREATE TABLE IF NOT EXISTS `cart_article` (
  `cart_article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_article_id`),
  UNIQUE KEY `uq_cart_cart_id_article_id` (`cart_id`,`article_id`),
  KEY `fk_cart_article_article_id` (`article_id`),
  CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart_article`;
/*!40000 ALTER TABLE `cart_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_article` ENABLE KEYS */;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  `parent__category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_name` (`name`),
  UNIQUE KEY `uq-category_image_path` (`image_path`),
  KEY `fk_category_parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
	(1, 'Računarske komponente', 'assets/pc.jpg', NULL),
	(2, 'Kućna elektronika', 'assets/home.jpg', NULL),
	(6, 'Laptop računari', 'assets/pc/latptop.jpg', 1),
	(7, 'Memorijski mediji', 'assets/pc/memory.jpg', 1),
	(8, 'Hard diskovi', 'assets/pc/memory/hdd.jpg', 7);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  KEY `fk_feature_category_id` (`category_id`),
  CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `feature`;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
	(1, 'Kapacitet', 8),
	(4, 'Napon', 2),
	(6, 'Proizvođač', 2),
	(5, 'Snaga', 2),
	(3, 'Tehnologija', 8),
	(12, 'Test2', 2),
	(2, 'Tip', 8);
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `status` enum('rejected','accepted','shipped','pending') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  KEY `fk_photo_article_id` (`article_id`),
  CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`photo_id`, `article_id`, `image_path`) VALUES
	(8, 2, '202058-9331205766-hard-disk-slika-2.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  `forename` varchar(64) NOT NULL DEFAULT '0',
  `surename` varchar(64) NOT NULL DEFAULT '0',
  `phone_number` varchar(24) NOT NULL DEFAULT '0',
  `postal_address` tinytext NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`),
  UNIQUE KEY `uq_user_phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password_hash`, `forename`, `surename`, `phone_number`, `postal_address`) VALUES
	(1, 'test@test.rs', 'DDAF35A193617ABACC417349AE20413112E6FA4E89A97EA20A9EEEE64B55D39A2192992A274FC1A836BA3C23A3FEEBBD454D4423643CE80E2A9AC94FA54CA49F', 'Pera', 'Peric', '+38166999999', 'Nepoznata adresa bb, Glavna Luka, Nedodjija');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
