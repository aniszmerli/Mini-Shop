-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2024 at 11:52 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `address_line1`, `address_line2`, `postal_code`, `city`, `phone_number`) VALUES
(3, 'Charguia', NULL, '2073', 'Ariana', '12345678'),
(4, 'Charguia', NULL, '2073', 'Ariana', '12345678'),
(5, 'Charguia', NULL, '2073', 'Ariana', '11111111');

-- --------------------------------------------------------

--
-- Table structure for table `application_user`
--

DROP TABLE IF EXISTS `application_user`;
CREATE TABLE IF NOT EXISTS `application_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_id` int DEFAULT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`),
  UNIQUE KEY `UNIQ_7A7FBEC1F5B7AF75` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_user`
--

INSERT INTO `application_user` (`id`, `address_id`, `username`, `roles`, `password`) VALUES
(1, NULL, 'anis', '[\"ROLE_ADMIN\"]', '$2y$13$ixTSQA6gA7kBWrQHFMdPGOoo4u.Wtxmmx.kPo0RI.SQhh4zpB9hoK'),
(2, NULL, 'user', '[\"ROLE_USER\"]', '$2y$13$uihKXZHUenR/7X1c0flXGO.yL16KYiEPl9E4zWVpCw0U3stdoxLs2'),
(4, NULL, 'user2', '[\"ROLE_USER\"]', '$2y$13$hYPaJ75Yf/88euj0F1b3eukOGTuYkM5a3c2/AaCstRIHKJTS.Hvau'),
(5, NULL, 'buyer', '[\"ROLE_USER\"]', '$2y$13$JkhGPGbd44hrfyOPKeFE0etMzLd.5Q5rU6mvEncenKI5U75bCA0Ky'),
(6, NULL, 'user3', '[\"ROLE_USER\"]', '$2y$13$jWZ8stduH41qIXQcgQPPwulQL3txaTnLPYbsKDmNBrJ3p37U1A5bS');

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `for_user_id` int NOT NULL,
  `address_id` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivred_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `quantity` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8ECAEAD4F5B7AF75` (`address_id`),
  KEY `IDX_8ECAEAD44584665A` (`product_id`),
  KEY `IDX_8ECAEAD49B5BB4B8` (`for_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`id`, `product_id`, `for_user_id`, `address_id`, `status`, `created_at`, `delivred_at`, `quantity`, `total`) VALUES
(4, 10, 2, 4, 'delivered', '2024-05-20 23:27:03', '2024-05-20 23:32:19', 1, 250),
(5, 12, 6, 5, 'pending', '2024-05-20 23:42:19', NULL, 1, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240515090333', '2024-05-20 19:30:22', 747);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by_id` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04ADB03A8386` (`created_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `created_by_id`, `status`, `price`, `quantity`, `description`, `name`, `is_used`, `photo`) VALUES
(7, 2, 'accepted', 2500, 1, 'IPhone 14 Pro Max \r\n28 GB\r\n batterie 🔋88%\r\n avec tous les accessoires câble original\r\nTrue Tone ✅❇️\r\nFace ID ✅❇️', 'iPhone 14 Pro Max', 1, '8f3d05ed8881fe82e6ab6390d3faab75.jpg'),
(8, 2, 'accepted', 1100, 1, 'Pc Portable Asus\r\n1To\r\n8Go Ram', 'Pc Portable', 1, '71fe114299dc193f2781fac2aee12eca.jpg'),
(9, 4, 'accepted', 500, 1, 'Ecran 24\"\r\n144Hz', 'Ecran AOC', 1, '7aae95ee14b28caedffcbcafe737cbec.jpg'),
(10, 4, 'accepted', 250, 0, 'Manette PS5', 'Manette PS5', 1, '99399d4e4ac1cf08350a86e0a2d5b6de.jpg'),
(11, 4, 'accepted', 1200, 1, 'Camera Canon', 'Camera', 1, 'a95a5dddfabe91434bf1aea33a5b2ecf.jpg'),
(12, 2, 'accepted', 1500, 1, 'Play Station 5\r\navec manette', 'Play Station 5', 1, '96bc9c5c96fa03251d73bcff71999814.jpg'),
(13, 2, 'rejected', 700, 1, 'Play Station 4\r\navec 2 manettes et pes 2021', 'Play Station 4', 1, 'b73c8ba3c60793b9a2045e60e9ee5eef.jpg'),
(14, 4, 'accepted', 700, 1, 'Play Station 4\r\navec 2 manettes et pes 2021', 'Play Station 4', 1, '3036f69610e50338330f50c72887663a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_report`
--

DROP TABLE IF EXISTS `product_report`;
CREATE TABLE IF NOT EXISTS `product_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `by_user_id` int NOT NULL,
  `to_product_id` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A6533620DC9C2434` (`by_user_id`),
  KEY `IDX_A653362062B78427` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application_user`
--
ALTER TABLE `application_user`
  ADD CONSTRAINT `FK_7A7FBEC1F5B7AF75` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Constraints for table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `FK_8ECAEAD44584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_8ECAEAD49B5BB4B8` FOREIGN KEY (`for_user_id`) REFERENCES `application_user` (`id`),
  ADD CONSTRAINT `FK_8ECAEAD4F5B7AF75` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04ADB03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `application_user` (`id`);

--
-- Constraints for table `product_report`
--
ALTER TABLE `product_report`
  ADD CONSTRAINT `FK_A653362062B78427` FOREIGN KEY (`to_product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_A6533620DC9C2434` FOREIGN KEY (`by_user_id`) REFERENCES `application_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
