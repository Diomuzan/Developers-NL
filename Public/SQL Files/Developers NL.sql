-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2022 at 03:28 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `developers_nl`
--
CREATE DATABASE IF NOT EXISTS `developers_nl` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `developers_nl`;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `working_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT DELAYED IGNORE INTO `employee` (`id`, `name`, `position`, `working_time`) VALUES
(1, 'Jason den Uijl', 'Manager', 9),
(2, 'Bryan Lo', 'Researcher', 9),
(3, 'Dion Smallenbroek', 'Production', 9);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT DELAYED IGNORE INTO `project` (`id`, `name`, `budget`) VALUES
(1, 'De Roeiboot', '200000.00'),
(2, 'Delft', '35000.00'),
(3, 'Het Blokkenhuis', '79500.00');

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
CREATE TABLE IF NOT EXISTS `relations` (
  `employee_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `employee_id2` int(11) NOT NULL,
  `project_id2` int(11) NOT NULL,
  UNIQUE KEY `relations__idx` (`employee_id2`),
  UNIQUE KEY `relations__idxv1` (`project_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relations`
--

INSERT DELAYED IGNORE INTO `relations` (`employee_id`, `project_id`, `employee_id2`, `project_id2`) VALUES
(NULL, NULL, 1, 1),
(NULL, NULL, 2, 2),
(NULL, NULL, 3, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_employee_fk` FOREIGN KEY (`employee_id2`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `relations_project_fk` FOREIGN KEY (`project_id2`) REFERENCES `project` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
