-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para proyectotec
CREATE DATABASE IF NOT EXISTS `proyectotec` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `proyectotec`;

-- Volcando estructura para tabla proyectotec.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectotec.sessions: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
	('v82eir5QOoWCdRsbdyW9tYaK0eTi8_IF', 1642899244, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":6}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla proyectotec.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  `date_joined` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_superuser` bit(1) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectotec.user: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `last_login`, `is_active`, `date_joined`, `password`, `is_superuser`, `user_name`) VALUES
	(6, 'Angel', 'Vega', 'aveg@gmail.com', '2022-01-21 08:27:33', 1, '2022-01-21 08:27:33', '$2a$10$I7JZS.cexfDGI8XxYqAPI.t9XjFGacm.FqjdMGk7vjvVSoV3t.3EG', b'1', 'avega');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
