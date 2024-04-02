-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: na05-sql.pebblehost.com
-- Generation Time: Apr 02, 2024 at 08:11 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `sticky_messages`
--

CREATE TABLE `sticky_messages` (
  `id` int(11) NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  `message_content` text NOT NULL,
  `embed_color` varchar(7) DEFAULT '#0099ff',
  `embed_image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sticky_messages`
--

INSERT INTO `sticky_messages` (`id`, `channel_id`, `message_content`, `embed_color`, `embed_image`, `title`) VALUES
(7, '1120152656439152652', 'Professor Oak uses .trade as my trade command | EX: .trade Charizard', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(8, '1095166032387252304', 'Professor Rowan uses .trade as my trade command | EX: .trade Mesprit', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(9, '1095166009326977125', 'Professor Laventon uses .trade as my trade command | EX: .trade arceus', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(10, '1095165983112573008', 'Professor Sonia uses .trade as my trade command | EX: .trade Aromatisse', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(11, '1223860044614074469', 'Perrin uses .trade as my trade command | EX: .trade Blaziken', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(12, '1223629960376226002', 'Nemona uses .trade as my trade command | EX: .trade Blaziken', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(13, '1165861687593799770', 'Professor Jamie uses .lookup item EX: .lookup Golden, then use .order 0D90 for your golden throne', '#E67E22', 'https://i.imgur.com/XRutpEC.png', 'Professor Isabelle'),
(14, '1211772464548286524', 'Gym Iono uses .trade as my trade command | EX: .trade Blaziken', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(15, '1196766542650671165', 'ShinyPawmI uses $rv for Blueberry Violet raid EX: $rv <seed> <difficulty> <storyprogress>\r\n\r\nGet Seeds:\r\nfrom [GenPKM](http://genpkm.com/seeds.html)', '#9B59B6', 'https://i.imgur.com/FcWFiUY.png', NULL),
(16, '1224008347037073438', 'Professor Sada uses .trade as my trade command | EX: .trade Blaziken', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(17, '1220871454145515671', 'miRAIDon Bot uses !rv for blueberry violet raid EX: !rv <seed> <difficulty> <storyprogress>\r\n\r\nGet Seeds:\r\nfrom [GenPKM](http://genpkm.com/seeds.html)', '#9B59B6', 'https://i.imgur.com/FcWFiUY.png', NULL),
(20, '1224445716424949840', 'Giratina uses $trade | Ex. $trade Charizard @ Master Ball', '#FFFF00', 'https://i.imgur.com/FcWFiUY.png', NULL),
(21, '1144698854042775703', 'Haunter uses $rv for Paldea Scarlet raid EX: $rv <seed> <difficulty> <storyprogress>\r\n\r\nGet Seeds:\r\nfrom [GenPKM](http://genpkm.com/seeds.html)', '#9B59B6', 'https://i.imgur.com/FcWFiUY.png', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sticky_messages`
--
ALTER TABLE `sticky_messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sticky_messages`
--
ALTER TABLE `sticky_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
