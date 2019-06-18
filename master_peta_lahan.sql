-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2019 at 09:24 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iais_ukdw`
--

-- --------------------------------------------------------

--
-- Table structure for table `master_peta_lahan`
--

CREATE TABLE `master_peta_lahan` (
  `ID_Lahan` int(11) NOT NULL,
  `nama_lahan` varchar(255) NOT NULL,
  `Koordinat_X` varchar(20) DEFAULT NULL,
  `Koordinat_Y` varchar(20) DEFAULT NULL,
  `luas_lahan` int(11) NOT NULL,
  `jenis_lahan` enum('sawah','tegalan') NOT NULL,
  `Desa` varchar(50) DEFAULT NULL,
  `Kecamatan` varchar(50) DEFAULT NULL,
  `Kabupaten` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(50) DEFAULT NULL,
  `status_organik` enum('organik','non_organik') NOT NULL,
  `ID_Kelompok_Tani` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_peta_lahan`
--

INSERT INTO `master_peta_lahan` (`ID_Lahan`, `nama_lahan`, `Koordinat_X`, `Koordinat_Y`, `luas_lahan`, `jenis_lahan`, `Desa`, `Kecamatan`, `Kabupaten`, `Provinsi`, `status_organik`, `ID_Kelompok_Tani`) VALUES
(2, 'lahan2', '-7.928363082196162', '110.29961786496813', 0, 'sawah', 'DONOHARJO', 'Ngaglik', 'Sleman', 'Daerah Istimewa Yogyakarta', 'organik', 'kelompok_a'),
(4, 'cobaupdate', '-7.929386582820112', '110.29773553844291', 21321, 'tegalan', 'TIRTONIRMOLO', 'kasihan', 'Bantul', 'Daerah Istimewa Yogyakarta', 'organik', 'kelompok_a'),
(5, 'test', '-7.929361585062354', '110.30053671354403', 0, 'sawah', 'GILANGHARJO', 'PANDAK', 'KABUPATEN BANTUL', 'DI YOGYAKARTA', 'organik', 'kelompok_b'),
(7, 'cek', '-7.928338227078408', '110.3019647579697', 0, 'sawah', 'GILANGHARJO', 'PANDAK', 'KABUPATEN BANTUL', 'DI YOGYAKARTA', 'organik', 'kelompok_b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_peta_lahan`
--
ALTER TABLE `master_peta_lahan`
  ADD PRIMARY KEY (`ID_Lahan`),
  ADD KEY `ID_Lahan` (`ID_Lahan`),
  ADD KEY `ID_Kelompok_Tani` (`ID_Kelompok_Tani`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_peta_lahan`
--
ALTER TABLE `master_peta_lahan`
  MODIFY `ID_Lahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
