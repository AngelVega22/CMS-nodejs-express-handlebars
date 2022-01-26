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

-- Volcando estructura para tabla proyectotec.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_artista` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `url_img` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectotec.producto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre_artista`, `descripcion`, `url_img`, `genero`, `precio`, `id_user`) VALUES
	(7, 'Bob Marley', 'musica reggae', 'https://images.pexels.com/photos/894156/pexels-photo-894156.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'raggea', 900, 7),
	(14, 'Shakira', 'musica pop', 'https://images.pexels.com/photos/4415532/pexels-photo-4415532.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'pop', 900, 9),
	(15, 'Muse', 'Banda de rock', 'https://images.pexels.com/photos/6173817/pexels-photo-6173817.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Rock', 9000, 9),
	(16, 'Simple plan', 'Rock punk', 'https://images.pexels.com/photos/2231751/pexels-photo-2231751.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'Rock punk', 800, 16),
	(17, 'Bob Marley', 'musica', 'https://images.pexels.com/photos/2231751/pexels-photo-2231751.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'raggea', 1, 24);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla proyectotec.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectotec.sessions: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
	('8nvoXGYqXCKiJOSVWvcxWYaH2ezcWhWy', 1643160610, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":6}}'),
	('D-o6mgs8SmTHmmghCEJ1YZyQp7Y8zrsq', 1643242319, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":1}}'),
	('c3qGPS_j9jwXcZ8WE5yKC0oUFLC-C-FE', 1643165248, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla proyectotec.user
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectotec.user: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `last_login`, `is_active`, `date_joined`, `password`, `is_superuser`, `user_name`, `is_artist`) VALUES
	(1, 'Angel ', 'Vega ', 'admin@gmail.com', '2022-01-21 08:27:33', 1, '2022-01-21 08:27:33', '$2a$10$I7JZS.cexfDGI8XxYqAPI.t9XjFGacm.FqjdMGk7vjvVSoV3t.3EG', 1, 'admin', 0),
	(7, 'Juan  ', 'Gomez    ', 'prueba@prueba.com    ', '2022-01-22 20:45:02', 1, '2022-01-22 20:45:02', '$2a$10$zJSZGlWEeyYUcyOvufBF6eJrhgxTS4cAYEzfsuHBP9hbw/ajKeGsG', 0, 'JuanP   ', 0),
	(9, 'Primer', 'Apellido', 'a@a.com  ', '2022-01-23 13:03:06', 1, '2022-01-23 13:03:06', '$2a$10$hDCGcK9IbXsksCp.gZ8dyOLdncCJq0QQmVmm5UGevCJldYnTUB3DG', 0, 'Usuario primer', 1),
	(14, 'angel', 'Vega', 'b@b.com', '2022-01-23 13:35:40', 1, '2022-01-23 13:35:40', '$2a$10$N2IlUnKZW2nYDpd2zryci.ahwQbB8SJY5F6Lwcec8rU7AS7nB5ZgS', 0, 'avega', 0),
	(15, 'Angel', 'Vega', 'c@c.com', '2022-01-23 13:36:31', 1, '2022-01-23 13:36:31', '$2a$10$lqS72qkIuYgLsNJity6vm.y1DZmbcNdMnLRDag0PNboaOVKTxomym', 0, 'avega', 0),
	(16, 'Angel', 'Vega', 'd@d.com', '2022-01-23 13:38:10', 1, '2022-01-23 13:38:10', '$2a$10$HyBGtc5n3jpJ2lXO5kQPrOfeIuQ.tFkI/Q3zGAQWEREIO2aYfpWG.', 0, 'avega', 1),
	(17, 'Angel', 'Vega', 'e@e.com', '2022-01-23 13:40:24', 1, '2022-01-23 13:40:24', '$2a$10$B2rnOEmwL00wjCf3GaXNre4yZ.HaIMcOHpzP0EQZAB26qJnjQAgYW', 0, 'avega', 1),
	(18, 'Angel', 'Vega', 'f@f.com', '2022-01-23 13:45:26', 1, '2022-01-23 13:45:26', '$2a$10$rnRSsA5/uEy/XXcZ.y6DGu44n6ITP1QQPo.C2hg8WM1smlY1QwzUi', 0, 'avega', 1),
	(19, 'Angel', 'Vega', 'g@g.com', '2022-01-23 13:46:23', 1, '2022-01-23 13:46:23', '$2a$10$3jpy7TGUf0m/Ew4wQvmT0eTrYd3nxV8ZtI/Bdl./Ji7NiE5rVK/Vy', 0, 'avega', 0),
	(20, 'Angel', 'Vega', 'h@h.com', '2022-01-23 14:19:40', 1, '2022-01-23 14:19:40', '$2a$10$FvflwCUw4tljiNjq58qIjeiMV6Fj6maJZZG/mdwT/R2Bv2G8m9Fbu', 0, 'avega', 0),
	(21, 'CLIENTE', 'CLIENTE', 'i@i.com', '2022-01-23 15:45:29', 1, '2022-01-23 15:45:29', '$2a$10$4eMJ1at7i1nzDNFxR7R61.1FsqV5n/G7iDai6BNDZUR.ok2RPqAf.', 0, 'avega', 0),
	(22, 'ARTISTA', 'ARTISTA', 'j@j.com', '2022-01-23 15:46:01', 1, '2022-01-23 15:46:01', '$2a$10$nPeSnS1kGu1xudvH7A4WCuQyXLJk8jD4mvVvSHgFZDUCbSNu.rjLe', 0, 'avega', 1),
	(23, 'Angel', 'Vega', 'k@k.com', '2022-01-24 18:38:44', 1, '2022-01-24 18:38:44', '$2a$10$8iBzyePVEiYQ.YEl8tCPXeFV0bx5IBZHR0s7krV/SXjelY1T9P0dq', 0, 'avega', 0),
	(24, 'Joel', 'Minaya', 'minaya@minaya.com  ', '2022-01-25 00:07:56', 1, '2022-01-25 00:07:56', '$2a$10$1MPUsScM/B8CdZ3xReae9uwFpb1624eUBH9uMCtuqcPBdJR2plVVW', 0, 'misterminaya  ', 1),
	(25, 'Rebeca', 'Ruiz', 'rebeca@rebeca.com', '2022-01-25 00:10:46', 1, '2022-01-25 00:10:46', '$2a$10$Thi6bQmnJ19P8J4T1U1oAe6mqAB8qamU/nX89LB2gqN5f5OLhFc6.', 0, 'rebe', 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
