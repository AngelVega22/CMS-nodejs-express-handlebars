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

-- Volcando datos para la tabla prototype.sessions: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
	('9wveGiAGoX_idAJz1IaxJd5srMzeQ4Kp', 1642821229, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":2}}'),
	('Px4LEhMYN-P4VhmXW9f_SWDosZnlgzSq', 1642821460, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":3}}'),
	('ZEVJgipikOpZPlaYvOzrDfa-oYvnVbVU', 1642828917, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":3}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando datos para la tabla prototype.user: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `last_login`, `is_active`, `date_joined`, `password`, `is_superuser`, `user_name`) VALUES
	(1, 'Angel', 'Vega', 'aveg@gmail.com', NULL, 1, NULL, 'dasdasasddasasddas', NULL, NULL),
	(3, 'Angel', 'Vega', 'avega@gmail.com', '2022-01-20 22:15:41', 1, '2022-01-20 22:15:41', '$2a$10$mPerabyLgZ8ed.uOhf7QoOpmiHgT0wVOce9VQUrXiblu/FPfk0OY6', b'1', 'avega'),
	(4, 'Angel', 'Vega', 'a@a.com', '2022-01-20 22:22:06', 1, '2022-01-20 22:22:06', '$2a$10$KQ9KY4.fDufqu3R5TXneXeTiJ5E0CTt67KNeu7VlJUVeysjOLS3Ka', b'1', 'avega'),
	(5, 'Angel', 'Vega', 'correo@correo.com', '2022-01-20 22:23:47', 1, '2022-01-20 22:23:47', '$2a$10$rvJIksvwPetA8E8eSntbHuCzkbWJkdFn27ahzfYTQqn5/MGrLVhB6', b'1', 'avega');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
