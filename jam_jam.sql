/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `follow` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `follow_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_user_follow_user_id` (`user_id`),
  KEY `fk_user_follow_following` (`follow_user_id`),
  CONSTRAINT `fk_user_follow_following` FOREIGN KEY (`follow_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_user_follow_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `skill_level` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `biography` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `instrument` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `music_sample` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_profiles` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(6, 6, NULL, 'Berlin', '52.5094201', '13.3340932', 'beginner', NULL, NULL, NULL, 'giutar', 'rock', NULL);
INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(7, 7, NULL, 'Berlin', '52.5088673', '13.3891173', 'beginner', NULL, NULL, NULL, 'bass', 'blues', NULL);
INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(8, 8, NULL, 'Berlin', '52.5260965', '13.4236683', 'beginr', NULL, NULL, NULL, 'bass', 'blues', NULL);
INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(12, 11, NULL, 'Berlin', '52.5433028', '13.4065609', 'beginner', NULL, NULL, NULL, 'Violin', 'blues', NULL),
(13, 12, NULL, 'Berlin', '52.4952698', '13.4284234', 'beginner', NULL, NULL, NULL, 'banjo', 'classical', NULL),
(14, 13, NULL, 'Berlin', '52.5451792', '13.3547416', 'advanced', NULL, NULL, NULL, 'banjo', 'blues', NULL),
(15, 14, NULL, 'Berlin', '52.5483204', '13.3784226', 'advanced', NULL, NULL, NULL, 'giutar', 'blues', NULL);

INSERT INTO `users` (`id`, `user_name`, `password`, `email`) VALUES
(1, 'user1', '1234', 'user1@gmail.com');
INSERT INTO `users` (`id`, `user_name`, `password`, `email`) VALUES
(2, 'user2', '1234', 'user2@gmail.com');
INSERT INTO `users` (`id`, `user_name`, `password`, `email`) VALUES
(3, 'user3', '1234', 'user3@gmail.com');
INSERT INTO `users` (`id`, `user_name`, `password`, `email`) VALUES
(4, 'user4', '1234', 'user4@gmail.com'),
(5, 'user5', '1234', 'user5@gmail.com'),
(6, 'Marta', '1234', '@'),
(7, 'Anna', '1234', '@'),
(8, 'Eike', '1234', '@'),
(11, 'Claudia', '1234', '@'),
(12, 'Berd', '1234', '@'),
(13, 'Lena', '1234', '@'),
(14, 'Ugo', '1234', '@'),
(15, 'Mez', '1234', '@'),
(16, 'Pilar', '1234', '@');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;