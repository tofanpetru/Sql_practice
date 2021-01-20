-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: dec. 29, 2020 la 09:40 AM
-- Versiune server: 10.4.17-MariaDB
-- Versiune PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `camin`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `camere`
--

CREATE TABLE `camere` (
  `ID_camera` int(11) NOT NULL,
  `ID_tip_confort` int(11) DEFAULT NULL,
  `ID_locatie` int(11) DEFAULT NULL,
  `nr_persoane_max` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `camere`
--

INSERT INTO `camere` (`ID_camera`, `ID_tip_confort`, `ID_locatie`, `nr_persoane_max`) VALUES
(101, 3, 1, 3),
(201, 1, 2, 2),
(301, 2, 3, 4),
(401, 1, 4, 2),
(501, 3, 5, 2);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `inregistrari`
--

CREATE TABLE `inregistrari` (
  `ID_inregistrare` int(11) NOT NULL,
  `IDNP_student` int(11) DEFAULT NULL,
  `ID_camera` int(11) DEFAULT NULL,
  `data_sosire` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `inregistrari`
--

INSERT INTO `inregistrari` (`ID_inregistrare`, `IDNP_student`, `ID_camera`, `data_sosire`) VALUES
(1, 699574834, 101, '2020-12-26'),
(2, 596483452, 201, '2020-12-26'),
(3, 657856789, 301, '2020-12-26'),
(4, 695840385, 401, '2020-12-26'),
(5, 765431876, 501, '2020-12-26');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `locatii`
--

CREATE TABLE `locatii` (
  `ID_locatie` int(11) NOT NULL,
  `nume_locatie` varchar(50) DEFAULT NULL,
  `ID_personal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `locatii`
--

INSERT INTO `locatii` (`ID_locatie`, `nume_locatie`, `ID_personal`) VALUES
(1, 'Etajul 1', 1),
(2, 'Etajul 2', 2),
(3, 'Etajul 3', 3),
(4, 'Etajul 4', 4),
(5, 'Etajul 5', 5);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `personal_camin`
--

CREATE TABLE `personal_camin` (
  `ID_personal` int(11) NOT NULL,
  `nume_personal` varchar(50) DEFAULT NULL,
  `prenume_personal` varchar(50) DEFAULT NULL,
  `contact_personal` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `personal_camin`
--

INSERT INTO `personal_camin` (`ID_personal`, `nume_personal`, `prenume_personal`, `contact_personal`) VALUES
(1, 'Axinte', 'Ion', '057742634'),
(2, 'Tudor', 'Alexandru', '069958432'),
(3, 'Chirila', 'Andrei', '068849530'),
(4, 'Nicoara', 'Diana', '064459645'),
(5, 'Postolache', 'Alexandrina', '064459675');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `studenti`
--

CREATE TABLE `studenti` (
  `IDNP_student` int(11) NOT NULL,
  `nume_student` varchar(50) DEFAULT NULL,
  `prenume_student` varchar(50) DEFAULT NULL,
  `contact_student` varchar(50) DEFAULT NULL,
  `grupa_student` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `studenti`
--

INSERT INTO `studenti` (`IDNP_student`, `nume_student`, `prenume_student`, `contact_student`, `grupa_student`) VALUES
(596483452, 'Turcanu', 'Cristian', '074495342', 'FAF-101'),
(657856789, 'Albus', 'Ion', '068853454', 'RC-204'),
(695840385, 'Botnaru', 'Cristi', '065549645', 'RM-291'),
(699574834, 'Morari', 'Valentin', '079916276', 'IA-209'),
(765431876, 'Menlic', 'Bogdan', '068853555', 'SI-102');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tip_confort`
--

CREATE TABLE `tip_confort` (
  `ID_tip_confort` int(11) NOT NULL,
  `nume_tip_confort` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `tip_confort`
--

INSERT INTO `tip_confort` (`ID_tip_confort`, `nume_tip_confort`) VALUES
(1, 'Standart'),
(2, 'Superior'),
(3, 'Minim necesar');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `camere`
--
ALTER TABLE `camere`
  ADD PRIMARY KEY (`ID_camera`),
  ADD KEY `ID_tip_confort` (`ID_tip_confort`),
  ADD KEY `ID_locatie` (`ID_locatie`);

--
-- Indexuri pentru tabele `inregistrari`
--
ALTER TABLE `inregistrari`
  ADD PRIMARY KEY (`ID_inregistrare`),
  ADD KEY `IDNP_student` (`IDNP_student`),
  ADD KEY `ID_camera` (`ID_camera`);

--
-- Indexuri pentru tabele `locatii`
--
ALTER TABLE `locatii`
  ADD PRIMARY KEY (`ID_locatie`),
  ADD KEY `ID_personal` (`ID_personal`);

--
-- Indexuri pentru tabele `personal_camin`
--
ALTER TABLE `personal_camin`
  ADD PRIMARY KEY (`ID_personal`);

--
-- Indexuri pentru tabele `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`IDNP_student`);

--
-- Indexuri pentru tabele `tip_confort`
--
ALTER TABLE `tip_confort`
  ADD PRIMARY KEY (`ID_tip_confort`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `inregistrari`
--
ALTER TABLE `inregistrari`
  MODIFY `ID_inregistrare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `locatii`
--
ALTER TABLE `locatii`
  MODIFY `ID_locatie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `personal_camin`
--
ALTER TABLE `personal_camin`
  MODIFY `ID_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `tip_confort`
--
ALTER TABLE `tip_confort`
  MODIFY `ID_tip_confort` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `camere`
--
ALTER TABLE `camere`
  ADD CONSTRAINT `camere_ibfk_1` FOREIGN KEY (`ID_tip_confort`) REFERENCES `tip_confort` (`ID_tip_confort`),
  ADD CONSTRAINT `camere_ibfk_2` FOREIGN KEY (`ID_locatie`) REFERENCES `locatii` (`ID_locatie`);

--
-- Constrângeri pentru tabele `inregistrari`
--
ALTER TABLE `inregistrari`
  ADD CONSTRAINT `inregistrari_ibfk_1` FOREIGN KEY (`IDNP_student`) REFERENCES `studenti` (`IDNP_student`),
  ADD CONSTRAINT `inregistrari_ibfk_2` FOREIGN KEY (`ID_camera`) REFERENCES `camere` (`ID_camera`);

--
-- Constrângeri pentru tabele `locatii`
--
ALTER TABLE `locatii`
  ADD CONSTRAINT `locatii_ibfk_1` FOREIGN KEY (`ID_personal`) REFERENCES `personal_camin` (`ID_personal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
