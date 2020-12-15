-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2020 at 04:43 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbzakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, '12345', 1, 0, 0, '1', 1),
(2, 2, '678910', 1, 0, 0, '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:qurban_c/index:get', 2, 1608044863, '12345'),
(2, 'method-name:index_get', 2, 1608044997, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `qurban`
--

CREATE TABLE `qurban` (
  `kode_qurban` int(5) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telpon` int(15) NOT NULL,
  `hewan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qurban`
--

INSERT INTO `qurban` (`kode_qurban`, `nama`, `alamat`, `telpon`, `hewan`) VALUES
(1, 'Muhammad Ali Hasymi', 'Jl. Candi 3D / 437', 3123412, 'Kambing'),
(2, 'Sukirman R', 'Jl. Candi 3A/123', 24115, 'Domba'),
(3, 'H. Damanhuri', 'Jl. Raya Candi 3 / 502', 341878231, 'Sapi'),
(4, 'Arief Budiman', 'Jl. Candi 3D / 437', 879783271, 'Sapi'),
(5, 'Dasawesma RT 8', 'RT 08, RW 03, Karang Besuki', 341582944, 'Sapi'),
(6, 'Hamba Allah', 'Jl. Kebenaran', 0, 'Domba'),
(7, 'Sukirman', 'Jl. klaseman', 341297821, 'Domba'),
(8, 'Soepandri', 'Jombang', 87874821, 'Kerbau'),
(9, 'H. Choiruddin', 'Jl. Raya Candi 3 / 498 ', 341576721, 'Kambing'),
(10, 'Karang Taruna RW 03', 'RW 03 Karang Besuki', 0, 'Sapi'),
(11, 'Achmad Kusen', 'Jl. Raya Candi 3 / 209', 341287812, 'Sapi'),
(12, 'Andik Febrianto', 'Jl. Candi 3D / 412', 879782312, 'Kambing'),
(13, 'Arik Nitiardjo', 'Jl. Candi 3D Nomor 235', 881876822, 'Domba'),
(14, 'Rusdi Hamid', 'Jl. Raya Galunggung 34', 851297412, 'Kambing'),
(15, 'Achmad Nur Hidayat', 'Jl. Candi 3D / 421', 2147483647, 'Kambing'),
(16, 'Sucipto', 'Jl. Candi 3D / 402', 341287752, 'Kambing'),
(17, 'Dasawesma RT 9', 'RT 09, RW 03, Karang Besuki', 2147483647, 'Sapi'),
(18, 'Paguyuban Pensiunan ', 'RW 03 Karang Besuki', 0, 'Sapi'),
(19, 'Djoko Santoso', 'Jl. Candi 3E / 513', 878824234, 'Kambing'),
(20, 'Arif Santari', 'Jl. Candi 3B / 212', 87767231, 'Kambing'),
(21, 'Sri Ajani', 'Jl Candi 3D Nomor 437', 341582944, 'Kambing'),
(22, 'Yanaz Bahtyar', 'Jl. Candi 5A/32', 897763912, 'Kambing'),
(23, 'Dasawesma RT 5', 'RT 05, RW 03, Karang Besuki', 0, 'Sapi'),
(24, 'Karang Taruna RT 08', 'RW 03 Karang Besuki', 2147483647, 'Kambing'),
(25, 'Rochani', 'Jl. Raya Candi 3 402', 341297824, 'Kambing'),
(26, 'Amin Firmansyah', 'Jl. Candi 3E / 521', 2147483647, 'Kambing'),
(27, 'Suhudi', 'Jl. Bangkalan Krajan 2C', 2147483647, 'Kambing'),
(28, 'Hadi Purnomo', 'Jl. Candi 3C / 337', 2147483647, 'Kambing'),
(29, 'Dasawesma RT 7', 'RT 07, RW 03, Karang Besuki', 879784124, 'Sapi'),
(30, 'Candra Maretno', 'Jl. Candi 3B / 212', 2147483647, 'Kambing'),
(31, 'Djono Kiswanto', 'Jl. Candi 3A / 87', 341278752, 'Domba');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qurban`
--
ALTER TABLE `qurban`
  ADD PRIMARY KEY (`kode_qurban`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qurban`
--
ALTER TABLE `qurban`
  MODIFY `kode_qurban` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
