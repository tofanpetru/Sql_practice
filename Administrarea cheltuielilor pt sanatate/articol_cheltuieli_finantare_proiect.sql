-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 10, 2021 la 03:42 PM
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
-- Bază de date: `administrarea_cheltuielilor`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `articol_cheltuieli_finantare_proiect`
--

CREATE TABLE `articol_cheltuieli_finantare_proiect` (
  `id_cheltuieli` int(11) NOT NULL,
  `id_proiect` int(11) NOT NULL,
  `id_finantare` int(11) NOT NULL,
  `suma_finantata` decimal(10,0) NOT NULL,
  `nr_persoane` int(11) NOT NULL,
  `suma_necesita_intoarsa` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `articol_cheltuieli_finantare_proiect`
--

INSERT INTO `articol_cheltuieli_finantare_proiect` (`id_cheltuieli`, `id_proiect`, `id_finantare`, `suma_finantata`, `nr_persoane`, `suma_necesita_intoarsa`) VALUES
(1, 1, 1, '250000', 125, '0'),
(2, 2, 6, '20000', 20, '5000');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `articol_cheltuieli_finantare_proiect`
--
ALTER TABLE `articol_cheltuieli_finantare_proiect`
  ADD PRIMARY KEY (`id_cheltuieli`),
  ADD KEY `id_proiect` (`id_proiect`),
  ADD KEY `id_finantare` (`id_finantare`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `articol_cheltuieli_finantare_proiect`
--
ALTER TABLE `articol_cheltuieli_finantare_proiect`
  MODIFY `id_cheltuieli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `articol_cheltuieli_finantare_proiect`
--
ALTER TABLE `articol_cheltuieli_finantare_proiect`
  ADD CONSTRAINT `articol_cheltuieli_finantare_proiect_ibfk_1` FOREIGN KEY (`id_proiect`) REFERENCES `proiecte_sanatate` (`id_proiect`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articol_cheltuieli_finantare_proiect_ibfk_2` FOREIGN KEY (`id_finantare`) REFERENCES `tipuri_de_finantare` (`id_finantare`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
