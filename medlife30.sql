-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for medlife
CREATE DATABASE IF NOT EXISTS `medlife` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medlife`;

-- Dumping structure for table medlife.address
CREATE TABLE IF NOT EXISTS `address` (
  `house_no` varchar(55) DEFAULT NULL,
  `house_area` varchar(55) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `cust_id_f` varchar(55) DEFAULT NULL,
  `shop_id_f` int(11) DEFAULT NULL,
  KEY `cust_id_f` (`cust_id_f`),
  KEY `shop_id_f` (`shop_id_f`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`cust_id_f`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`shop_id_f`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table medlife.address: ~11 rows (approximately)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`house_no`, `house_area`, `city`, `pincode`, `cust_id_f`, `shop_id_f`) VALUES
	('101+', 'pune', 'pune', 411062, 'cust1', NULL),
	('101', 'pune', 'pune', 411044, NULL, 102),
	('87', 'pune', 'pune', 411062, 'cust2', NULL),
	('87', 'pune', 'pune', 411044, NULL, 7777),
	('101', 'pune', 'pune', 411062, 'customer1', NULL),
	('102', 'nigdi', 'pune', 411044, 'customer2', NULL),
	('h11', 'talawade', 'pune', 411062, NULL, 11),
	('h22', 'nigdi', 'pune', 411044, NULL, 22),
	('h105', 'akurdi', 'pune', 411033, 'customer3', NULL),
	('h99', 'pimpri', 'pune', 411033, NULL, 999),
	('h1111', 'pune', 'pune', 411063, 'customer4', NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table medlife.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` varchar(55) NOT NULL DEFAULT '',
  `cust_name` varchar(55) DEFAULT NULL,
  `contact` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table medlife.customer: ~6 rows (approximately)
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`cust_id`, `cust_name`, `contact`) VALUES
	('cust1', 'kishor', 8805072549),
	('cust2', 'kishor', 8805072549),
	('customer1', 'kishor', 8805072549),
	('customer2', 'manthan', 7020231164),
	('customer3', 'kunal', 9763860798),
	('customer4', 'pradip', 1234567890);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table medlife.medicine
CREATE TABLE IF NOT EXISTS `medicine` (
  `medicine_name` varchar(55) DEFAULT NULL,
  `medicine_type` varchar(55) DEFAULT NULL,
  `medicine_price` float DEFAULT NULL,
  `shop_id_f` int(11) DEFAULT NULL,
  `trade_id_f` int(11) DEFAULT NULL,
  `medicine_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`medicine_id`),
  KEY `shop_id_f` (`shop_id_f`),
  KEY `FK_medicine_trade` (`trade_id_f`),
  CONSTRAINT `FK_medicine_trade` FOREIGN KEY (`trade_id_f`) REFERENCES `trade` (`trade_id`),
  CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`shop_id_f`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table medlife.medicine: ~26 rows (approximately)
DELETE FROM `medicine`;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` (`medicine_name`, `medicine_type`, `medicine_price`, `shop_id_f`, `trade_id_f`, `medicine_id`) VALUES
	('crocin', 'tablet', 2, 102, NULL, 1),
	('omi', 'tablet', 3, 102, 15, 2),
	('kk', 'kk', 87, 7777, 7, 3),
	('axe', 'perfume', 99, 11, NULL, 4),
	('combiflam', 'tablet', 12, 11, NULL, 5),
	('omi', 'tablet', 6, 11, 15, 6),
	('coughSyrup', 'syrup', 55, 11, NULL, 7),
	('crocin', 'tablet', 6, 11, NULL, 8),
	('sirin', 'etc', 13, 22, 12, 9),
	('injection', 'etc', 13, 22, 13, 10),
	('saline', 'etc', 16, 22, NULL, 11),
	('omi', '6', 6, 22, 15, 12),
	('crocin', 'tablet', 6, 22, NULL, 13),
	('horlecs', 'syrup', 99, 999, NULL, 14),
	('omi', 'tablet', 6, 999, NULL, 15),
	('rantac', 'tablet', 32, 999, NULL, 16),
	('azagold', 'tablet', 17, 999, NULL, 17),
	('sinarest', 'tablet', 23, 999, NULL, 18),
	('crocinAdvance', 'tablet', 21, 999, NULL, 19),
	('saradox', 'tablet', 14, 999, NULL, 20),
	('thyroxin', 'tablet', 55, 999, NULL, 21),
	('Bigomet500', 'tablet', 59, 999, NULL, 22),
	('zils', 'tablet', 33, 999, NULL, 23),
	('corec', 'syrup', 59, 999, 17, 24),
	('pudinhara', 'tablet', 78, 999, NULL, 25),
	('honitel', 'syrup', 79, 999, 16, 26);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;

-- Dumping structure for table medlife.shop
CREATE TABLE IF NOT EXISTS `shop` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `shop_name` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table medlife.shop: ~5 rows (approximately)
DELETE FROM `shop`;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` (`shop_id`, `shop_name`) VALUES
	(11, 'shree'),
	(22, 'satyam'),
	(102, 'om'),
	(999, 'guru'),
	(7777, 'maulii');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;

-- Dumping structure for table medlife.trade
CREATE TABLE IF NOT EXISTS `trade` (
  `trade_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` float DEFAULT NULL,
  `trade_date` date DEFAULT NULL,
  `cust_id_f` varchar(55) DEFAULT NULL,
  `shop_id_f` int(11) DEFAULT NULL,
  PRIMARY KEY (`trade_id`),
  KEY `FK_trade_customer` (`cust_id_f`),
  KEY `FK_trade_shop` (`shop_id_f`),
  CONSTRAINT `FK_trade_customer` FOREIGN KEY (`cust_id_f`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `FK_trade_shop` FOREIGN KEY (`shop_id_f`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table medlife.trade: ~17 rows (approximately)
DELETE FROM `trade`;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` (`trade_id`, `total_price`, `trade_date`, `cust_id_f`, `shop_id_f`) VALUES
	(1, 3, '2019-04-30', 'customer1', 102),
	(2, 3, '2019-04-30', 'customer1', 102),
	(3, 6, '2019-04-30', 'customer1', 11),
	(4, 13, '2019-04-30', 'customer2', 22),
	(5, 3, '2019-04-30', 'customer1', 102),
	(6, 3, '2019-04-30', 'customer1', 102),
	(7, 3, '2019-04-29', 'customer1', 102),
	(8, 3, '2019-04-29', 'customer1', 102),
	(9, 3, '2019-04-28', 'customer1', 102),
	(10, 3, '2019-04-30', 'customer1', 102),
	(11, 3, '2019-04-30', 'customer1', 102),
	(12, 13, '2019-04-28', 'customer2', 22),
	(13, 13, '2019-04-30', 'customer2', 22),
	(14, 6, '2019-04-30', 'customer1', 11),
	(15, 6, '2019-04-30', 'customer1', 22),
	(16, 79, '2019-04-30', 'customer3', 999),
	(17, 59, '2019-04-30', 'customer4', 999);
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
