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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectotec.producto: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre_artista`, `descripcion`, `url_img`, `genero`, `precio`, `id_user`) VALUES
	(1, 'Canto ', 'canto para cumpleaños', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/adele-1636963562.jpg', 'Canto ', 900, 32),
	(3, 'otro', 'musica', 'https://nypost.com/wp-content/uploads/sites/2/2021/11/adele-one-night-only-3.jpg?quality=90&strip=all&w=682', 'otro', 1222, 32),
	(4, 'otro', 'muse', 'https://cdn-3.expansion.mx/dims4/default/4b0be03/2147483647/strip/true/crop/1000x1250+0+0/resize/1200x1500!/format/webp/quality/90/?url=https%3A%2F%2Fcdn-3.expansion.mx%2F99%2F55%2Fd5c0b9d44aa48fb4c7b67c9efb83%2Fadele.jpg', 'Saludo', 1299, 32),
	(5, 'otro', 'otro', 'http://www.zeleb.mx/sites/default/files/styles/news_main_image/public/aleks_syntek_revelo_que_usa_lentes_desde_muy_joven..jpg?itok=14SX-K06', 'otro', 700, 37);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

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
	('Fk6DrNzRkxMaEQgxnL8ToxQF1aAPuIue', 1643683731, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{}}');
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
  `foto` longtext,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyectotec.user: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `last_login`, `is_active`, `date_joined`, `password`, `is_superuser`, `user_name`, `is_artist`, `foto`) VALUES
	(1, 'Angel ', 'Vega ', 'admin@gmail.com', '2022-01-21 08:27:33', 1, '2022-01-21 08:27:33', '$2a$10$I7JZS.cexfDGI8XxYqAPI.t9XjFGacm.FqjdMGk7vjvVSoV3t.3EG', 1, 'admin', 0, NULL),
	(32, 'Adele   ', 'Blue Atkins', 'artista1@gmail.com          ', '2022-01-29 15:31:39', 1, '2022-01-29 15:31:39', '$2a$10$SbIxV2cMSkCMKRWndvRpq.BBa/FuIvQYUnu43zxRF.6/sr0ZpMTYa', 0, 'Adele ', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgdS47d1ZWjD0VS_dkQcmQroPwhdQXqJPdSA&usqp=CAU  '),
	(33, 'Jared ', 'Leto ', 'artista2@gmail.com    ', '2022-01-29 16:36:50', 1, '2022-01-29 16:36:50', '$2a$10$GNGZoZXuuPURW3vpuq9AKu2leNcP1TeB0h5kaKbUE28zO.4KzwAIW', 0, 'Jared Leto', 1, 'https://www.alohacriticon.com/wp-content/uploads/2003/07/jared-leto-fotos.jpg '),
	(36, 'Carlos ', 'Sadness ', 'artista4@gmail.com    ', '2022-01-29 17:58:21', 1, '2022-01-29 17:58:21', '$2a$10$Tb7sRFeCLvAgPv4zYHNRSOvYoidWppRg9xrVuXL4hqcFCLLQAAxlW', 0, 'Carlos Sadness', 1, 'https://vanidad.es/images/carpeta_gestor/archivos/2019/06/28/CSADNESS_lalomar1.jpg '),
	(37, 'Alek  ', 'Syntek  ', 'artista5@gmail.com  ', '2022-01-30 11:18:23', 1, '2022-01-30 11:18:23', '$2a$10$M7Q0ZPcSywRFr2W2tE1LH.AjY8rjkQtIDhvrzkieIADnhZfXLrfrS', 0, 'Alek Syntek', 1, ' https://ca-times.brightspotcdn.com/dims4/default/0ee6ae1/2147483647/strip/true/crop/1360x2048+0+0/resize/840x1265!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F96%2F66%2F34bab639a42f440e768564ffd78c%2Fsdut-el-cantante-mexicano-aleks-synt-20160823 '),
	(38, 'Angel     ', 'Vega     ', 'avega@gmail.com     ', '2022-01-30 17:45:52', 1, '2022-01-30 17:45:52', '$2a$10$T9bqZml7Cti/9AONb0.xeuT1dWF2b3QJSPhEBC62S9aujxa.BlJ2S', 0, 'Avega', 0, '     '),
	(41, 'usuario', 'usuario', 'usuario@usuario.com', '2022-01-30 21:27:43', 1, '2022-01-30 21:27:43', '$2a$10$SK5.7rMWViBu7NpaR/WI2.aa/.KuPV1VKBBZCvDIzR9ji2no56Wfm', 0, 'usuario', 0, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
