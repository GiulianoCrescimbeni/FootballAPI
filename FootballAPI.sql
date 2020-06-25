-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 25, 2020 at 03:52 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FootballAPI`
--

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `squad_position` int(11) NOT NULL,
  `squad_name` varchar(100) DEFAULT NULL,
  `squad_points` int(11) DEFAULT NULL,
  `squad_played` int(11) DEFAULT NULL,
  `squad_winned` int(11) DEFAULT NULL,
  `squad_loosed` int(11) DEFAULT NULL,
  `squad_tie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`squad_position`, `squad_name`, `squad_points`, `squad_played`, `squad_winned`, `squad_loosed`, `squad_tie`) VALUES
(1, 'Juventus', 66, 27, 21, 3, 3),
(2, 'Lazio', 62, 27, 19, 5, 3),
(3, 'Inter', 58, 27, 17, 7, 3),
(4, 'Atalanta', 54, 27, 16, 6, 5),
(5, 'Roma', 48, 27, 14, 6, 7),
(6, 'Napoli', 42, 27, 12, 6, 9),
(7, 'Parma', 39, 27, 11, 6, 10),
(8, 'Milan', 39, 27, 11, 6, 10),
(9, 'Verona', 38, 27, 10, 8, 9),
(10, 'Cagliari', 35, 27, 9, 8, 10),
(11, 'Bologna', 34, 27, 9, 7, 11),
(12, 'Sassuolo', 33, 27, 9, 6, 12),
(13, 'Fiorentina', 31, 27, 7, 10, 10),
(14, 'Torino', 31, 27, 9, 4, 14),
(15, 'Udinese', 28, 27, 7, 7, 13),
(16, 'Sampdoria', 26, 27, 7, 5, 15),
(17, 'Genoa', 25, 27, 6, 7, 14),
(18, 'Lecce', 25, 27, 6, 7, 14),
(19, 'Spal', 18, 27, 5, 3, 19),
(20, 'Brescia', 17, 27, 4, 5, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`squad_position`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `squad_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
