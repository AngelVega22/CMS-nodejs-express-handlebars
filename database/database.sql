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


-- Volcando estructura de base de datos para escuela
CREATE DATABASE IF NOT EXISTS `escuela` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `escuela`;

-- Volcando estructura para tabla escuela.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla escuela.categoria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`, `foto`, `descripcion`) VALUES
	(1, ' Marketing ', '/uploads/bg.jpg', ' Marketing Digital y neuromarketing'),
	(2, 'Desarrollo web ', '/uploads/bg-system.jpg', 'Diseño y desarrollo web '),
	(3, 'Publicidad', NULL, 'Publicidad');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla escuela.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_c` varchar(255) NOT NULL,
  `descripcion_c` varchar(255) NOT NULL,
  `foto_c` varchar(255) DEFAULT NULL,
  `precio` float NOT NULL,
  `id_categoria` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla escuela.curso: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`id`, `nombre_c`, `descripcion_c`, `foto_c`, `precio`, `id_categoria`) VALUES
	(14, 'Neuromarketing', 'Neuromarketing interesante', NULL, 120, 1),
	(15, 'Wordpress', 'Wordpress', NULL, 121, 2),
	(16, 'Programación web', 'Programación web', NULL, 980, 2),
	(17, 'Wordpress avanzado', 'Wordpress avanzado', NULL, 100, 2),
	(18, 'PHP', 'PHP', NULL, 121, 2),
	(19, 'HTML', 'HTML', NULL, 700, 2),
	(20, 'Marketing digital avanzado', 'Marketing digital avanzado', NULL, 239, 1),
	(21, 'Introduccion a la publicidad', 'Introduccion a la publicidad', NULL, 120, 3);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Volcando estructura para tabla escuela.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla escuela.sessions: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
	('l8n2TuPPOqaeXiKzIjT6p8draR_ENXvD', 1644558750, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":32}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla escuela.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '0',
  `is_superuser` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_artist` int(11) DEFAULT '0',
  `foto` longtext,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla escuela.user: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `last_login`, `is_active`, `date_joined`, `password`, `is_superuser`, `user_name`, `is_artist`, `foto`) VALUES
	(1, 'Angel ', 'Vega ', 'admin@gmail.com', '2022-01-21 08:27:33', 1, '2022-01-21 08:27:33', '$2a$10$I7JZS.cexfDGI8XxYqAPI.t9XjFGacm.FqjdMGk7vjvVSoV3t.3EG', 1, 'admin', 0, '/uploads/laragon.png'),
	(32, 'Profesor ', 'Blue Atkins    ', 'artista1@gmail.com              ', '2022-01-29 15:31:39', 1, '2022-01-29 15:31:39', '$2a$10$SbIxV2cMSkCMKRWndvRpq.BBa/FuIvQYUnu43zxRF.6/sr0ZpMTYa', 0, 'Profesor ', 1, '/uploads/yo2.png'),
	(33, 'Jared  ', 'Leto  ', 'artista2@gmail.com     ', '2022-01-29 16:36:50', 1, '2022-01-29 16:36:50', '$2a$10$GNGZoZXuuPURW3vpuq9AKu2leNcP1TeB0h5kaKbUE28zO.4KzwAIW', 0, 'Jared Leto ', 1, '/uploads/pexels-ekaterina-bolovtsova-6689233.mp4'),
	(36, 'Carlos  ', 'Sadness  ', 'artista4@gmail.com     ', '2022-01-29 17:58:21', 1, '2022-01-29 17:58:21', '$2a$10$Tb7sRFeCLvAgPv4zYHNRSOvYoidWppRg9xrVuXL4hqcFCLLQAAxlW', 0, 'Carlos Sadness ', 1, ''),
	(37, 'Alek   ', 'Syntek   ', 'artista5@gmail.com   ', '2022-01-30 11:18:23', 1, '2022-01-30 11:18:23', '$2a$10$M7Q0ZPcSywRFr2W2tE1LH.AjY8rjkQtIDhvrzkieIADnhZfXLrfrS', 0, 'Alek Syntek ', 1, ''),
	(44, 'Artista           ', 'prueba           ', 'artista3@gmail.com           ', '2022-02-01 23:12:45', 1, '2022-02-01 23:12:45', '$2a$10$LEd6YxBWbsJmOmGhN3TUA.ImA60a9ZI3J2bGMAaPvID38LnCPEGgS', 0, 'Muse', 1, '/uploads/pexels-anastasia-shuraeva-8028186.mp4'),
	(45, 'cliente', 'prueba', 'cliente1@gmail.com', '2022-02-02 01:03:45', 1, '2022-02-02 01:03:45', '$2a$10$f16BK0ue6yRD9KcL6T3xae5l2bawz/uOpXcFelCXwa/d6OYvMpRkK', 0, 'avega', 0, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
