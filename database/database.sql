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
  `estado_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla escuela.categoria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`, `foto`, `descripcion`, `estado_categoria`) VALUES
	(1, ' Marketing  ', '/uploads/redes.png', ' Marketing Digital y neuromarketing ', 1),
	(2, 'Desarrollo web  ', '/uploads/content.png', 'Aprende desarrollar tu sitio web desde cero, conoce todos los lenguajes de programación, maquetadores visuales, gestores de contenido como WordPress y administra tu sitio web sin complicaciones.', 1),
	(3, 'Publicidad  ', '/uploads/4360029.png', 'Publicidad   ', 1),
	(6, 'Comunicación  ', '/uploads/comun.png', 'Comunicación  ', 1),
	(7, 'Programación ', '/uploads/coding.png', 'Programación ', 1),
	(8, 'Diseño gráfico  ', '/uploads/dise.png', 'El diseño gráfico es la profesión y disciplina académica cuya actividad consiste en proyectar comunicaciones visuales destinadas a transmitir mensajes específicos a grupos sociales con objetivos determinados.', 1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla escuela.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `id_c` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_c` varchar(255) DEFAULT NULL,
  `descripcion_c` longtext,
  `foto_c` varchar(255) DEFAULT NULL,
  `precio` varchar(50) DEFAULT NULL,
  `horario` varchar(200) DEFAULT NULL,
  `duracion` varchar(200) DEFAULT NULL,
  `inicio` varchar(200) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT '0',
  `estado_curso` int(11) DEFAULT '0',
  `is_promo` int(11) DEFAULT '0',
  PRIMARY KEY (`id_c`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla escuela.curso: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`id_c`, `nombre_c`, `descripcion_c`, `foto_c`, `precio`, `horario`, `duracion`, `inicio`, `id_categoria`, `estado_curso`, `is_promo`) VALUES
	(44, ' Wordpress  ', ' Wordpress  ', '/uploads/img_3125.jpg', '  1234  ', '1pm a 3pm', '6 meses', 'marzo', 1, 1, 0),
	(46, 'Javascript   ', 'JavaScript (JS) es un lenguaje de programación ligero, interpretado, o compilado justo-a-tiempo (just-in-time) con funciones de primera clase. ', '/uploads/640px-js.png', '250   ', '1pm a 3pm', '6 meses', 'Junio', 2, 1, 1),
	(51, 'PHP  ', 'PHP (acrónimo recursivo de PHP: Hypertext Preprocessor ) es un lenguaje de código abierto muy popular especialmente adecuado para el desarrollo web y que puede ser incrustado en HTML. ', '/uploads/PHP-logo.svg.png', '808  ', '1pm a 3pm', '3 meses', 'marzo', 2, 1, 1),
	(52, 'SEO  ', 'El posicionamiento en buscadores u optimización de motores de búsqueda es el proceso de mejorar la visibilidad de un sitio web en los resultados orgánicos de los diferentes buscadores.', '/uploads/mark.jpg', '808  ', '1pm a 3pm', '3 meses', 'marzo', 3, 1, NULL),
	(53, 'SEO   ', 'Curso de seo', '/uploads/publi.png', '808   ', '1pm a 3pm', '3 meses', 'marzo', 6, 1, 1),
	(54, 'Google ads  ', 'Google ads  ', '/uploads/goosda.png', '900  ', '1pm a 3pm', '6 meses', 'marzo', 3, 1, NULL),
	(55, 'Fotografia', 'Fotografia', NULL, '900', '1pm a 3pm', '6 meses', 'marzo', 6, 1, 0),
	(56, 'C++', 'C++', NULL, '900', '1pm a 3pm', '3 meses', 'febrero', 7, 1, 0),
	(57, 'Photoshop ', 'Photoshop ', '/uploads/ps.png', '900 ', '1pm a 3pm', '6 meses', 'Junio', 8, 1, 0),
	(58, 'Illustrator  ', 'Illustrator  ', '/uploads/ai.png', '900  ', '1pm a 3pm', '6 meses', 'febrero', 8, 1, 1);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Volcando estructura para tabla escuela.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla escuela.sessions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
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

-- Volcando datos para la tabla escuela.user: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `last_login`, `is_active`, `date_joined`, `password`, `is_superuser`, `user_name`, `is_artist`, `foto`) VALUES
	(1, 'Angel ', 'Vega ', 'admin@gmail.com', '2022-01-21 08:27:33', 1, '2022-01-21 08:27:33', '$2a$10$I7JZS.cexfDGI8XxYqAPI.t9XjFGacm.FqjdMGk7vjvVSoV3t.3EG', 1, 'admin', 0, '/uploads/laragon.png'),
	(32, 'Angel ', 'Vega', 'artista1@gmail.com               ', '2022-01-29 15:31:39', 1, '2022-01-29 15:31:39', '$2a$10$SbIxV2cMSkCMKRWndvRpq.BBa/FuIvQYUnu43zxRF.6/sr0ZpMTYa', 0, 'Angel Vega', 1, '/uploads/yo2.png'),
	(37, 'Alek   ', 'Syntek   ', 'artista5@gmail.com   ', '2022-01-30 11:18:23', 1, '2022-01-30 11:18:23', '$2a$10$M7Q0ZPcSywRFr2W2tE1LH.AjY8rjkQtIDhvrzkieIADnhZfXLrfrS', 0, 'Alek Syntek ', 1, ''),
	(45, 'Bruno ', 'yapay ', 'cliente1@gmail.com  ', '2022-02-02 01:03:45', 1, '2022-02-02 01:03:45', '$2a$10$f16BK0ue6yRD9KcL6T3xae5l2bawz/uOpXcFelCXwa/d6OYvMpRkK', 0, 'avega  ', 0, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
