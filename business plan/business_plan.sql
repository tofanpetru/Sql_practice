-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 19, 2021 la 11:22 PM
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
-- Bază de date: `business_plan`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `analiza_globala`
--

CREATE TABLE `analiza_globala` (
  `id_analiza` int(11) NOT NULL,
  `factor` varchar(200) NOT NULL,
  `desc_analiza` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `analiza_globala`
--

INSERT INTO `analiza_globala` (`id_analiza`, `factor`, `desc_analiza`) VALUES
(1, 'Startul vanzărilor', 'Atunci cand produsul înainte de lansare, în forma fizică nu are şi o rezervă, în caz că se va cumpara rapid');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `business_plan`
--

CREATE TABLE `business_plan` (
  `id_plan` int(11) NOT NULL,
  `proiect` varchar(255) NOT NULL,
  `descriere` varchar(255) NOT NULL,
  `id_analiza` int(11) NOT NULL,
  `id_marketing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `business_plan`
--

INSERT INTO `business_plan` (`id_plan`, `proiect`, `descriere`, `id_analiza`, `id_marketing`) VALUES
(1, 'Playstation 5', 'O consola Next gen pentru gaming', 1, 2);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `finante_after`
--

CREATE TABLE `finante_after` (
  `id_finante` int(11) NOT NULL,
  `buget_finantare` int(11) NOT NULL,
  `profit_estimat` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `finante_after`
--

INSERT INTO `finante_after` (`id_finante`, `buget_finantare`, `profit_estimat`, `id_plan`) VALUES
(1, 14500, 56000, 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `marketing`
--

CREATE TABLE `marketing` (
  `id_marketing` int(11) NOT NULL,
  `tip_raspandire` varchar(255) NOT NULL,
  `marketing_idei` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `marketing`
--

INSERT INTO `marketing` (`id_marketing`, `tip_raspandire`, `marketing_idei`) VALUES
(2, 'mediul online', 'reclame platite FB');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `analiza_globala`
--
ALTER TABLE `analiza_globala`
  ADD PRIMARY KEY (`id_analiza`);

--
-- Indexuri pentru tabele `business_plan`
--
ALTER TABLE `business_plan`
  ADD PRIMARY KEY (`id_plan`),
  ADD KEY `id_analiza` (`id_analiza`),
  ADD KEY `id_marketing` (`id_marketing`);

--
-- Indexuri pentru tabele `finante_after`
--
ALTER TABLE `finante_after`
  ADD PRIMARY KEY (`id_finante`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indexuri pentru tabele `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`id_marketing`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `analiza_globala`
--
ALTER TABLE `analiza_globala`
  MODIFY `id_analiza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `business_plan`
--
ALTER TABLE `business_plan`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pentru tabele `finante_after`
--
ALTER TABLE `finante_after`
  MODIFY `id_finante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `marketing`
--
ALTER TABLE `marketing`
  MODIFY `id_marketing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `business_plan`
--
ALTER TABLE `business_plan`
  ADD CONSTRAINT `business_plan_ibfk_1` FOREIGN KEY (`id_analiza`) REFERENCES `analiza_globala` (`id_analiza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `business_plan_ibfk_3` FOREIGN KEY (`id_marketing`) REFERENCES `marketing` (`id_marketing`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constrângeri pentru tabele `finante_after`
--
ALTER TABLE `finante_after`
  ADD CONSTRAINT `finante_after_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `business_plan` (`id_plan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
