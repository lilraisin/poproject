-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2020 at 04:29 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poproject_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `adres`
--

CREATE TABLE `adres` (
  `idAdresu` int(11) NOT NULL,
  `nrMieszkania` varchar(20) DEFAULT NULL,
  `nrUlicy` varchar(20) NOT NULL,
  `nazwaUlicy` varchar(20) NOT NULL,
  `miasto` varchar(20) NOT NULL,
  `LokalNrLokalu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adres`
--

INSERT INTO `adres` (`idAdresu`, `nrMieszkania`, `nrUlicy`, `nazwaUlicy`, `miasto`, `LokalNrLokalu`) VALUES
(1, '35', '14', 'Śliczna', 'Wrocław', '1'),
(2, '55', '38', 'Targowa', 'Wrocław', '2');

-- --------------------------------------------------------

--
-- Table structure for table `danekartyb`
--

CREATE TABLE `danekartyb` (
  `idKartyB` int(11) NOT NULL,
  `ccvKod` varchar(10) NOT NULL,
  `nrKarty` varchar(20) NOT NULL,
  `dataWyg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `danekartyb`
--

INSERT INTO `danekartyb` (`idKartyB`, `ccvKod`, `nrKarty`, `dataWyg`) VALUES
(1, 'cc123', '1234 0000 2345 3456', '0000-00-00'),
(2, 'cv223', '4321 0000 5425 6543', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `danekontaktowe`
--

CREATE TABLE `danekontaktowe` (
  `idDanychK` int(11) NOT NULL,
  `nrTelefonu` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `imie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `danekontaktowe`
--

INSERT INTO `danekontaktowe` (`idDanychK`, `nrTelefonu`, `email`, `nazwisko`, `imie`) VALUES
(1, '123456789', 'kapi@wp.pl', 'Kacperek', 'Kacper'),
(2, '987654321', 'Debo@gmail.pl', 'Dębkowski', 'Jan');

-- --------------------------------------------------------

--
-- Table structure for table `lokal`
--

CREATE TABLE `lokal` (
  `NrLokalu` int(11) NOT NULL,
  `Adres` int(11) DEFAULT NULL,
  `StandardMieszkaniowy` int(11) NOT NULL,
  `CzyZamieszkaly` bit(1) DEFAULT NULL,
  `IloscPokoi` int(11) DEFAULT NULL,
  `WolnychMiejsc` int(11) NOT NULL,
  `MaxMiejsc` int(11) NOT NULL,
  `UZYTKOWNIKID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokal`
--

INSERT INTO `lokal` (`NrLokalu`, `Adres`, `StandardMieszkaniowy`, `CzyZamieszkaly`, `IloscPokoi`, `WolnychMiejsc`, `MaxMiejsc`, `UZYTKOWNIKID`) VALUES
(1, 1, 3, b'0', 3, 4, 4, 1),
(2, 2, 2, b'1', 2, 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ogłoszenie`
--

CREATE TABLE `ogłoszenie` (
  `NrOgloszenia` int(11) NOT NULL,
  `Tytul` varchar(30) NOT NULL,
  `Oplata` int(11) DEFAULT NULL,
  `Opis` varchar(255) DEFAULT NULL,
  `CzyAktualne` bit(1) NOT NULL,
  `CzyZawieszone` bit(1) NOT NULL,
  `TerminyWizyt` date DEFAULT NULL,
  `LiczbaMiejsc` int(11) NOT NULL,
  `DataWystawienia` date NOT NULL,
  `LOKALID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ogłoszenie`
--

INSERT INTO `ogłoszenie` (`NrOgloszenia`, `Tytul`, `Oplata`, `Opis`, `CzyAktualne`, `CzyZawieszone`, `TerminyWizyt`, `LiczbaMiejsc`, `DataWystawienia`, `LOKALID`) VALUES
(1, 'Porządny tytuł', 1800, 'Fajne takie, schludne, nowe i wgl', b'1', b'0', NULL, 2, '2020-01-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rezerwacja`
--

CREATE TABLE `rezerwacja` (
  `NrRezerwacji` int(11) NOT NULL,
  `TerminWizyty` date NOT NULL,
  `Notka` varchar(255) DEFAULT NULL,
  `Stan` int(11) NOT NULL,
  `UZYTKOWNIKID` int(11) NOT NULL,
  `OGLOSZENIEID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `użytkownik`
--

CREATE TABLE `użytkownik` (
  `NrUzytkownika` int(11) NOT NULL,
  `DANEOSOBOWEID` int(11) NOT NULL,
  `Zdjecie` int(11) DEFAULT NULL,
  `DANEKBID` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `haslo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `użytkownik`
--

INSERT INTO `użytkownik` (`NrUzytkownika`, `DANEOSOBOWEID`, `Zdjecie`, `DANEKBID`, `login`, `haslo`) VALUES
(1, 1, NULL, 1, 'Kapi123', 'Kapi321'),
(2, 2, NULL, 2, 'DEB000', 'DeBs22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`idAdresu`);

--
-- Indexes for table `danekartyb`
--
ALTER TABLE `danekartyb`
  ADD PRIMARY KEY (`idKartyB`);

--
-- Indexes for table `danekontaktowe`
--
ALTER TABLE `danekontaktowe`
  ADD PRIMARY KEY (`idDanychK`);

--
-- Indexes for table `lokal`
--
ALTER TABLE `lokal`
  ADD PRIMARY KEY (`NrLokalu`),
  ADD KEY `posiada` (`UZYTKOWNIKID`),
  ADD KEY `Jest_zlokalizowany` (`Adres`);

--
-- Indexes for table `ogłoszenie`
--
ALTER TABLE `ogłoszenie`
  ADD PRIMARY KEY (`NrOgloszenia`),
  ADD KEY `Wystawiane_do` (`LOKALID`);

--
-- Indexes for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD PRIMARY KEY (`NrRezerwacji`),
  ADD KEY `dokonuje` (`UZYTKOWNIKID`),
  ADD KEY `dotyczy` (`OGLOSZENIEID`);

--
-- Indexes for table `użytkownik`
--
ALTER TABLE `użytkownik`
  ADD PRIMARY KEY (`NrUzytkownika`),
  ADD KEY `FKUżytkownik788004` (`DANEKBID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adres`
--
ALTER TABLE `adres`
  MODIFY `idAdresu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danekartyb`
--
ALTER TABLE `danekartyb`
  MODIFY `idKartyB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danekontaktowe`
--
ALTER TABLE `danekontaktowe`
  MODIFY `idDanychK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lokal`
--
ALTER TABLE `lokal`
  MODIFY `NrLokalu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ogłoszenie`
--
ALTER TABLE `ogłoszenie`
  MODIFY `NrOgloszenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  MODIFY `NrRezerwacji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `użytkownik`
--
ALTER TABLE `użytkownik`
  MODIFY `NrUzytkownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lokal`
--
ALTER TABLE `lokal`
  ADD CONSTRAINT `Jest_zlokalizowany` FOREIGN KEY (`Adres`) REFERENCES `adres` (`idAdresu`),
  ADD CONSTRAINT `posiada` FOREIGN KEY (`UZYTKOWNIKID`) REFERENCES `użytkownik` (`NrUzytkownika`);

--
-- Constraints for table `ogłoszenie`
--
ALTER TABLE `ogłoszenie`
  ADD CONSTRAINT `Wystawiane_do` FOREIGN KEY (`LOKALID`) REFERENCES `lokal` (`NrLokalu`);

--
-- Constraints for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `dokonuje` FOREIGN KEY (`UZYTKOWNIKID`) REFERENCES `użytkownik` (`NrUzytkownika`),
  ADD CONSTRAINT `dotyczy` FOREIGN KEY (`OGLOSZENIEID`) REFERENCES `ogłoszenie` (`NrOgloszenia`);

--
-- Constraints for table `użytkownik`
--
ALTER TABLE `użytkownik`
  ADD CONSTRAINT `FKUżytkownik788004` FOREIGN KEY (`DANEKBID`) REFERENCES `danekartyb` (`idKartyB`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
