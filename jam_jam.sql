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
  CONSTRAINT `fk_user_follow_following` FOREIGN KEY (`follow_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_user_follow_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
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
  CONSTRAINT `fk_user_profiles` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `follow` (`id`, `user_id`, `follow_user_id`) VALUES
(1, 1, 2);
INSERT INTO `follow` (`id`, `user_id`, `follow_user_id`) VALUES
(2, 1, 3);
INSERT INTO `follow` (`id`, `user_id`, `follow_user_id`) VALUES
(3, 2, 3);
INSERT INTO `follow` (`id`, `user_id`, `follow_user_id`) VALUES
(4, 2, 1),
(5, 3, 1);

INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(1, 1, 'https://dummyimage.com/200x280', 'Berlin', NULL, NULL, 'beginner', '1233', 'user1@gmail.com', 'blablablab', 'guitar', NULL, 'https://soundcloud.com/introspectivachannel/saebius-a-thousand-changes');
INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(2, 2, 'https://dummyimage.com/200x280', 'Berlin', NULL, NULL, 'beginner', '3454534', 'user2@gmail.com', 'blablablab', 'bass', NULL, 'https://soundcloud.com/introspectivachannel/o-floating-machine-o');
INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(3, 3, 'https://dummyimage.com/200x280', 'Berlin', NULL, NULL, 'beginner', '234234', 'user3@gmail.com', 'blablablab', 'drum', NULL, 'https://soundcloud.com/jaycoba/space-disco-session-2-vinyl-by-simplexia');
INSERT INTO `profiles` (`id`, `user_id`, `picture`, `city`, `latitude`, `longitude`, `skill_level`, `contact_phone`, `contact_mail`, `biography`, `instrument`, `genre`, `music_sample`) VALUES
(4, 4, 'https://dummyimage.com/200x280', 'Berlin', NULL, NULL, 'advance', '153452', 'user4@gmail.com', 'blablablab', 'singer', NULL, NULL),
(5, 5, 'https://dummyimage.com/200x280', 'Berlin', NULL, NULL, 'advance', '2354234', 'user5@gmail.com', 'blablablab', 'gutar', NULL, NULL);

INSERT INTO `user` (`id`, `user_name`, `password`, `email`) VALUES
(1, 'user1', '1234', 'user1@gmail.com');
INSERT INTO `user` (`id`, `user_name`, `password`, `email`) VALUES
(2, 'user2', '1234', 'user2@gmail.com');
INSERT INTO `user` (`id`, `user_name`, `password`, `email`) VALUES
(3, 'user3', '1234', 'user3@gmail.com');
INSERT INTO `user` (`id`, `user_name`, `password`, `email`) VALUES
(4, 'user4', '1234', 'user4@gmail.com'),
(5, 'user5', '1234', 'user5@gmail.com');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;