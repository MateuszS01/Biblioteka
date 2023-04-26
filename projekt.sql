-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Kwi 2023, 17:14
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `Autor` mediumtext NOT NULL,
  `Tytuł` mediumtext NOT NULL,
  `Data Wydania` date NOT NULL,
  `Stan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `books`
--

INSERT INTO `books` (`id`, `Autor`, `Tytuł`, `Data Wydania`, `Stan`) VALUES
(1, 'Brandon Sanderson', 'Droga Królów', '2010-01-15', 'Dostępna'),
(2, 'Brandon Sanderson', 'Z mgły zrodzony', '2007-08-10', 'Wypożyczona'),
(3, 'Andrzej Sapkowski', 'Ostatnie Życzenie', '2014-05-15', 'Zamówiona'),
(4, 'Andrzej Sapkowski', 'Miecz Przeznaczenia', '2017-12-31', 'Dostępna'),
(5, 'H. P. Lovecraft', 'Zew Cthulhu', '1999-07-17', 'Dostępna'),
(6, 'H. P. Lovecraft', 'Zgroza w Dunwitch', '2001-03-23', 'Wypożyczona'),
(7, 'J. K. Rowling', 'Harry Potter i Kamień Filozoficzny', '2005-07-14', 'Zamówiona'),
(8, 'J. K. Rowling', 'Harry Potter i Komnata Tajemnic', '2014-02-21', 'Dostępna'),
(9, 'Stanisław Lem', 'Niezwyciężony', '2013-12-12', 'Dostępna'),
(10, 'Stanisław Lem', 'Solaris', '2016-09-21', 'Wypożyczona');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `history`
--

CREATE TABLE `history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `checkout_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `history`
--

INSERT INTO `history` (`id`, `user_id`, `book_id`, `checkout_date`, `return_date`) VALUES
(1, 1, 1, '2017-10-15', NULL),
(2, 1, 2, '2017-10-05', '2017-10-13'),
(3, 2, 2, '2017-10-15', '2017-10-22'),
(4, 2, 3, '2017-10-15', NULL),
(5, 1, 9, '2023-04-02', '2023-04-29'),
(6, 1, 7, '2023-02-08', '2023-03-09'),
(7, 1, 8, '2023-04-27', NULL),
(8, 2, 5, '2023-04-28', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `email`) VALUES
(1, 'admin', '1234', 'ad@ad.com'),
(2, 'user1', '12', 'u@u.pl'),
(3, 'ćążó', '12', 'g@g.com'),
(4, 'n4', '12', '4@i.oo');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indeksy dla tabeli `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
