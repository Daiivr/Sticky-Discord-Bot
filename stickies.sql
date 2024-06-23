-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: na05-sql.pebblehost.com
-- Generation Time: Jun 23, 2024 at 06:06 PM
-- Server version: 10.5.12-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customer_623285_pokemonlegends`
--
CREATE DATABASE IF NOT EXISTS `customer_623285_pokemonlegends` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `customer_623285_pokemonlegends`;

-- --------------------------------------------------------

--
-- Table structure for table `sticky_messages`
--

DROP TABLE IF EXISTS `sticky_messages`;
CREATE TABLE IF NOT EXISTS `sticky_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `embed_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT '#0099ff',
  `embed_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
