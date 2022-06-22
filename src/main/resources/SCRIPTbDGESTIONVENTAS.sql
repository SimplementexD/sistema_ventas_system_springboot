-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.29 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dbgestionventas
CREATE DATABASE IF NOT EXISTS `dbgestionventas` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbgestionventas`;

-- Volcando estructura para tabla dbgestionventas.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.category: ~6 rows (aproximadamente)
DELETE FROM `category`;
INSERT INTO `category` (`category_id`, `category_name`, `category_description`) VALUES
	(1, 'Galletas', 'Categoría de galletas'),
	(2, 'Aceite', 'Categoría de aceites'),
	(3, 'Fideo', 'Categoría de fideos'),
	(4, 'Embutido', 'Categoría de embutidos'),
	(5, 'Especias', 'Categoría de especias'),
	(6, 'Lácteos', 'Categoría de lácteos');

-- Volcando estructura para tabla dbgestionventas.company
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` bigint NOT NULL,
  `company_description` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.company: ~0 rows (aproximadamente)
DELETE FROM `company`;

-- Volcando estructura para tabla dbgestionventas.country
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.country: ~1 rows (aproximadamente)
DELETE FROM `country`;
INSERT INTO `country` (`country_id`, `country_name`) VALUES
	(1, 'Perú');

-- Volcando estructura para tabla dbgestionventas.department
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.department: ~4 rows (aproximadamente)
DELETE FROM `department`;
INSERT INTO `department` (`department_id`, `department_name`) VALUES
	(1, 'IT Department'),
	(2, 'Java Developement'),
	(3, 'HR Department'),
	(4, 'Web Developement');

-- Volcando estructura para tabla dbgestionventas.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla dbgestionventas.hibernate_sequence: ~1 rows (aproximadamente)
DELETE FROM `hibernate_sequence`;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(112);

-- Volcando estructura para tabla dbgestionventas.login
CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `login_name` varchar(255) NOT NULL,
  `login_email` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_level_id` varchar(255) NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `FK_login_person` (`person_id`),
  CONSTRAINT `FK_login_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla dbgestionventas.login: ~1 rows (aproximadamente)
DELETE FROM `login`;
INSERT INTO `login` (`login_id`, `person_id`, `login_name`, `login_email`, `login_password`, `login_level_id`) VALUES
	(1, 1001, 'cjve', '08200163@unmsm.edu.pe', '1234', '1');

-- Volcando estructura para tabla dbgestionventas.month
CREATE TABLE IF NOT EXISTS `month` (
  `month_id` int NOT NULL AUTO_INCREMENT,
  `month_name` varchar(100) NOT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.month: ~12 rows (aproximadamente)
DELETE FROM `month`;
INSERT INTO `month` (`month_id`, `month_name`) VALUES
	(1, 'Enero'),
	(2, 'Febrero'),
	(3, 'Marzo'),
	(4, 'Abril'),
	(5, 'Mayo'),
	(6, 'Junio'),
	(7, 'Julio'),
	(8, 'Agosto'),
	(9, 'Septiembre'),
	(10, 'Octubre'),
	(11, 'Noviembre'),
	(12, 'Diciembre');

-- Volcando estructura para tabla dbgestionventas.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_customer_name` varchar(255) NOT NULL,
  `order_customer_mobile` varchar(255) NOT NULL,
  `order_total` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.orders: ~4 rows (aproximadamente)
DELETE FROM `orders`;
INSERT INTO `orders` (`order_id`, `order_customer_name`, `order_customer_mobile`, `order_total`, `order_status`, `order_date`) VALUES
	(88, 'asdf', 'asdfasdf', '581', 'Paid', '11 Aug 2021 02:28 PM'),
	(93, 'Kaushal Kishore', '9876543211', '940', 'Paid', '11 Aug 2021 02:30 PM'),
	(98, 'Amit Kumar', '9878676543', '34', 'Paid', '11 Aug 2021 04:36 PM'),
	(100, 'Jay Kumar', '8787865454', '760', 'Paid', '12 Aug 2021 12:02 AM');

-- Volcando estructura para tabla dbgestionventas.person
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `person_full_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_names` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_surname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_second_surname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_gender` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_village` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_state` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_landline` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_mobile` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_department` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_date_of_birthday` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `person_nationalty` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dbgestionventas.person: ~5 rows (aproximadamente)
DELETE FROM `person`;
INSERT INTO `person` (`person_id`, `person_full_name`, `person_names`, `person_surname`, `person_second_surname`, `person_gender`, `person_address`, `person_village`, `person_state`, `person_country`, `person_landline`, `person_mobile`, `person_email`, `person_status`, `person_department`, `person_date_of_birthday`, `person_nationalty`) VALUES
	(1001, 'Jessica Vallejos Espiñal', 'Jessica', 'Vallejos', 'Espiñal', 'F', 'A : 42/6', 'SJM', '5', '1', '111111', '999888777', '08200163@unmsms.edu.pe', '2', '1', '2021-07-07', 'Peruvian'),
	(1002, 'Kaushal', 'Kishore', 'Jaiswal', '', 'M', 'A : 42/6', 'Ghaziabad', '1', '1', '111111', '999888777', '', '1', '3', '7 July,1988', 'Peruvian'),
	(1003, 'Sumit', 'Kumar', 'Aggarwal', '', 'M', 'A : 42/6', 'Ghaziabad', '1', '1', '111111', '999888777', '', '2', '1', '12 January, 1988', 'Peruvian'),
	(1014, 'Anuj', 'Kumar', 'Dubej', '', 'M', 'A : 42/6 Sector 62', 'Bhabua (Kaimur)', '1', '1', '9876543212', '999888777', '', '1', '1', '12 January 1985', 'Peruvian'),
	(1015, 'Amit', 'Kumar', 'Rastogi1', '', 'M', 'A : 42/61', 'Ghaziabad1', '4', '1', '9876543121', '999888777', '', '11', '4', '12 January, 19881', 'Peruvian');

-- Volcando estructura para tabla dbgestionventas.product
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(255) NOT NULL,
  `product_stock` int NOT NULL,
  `product_category_id` varchar(255) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price_per_item` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_prod_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `product_exp_date` varchar(255) NOT NULL,
  `product_company` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.product: ~10 rows (aproximadamente)
DELETE FROM `product`;
INSERT INTO `product` (`product_id`, `product_code`, `product_stock`, `product_category_id`, `product_title`, `product_price_per_item`, `product_description`, `product_prod_date`, `product_exp_date`, `product_company`) VALUES
	(1, 'M10001gg', 81, '1', 'Galleta Oreo', '2', 'Galleta Oreo', '', '', '43'),
	(2, 'M10002', 30, '2', 'Aceite Primor', '1.50', 'Aceite Primor', '', '', '1'),
	(3, 'M10003', 306, '3', 'Maggi', '1.50', 'Maggi', '', '', '1'),
	(5, 'M10004', 5, '3', 'Chilly Sous', '1', 'Chilly Sous', '', '', '1'),
	(6, 'M10005', 2, '4', 'Haldiram Namkeen', '10', 'Haldiram Namkeen', '', '', '1'),
	(7, 'M10006', 10, '3', 'Macroni', '10', 'Macroni', '', '', '1'),
	(8, 'M10007', 8, '5', 'Cloves', '100', 'Cloves', '', '', '1'),
	(9, 'M10008', 9, '5', 'Red Chilli', '10', 'Red Chilli', '', '', '1'),
	(10, 'M10009', 9, '4', 'Vaporizer', '100', 'Descriptionj', '', '', '1'),
	(111, 'M10002', 30, '2', 'Aceite Primor Premium xxxxxxxxx', '1.50', 'Aceite Primor', '', '', '1');

-- Volcando estructura para tabla dbgestionventas.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `company_id` bigint NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_description` text NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla dbgestionventas.proveedor: ~4 rows (aproximadamente)
DELETE FROM `proveedor`;
INSERT INTO `proveedor` (`company_id`, `company_name`, `company_description`) VALUES
	(1, 'Don Vittorio', 'Don Vittorio'),
	(41, 'Gloria', 'Venta de lácteos y embutidos'),
	(42, 'Costeño', 'Venta de arroz y azucar'),
	(43, 'Óreo', 'Óreo');

-- Volcando estructura para tabla dbgestionventas.salary
CREATE TABLE IF NOT EXISTS `salary` (
  `salary_id` int NOT NULL AUTO_INCREMENT,
  `salary_employee_id` varchar(255) NOT NULL,
  `salary_month` varchar(255) NOT NULL,
  `salary_working_days` varchar(255) NOT NULL,
  `salary_basic` varchar(255) NOT NULL,
  `salary_hra` varchar(255) NOT NULL,
  `salary_mediclaim` varchar(255) NOT NULL,
  `salary_ta` varchar(255) NOT NULL,
  `salary_da` varchar(255) NOT NULL,
  `salary_reimbursement` varchar(255) NOT NULL,
  `salary_ca` varchar(255) NOT NULL,
  `salary_others` varchar(255) NOT NULL,
  `salary_dpf` varchar(255) NOT NULL,
  `salary_dtax` varchar(255) NOT NULL,
  `salary_desc` text NOT NULL,
  `salary_total` varchar(255) NOT NULL,
  `salary_dedc` varchar(255) NOT NULL,
  `salary_product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.salary: ~3 rows (aproximadamente)
DELETE FROM `salary`;
INSERT INTO `salary` (`salary_id`, `salary_employee_id`, `salary_month`, `salary_working_days`, `salary_basic`, `salary_hra`, `salary_mediclaim`, `salary_ta`, `salary_da`, `salary_reimbursement`, `salary_ca`, `salary_others`, `salary_dpf`, `salary_dtax`, `salary_desc`, `salary_total`, `salary_dedc`, `salary_product_id`) VALUES
	(1, '1001', '1', '22', '20000', '10000', '100', '1200', '500', '1000', '800', '2300', '1200', '2300', 'Salary for the ', '35900', '3500', NULL),
	(2, '1002', '2', '22', '20000', '10000', '100', '1200', '500', '1000', '800', '2300', '1200', '2300', 'Salary for the ', '35900', '3500', NULL),
	(3, '1003', '3', '22', '20000', '10000', '100', '1200', '500', '1000', '800', '2300', '1200', '2300', 'Salary for the ', '35900', '3500', NULL);

-- Volcando estructura para tabla dbgestionventas.saluation
CREATE TABLE IF NOT EXISTS `saluation` (
  `saluation_id` int NOT NULL AUTO_INCREMENT,
  `saluation_name` varchar(255) NOT NULL,
  PRIMARY KEY (`saluation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.saluation: ~2 rows (aproximadamente)
DELETE FROM `saluation`;
INSERT INTO `saluation` (`saluation_id`, `saluation_name`) VALUES
	(1, 'Mr.'),
	(2, 'Mrs.');

-- Volcando estructura para tabla dbgestionventas.sell
CREATE TABLE IF NOT EXISTS `sell` (
  `sell_id` int NOT NULL AUTO_INCREMENT,
  `sell_order_id` varchar(255) NOT NULL,
  `sell_product_id` varchar(255) NOT NULL,
  `sell_units` varchar(255) NOT NULL,
  `sell_price_per_unit` varchar(255) NOT NULL,
  `sell_total_cost` varchar(255) NOT NULL,
  PRIMARY KEY (`sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.sell: ~12 rows (aproximadamente)
DELETE FROM `sell`;
INSERT INTO `sell` (`sell_id`, `sell_order_id`, `sell_product_id`, `sell_units`, `sell_price_per_unit`, `sell_total_cost`) VALUES
	(89, '88', '5', '1', '1', '1'),
	(90, '88', '9', '4', '10', '40'),
	(91, '88', '7', '4', '10', '40'),
	(92, '88', '10', '5', '100', '500'),
	(95, '93', '8', '5', '100', '500'),
	(96, '93', '9', '4', '10', '40'),
	(97, '93', '10', '4', '100', '400'),
	(99, '98', '5', '34', '1', '34'),
	(102, '100', '8', '3', '100', '300'),
	(103, '100', '10', '4', '100', '400'),
	(104, '100', '9', '2', '10', '20'),
	(105, '100', '6', '4', '10', '40');

-- Volcando estructura para tabla dbgestionventas.state
CREATE TABLE IF NOT EXISTS `state` (
  `state_id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbgestionventas.state: ~7 rows (aproximadamente)
DELETE FROM `state`;
INSERT INTO `state` (`state_id`, `state_name`) VALUES
	(1, 'Chosica'),
	(2, 'Ate'),
	(3, 'SJM'),
	(4, 'Cieneguilla'),
	(5, 'Amauta'),
	(6, 'Huaycán'),
	(7, 'Otros');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
