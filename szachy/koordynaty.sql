-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2024 at 12:53 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szachy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koordynaty`
--

CREATE TABLE `koordynaty` (
  `id` int(11) NOT NULL,
  `idPlanszy` int(11) NOT NULL,
  `figura` char(1) NOT NULL,
  `litera` tinyint(1) NOT NULL,
  `liczba` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koordynaty`
--

INSERT INTO `koordynaty` (`id`, `idPlanszy`, `figura`, `litera`, `liczba`) VALUES
(1, 1, '♜', 6, 0),
(2, 1, '♚', 7, 0),
(3, 1, '♟', 7, 1),
(4, 1, '♖', 7, 7),
(5, 1, '♗', 4, 4),
(6, 1, '♔', 0, 7),
(7, 2, '♕', 4, 3),
(8, 2, '♕', 3, 3),
(9, 2, '♔', 1, 3),
(10, 2, '♟', 1, 4),
(11, 2, '♟', 0, 5),
(12, 2, '♜', 5, 6),
(13, 2, '♚', 5, 7),
(14, 4, '♗', 6, 7),
(15, 4, '♖', 7, 3),
(16, 4, '♖', 2, 5),
(17, 4, '♔', 1, 5),
(18, 4, '♙', 5, 6),
(19, 4, '♚', 3, 4),
(20, 3, '♜', 0, 0),
(21, 3, '♝', 0, 4),
(22, 3, '♚', 6, 1),
(23, 3, '♟', 7, 1),
(24, 3, '♖', 1, 7),
(25, 3, '♔', 4, 1),
(26, 3, '♘', 5, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `koordynaty`
--
ALTER TABLE `koordynaty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPlanszy` (`idPlanszy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `koordynaty`
--
ALTER TABLE `koordynaty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `koordynaty`
--
ALTER TABLE `koordynaty`
  ADD CONSTRAINT `koordynaty_ibfk_1` FOREIGN KEY (`idPlanszy`) REFERENCES `plansza` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
