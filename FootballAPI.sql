-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Ago 01, 2020 alle 16:37
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
-- Struttura della tabella `bundesliga_scorers`
--

CREATE TABLE `bundesliga_scorers` (
  `player_position` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `player_squad` varchar(100) DEFAULT NULL,
  `player_role` varchar(100) DEFAULT NULL,
  `player_goals` int(11) DEFAULT NULL,
  `player_penalties` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `bundesliga_scorers`
--

INSERT INTO `bundesliga_scorers` (`player_position`, `player_name`, `player_squad`, `player_role`, `player_goals`, `player_penalties`) VALUES
(1, 'R. Lewandowski', 'Bayern Monaco', 'Striker', 34, 5),
(2, 'T. Werner', 'Lipsia', 'Striker', 28, 3),
(3, 'J. Sancho', 'Borussia Dortmund', 'Midfielder', 17, 0),
(4, 'W. Weghorst', 'Wolfsburg', 'Striker', 16, 4),
(5, 'R. Hennings', 'Fortuna DÃ¼sseldorf', 'Striker', 15, 4),
(6, 'J. CÃ³rdoba', 'Colonia', 'Striker', 13, 0),
(7, 'E. Haaland', 'Borussia Dortmund', 'Striker', 13, 0),
(8, 'F. Niederlechner', 'Augsburg', 'Striker', 13, 1),
(9, 'R. Quaison', 'Mainz', 'Striker', 13, 1),
(10, 'S. Andersson', 'Union Berlino', 'Striker', 12, 1),
(11, 'S. Gnabry', 'Bayern Monaco', 'Striker', 12, 0),
(12, 'K. Havertz', 'Bayer Leverkusen', 'Midfielder', 12, 1),
(13, 'A. Kramaric', 'Hoffenheim', 'Striker', 12, 2),
(14, 'A. Silva', 'Eintracht Francoforte', 'Striker', 12, 1),
(15, 'N. Petersen', 'Friburgo', 'Striker', 11, 1),
(16, 'M. Reus', 'Borussia Dortmund', 'Midfielder', 11, 1),
(17, 'A. PlÃ©a', 'Borussia M\'Gladbach', 'Striker', 10, 0),
(18, 'P. Schick', 'Lipsia', 'Striker', 10, 0),
(19, 'M. Thuram', 'Borussia M\'Gladbach', 'Striker', 10, 0),
(20, 'K. Volland', 'Bayer Leverkusen', 'Striker', 10, 0),
(21, 'M. Sabitzer', 'Lipsia', 'Midfielder', 9, 0),
(22, 'L. Stindl', 'Borussia M\'Gladbach', 'Midfielder', 9, 2),
(23, 'P. Coutinho', 'Bayern Monaco', 'Midfielder', 8, 1),
(24, 'B. Dost', 'Eintracht Francoforte', 'Striker', 8, 0),
(25, 'B. Embolo', 'Borussia M\'Gladbach', 'Striker', 8, 0),
(26, 'R. Guerreiro', 'Borussia Dortmund', 'Midfielder', 8, 0),
(27, 'M. Hinteregger', 'Eintracht Francoforte', 'Defender', 8, 0),
(28, 'L. HÃ¶ler', 'Friburgo', 'Striker', 8, 0),
(29, 'P. Max', 'Augsburg', 'Defender', 8, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `bundesliga_teams`
--

CREATE TABLE `bundesliga_teams` (
  `squad_position` int(11) NOT NULL,
  `squad_name` varchar(100) DEFAULT NULL,
  `squad_points` int(11) DEFAULT NULL,
  `squad_played` int(11) DEFAULT NULL,
  `squad_winned` int(11) DEFAULT NULL,
  `squad_loosed` int(11) DEFAULT NULL,
  `squad_tie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `bundesliga_teams`
--

INSERT INTO `bundesliga_teams` (`squad_position`, `squad_name`, `squad_points`, `squad_played`, `squad_winned`, `squad_loosed`, `squad_tie`) VALUES
(1, 'Bayern Monaco', 82, 34, 26, 4, 4),
(2, 'Borussia Dortmund', 69, 34, 21, 6, 7),
(3, 'Lipsia', 66, 34, 18, 12, 4),
(4, 'Borussia M\'Gladbach', 65, 34, 20, 5, 9),
(5, 'Bayer Leverkusen', 63, 34, 19, 6, 9),
(6, 'Hoffenheim', 52, 34, 15, 7, 12),
(7, 'Wolfsburg', 49, 34, 13, 10, 11),
(8, 'Friburgo', 48, 34, 13, 9, 12),
(9, 'Eintracht Francoforte', 45, 34, 13, 6, 15),
(10, 'Hertha BSC', 41, 34, 11, 8, 15),
(11, 'Union Berlino', 41, 34, 12, 5, 17),
(12, 'Schalke 04', 39, 34, 9, 12, 13),
(13, 'Mainz', 37, 34, 11, 4, 19),
(14, 'Colonia', 36, 34, 10, 6, 18),
(15, 'Augsburg', 36, 34, 9, 9, 16),
(16, 'Werder Brema', 31, 34, 8, 7, 19),
(17, 'Fortuna DÃ¼sseldorf', 30, 34, 6, 12, 16),
(18, 'Paderborn', 20, 34, 4, 8, 22);

-- --------------------------------------------------------

--
-- Struttura della tabella `liga_scorers`
--

CREATE TABLE `liga_scorers` (
  `player_position` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `player_squad` varchar(100) DEFAULT NULL,
  `player_role` varchar(100) DEFAULT NULL,
  `player_goals` int(11) DEFAULT NULL,
  `player_penalties` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `liga_scorers`
--

INSERT INTO `liga_scorers` (`player_position`, `player_name`, `player_squad`, `player_role`, `player_goals`, `player_penalties`) VALUES
(1, 'L. Messi', 'Barcellona', 'Striker', 25, 5),
(2, 'K. Benzema', 'Real Madrid', 'Striker', 21, 5),
(3, 'G. Moreno', 'Villarreal', 'Striker', 18, 1),
(4, 'L. SuÃ¡rez', 'Barcellona', 'Striker', 16, 1),
(5, 'R. GarcÃ­a', 'Athletic Bilbao', 'Midfielder', 15, 7),
(6, 'I. Aspas', 'Celta Vigo', 'Striker', 14, 5),
(7, 'L. Ocampos', 'Siviglia', 'Midfielder', 14, 5),
(8, 'A. Budimir', 'Mallorca', 'Striker', 13, 2),
(9, 'Ã. Morata', 'AtlÃ©tico Madrid', 'Striker', 12, 2),
(10, 'S. Cazorla', 'Villarreal', 'Midfielder', 11, 8),
(11, 'W. JosÃ©', 'Real Sociedad', 'Striker', 11, 0),
(12, 'R. MartÃ­', 'Levante', 'Striker', 11, 4),
(13, 'J. Mata', 'Getafe', 'Striker', 11, 3),
(14, 'Joselu', 'AlavÃ©s', 'Striker', 11, 1),
(15, 'L. PÃ©rez', 'AlavÃ©s', 'Striker', 11, 5),
(16, 'S. Ramos', 'Real Madrid', 'Defender', 11, 6),
(17, 'C. FernÃ¡ndez', 'Granada', 'Striker', 10, 1),
(18, 'M. GÃ³mez', 'Valencia', 'Striker', 10, 0),
(19, 'L. MorÃ³n', 'Real Betis', 'Striker', 10, 0),
(20, 'M. Oyarzabal', 'Real Sociedad', 'Striker', 10, 4),
(21, 'Ã. RodrÃ­guez', 'Getafe', 'Striker', 10, 1),
(22, 'A. Griezmann', 'Barcellona', 'Striker', 9, 0),
(23, 'A. Isak', 'Real Sociedad', 'Striker', 9, 0),
(24, 'Ã?. RodrÃ­guez', 'LeganÃ©s', 'Midfielder', 9, 2),
(25, 'C. Avila', 'Osasuna', 'Striker', 9, 0),
(26, 'Y. En-Nesyri', 'Siviglia', 'Striker', 8, 0),
(27, 'R. GarcÃ­a', 'Osasuna', 'Midfielder', 8, 1),
(28, 'S. Guardiola', 'Real Valladolid', 'Striker', 8, 0),
(29, 'B. Mayoral', 'Levante', 'Striker', 8, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `liga_teams`
--

CREATE TABLE `liga_teams` (
  `squad_position` int(11) NOT NULL,
  `squad_name` varchar(100) DEFAULT NULL,
  `squad_points` int(11) DEFAULT NULL,
  `squad_played` int(11) DEFAULT NULL,
  `squad_winned` int(11) DEFAULT NULL,
  `squad_loosed` int(11) DEFAULT NULL,
  `squad_tie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `liga_teams`
--

INSERT INTO `liga_teams` (`squad_position`, `squad_name`, `squad_points`, `squad_played`, `squad_winned`, `squad_loosed`, `squad_tie`) VALUES
(1, 'Real Madrid', 87, 38, 26, 9, 3),
(2, 'Barcellona', 82, 38, 25, 7, 6),
(3, 'AtlÃ©tico Madrid', 70, 38, 18, 16, 4),
(4, 'Siviglia', 70, 38, 19, 13, 6),
(5, 'Villarreal', 60, 38, 18, 6, 14),
(6, 'Real Sociedad', 56, 38, 16, 8, 14),
(7, 'Granada', 56, 38, 16, 8, 14),
(8, 'Getafe', 54, 38, 14, 12, 12),
(9, 'Valencia', 53, 38, 14, 11, 13),
(10, 'Osasuna', 52, 38, 13, 13, 12),
(11, 'Athletic Bilbao', 51, 38, 13, 12, 13),
(12, 'Levante', 49, 38, 14, 7, 17),
(13, 'Real Valladolid', 42, 38, 9, 15, 14),
(14, 'Eibar', 42, 38, 11, 9, 18),
(15, 'Real Betis', 41, 38, 10, 11, 17),
(16, 'AlavÃ©s', 39, 38, 10, 9, 19),
(17, 'Celta Vigo', 37, 38, 7, 16, 15),
(18, 'LeganÃ©s', 36, 38, 8, 12, 18),
(19, 'Mallorca', 33, 38, 9, 6, 23),
(20, 'Espanyol', 25, 38, 5, 10, 23);

-- --------------------------------------------------------

--
-- Struttura della tabella `ligue1_scorers`
--

CREATE TABLE `ligue1_scorers` (
  `player_position` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `player_squad` varchar(100) DEFAULT NULL,
  `player_role` varchar(100) DEFAULT NULL,
  `player_goals` int(11) DEFAULT NULL,
  `player_penalties` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ligue1_scorers`
--

INSERT INTO `ligue1_scorers` (`player_position`, `player_name`, `player_squad`, `player_role`, `player_goals`, `player_penalties`) VALUES
(1, 'W. Ben Yedder', 'Monaco', 'Striker', 18, 3),
(2, 'K. MbappÃ©', 'Paris Saint-Germain', 'Striker', 18, 0),
(3, 'M. Dembele', 'Lione', 'Striker', 16, 4),
(4, 'V. Osimhen', 'Lilla', 'Striker', 13, 2),
(5, 'Neymar', 'Paris Saint-Germain', 'Striker', 13, 4),
(6, 'H. Diallo', 'Metz', 'Striker', 12, 1),
(7, 'M. Icardi', 'Paris Saint-Germain', 'Striker', 12, 0),
(8, 'D. Benedetto', 'Marsiglia', 'Striker', 11, 0),
(9, 'K. Dolberg', 'Nizza', 'Striker', 11, 0),
(10, 'D. Bouanga', 'St. Etienne', 'Midfielder', 10, 3),
(11, 'M. Niang', 'Rennes', 'Striker', 10, 0),
(12, 'A. Delort', 'Montpellier', 'Striker', 9, 0),
(13, 'M. Depay', 'Lione', 'Striker', 9, 1),
(14, 'S. Guirassy', 'Amiens', 'Striker', 9, 3),
(15, 'D. Payet', 'Marsiglia', 'Midfielder', 9, 3),
(16, 'I. Slimani', 'Monaco', 'Striker', 9, 1),
(17, 'L. Ajorque', 'Strasburgo', 'Striker', 8, 1),
(18, 'Ã. Di MarÃ­a', 'Paris Saint-Germain', 'Midfielder', 8, 1),
(19, 'A. Hunou', 'Rennes', 'Midfielder', 8, 1),
(20, 'A. Thomasson', 'Strasburgo', 'Midfielder', 8, 0),
(21, 'J. Briand', 'Bordeaux', 'Striker', 7, 1),
(22, 'W. Cyprien', 'Nizza', 'Midfielder', 7, 5),
(23, 'B. Dia', 'Reims', 'Striker', 7, 1),
(24, 'L. RÃ©my', 'Lilla', 'Striker', 7, 0),
(25, 'R. Alioui', 'Angers', 'Striker', 6, 0),
(26, 'M. BaldÃ©', 'Dijon', 'Midfielder', 6, 0),
(27, 'I. Cardona', 'Brest', 'Striker', 6, 0),
(28, 'R. Hamouma', 'St. Etienne', 'Midfielder', 6, 0),
(29, 'H. Ui-Jo', 'Bordeaux', 'Striker', 6, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ligue1_teams`
--

CREATE TABLE `ligue1_teams` (
  `squad_position` int(11) NOT NULL,
  `squad_name` varchar(100) DEFAULT NULL,
  `squad_points` int(11) DEFAULT NULL,
  `squad_played` int(11) DEFAULT NULL,
  `squad_winned` int(11) DEFAULT NULL,
  `squad_loosed` int(11) DEFAULT NULL,
  `squad_tie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ligue1_teams`
--

INSERT INTO `ligue1_teams` (`squad_position`, `squad_name`, `squad_points`, `squad_played`, `squad_winned`, `squad_loosed`, `squad_tie`) VALUES
(1, 'Angers', 0, 0, 0, 0, 0),
(2, 'Bordeaux', 0, 0, 0, 0, 0),
(3, 'Brest', 0, 0, 0, 0, 0),
(4, 'Dijon', 0, 0, 0, 0, 0),
(5, 'Lens', 0, 0, 0, 0, 0),
(6, 'Lilla', 0, 0, 0, 0, 0),
(7, 'Lorient', 0, 0, 0, 0, 0),
(8, 'Lione', 0, 0, 0, 0, 0),
(9, 'Marsiglia', 0, 0, 0, 0, 0),
(10, 'Metz', 0, 0, 0, 0, 0),
(11, 'Monaco', 0, 0, 0, 0, 0),
(12, 'Montpellier', 0, 0, 0, 0, 0),
(13, 'Nantes', 0, 0, 0, 0, 0),
(14, 'Nizza', 0, 0, 0, 0, 0),
(15, 'NÃ®mes', 0, 0, 0, 0, 0),
(16, 'Paris Saint-Germain', 0, 0, 0, 0, 0),
(17, 'Reims', 0, 0, 0, 0, 0),
(18, 'Rennes', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `premier_league_scorers`
--

CREATE TABLE `premier_league_scorers` (
  `player_position` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `player_squad` varchar(100) DEFAULT NULL,
  `player_role` varchar(100) DEFAULT NULL,
  `player_goals` int(11) DEFAULT NULL,
  `player_penalties` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `premier_league_scorers`
--

INSERT INTO `premier_league_scorers` (`player_position`, `player_name`, `player_squad`, `player_role`, `player_goals`, `player_penalties`) VALUES
(1, 'J. Vardy', 'Leicester City', 'Striker', 23, 4),
(2, 'P. Aubameyang', 'Arsenal', 'Striker', 22, 2),
(3, 'D. Ings', 'Southampton', 'Striker', 22, 1),
(4, 'R. Sterling', 'Manchester City', 'Striker', 20, 0),
(5, 'M. Salah', 'Liverpool', 'Striker', 19, 3),
(6, 'H. Kane', 'Tottenham', 'Striker', 18, 2),
(7, 'S. ManÃ©', 'Liverpool', 'Striker', 18, 0),
(8, 'R. JimÃ©nez', 'Wolverhampton', 'Striker', 17, 4),
(9, 'A. Martial', 'Manchester United', 'Striker', 17, 0),
(10, 'M. Rashford', 'Manchester United', 'Striker', 17, 6),
(11, 'S. AgÃ¼ero', 'Manchester City', 'Striker', 16, 2),
(12, 'T. Abraham', 'Chelsea', 'Striker', 15, 0),
(13, 'C. Wood', 'Burnley', 'Striker', 14, 1),
(14, 'G. Jesus', 'Manchester City', 'Striker', 14, 0),
(15, 'D. Calvert-Lewin', 'Everton', 'Striker', 13, 0),
(16, 'K. De Bruyne', 'Manchester City', 'Midfielder', 13, 2),
(17, 'Richarlison', 'Everton', 'Striker', 13, 0),
(18, 'R. Mahrez', 'Manchester City', 'Striker', 11, 1),
(19, 'T. Pukki', 'Norwich City', 'Striker', 11, 2),
(20, 'S. Heung-Min', 'Tottenham', 'Striker', 11, 0),
(21, 'M. Antonio', 'West Ham United', 'Midfielder', 10, 1),
(22, 'T. Deeney', 'Watford', 'Striker', 10, 5),
(23, 'M. Greenwood', 'Manchester United', 'Striker', 10, 0),
(24, 'A. Lacazette', 'Arsenal', 'Striker', 10, 0),
(25, 'N. Maupay', 'Brighton and Hove Albion', 'Striker', 10, 1),
(26, 'J. Ayew', 'Crystal Palace', 'Striker', 9, 0),
(27, 'R. Firmino', 'Liverpool', 'Striker', 9, 0),
(28, 'Willian', 'Chelsea', 'Striker', 9, 4),
(29, 'C. Pulisic', 'Chelsea', 'Midfielder', 9, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `premier_league_teams`
--

CREATE TABLE `premier_league_teams` (
  `squad_position` int(11) NOT NULL,
  `squad_name` varchar(100) DEFAULT NULL,
  `squad_points` int(11) DEFAULT NULL,
  `squad_played` int(11) DEFAULT NULL,
  `squad_winned` int(11) DEFAULT NULL,
  `squad_loosed` int(11) DEFAULT NULL,
  `squad_tie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `premier_league_teams`
--

INSERT INTO `premier_league_teams` (`squad_position`, `squad_name`, `squad_points`, `squad_played`, `squad_winned`, `squad_loosed`, `squad_tie`) VALUES
(1, 'Liverpool', 99, 38, 32, 3, 3),
(2, 'Manchester City', 81, 38, 26, 3, 9),
(3, 'Manchester United', 66, 38, 18, 12, 8),
(4, 'Chelsea', 66, 38, 20, 6, 12),
(5, 'Leicester City', 62, 38, 18, 8, 12),
(6, 'Tottenham', 59, 38, 16, 11, 11),
(7, 'Wolverhampton', 59, 38, 15, 14, 9),
(8, 'Arsenal', 56, 38, 14, 14, 10),
(9, 'Sheffield United', 54, 38, 14, 12, 12),
(10, 'Burnley', 54, 38, 15, 9, 14),
(11, 'Southampton', 52, 38, 15, 7, 16),
(12, 'Everton', 49, 38, 13, 10, 15),
(13, 'Newcastle United', 44, 38, 11, 11, 16),
(14, 'Crystal Palace', 43, 38, 11, 10, 17),
(15, 'Brighton and Hove Albion', 41, 38, 9, 14, 15),
(16, 'West Ham United', 39, 38, 10, 9, 19),
(17, 'Aston Villa', 35, 38, 9, 8, 21),
(18, 'Bournemouth', 34, 38, 9, 7, 22),
(19, 'Watford', 34, 38, 8, 10, 20),
(20, 'Norwich City', 21, 38, 5, 6, 27);

-- --------------------------------------------------------

--
-- Struttura della tabella `serie_a_scorers`
--

CREATE TABLE `serie_a_scorers` (
  `player_position` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `player_squad` varchar(100) DEFAULT NULL,
  `player_role` varchar(100) DEFAULT NULL,
  `player_goals` int(11) DEFAULT NULL,
  `player_penalties` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `serie_a_scorers`
--

INSERT INTO `serie_a_scorers` (`player_position`, `player_name`, `player_squad`, `player_role`, `player_goals`, `player_penalties`) VALUES
(1, 'C. Immobile', 'Lazio', 'Striker', 35, 14),
(2, 'C. Ronaldo', 'Juventus', 'Striker', 31, 12),
(3, 'R. Lukaku', 'Inter', 'Striker', 23, 6),
(4, 'F. Caputo', 'Sassuolo', 'Striker', 21, 2),
(5, 'J. Pedro', 'Cagliari', 'Midfielder', 18, 4),
(6, 'L. Muriel', 'Atalanta', 'Striker', 18, 6),
(7, 'D. Zapata', 'Atalanta', 'Striker', 18, 1),
(8, 'A. Belotti', 'Torino', 'Striker', 16, 7),
(9, 'E. Dzeko', 'Roma', 'Striker', 16, 0),
(10, 'J. Ilicic', 'Atalanta', 'Midfielder', 15, 0),
(11, 'D. Berardi', 'Sassuolo', 'Striker', 14, 2),
(12, 'M. Mancosu', 'Lecce', 'Midfielder', 14, 9),
(13, 'L. MartÃ­nez', 'Inter', 'Striker', 14, 2),
(14, 'A. Petagna', 'Spal', 'Striker', 12, 5),
(15, 'G. Simeone', 'Cagliari', 'Striker', 12, 0),
(16, 'J. Boga', 'Sassuolo', 'Striker', 11, 0),
(17, 'A. Cornelius', 'Parma', 'Striker', 11, 0),
(18, 'P. Dybala', 'Juventus', 'Striker', 11, 1),
(19, 'M. Gabbiadini', 'Sampdoria', 'Striker', 11, 1),
(20, 'A. Milik', 'Napoli', 'Striker', 11, 0),
(21, 'F. Quagliarella', 'Sampdoria', 'Striker', 11, 5),
(22, 'A. Rebic', 'Milan', 'Striker', 11, 0),
(23, 'F. Chiesa', 'Fiorentina', 'Striker', 10, 1),
(24, 'D. Kulusevski', 'Parma', 'Midfielder', 10, 1),
(25, 'G. Lapadula', 'Lecce', 'Striker', 10, 2),
(26, 'K. Lasagna', 'Udinese', 'Striker', 10, 0),
(27, 'M. Barrow', 'Bologna', 'Striker', 9, 1),
(28, 'F. Caicedo', 'Lazio', 'Striker', 9, 0),
(29, 'H. Calhanoglu', 'Milan', 'Midfielder', 9, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `serie_a_teams`
--

CREATE TABLE `serie_a_teams` (
  `squad_position` int(11) NOT NULL,
  `squad_name` varchar(100) DEFAULT NULL,
  `squad_points` int(11) DEFAULT NULL,
  `squad_played` int(11) DEFAULT NULL,
  `squad_winned` int(11) DEFAULT NULL,
  `squad_loosed` int(11) DEFAULT NULL,
  `squad_tie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `serie_a_teams`
--

INSERT INTO `serie_a_teams` (`squad_position`, `squad_name`, `squad_points`, `squad_played`, `squad_winned`, `squad_loosed`, `squad_tie`) VALUES
(1, 'Juventus', 83, 37, 26, 5, 6),
(2, 'Inter', 79, 37, 23, 10, 4),
(3, 'Atalanta', 78, 37, 23, 9, 5),
(4, 'Lazio', 78, 37, 24, 6, 7),
(5, 'Roma', 67, 37, 20, 7, 10),
(6, 'Milan', 63, 37, 18, 9, 10),
(7, 'Napoli', 59, 37, 17, 8, 12),
(8, 'Sassuolo', 51, 37, 14, 9, 14),
(9, 'Verona', 49, 37, 12, 13, 12),
(10, 'Fiorentina', 46, 37, 11, 13, 13),
(11, 'Parma', 46, 37, 13, 7, 17),
(12, 'Bologna', 46, 37, 12, 10, 15),
(13, 'Cagliari', 45, 37, 11, 12, 14),
(14, 'Udinese', 42, 37, 11, 9, 17),
(15, 'Sampdoria', 41, 37, 12, 5, 20),
(16, 'Torino', 39, 37, 11, 6, 20),
(17, 'Genoa', 36, 37, 9, 9, 19),
(18, 'Lecce', 35, 37, 9, 8, 20),
(19, 'Brescia', 24, 37, 6, 6, 25),
(20, 'Spal', 20, 37, 5, 5, 27);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `bundesliga_scorers`
--
ALTER TABLE `bundesliga_scorers`
  ADD PRIMARY KEY (`player_position`);

--
-- Indici per le tabelle `bundesliga_teams`
--
ALTER TABLE `bundesliga_teams`
  ADD PRIMARY KEY (`squad_position`);

--
-- Indici per le tabelle `liga_scorers`
--
ALTER TABLE `liga_scorers`
  ADD PRIMARY KEY (`player_position`);

--
-- Indici per le tabelle `liga_teams`
--
ALTER TABLE `liga_teams`
  ADD PRIMARY KEY (`squad_position`);

--
-- Indici per le tabelle `ligue1_scorers`
--
ALTER TABLE `ligue1_scorers`
  ADD PRIMARY KEY (`player_position`);

--
-- Indici per le tabelle `ligue1_teams`
--
ALTER TABLE `ligue1_teams`
  ADD PRIMARY KEY (`squad_position`);

--
-- Indici per le tabelle `premier_league_scorers`
--
ALTER TABLE `premier_league_scorers`
  ADD PRIMARY KEY (`player_position`);

--
-- Indici per le tabelle `premier_league_teams`
--
ALTER TABLE `premier_league_teams`
  ADD PRIMARY KEY (`squad_position`);

--
-- Indici per le tabelle `serie_a_scorers`
--
ALTER TABLE `serie_a_scorers`
  ADD PRIMARY KEY (`player_position`);

--
-- Indici per le tabelle `serie_a_teams`
--
ALTER TABLE `serie_a_teams`
  ADD PRIMARY KEY (`squad_position`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `bundesliga_scorers`
--
ALTER TABLE `bundesliga_scorers`
  MODIFY `player_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT per la tabella `bundesliga_teams`
--
ALTER TABLE `bundesliga_teams`
  MODIFY `squad_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la tabella `liga_scorers`
--
ALTER TABLE `liga_scorers`
  MODIFY `player_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT per la tabella `liga_teams`
--
ALTER TABLE `liga_teams`
  MODIFY `squad_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la tabella `ligue1_scorers`
--
ALTER TABLE `ligue1_scorers`
  MODIFY `player_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT per la tabella `ligue1_teams`
--
ALTER TABLE `ligue1_teams`
  MODIFY `squad_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT per la tabella `premier_league_scorers`
--
ALTER TABLE `premier_league_scorers`
  MODIFY `player_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT per la tabella `premier_league_teams`
--
ALTER TABLE `premier_league_teams`
  MODIFY `squad_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la tabella `serie_a_scorers`
--
ALTER TABLE `serie_a_scorers`
  MODIFY `player_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT per la tabella `serie_a_teams`
--
ALTER TABLE `serie_a_teams`
  MODIFY `squad_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
