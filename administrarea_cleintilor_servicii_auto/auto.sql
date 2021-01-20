-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: dec. 25, 2020 la 01:14 PM
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
-- Bază de date: `auto`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `angajati`
--

CREATE TABLE `angajati` (
  `IDNP_angajat` int(11) NOT NULL,
  `nume_angajat` varchar(50) DEFAULT NULL,
  `prenume_angajat` varchar(50) DEFAULT NULL,
  `contact_angajat` varchar(50) DEFAULT NULL,
  `ID_sectie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `angajati`
--

INSERT INTO `angajati` (`IDNP_angajat`, `nume_angajat`, `prenume_angajat`, `contact_angajat`, `ID_sectie`) VALUES
(222275679, 'Hristea', 'Cristi', '068854097', 3),
(332275679, 'Johnson', 'Gheorghe', '065569734', 4),
(435675679, 'Coplea', 'Ion', '068854676', 1),
(442275679, 'Barcu', 'Alexei', '069958639', 5),
(888875679, 'Suhovic', 'Anatol', '068854940', 2);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `clienti`
--

CREATE TABLE `clienti` (
  `ID_client` int(11) NOT NULL,
  `nume_client` varchar(50) DEFAULT NULL,
  `prenume_client` varchar(50) DEFAULT NULL,
  `contact_client` varchar(50) DEFAULT NULL,
  `nr_inmatric_masina` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `clienti`
--

INSERT INTO `clienti` (`ID_client`, `nume_client`, `prenume_client`, `contact_client`, `nr_inmatric_masina`) VALUES
(1, 'Tirbu', 'Vasile', '076685436', 'MCP-777'),
(2, 'Chirca', 'Ioan', '079978573', 'IL-345'),
(3, 'Anatolie', 'Ilie', '078845296', 'SC-888'),
(4, 'Rudenco', 'Maxim', '068845634', 'LO-367'),
(5, 'Dumitras', 'Dumitru', '063386574', 'KOT-42');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `clienti_servicii`
--

CREATE TABLE `clienti_servicii` (
  `ID_client_serviciu` int(11) NOT NULL,
  `ID_client` int(11) DEFAULT NULL,
  `ID_serviciu` int(11) DEFAULT NULL,
  `ora_solicitat` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `clienti_servicii`
--

INSERT INTO `clienti_servicii` (`ID_client_serviciu`, `ID_client`, `ID_serviciu`, `ora_solicitat`) VALUES
(1, 1, 1, '14:13:16'),
(2, 2, 2, '14:13:43'),
(3, 3, 3, '14:13:55'),
(4, 4, 4, '14:14:07'),
(5, 5, 5, '14:14:18');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `locatii`
--

CREATE TABLE `locatii` (
  `ID_locatie` int(11) NOT NULL,
  `nume_locatie` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `locatii`
--

INSERT INTO `locatii` (`ID_locatie`, `nume_locatie`) VALUES
(1, 'Hangarul nr.1'),
(2, 'Hangarul nr.2'),
(3, 'Hangarul nr.3'),
(4, 'Hangarul nr.4'),
(5, 'Hangarul nr.5'),
(6, 'Hangarul nr.6');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `sectii`
--

CREATE TABLE `sectii` (
  `ID_sectie` int(11) NOT NULL,
  `nume_sectie` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `sectii`
--

INSERT INTO `sectii` (`ID_sectie`, `nume_sectie`) VALUES
(1, 'Vopsire'),
(2, 'Reparatie interna'),
(3, 'Reparatie externa'),
(4, 'Consultatie'),
(5, 'Salubrizare');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `servicii`
--

CREATE TABLE `servicii` (
  `ID_serviciu` int(11) NOT NULL,
  `nume_serviciu` varchar(50) DEFAULT NULL,
  `costul_serviciu` int(11) DEFAULT NULL,
  `ID_locatie` int(11) DEFAULT NULL,
  `IDNP_angajat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `servicii`
--

INSERT INTO `servicii` (`ID_serviciu`, `nume_serviciu`, `costul_serviciu`, `ID_locatie`, `IDNP_angajat`) VALUES
(1, 'Schimbarea usii', 2000, 1, 222275679),
(2, 'Vopsirea totala a masinii', 10000, 2, 435675679),
(3, 'Consulatie tehnica', 200, 3, 332275679),
(4, 'Reparatie motor', 3000, 4, 888875679),
(5, 'Schimbare filtru', 1000, 4, 888875679);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `angajati`
--
ALTER TABLE `angajati`
  ADD PRIMARY KEY (`IDNP_angajat`),
  ADD KEY `ID_sectie` (`ID_sectie`);

--
-- Indexuri pentru tabele `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`ID_client`);

--
-- Indexuri pentru tabele `clienti_servicii`
--
ALTER TABLE `clienti_servicii`
  ADD PRIMARY KEY (`ID_client_serviciu`),
  ADD KEY `ID_client` (`ID_client`),
  ADD KEY `ID_serviciu` (`ID_serviciu`);

--
-- Indexuri pentru tabele `locatii`
--
ALTER TABLE `locatii`
  ADD PRIMARY KEY (`ID_locatie`);

--
-- Indexuri pentru tabele `sectii`
--
ALTER TABLE `sectii`
  ADD PRIMARY KEY (`ID_sectie`);

--
-- Indexuri pentru tabele `servicii`
--
ALTER TABLE `servicii`
  ADD PRIMARY KEY (`ID_serviciu`),
  ADD KEY `IDNP_angajat` (`IDNP_angajat`),
  ADD KEY `ID_locatie` (`ID_locatie`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `clienti`
--
ALTER TABLE `clienti`
  MODIFY `ID_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `clienti_servicii`
--
ALTER TABLE `clienti_servicii`
  MODIFY `ID_client_serviciu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `locatii`
--
ALTER TABLE `locatii`
  MODIFY `ID_locatie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pentru tabele `sectii`
--
ALTER TABLE `sectii`
  MODIFY `ID_sectie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `servicii`
--
ALTER TABLE `servicii`
  MODIFY `ID_serviciu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `angajati`
--
ALTER TABLE `angajati`
  ADD CONSTRAINT `angajati_ibfk_1` FOREIGN KEY (`ID_sectie`) REFERENCES `sectii` (`ID_sectie`);

--
-- Constrângeri pentru tabele `clienti_servicii`
--
ALTER TABLE `clienti_servicii`
  ADD CONSTRAINT `clienti_servicii_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `clienti` (`ID_client`),
  ADD CONSTRAINT `clienti_servicii_ibfk_2` FOREIGN KEY (`ID_serviciu`) REFERENCES `servicii` (`ID_serviciu`);

--
-- Constrângeri pentru tabele `servicii`
--
ALTER TABLE `servicii`
  ADD CONSTRAINT `servicii_ibfk_1` FOREIGN KEY (`IDNP_angajat`) REFERENCES `angajati` (`IDNP_angajat`),
  ADD CONSTRAINT `servicii_ibfk_2` FOREIGN KEY (`ID_locatie`) REFERENCES `locatii` (`ID_locatie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
