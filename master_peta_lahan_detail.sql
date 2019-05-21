-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2019 at 07:25 PM
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
-- Table structure for table `master_peta_lahan_detail`
--

CREATE TABLE `master_peta_lahan_detail` (
  `id_detail` int(11) NOT NULL,
  `ID_Lahan` int(11) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `longt` varchar(20) NOT NULL,
  `indeks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_peta_lahan_detail`
--

INSERT INTO `master_peta_lahan_detail` (`id_detail`, `ID_Lahan`, `lat`, `longt`, `indeks`) VALUES
(5, 2, '-7.928484678360535', '110.29984203643903', 1),
(6, 2, '-7.928317314428722', '110.29931728739098', 2),
(7, 2, '-7.928261526436312', '110.2993400861676', 3),
(8, 2, '-7.928326612426706', '110.29984970588043', 5),
(9, 3, '-7.927626605417482', '110.29994127817201', 1),
(10, 3, '-7.927832489955332', '110.30064363974827', 2),
(11, 3, '-7.9277421664288275', '110.30065570968884', 3),
(12, 3, '-7.92761863569137', '110.29995028871792', 5),
(13, 4, '-7.92956324428696', '110.29753265447664', 1),
(14, 4, '-7.929617254003119', '110.29786798620034', 2),
(15, 4, '-7.929071779867816', '110.29795204300183', 3),
(16, 4, '-7.929048809572604', '110.29787905276964', 4),
(17, 4, '-7.928977631597796', '110.29787925026733', 5),
(20, 4, '-7.928972162828607', '110.29773508202754', 6),
(21, 4, '-7.929113352484229', '110.2977215078638', 7),
(22, 4, '-7.929107592513504', '110.29744912881154', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_peta_lahan_detail`
--
ALTER TABLE `master_peta_lahan_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_peta_lahan_detail`
--
ALTER TABLE `master_peta_lahan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
