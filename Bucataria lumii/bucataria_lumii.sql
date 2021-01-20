-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 14, 2021 la 01:08 AM
-- Versiune server: 10.4.13-MariaDB
-- Versiune PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `bucataria_lumii`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `mancare`
--

CREATE TABLE `mancare` (
  `id_mancare` int(11) NOT NULL,
  `denumire` varchar(230) NOT NULL,
  `ingrediente` varchar(300) NOT NULL,
  `id_tip_mancare` int(11) NOT NULL,
  `img_link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `mancare`
--

INSERT INTO `mancare` (`id_mancare`, `denumire`, `ingrediente`, `id_tip_mancare`, `img_link`) VALUES
(1, 'Pizza', 'faina, drojdie, apa, sare, ulei, salam, mozzarella, rosii', 6, 'https://pizzamania.md/wp-content/uploads/2019/06/Pizza-Neptun5de7.jpg'),
(2, 'Supa cu taietei', 'taietei, ceapa, apa, morcov', 1, 'https://www.ecuisine.ro/wp-content/uploads/supa_cu_taitei_asiatici.jpg'),
(3, 'Sandwich', 'paine, cartofi', 6, 'https://blog.f64.ro/wp-content/uploads/2019/08/pexels-photo-1600711.jpeg');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `recenzie_mancare`
--

CREATE TABLE `recenzie_mancare` (
  `id_recenzie` int(11) NOT NULL,
  `id_mancare` int(11) NOT NULL,
  `recenzie` varchar(300) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `recenzie_mancare`
--

INSERT INTO `recenzie_mancare` (`id_recenzie`, `id_mancare`, `recenzie`, `date`) VALUES
(1, 1, 'Wow ! mare descoperire, şi romanii fac pizza', '2021-01-07 20:56:33'),
(2, 2, 'Nice, mi-am hranit  copilul si mai vrea :)', '2021-01-07 20:56:43');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `restrictii_tara`
--

CREATE TABLE `restrictii_tara` (
  `id_restrictie` int(11) NOT NULL,
  `restrictie` varchar(255) NOT NULL,
  `id_tara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `restrictii_tara`
--

INSERT INTO `restrictii_tara` (`id_restrictie`, `restrictie`, `id_tara`) VALUES
(1, 'branza ca desert', 6),
(2, 'melcii', 1),
(3, 'Porcul', 7),
(7, 'daw', 6);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tari`
--

CREATE TABLE `tari` (
  `id_tara` int(11) NOT NULL,
  `nume_tara` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `tari`
--

INSERT INTO `tari` (`id_tara`, `nume_tara`) VALUES
(1, 'China'),
(2, 'Lituania'),
(3, 'Moldova'),
(4, 'Romania'),
(5, 'Italia'),
(6, 'Franta'),
(7, 'Dubai');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tip_mancare`
--

CREATE TABLE `tip_mancare` (
  `id_tip_mancare` int(11) NOT NULL,
  `tip_mancare` varchar(250) NOT NULL,
  `id_tara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `tip_mancare`
--

INSERT INTO `tip_mancare` (`id_tip_mancare`, `tip_mancare`, `id_tara`) VALUES
(1, 'Supe', 1),
(2, 'Desert', 6),
(3, 'Supa', 3),
(4, 'copturi', 5),
(5, 'desert', 1),
(6, 'desert', 4);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `mancare`
--
ALTER TABLE `mancare`
  ADD PRIMARY KEY (`id_mancare`),
  ADD KEY `id_tip_mancare` (`id_tip_mancare`);

--
-- Indexuri pentru tabele `recenzie_mancare`
--
ALTER TABLE `recenzie_mancare`
  ADD PRIMARY KEY (`id_recenzie`),
  ADD KEY `id_mancare` (`id_mancare`);

--
-- Indexuri pentru tabele `restrictii_tara`
--
ALTER TABLE `restrictii_tara`
  ADD PRIMARY KEY (`id_restrictie`),
  ADD KEY `id_tara` (`id_tara`);

--
-- Indexuri pentru tabele `tari`
--
ALTER TABLE `tari`
  ADD PRIMARY KEY (`id_tara`);

--
-- Indexuri pentru tabele `tip_mancare`
--
ALTER TABLE `tip_mancare`
  ADD PRIMARY KEY (`id_tip_mancare`),
  ADD KEY `id_tara` (`id_tara`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `mancare`
--
ALTER TABLE `mancare`
  MODIFY `id_mancare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `recenzie_mancare`
--
ALTER TABLE `recenzie_mancare`
  MODIFY `id_recenzie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pentru tabele `restrictii_tara`
--
ALTER TABLE `restrictii_tara`
  MODIFY `id_restrictie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pentru tabele `tari`
--
ALTER TABLE `tari`
  MODIFY `id_tara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `tip_mancare`
--
ALTER TABLE `tip_mancare`
  MODIFY `id_tip_mancare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `mancare`
--
ALTER TABLE `mancare`
  ADD CONSTRAINT `mancare_ibfk_1` FOREIGN KEY (`id_tip_mancare`) REFERENCES `tip_mancare` (`id_tip_mancare`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `recenzie_mancare`
--
ALTER TABLE `recenzie_mancare`
  ADD CONSTRAINT `recenzie_mancare_ibfk_1` FOREIGN KEY (`id_mancare`) REFERENCES `mancare` (`id_mancare`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `restrictii_tara`
--
ALTER TABLE `restrictii_tara`
  ADD CONSTRAINT `restrictii_tara_ibfk_1` FOREIGN KEY (`id_tara`) REFERENCES `tari` (`id_tara`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `tip_mancare`
--
ALTER TABLE `tip_mancare`
  ADD CONSTRAINT `tip_mancare_ibfk_1` FOREIGN KEY (`id_tara`) REFERENCES `tari` (`id_tara`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
