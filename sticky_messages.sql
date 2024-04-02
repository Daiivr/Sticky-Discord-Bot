-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `sticky_messages` (
  `id` int(11) NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  `message_content` text NOT NULL,
  `embed_color` varchar(7) DEFAULT '#0099ff',
  `embed_image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `sticky_messages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sticky_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;
