-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for inventiolite
CREATE DATABASE IF NOT EXISTS `inventiolite` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `inventiolite`;

-- Dumping structure for table inventiolite.box
CREATE TABLE IF NOT EXISTS `box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.box: ~1 rows (approximately)
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
INSERT INTO `box` (`id`, `created_at`) VALUES
	(1, '2017-10-10 21:26:20');
/*!40000 ALTER TABLE `box` ENABLE KEYS */;

-- Dumping structure for table inventiolite.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.category: ~5 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `image`, `name`, `description`, `created_at`) VALUES
	(1, NULL, 'Ferreteria', NULL, '2017-10-12 16:06:13'),
	(2, NULL, 'Decoracion', NULL, '2017-10-12 16:08:32'),
	(3, NULL, 'Cocina', NULL, '2017-10-12 16:08:45'),
	(4, NULL, 'Mascotas', NULL, '2017-10-12 16:09:10'),
	(5, NULL, 'Muebles ', NULL, '2017-10-12 16:09:36');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table inventiolite.configuration
CREATE TABLE IF NOT EXISTS `configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind` int(11) NOT NULL,
  `val` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.configuration: ~8 rows (approximately)
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` (`id`, `short`, `name`, `kind`, `val`) VALUES
	(1, 'title', 'Titulo del Sistema', 2, 'Inventio Lite'),
	(2, 'use_image_product', 'Utilizar Imagenes en los productos', 1, '0'),
	(3, 'active_clients', 'Activar clientes', 1, '0'),
	(4, 'active_providers', 'Activar proveedores', 1, '0'),
	(5, 'active_categories', 'Activar categorias', 1, '0'),
	(6, 'active_reports_word', 'Activar reportes en Word', 1, '0'),
	(7, 'active_reports_excel', 'Activar reportes en Excel', 1, '0'),
	(8, 'active_reports_pdf', 'Activar reportes en PDF', 1, '0');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;

-- Dumping structure for table inventiolite.operation
CREATE TABLE IF NOT EXISTS `operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `q` float NOT NULL,
  `operation_type_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `operation_type_id` (`operation_type_id`),
  KEY `sell_id` (`sell_id`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_type` (`id`),
  CONSTRAINT `operation_ibfk_3` FOREIGN KEY (`sell_id`) REFERENCES `sell` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.operation: ~76 rows (approximately)
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` (`id`, `product_id`, `q`, `operation_type_id`, `sell_id`, `created_at`) VALUES
	(1, 1, 50, 1, NULL, '2017-10-12 16:36:09'),
	(2, 24, 100, 1, NULL, '2017-10-12 18:02:02'),
	(3, 37, 50, 1, NULL, '2017-10-12 18:34:00'),
	(4, 38, 100, 1, NULL, '2017-10-12 18:35:30'),
	(5, 39, 200, 1, NULL, '2017-10-12 18:36:57'),
	(6, 40, 100, 1, NULL, '2017-10-12 18:38:10'),
	(7, 41, 100, 1, NULL, '2017-10-12 18:42:23'),
	(8, 2, 85, 1, 1, '2017-10-12 19:52:55'),
	(9, 3, 50, 1, 2, '2017-10-12 19:53:13'),
	(10, 4, 55, 1, 3, '2017-10-12 19:53:41'),
	(11, 5, 30, 1, 4, '2017-10-12 19:55:06'),
	(12, 6, 5, 1, 5, '2017-10-12 19:55:28'),
	(13, 7, 15, 1, 6, '2017-10-12 19:55:54'),
	(14, 8, 35, 1, 7, '2017-10-12 19:56:17'),
	(15, 9, 40, 1, 8, '2017-10-12 19:56:32'),
	(16, 10, 20, 1, 9, '2017-10-12 19:56:50'),
	(17, 11, 20, 1, 10, '2017-10-12 19:57:14'),
	(18, 12, 5, 1, 11, '2017-10-12 19:57:33'),
	(19, 13, 50, 1, 12, '2017-10-12 19:57:56'),
	(20, 14, 150, 1, 13, '2017-10-12 19:58:14'),
	(21, 15, 3, 1, 14, '2017-10-12 20:00:11'),
	(22, 16, 7, 1, 15, '2017-10-12 20:02:02'),
	(23, 16, 58, 1, 16, '2017-10-12 20:02:40'),
	(24, 17, 15, 1, 17, '2017-10-12 20:03:19'),
	(25, 18, 50, 1, 18, '2017-10-12 20:03:33'),
	(26, 19, 100, 1, 19, '2017-10-12 20:03:49'),
	(27, 20, 100, 1, 20, '2017-10-12 20:04:11'),
	(28, 21, 100, 1, 21, '2017-10-12 20:04:31'),
	(29, 22, 100, 1, 22, '2017-10-12 20:04:47'),
	(30, 23, 100, 1, 23, '2017-10-12 20:05:02'),
	(31, 25, 100, 1, 24, '2017-10-12 20:05:16'),
	(32, 26, 100, 1, 25, '2017-10-12 20:05:55'),
	(33, 27, 100, 1, 26, '2017-10-12 20:06:07'),
	(34, 28, 100, 1, 27, '2017-10-12 20:06:21'),
	(35, 29, 100, 1, 28, '2017-10-12 20:06:40'),
	(36, 30, 100, 1, 29, '2017-10-12 20:07:14'),
	(37, 31, 100, 1, 30, '2017-10-12 20:07:25'),
	(38, 32, 100, 1, 31, '2017-10-12 20:07:40'),
	(39, 33, 100, 1, 32, '2017-10-12 20:07:54'),
	(40, 34, 100, 1, 33, '2017-10-12 20:08:07'),
	(41, 35, 100, 1, 34, '2017-10-12 20:08:24'),
	(42, 36, 100, 1, 35, '2017-10-12 20:08:40'),
	(43, 42, 75, 1, 36, '2017-10-12 20:08:54'),
	(44, 43, 75, 1, 37, '2017-10-12 20:09:09'),
	(45, 44, 75, 1, 38, '2017-10-12 20:09:33'),
	(46, 45, 100, 1, 39, '2017-10-12 20:09:51'),
	(47, 46, 75, 1, 40, '2017-10-12 20:10:27'),
	(48, 47, 75, 1, 41, '2017-10-12 20:10:40'),
	(49, 48, 75, 1, 42, '2017-10-12 20:10:54'),
	(50, 49, 75, 1, 43, '2017-10-12 20:11:05'),
	(51, 50, 75, 1, 44, '2017-10-12 20:11:19'),
	(52, 51, 75, 1, 45, '2017-10-12 20:11:34'),
	(53, 52, 100, 1, 46, '2017-10-12 20:12:35'),
	(54, 54, 100, 1, 47, '2017-10-12 20:13:05'),
	(55, 55, 100, 1, 48, '2017-10-12 20:13:19'),
	(56, 56, 100, 1, 49, '2017-10-12 20:13:32'),
	(57, 57, 100, 1, 50, '2017-10-12 20:13:50'),
	(58, 58, 100, 1, 51, '2017-10-12 20:15:17'),
	(59, 59, 100, 1, 52, '2017-10-12 20:15:32'),
	(60, 60, 100, 1, 53, '2017-10-12 20:15:45'),
	(61, 61, 100, 1, 54, '2017-10-12 20:15:57'),
	(62, 62, 100, 1, 55, '2017-10-13 18:32:53'),
	(63, 63, 100, 1, 56, '2017-10-13 18:33:22'),
	(64, 64, 100, 1, 57, '2017-10-13 18:33:49'),
	(65, 65, 100, 1, 58, '2017-10-13 18:34:15'),
	(66, 66, 100, 1, 59, '2017-10-13 18:34:35'),
	(67, 67, 100, 1, 60, '2017-10-13 18:34:59'),
	(68, 68, 100, 1, 61, '2017-10-13 18:35:24'),
	(69, 69, 100, 1, 62, '2017-10-13 18:36:00'),
	(70, 70, 100, 1, 63, '2017-10-13 18:36:18'),
	(71, 71, 100, 1, 64, '2017-10-13 18:36:36'),
	(72, 72, 100, 1, 65, '2017-10-13 18:36:54'),
	(73, 73, 100, 1, 66, '2017-10-13 18:37:13'),
	(74, 74, 75, 1, 67, '2017-10-13 18:37:31'),
	(75, 75, 75, 1, 68, '2017-10-13 18:37:52'),
	(76, 76, 75, 1, 69, '2017-10-13 18:38:11'),
	(80, 73, 20, 2, 1, '2017-11-07 02:07:28'),
	(81, 5, 5, 2, 1, '2017-11-07 02:09:14');
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;

-- Dumping structure for table inventiolite.operation_type
CREATE TABLE IF NOT EXISTS `operation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.operation_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `operation_type` DISABLE KEYS */;
INSERT INTO `operation_type` (`id`, `name`) VALUES
	(1, 'entrada'),
	(2, 'salida');
/*!40000 ALTER TABLE `operation_type` ENABLE KEYS */;

-- Dumping structure for table inventiolite.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.person: ~17 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `image`, `name`, `lastname`, `company`, `address1`, `address2`, `phone1`, `phone2`, `email1`, `email2`, `kind`, `created_at`) VALUES
	(1, NULL, 'Juan ', 'Perez', NULL, '5ta. calle 6-23 zona 1', NULL, '58526987', NULL, 'jperez@gmail.com', NULL, 2, '2017-10-12 22:38:41'),
	(2, NULL, 'Luis ', 'Gonzales', NULL, '23 Calle 2-69, Zona 9', NULL, '22546987', NULL, 'lgg@grupoci,com', NULL, 2, '2017-10-12 22:39:35'),
	(3, NULL, 'Mynor', 'Jerez', NULL, '5 calle 8-96, zona 10', NULL, '22547412', NULL, 'mjerez@company247.com', NULL, 2, '2017-10-12 22:40:30'),
	(4, NULL, 'Cristian', 'Granados', NULL, '9 calle 7-88, zona 13', NULL, '22145878', NULL, 'CG@123company.com', NULL, 2, '2017-10-12 22:41:56'),
	(5, NULL, 'Estuardo', 'Chinchilla', NULL, '7 calle 2-96, zona 18', NULL, '54879632', NULL, 'echin@gmail.com', NULL, 2, '2017-10-12 22:42:44'),
	(6, NULL, 'Jesus', 'Ochoa', NULL, '22 calle 7-55, zona 7', NULL, '22417458', NULL, 'jochoa@gruposky.com', NULL, 2, '2017-10-12 22:44:23'),
	(7, NULL, 'Mirna', 'Ortiz', NULL, '9 calle 8-55, zona 11', NULL, '54741236', NULL, 'mortiz@hotmail.com', NULL, 2, '2017-10-12 22:45:16'),
	(8, NULL, 'Luisa', 'Spencer', NULL, '8 calle 7-44, zona 14', NULL, '21478954', NULL, 'lspencer@groupcl.com', NULL, 2, '2017-10-12 22:46:11'),
	(9, NULL, 'Elisa', 'Garcia', NULL, '4 calle 7-44, zona 16', NULL, '41745698', NULL, 'eligar@gmail.com', NULL, 2, '2017-10-12 22:47:07'),
	(10, NULL, 'Karen', 'MuÃ±oz', NULL, '3 calle 1-11, zona 2', NULL, '36985474', NULL, 'kmuÃ±oz@kingco.com', NULL, 2, '2017-10-12 22:48:15'),
	(11, NULL, 'Mayra', 'Faggiolli', NULL, '7a. avenida 8-35 zona 9', NULL, '77853142', NULL, 'mayrafr@ferreteriauniversal.com', NULL, 2, '2017-10-13 05:01:04'),
	(12, NULL, 'Reynaldo', 'Jaramillo', NULL, 'Ruta 1 4-05 zona 4', NULL, '54486321', NULL, 'jaramillo07@distritornillos.net', NULL, 2, '2017-10-13 05:05:00'),
	(13, NULL, 'Summer', 'Ales', NULL, '8 avenida 9-21 zona 15', NULL, '34486565', NULL, 'gerente.general@ales.com.gt', NULL, 2, '2017-10-13 05:06:34'),
	(14, NULL, 'Julio Estuardo', 'Perez', NULL, 'Ruta 0 8-90 zona 4', NULL, '52219785', NULL, 'estuardoperez@maquipesada.com', NULL, 2, '2017-10-13 05:08:10'),
	(15, NULL, 'Raul Armando', 'Fernandez', NULL, '9 avenida 6-41 zona 16', NULL, '56823440', NULL, 'raulfer@pintuguasa.com', NULL, 2, '2017-10-13 05:14:25'),
	(16, NULL, 'Francisco', 'Ramirez Lopez', NULL, '3 avenida 9-23 zona 1', NULL, '52274253', NULL, 'frankramirez@mensajeriaglobal.com', NULL, 2, '2017-10-13 05:16:38'),
	(17, NULL, 'Maria Fernanda', 'Lopez Romero', NULL, '7a calle 7-32 zona 1', NULL, '23860014', NULL, 'gerencia@capacitaciongt.com', NULL, 2, '2017-10-13 05:18:41');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- Dumping structure for table inventiolite.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `inventary_min` int(11) DEFAULT 10,
  `price_in` float DEFAULT NULL,
  `price_out` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `presentation` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.product: ~76 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `image`, `barcode`, `name`, `description`, `inventary_min`, `price_in`, `price_out`, `unit`, `presentation`, `user_id`, `category_id`, `created_at`, `is_active`) VALUES
	(1, 'Librera_1_1.jpg', NULL, 'Librera 5 Repisas', 'Color: Cafe\r\nMarca: ZMOBILI\r\nDimensiones: 60 x 23.6 x 182 cm ', 20, 399.99, 599.99, '', 'Madera', 3, 5, '2017-10-12 16:36:09', 1),
	(2, 'Mesa_Auxiliar.jpg', NULL, 'Mesa Auxiliar', '', 50, 199.99, 449.99, '', 'Madera', 3, 5, NULL, 1),
	(3, 'Librera_Cubos.jpg', NULL, 'Librera Cubos', 'Color: Blanco/Beige\r\nDimensiones: 79 x 29.5 x 80 cm', 45, 399.99, 699.99, '', 'Madera', 3, 5, NULL, 1),
	(4, 'Rack_Fusion.jpg', NULL, 'Rack Fusion', 'Centro de Entretenimiento\r\nDimensiones: 68.5x170x38 cm', 5, 999.99, 1699.99, '', 'Madera', 3, 5, NULL, 1),
	(5, 'Librera_3_Repisas.jpg', NULL, 'Librera 3 Repisas', 'Color: Cafe Claro\r\nDimensiones: 60 x 23.6 x 90 cm', 25, 199.99, 399.99, '', 'Madera', 3, 5, NULL, 1),
	(6, 'Mesa_Plegable.jpg', NULL, 'Mesa Plegable', 'Marca: Newstorm\r\nColor: Blanco\r\nDimensiones: 182 x 72 x 74 cm', 4, 399.99, 599.99, '', 'Plastico', 3, 5, NULL, 1),
	(7, 'Mesa_de_Jardin.jpg', NULL, 'Mesa de Jardin', 'Juego de Muebles\r\nColor: Chocolate\r\nNo. Piezas: 3', 50, 419.99, 699.99, '', 'Vidrio-Metal', 3, 5, NULL, 1),
	(8, 'Set_Mesa.jpg', NULL, 'Set de Mesa', 'Juego de Muebles con Sombrilla\r\nCantidad de Piezas: 6', 20, 999.99, 1999.99, '', 'Vidrio-Metal', 3, 5, NULL, 1),
	(9, 'Sillon_Columpio.jpg', NULL, 'Sillon Columpio', 'Sillon para 3 personas. \r\nPeso de Soporte: 210 kg\r\nDimensiones: 110 x 170 x 153 cm', 35, 599.99, 799.99, '', 'Metal-Tela', 3, 5, NULL, 1),
	(10, 'Sillon_Reclinable.jpg', NULL, 'Sillon Reclinable', 'Sillon Tipo Reclinable\r\nColor: Cafe \r\nDimensiones: 75 x 90 x 98 cm', 60, 1049.99, 1499.99, '', 'Microfibra', 3, 5, NULL, 1),
	(11, 'Sillon.jpg', NULL, 'Sillon Normal', 'Sillon Bean Bag\r\nColor: Cafe Obscuro', 40, 799.99, 999.99, '', 'Cuero Sintetico', 3, 5, NULL, 1),
	(12, 'Sofa_Cama_1.jpg', NULL, 'Sofa Cama', 'Color: Chocolate\r\nTipo: Reclinable', 45, 1199.99, 1399.99, '', 'Tela', 3, 5, NULL, 1),
	(13, 'Banco_Bar.jpg', NULL, 'Banco Bar', 'Color: Negro\r\nDimensiones: 44 x 47 x 88 cm', 25, 299.99, 499.99, '', 'Metal', 3, 5, NULL, 1),
	(14, 'Silla_Ann.jpg', NULL, 'Silla de Comedor', 'Color: Cafe\r\nDimensiones: 41 x 49.5 x 97.5 cm', 33, 99.99, 199.99, '', 'Metal', 3, 5, NULL, 1),
	(15, 'Silla.jpg', NULL, 'Silla de Oficina', 'Marca: ZMOBILI\r\nColor: Azul/Verde\r\nDimensiones: 62 x 63 x 92 cm', 90, 799.99, 999.99, '', 'Acero-Mesh', 3, 5, NULL, 1),
	(16, 'JugueteGoma.jpg', NULL, 'Juguete de Goma', 'Marca: KOLE\r\nEmite sonido. ', 78, 9.99, 19.99, '', 'Hule', 3, 4, NULL, 1),
	(17, 'CasaPlastico.jpg', NULL, 'Casa para Perro', 'Marca: EGM\r\nColor: Azul\r\nAltura Puerta: 17 pulgadas', 54, 399.99, 599.99, '', 'Plastico', 3, 4, NULL, 1),
	(18, 'ProtectorAsiento.jpg', NULL, 'Protector de Asiento', 'Marca: Cloralex', 60, 49.99, 99.99, '', 'Tela-Fieltro', 3, 4, NULL, 1),
	(19, 'DispensadorAgua.jpg', NULL, 'Dispensador de Agua', 'Marca: PET MATE\r\nCapacidad: 0.75 Galones\r\nUso: Agua', 100, 79.99, 144.99, '', 'Plastico', 3, 4, NULL, 1),
	(20, 'Asiento.jpg', NULL, 'Asiento para Mascota', 'Marca: ETNA', 50, 99.99, 149.99, '', 'Tela', 3, 4, NULL, 1),
	(21, 'collar.jpg', NULL, 'Correa  para Perro', 'Marca: FIERO', 30, 5.99, 9.99, '100', 'Metal', 3, 4, NULL, 1),
	(22, 'CasaPortatil.jpg', NULL, 'Casa para Perro Portatil', 'Marca: ETNA\r\nTamano: Mediano\r\nColor: Beige', 25, 99.99, 149.99, '80', 'Tela', 3, 4, NULL, 1),
	(23, 'EscalerasPerro.jpg', NULL, 'Escalera Portatil', 'Marca: ETNA\r\nColor: Beige\r\nDimensiones: 16 x 12 x 4 1/2', 45, 79.99, 169.99, '100', 'Plastico', 3, 4, NULL, 1),
	(24, 'Chaleco.jpg', NULL, 'Chaleco Impermeable', 'Talla: M\r\nColor: Rosado', 40, 49.99, 89.99, '65', 'Nylon', 3, 4, '2017-10-12 18:02:02', 1),
	(25, 'CollarCuero.jpg', NULL, 'Collar para Perro', 'Marca: Dog Lover', 50, 29.99, 49.99, '100', 'Cuero', 3, 4, NULL, 1),
	(26, 'Arnes.jpg', NULL, 'Arnes ', 'Marca: Pet Town', 30, 49.99, 69.99, '55', '', 3, 4, NULL, 1),
	(27, 'JuguetePeluche.jpg', NULL, 'Juguete de Peluche', 'Marca: Diggers\r\nDiseno: Animal', 30, 49.99, 69.99, '78', 'Peluche', 3, 4, NULL, 1),
	(28, 'JaulaPerro.jpg', NULL, 'Jaula para Perro', 'Marca: Midwest\r\nColor: Negro\r\nTamano: Grande', 20, 799.99, 999.99, '50', 'Metal', 3, 4, NULL, 1),
	(29, 'TransportadorMascotas.jpg', NULL, 'Transportador de Mascotas', 'Marca: Aspen\r\nColor: Gris\r\nTamano: Grande', 50, 999.99, 1499.99, '80', 'Metal', 3, 4, NULL, 1),
	(30, 'SillonCama.jpg', NULL, 'Sillon Cama', 'Marca: Pet Store', 30, 119.99, 189.99, '75', 'Madera-Tela', 3, 4, NULL, 1),
	(31, 'AmoladoraAngular.jpg', NULL, 'Amoladora Angular', 'Marca: DeWalt\r\nUso: Profes', 10, 499.99, 699.99, '36', 'Peso: 3.9 Libras', 3, 1, NULL, 1),
	(32, 'Pulidora.jpg', NULL, 'Pulidora Orbital', 'Marca: TRUPER\r\nUso: Profesional\r\nTipo: Orbital', 30, 149.99, 399.99, '60', 'Peso: 1.2 Kg', 3, 1, NULL, 1),
	(33, 'RotoMartillo.jpg', NULL, 'Rotomartillo Electrico', 'Marca: TRUPER\r\nTipo: Rotomartillo', 35, 199.99, 249.99, '70', '', 3, 1, NULL, 1),
	(34, 'Cautin.jpg', NULL, 'Cautin Tipo Lapiz', 'Marca: PRETUL\r\n', 40, 29.99, 39.99, '100', '', 3, 1, NULL, 1),
	(35, 'TaladroInalambrico.jpg', NULL, 'Taladro Inalambrico', 'Marca: PRETUL', 20, 199.99, 249.99, '45', '', 3, 1, NULL, 1),
	(36, 'EngrapadoraManual.jpg', NULL, 'Engrapadora Manual', 'Marca: TRUPER\r\nTipo: Pistola', 15, 79.99, 99.99, '50', 'Metal Cromado', 3, 1, NULL, 1),
	(37, 'EscaleraMetal.jpg', NULL, 'Escalera de Metal', 'Marca: ELEMENTS\r\nColor: Negro/Blanco', 25, 139.99, 199.99, '50', 'Metal', 3, 1, '2017-10-12 18:34:00', 1),
	(38, 'CintaMetrica.jpg', NULL, 'Cinta Metrica', 'Marca: PRETUL\r\nColor: Amarillo', 44, 9.99, 14.99, '100', 'Metal', 3, 1, '2017-10-12 18:35:29', 1),
	(39, 'MartilloUna.jpg', NULL, 'Martillo', 'Marca: PRETUL\r\nTamano del Mango: 11 pulgadas', 80, 29.99, 34.99, '200', 'Peso: 16 oz', 3, 1, '2017-10-12 18:36:57', 1),
	(40, 'SetDestornilladores.jpg', NULL, 'Set de Destornilladores', 'Marca: STANLEY\r\nRango de Piezas: 1-10 piezas', 50, 39.99, 59.99, '100', '', 3, 1, '2017-10-12 18:38:10', 1),
	(41, 'CajaHerramientas.jpg', NULL, 'Caja de Herramientas', 'Marca: TRUPER\r\nUso: Profesional\r\nColor: Gris', 50, 59.99, 79.99, 'Peso: 072 kg', 'Plastico', 3, 1, '2017-10-12 18:42:23', 1),
	(42, 'CepilloCircular.jpg', NULL, 'Cepillo Circular', 'Marca: TRUPER\r\nTipo: Circular', 50, 9.99, 19.99, 'Unidad', 'Individual', 3, 1, NULL, 1),
	(43, 'SierraProfesional.jpg', NULL, 'Sierra Profesional', 'Marca: TRUPER\r\nUso: Profesional', 56, 499.99, 599.99, 'Unidad', '', 3, 1, NULL, 1),
	(44, 'DesarmadorInalambrico.jpg', NULL, 'Desarmador Inalambrico', 'Marca: SKIL', 45, 179.99, 199.99, 'Unidad', 'Domestico', 3, 1, NULL, 1),
	(45, 'SierraMadera.jpg', NULL, 'Sierra para Madera', 'Marca: TRUPER\r\nTipo: Caladora', 67, 14.99, 29.99, 'Unidad', 'Acero al Cromo', 3, 1, NULL, 1),
	(46, 'VelaSet.jpg', NULL, 'Set de Velas', 'Marca: FLOR DE LIZ\r\nColor: Variedad\r\nCantidad de Piezas: 6', 50, 9.99, 19.99, 'Unidad', 'Set', 3, 2, NULL, 1),
	(47, 'MarcoFotos.jpg', NULL, 'Marco para Fotos', 'Marca: FLOR DE LIZ\r\nContenido: Para 3 fotos', 25, 19.99, 29.99, 'Unidad', 'Plastico', 3, 2, NULL, 1),
	(48, 'Individual2.jpg', NULL, 'Individual', 'Marca: VIVA\r\nCantidad de Piezas: 1', 15, 9.99, 19.99, 'Unidad', 'Plastico', 3, 2, NULL, 1),
	(49, 'EucaliptoBrillante.jpg', NULL, 'Eucalipto Brillante', 'Marca: KOTZIJAL\r\nFollaje seco\r\nCantidad de Piezas: 6 tallos', 60, 39.99, 59.99, 'Unidad', 'Natural', 3, 2, NULL, 1),
	(50, 'Setmadera.jpg', NULL, 'Set Galeria Doble Madera', 'Marca: VIVA\r\nTipo: Doble\r\nColor: Cafe', 80, 149.99, 299.99, 'Diametro Barra: 2.5/2.3 cm', 'Doble', 3, 2, NULL, 1),
	(51, 'CortinaBambu.jpg', NULL, 'Cortina de Bambu', 'Decoracion', 100, 199.99, 279.99, 'Unidad', 'Empaquetado', 3, 2, NULL, 1),
	(52, 'Individual.jpg', NULL, 'Individual Bamboo', 'Color: Natural\r\nForma: Rectangular', 56, 9.99, 14.99, 'Unidad', 'Individual', 3, 2, NULL, 1),
	(54, 'PlatoDorado.jpg', NULL, 'Plato Base Dorado', 'Color: Dorado', 50, 19.99, 24.99, 'Unidad', 'Individual', 3, 2, NULL, 1),
	(55, 'GaleriaCortina.jpg', NULL, 'Galeria para Cortina', 'Marca: VIVA\r\nTipo: Extensible\r\nColor: Dorado Antiguo', 58, 199.99, 249.99, 'Unidad', 'Metal', 3, 2, NULL, 1),
	(56, 'PersianaBambu.jpg', NULL, 'Persiana Bamboo', 'Marca: VIVA\r\nColor: Cafe Claro', 45, 199.99, 299.99, 'Unidad', 'Empaquetado', 3, 2, NULL, 1),
	(57, 'PlatoBase_2.jpg', NULL, 'Plato Base Redondo', 'Plato de Decoracion', 45, 19.99, 39.99, 'Unidad', 'Individual', 3, 2, NULL, 1),
	(58, 'FarolCuadrado.jpg', NULL, 'Farol Cuadrado', '', 15, 59.99, 99.99, 'Unidad', 'Metal', 3, 2, NULL, 1),
	(59, 'ExtensionSolar.jpg', NULL, 'Extension Solar de Faros', 'Marca: SOLARIS\r\nForma: Colgante\r\nLuz: LED', 78, 99.99, 149.99, 'Unidad', 'Metalica-Individual', 3, 2, NULL, 1),
	(60, 'Cojin.jpg', NULL, 'Cojin', 'Color: Variedad', 50, 49.99, 99.99, 'Unidad', 'Individual-Colores', 3, 2, NULL, 1),
	(61, 'Espejo.jpg', NULL, 'Espejo de Pared', 'Tamano: Pequeno\r\nCantidad de Piezas: 1', 30, 49.99, 89.99, 'Unidad', 'Marco de Madera', 3, 2, NULL, 1),
	(62, 'Minibar.jpg', NULL, 'Mini Bar de manera', 'Incluye copas, no botellas. ', 50, 149.99, 249.99, 'Unidad', 'Madera', 3, 3, NULL, 1),
	(63, 'Contenedores.jpg', NULL, 'Contenedores para Comida', 'Marca: ELEMENTS\r\nFormas: Cuadrado, Rectangular, Redondo\r\nColor: Transparente', 20, 49.99, 59.99, 'Unidad', 'Plastico, A presion', 3, 3, NULL, 1),
	(64, 'SetTazones.jpg', NULL, 'Set de 5 Tazones', 'Marca: Nordika\r\nVasijas para Mezclar\r\nCantidad de Piezas: 5', 25, 29.99, 49.99, 'Unidad', 'Vidrio', 3, 3, NULL, 1),
	(65, 'SetEspecieros.jpg', NULL, 'Set de Especieros', 'Forma: Redonda\r\nColor: Transparente\r\nPiezas: 6', 15, 39.99, 69.99, 'Unidad', 'Vidrio-Metal', 3, 3, NULL, 1),
	(66, 'DispensadorAgua_1.jpg', NULL, 'Dispensador de Agua', 'Color: Natural\r\nForma: Cuadrado', 30, 69.99, 119.99, 'Unidad', 'Plastico', 3, 3, NULL, 1),
	(67, 'MoldeMuffin.jpg', NULL, 'Molde de Muffins', 'Marca: GOOD COOK\r\nCantidad de piezas: 1', 25, 19.99, 29.99, 'Unidad', 'Aluminio', 3, 3, NULL, 1),
	(68, 'PortaCuchillos.jpg', NULL, 'Porta Cubiertos', 'Retenedor de Utensilios\r\nColor: Cafe Oscuro\r\nPiezas: 9', 8, 79.99, 139.99, 'Unidad', 'Madera de Pino con Barniz', 3, 3, NULL, 1),
	(69, 'SetCuchillos.jpg', NULL, 'Set de Cuchillos', 'Marca: TRAMONTINA\r\nColor: Negro\r\nPiezas: 6', 20, 99.99, 149.99, 'Unidad', 'Acero Inoxidable, Plastico', 3, 3, NULL, 1),
	(70, 'BateriaCocina.jpg', NULL, 'Bateria de Cocina 8 piezas', 'Marca: NORDIKA\r\nPiezas: 8\r\nColor: Plateado', 16, 299.99, 499.99, 'Unidad', 'Vidrio, Acero Inoxidable', 3, 3, NULL, 1),
	(71, 'BateriaCocinaRojo.jpg', NULL, 'Bateria de Cocina 10 Piezas', 'Marca: TRAMONTINA\r\nAntiadherente: Si\r\nColor: Rojo', 10, 499.99, 899.99, 'Unidad', 'Aluminio/Antiadherente', 3, 3, NULL, 1),
	(72, 'BateriaAcero.jpg', NULL, 'Bateria de Cocina 12 Piezas', 'Marca: TRAMONTINA', 4, 599.99, 1199.99, 'Unidad', 'Acero Inoxidable, Plastico', 3, 3, NULL, 1),
	(73, 'Comal.jpg', NULL, 'Comalito', 'Marca: ALDURA\r\nDiametro: 28 cm\r\nColor: Negro', 25, 99.99, 129.99, 'Unidad', 'Metal', 3, 3, NULL, 1),
	(74, 'Gallinita.jpg', NULL, 'Canasta Diseno Gallinita', 'Marca: NORDIKA\r\nRetenedor/Cesta de Frutas/Huevos\r\nColor: Gris', 50, 39.99, 69.99, 'Unidad', 'Metal', 3, 3, NULL, 1),
	(75, 'Desayunador.jpg', NULL, 'Desayunador para Cama', 'Tamano: Grande\r\nPlegable', 40, 169.99, 299.99, 'Unidad', 'Madera', 3, 3, NULL, 1),
	(76, 'VasoAcero.jpg', NULL, 'Vaso de Acero Inoxidable', 'Marca: OSTER\r\nCapacidad de Vaso: 5 tazas', 38, 99.99, 149.99, 'Unidad', 'Acero Inoxidable', 3, 3, NULL, 1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table inventiolite.sell
CREATE TABLE IF NOT EXISTS `sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `operation_type_id` int(11) DEFAULT 2,
  `box_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `box_id` (`box_id`),
  KEY `operation_type_id` (`operation_type_id`),
  KEY `user_id` (`user_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`),
  CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_type` (`id`),
  CONSTRAINT `sell_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `sell_ibfk_4` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.sell: ~69 rows (approximately)
/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
INSERT INTO `sell` (`id`, `person_id`, `user_id`, `operation_type_id`, `box_id`, `created_at`) VALUES
	(1, NULL, 3, 1, NULL, '2017-10-12 19:52:55'),
	(2, NULL, 3, 1, NULL, '2017-10-12 19:53:13'),
	(3, NULL, 3, 1, NULL, '2017-10-12 19:53:41'),
	(4, NULL, 3, 1, NULL, '2017-10-12 19:55:06'),
	(5, NULL, 3, 1, NULL, '2017-10-12 19:55:28'),
	(6, NULL, 3, 1, NULL, '2017-10-12 19:55:54'),
	(7, NULL, 3, 1, NULL, '2017-10-12 19:56:17'),
	(8, NULL, 3, 1, NULL, '2017-10-12 19:56:32'),
	(9, NULL, 3, 1, NULL, '2017-10-12 19:56:50'),
	(10, NULL, 3, 1, NULL, '2017-10-12 19:57:14'),
	(11, NULL, 3, 1, NULL, '2017-10-12 19:57:32'),
	(12, NULL, 3, 1, NULL, '2017-10-12 19:57:56'),
	(13, NULL, 3, 1, NULL, '2017-10-12 19:58:14'),
	(14, NULL, 3, 1, NULL, '2017-10-12 20:00:11'),
	(15, NULL, 3, 1, NULL, '2017-10-12 20:02:02'),
	(16, NULL, 3, 1, NULL, '2017-10-12 20:02:40'),
	(17, NULL, 3, 1, NULL, '2017-10-12 20:03:19'),
	(18, NULL, 3, 1, NULL, '2017-10-12 20:03:33'),
	(19, NULL, 3, 1, NULL, '2017-10-12 20:03:49'),
	(20, NULL, 3, 1, NULL, '2017-10-12 20:04:11'),
	(21, NULL, 3, 1, NULL, '2017-10-12 20:04:31'),
	(22, NULL, 3, 1, NULL, '2017-10-12 20:04:47'),
	(23, NULL, 3, 1, NULL, '2017-10-12 20:05:02'),
	(24, NULL, 3, 1, NULL, '2017-10-12 20:05:16'),
	(25, NULL, 3, 1, NULL, '2017-10-12 20:05:55'),
	(26, NULL, 3, 1, NULL, '2017-10-12 20:06:07'),
	(27, NULL, 3, 1, NULL, '2017-10-12 20:06:21'),
	(28, NULL, 3, 1, NULL, '2017-10-12 20:06:40'),
	(29, NULL, 3, 1, NULL, '2017-10-12 20:07:13'),
	(30, NULL, 3, 1, NULL, '2017-10-12 20:07:25'),
	(31, NULL, 3, 1, NULL, '2017-10-12 20:07:40'),
	(32, NULL, 3, 1, NULL, '2017-10-12 20:07:54'),
	(33, NULL, 3, 1, NULL, '2017-10-12 20:08:07'),
	(34, NULL, 3, 1, NULL, '2017-10-12 20:08:24'),
	(35, NULL, 3, 1, NULL, '2017-10-12 20:08:40'),
	(36, NULL, 3, 1, NULL, '2017-10-12 20:08:54'),
	(37, NULL, 3, 1, NULL, '2017-10-12 20:09:09'),
	(38, NULL, 3, 1, NULL, '2017-10-12 20:09:33'),
	(39, NULL, 3, 1, NULL, '2017-10-12 20:09:51'),
	(40, NULL, 3, 1, NULL, '2017-10-12 20:10:27'),
	(41, NULL, 3, 1, NULL, '2017-10-12 20:10:40'),
	(42, NULL, 3, 1, NULL, '2017-10-12 20:10:54'),
	(43, NULL, 3, 1, NULL, '2017-10-12 20:11:05'),
	(44, NULL, 3, 1, NULL, '2017-10-12 20:11:19'),
	(45, NULL, 3, 1, NULL, '2017-10-12 20:11:34'),
	(46, NULL, 3, 1, NULL, '2017-10-12 20:12:35'),
	(47, NULL, 3, 1, NULL, '2017-10-12 20:13:05'),
	(48, NULL, 3, 1, NULL, '2017-10-12 20:13:19'),
	(49, NULL, 3, 1, NULL, '2017-10-12 20:13:32'),
	(50, NULL, 3, 1, NULL, '2017-10-12 20:13:50'),
	(51, NULL, 3, 1, NULL, '2017-10-12 20:15:17'),
	(52, NULL, 3, 1, NULL, '2017-10-12 20:15:32'),
	(53, NULL, 3, 1, NULL, '2017-10-12 20:15:45'),
	(54, NULL, 3, 1, NULL, '2017-10-12 20:15:57'),
	(55, 14, 3, 1, NULL, '2017-10-13 18:32:53'),
	(56, 7, 3, 1, NULL, '2017-10-13 18:33:22'),
	(57, 11, 3, 1, NULL, '2017-10-13 18:33:49'),
	(58, 4, 3, 1, NULL, '2017-10-13 18:34:15'),
	(59, 17, 3, 1, NULL, '2017-10-13 18:34:34'),
	(60, 3, 3, 1, NULL, '2017-10-13 18:34:59'),
	(61, 8, 3, 1, NULL, '2017-10-13 18:35:24'),
	(62, 9, 3, 1, NULL, '2017-10-13 18:36:00'),
	(63, 15, 3, 1, NULL, '2017-10-13 18:36:18'),
	(64, 13, 3, 1, NULL, '2017-10-13 18:36:36'),
	(65, 12, 3, 1, NULL, '2017-10-13 18:36:54'),
	(66, 3, 3, 1, NULL, '2017-10-13 18:37:13'),
	(67, 10, 3, 1, NULL, '2017-10-13 18:37:31'),
	(68, 8, 3, 1, NULL, '2017-10-13 18:37:52'),
	(69, 10, 3, 1, NULL, '2017-10-13 18:38:11');
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;

-- Dumping structure for table inventiolite.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `disponible` float DEFAULT NULL,
  `comprometidas` float DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.stock: ~76 rows (approximately)
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`product_id`, `nombre`, `disponible`, `comprometidas`) VALUES
	(1, 'Librera 5 Repisas', 50, 0),
	(2, 'Mesa Auxiliar', 85, 0),
	(3, 'Librera Cubos', 50, 0),
	(4, 'Rack Fusion', 55, 0),
	(5, 'Librera 3 Repisas', 25, 0),
	(6, 'Mesa Plegable', 5, 0),
	(7, 'Mesa de JardÃ­n', 15, 0),
	(8, 'Set de Mesa', 35, 0),
	(9, 'Sillón Columpio', 40, 0),
	(10, 'Sillón Reclinable', 20, 0),
	(11, 'Sillón Normal', 20, 0),
	(12, 'Sofá Cama', 5, 0),
	(13, 'Banco Bar', 50, 0),
	(14, 'Silla de Comedor', 150, 0),
	(15, 'Silla de Oficina', 3, 0),
	(16, 'Juguete de Goma', 65, 0),
	(17, 'Casa para Perro', 15, 0),
	(18, 'Protector de Asiento', 50, 0),
	(19, 'Dispensador de Agua', 100, 0),
	(20, 'Asiento para Mascota', 100, 0),
	(21, 'Correa  para Perro', 100, 0),
	(22, 'Casa para Perro PortÃ¡til', 100, 0),
	(23, 'Escalera PortÃ¡til', 100, 0),
	(24, 'Chaleco Impermeable', 100, 0),
	(25, 'Collar para Perro', 100, 0),
	(26, 'Arnés ', 100, 0),
	(27, 'Juguete de Peluche', 100, 0),
	(28, 'Jaula para Perro', 100, 0),
	(29, 'Transportador de Mascotas', 100, 0),
	(30, 'Sillón Cama', 100, 0),
	(31, 'Amoladora Angular', 100, 0),
	(32, 'Pulidora Orbital', 100, 0),
	(33, 'Rotomartillo ElÃ©ctrico', 100, 0),
	(34, 'Cautín Tipo Lápiz', 100, 0),
	(35, 'Taladro Inalámbrico', 100, 0),
	(36, 'Engrapadora Manual', 100, 0),
	(37, 'Escalera de Metal', 50, 0),
	(38, 'Cinta Métrica', 100, 0),
	(39, 'Martillo', 200, 0),
	(40, 'Set de Destornilladores', 100, 0),
	(41, 'Caja de Herramientas', 100, 0),
	(42, 'Cepillo Circular', 75, 0),
	(43, 'Sierra Profesional', 75, 0),
	(44, 'Desarmador Inalámbrico', 75, 0),
	(45, 'Sierra para Mader', 100, 0),
	(46, 'Set de Velas', 75, 0),
	(47, 'Marco para Fotos', 75, 0),
	(48, 'Individual', 75, 0),
	(49, 'Eucalipto Brillante', 75, 0),
	(50, 'Set Galería Doble Madera', 75, 0),
	(51, 'Cortina de Bambú', 75, 0),
	(52, 'Individual Bamboo', 100, 0),
	(53, 'Plato Base Redondo', 0, 0),
	(54, 'Plato Base Dorado', 100, 0),
	(55, 'Galería para Cortina', 100, 0),
	(56, 'Persiana Bambú', 100, 0),
	(57, 'Plato Base Redondo', 100, 0),
	(58, 'Farol Cuadrado', 100, 0),
	(59, 'Extensión Solar de Faros', 100, 0),
	(60, 'Cojín', 100, 0),
	(61, 'Espejo de Pared', 100, 0),
	(62, 'Mini Bar de manera', 100, 0),
	(63, 'Contenedores para Comida', 100, 0),
	(64, 'Set de 5 Tazones', 100, 0),
	(65, 'Set de Especieros', 100, 0),
	(66, 'Dispensador de Agua', 100, 0),
	(67, 'Molde de Muffins', 100, 0),
	(68, 'Porta Cubiertos', 100, 0),
	(69, 'Set de Cuchillos', 100, 0),
	(70, 'Batería de Cocina 8 piezas', 100, 0),
	(71, 'Batería de Cocina 10 Piezas', 100, 0),
	(72, 'Batería de Cocina 12 Piezas', 100, 0),
	(73, 'Comalito', 80, 0),
	(74, 'Canasta Diseño Gallinita', 75, 0),
	(75, 'Desayunador para Cama', 75, 0),
	(76, 'Vaso de Acero Inoxidable', 75, 0);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

-- Dumping structure for table inventiolite.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table inventiolite.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `is_active`, `is_admin`, `created_at`) VALUES
	(3, 'Administrador', '', '', 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, 1, 1, '2017-10-10 20:40:01'),
	(4, 'prueba', 'prueba', 'prueba', 'prueba@correo.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', NULL, 1, 0, '2017-11-04 13:26:07');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for trigger inventiolite.operation_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `operation_after_insert` BEFORE INSERT ON `operation` FOR EACH ROW BEGIN


IF NEW.operation_type_id = 1 THEN
	UPDATE  stock SET 
			  disponible   = disponible + new.q 
	WHERE product_id = new.product_id;
END IF;




END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger inventiolite.operation_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `operation_before_delete` BEFORE DELETE ON `operation` FOR EACH ROW BEGIN


IF old.operation_type_id = 1 THEN
	UPDATE  stock SET 
			  disponible   = disponible - old.q 
	WHERE product_id = old.product_id;
END IF;


IF old.operation_type_id = 2 THEN
	UPDATE  stock SET 
			  disponible   = disponible + old.q 
	WHERE product_id = old.product_id;
END IF;


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger inventiolite.product_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `product_after_insert` AFTER INSERT ON `product` FOR EACH ROW BEGIN

INSERT INTO STOCK
(product_id, nombre, disponible, comprometidas)
VALUES
(NEW.id, NEW.name, 0,0);


END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger inventiolite.stock_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `stock_before_update` BEFORE UPDATE ON `stock` FOR EACH ROW BEGIN

IF NEW.disponible <> OLD.disponible THEN

	INSERT INTO operation
	(product_id, q, operation_type_id, sell_id,created_at)
	VALUES
	(NEW.product_id , OLD.disponible - NEW.disponible, 2,1, NOW());

END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
