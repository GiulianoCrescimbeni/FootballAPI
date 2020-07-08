-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Lug 08, 2020 alle 14:49
-- Versione del server: 10.1.21-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Struttura della tabella `scorers`
--

CREATE TABLE `scorers` (
  `player_position` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `player_squad` varchar(100) DEFAULT NULL,
  `player_role` varchar(100) DEFAULT NULL,
  `player_goals` int(11) DEFAULT NULL,
  `player_penalties` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scorers`
--

INSERT INTO `scorers` (`player_position`, `player_name`, `player_squad`, `player_role`, `player_goals`, `player_penalties`) VALUES
(1, 'C. Immobile', 'Lazio', 'Attaccante ', 29, 11),
(2, 'C. Ronaldo', 'Juventus', 'Attaccante ', 26, 9),
(3, 'R. Lukaku', 'Inter', 'Attaccante ', 20, 5),
(4, 'J. Pedro', 'Cagliari', 'Centrocampista ', 17, 4),
(5, 'L. Muriel', 'Atalanta', 'Attaccante ', 16, 6),
(6, 'F. Caputo', 'Sassuolo', 'Attaccante ', 15, 1),
(7, 'J. Ilicic', 'Atalanta', 'Centrocampista ', 15, 0),
(8, 'E. Dzeko', 'Roma', 'Attaccante ', 14, 0),
(9, 'D. Zapata', 'Atalanta', 'Attaccante ', 14, 1),
(10, 'A. Belotti', 'Torino', 'Attaccante ', 13, 7),
(11, 'L. MartÃ­nez', 'Inter', 'Attaccante ', 12, 2),
(12, 'A. Petagna', 'Spal', 'Attaccante ', 12, 5),
(13, 'D. Berardi', 'Sassuolo', 'Attaccante ', 11, 2),
(14, 'J. Boga', 'Sassuolo', 'Attaccante ', 11, 0),
(15, 'A. Cornelius', 'Parma', 'Attaccante ', 11, 0),
(16, 'P. Dybala', 'Juventus', 'Attaccante ', 11, 1),
(17, 'M. Mancosu', 'Lecce', 'Centrocampista ', 11, 8),
(18, 'A. Milik', 'Napoli', 'Attaccante ', 10, 0),
(19, 'A. Rebic', 'Milan', 'Attaccante ', 10, 0),
(20, 'G. Simeone', 'Cagliari', 'Attaccante ', 10, 0),
(21, 'F. Caicedo', 'Lazio', 'Attaccante ', 9, 0),
(22, 'R. Gosens', 'Atalanta', 'Difensore ', 9, 0),
(23, 'F. Quagliarella', 'Sampdoria', 'Attaccante ', 9, 5),
(24, 'M. Gabbiadini', 'Sampdoria', 'Attaccante ', 8, 1),
(25, 'K. Lasagna', 'Udinese', 'Attaccante ', 8, 0),
(26, 'R. Orsolini', 'Bologna', 'Centrocampista ', 8, 0),
(27, 'G. Pandev', 'Genoa', 'Attaccante ', 8, 0),
(28, 'J. Correa', 'Lazio', 'Centrocampista ', 7, 0),
(29, 'D. Criscito', 'Genoa', 'Difensore ', 7, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `teams`
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
-- Dump dei dati per la tabella `teams`
--

INSERT INTO `teams` (`squad_position`, `squad_name`, `squad_points`, `squad_played`, `squad_winned`, `squad_loosed`, `squad_tie`) VALUES
(1, 'Juventus', 75, 31, 24, 3, 4),
(2, 'Lazio', 68, 31, 21, 5, 5),
(3, 'Inter', 64, 30, 19, 7, 4),
(4, 'Atalanta', 63, 30, 19, 6, 5),
(5, 'Milan', 49, 31, 14, 7, 10),
(6, 'Roma', 48, 30, 14, 6, 10),
(7, 'Napoli', 48, 30, 14, 6, 10),
(8, 'Verona', 42, 30, 11, 9, 10),
(9, 'Bologna', 41, 30, 11, 8, 11),
(10, 'Sassuolo', 40, 30, 11, 7, 12),
(11, 'Cagliari', 39, 30, 10, 9, 11),
(12, 'Parma', 39, 30, 11, 6, 13),
(13, 'Fiorentina', 34, 30, 8, 10, 12),
(14, 'Sampdoria', 32, 30, 9, 5, 16),
(15, 'Udinese', 32, 30, 8, 8, 14),
(16, 'Torino', 31, 30, 9, 4, 17),
(17, 'Lecce', 28, 31, 7, 7, 17),
(18, 'Genoa', 27, 30, 6, 9, 15),
(19, 'Brescia', 21, 30, 5, 6, 19),
(20, 'Spal', 19, 30, 5, 4, 21);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `scorers`
--
ALTER TABLE `scorers`
  ADD PRIMARY KEY (`player_position`);

--
-- Indici per le tabelle `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`squad_position`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `scorers`
--
ALTER TABLE `scorers`
  MODIFY `player_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT per la tabella `teams`
--
ALTER TABLE `teams`
  MODIFY `squad_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
