-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2019 at 09:26 PM
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
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `tentang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`tentang`) VALUES
('<div>Organisasi pengembangan Sistem\\Informasi Pertanian Terintegrasi (SIPT) merupakan sebuah lembaga pendidikan tinggi yang ingin memberikan kontribusi nyata bagi peningkatan produktifitas\\r\\ndan kesejahteraan masyarakat tani melalui penerapan teknologi informasi dan komunikasi. Hal tersebut menjadi visi utama bagi pengembangan SIPT. Sementara\\r\\nitu misi yang diemban organisasi meliputi:</div><div><br></div><div>1. &nbsp; &nbsp; Memberikan layanan untuk pengembangan kapasitas petani dalam menggunakan TIK.</div><div><br></div><div>2. &nbsp; &nbsp; Mengembangkan sebuah blueprint untuk SIPT.</div><div><br></div><div>3. &nbsp; &nbsp; Mendukung perkembangan pertanian modern melalui npembangunan aplikasi computer untuk berbagi proses bisnis dalam pertanian.</div><div><br></div><div>4. &nbsp; &nbsp; Mendukung pertanian presisi melalui pembangunan system berbasis pengetahuan.</div><div><br></div><div>5. &nbsp; &nbsp; Membentuk dan menghubungkan jejaring untuk semua stakeholder dibidang pertanian melalui pengembangan system pertanian yang terintegrasi.</div><div><br></div><div>6. &nbsp; &nbsp;Menyediakan informasi yang terpercaya bagi petani terkait bisnis pertanian yang dijalankan.</div>');

-- --------------------------------------------------------

--
-- Table structure for table `balas_komentar`
--

CREATE TABLE `balas_komentar` (
  `ID_Balas` int(100) NOT NULL,
  `ID_Komentar` int(100) NOT NULL,
  `ID_Penawaran` varchar(10) NOT NULL,
  `ID_User` varchar(50) NOT NULL,
  `Komentar_Balas` text NOT NULL,
  `Tanggal_Balas` date NOT NULL,
  `Waktu_Balas` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balas_komentar`
--

INSERT INTO `balas_komentar` (`ID_Balas`, `ID_Komentar`, `ID_Penawaran`, `ID_User`, `Komentar_Balas`, `Tanggal_Balas`, `Waktu_Balas`) VALUES
(10, 1, 'PEN0002', '012461', 'Ready', '2018-01-07', '13:58:34'),
(11, 1, 'PEN0002', 'idpercobaa', 'asd', '2018-01-17', '04:27:50');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `ID_Chat` int(255) NOT NULL,
  `ID_Topic` varchar(100) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `tgl_updt` date NOT NULL,
  `balas` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`ID_Chat`, `ID_Topic`, `nama_user`, `isi`, `tgl_updt`, `balas`) VALUES
(1, '2', 'bolo', 'saya mau tanya kalu sudah beli benih bagaimana  cara menyimpang yang baik?', '2017-10-17', NULL),
(2, '2', 'Bambang', 'Bisa dibeli di www.benih.com', '2017-10-24', NULL),
(3, '2', '1234567', 'Sa juga mau tanya jika banihnya bosok enaknya diapain ya ?', '2017-10-02', NULL),
(4, '2', 'Bambang', 'Mending di jadin pupuk aja mas 1234567', '2017-10-02', NULL),
(5, '6', '1234567', 'Apakah ada saran tempat cari tanah yang baik di jogja', '2017-10-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_alamat`
--

CREATE TABLE `detail_alamat` (
  `kode_alamat` int(10) NOT NULL,
  `nama_penerima` varchar(50) NOT NULL,
  `nama_alamat` varchar(50) NOT NULL,
  `alamat_penerima` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kelurahan_desa` varchar(50) NOT NULL,
  `kodepos` int(5) NOT NULL,
  `ID_User` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_alamat`
--

INSERT INTO `detail_alamat` (`kode_alamat`, `nama_penerima`, `nama_alamat`, `alamat_penerima`, `provinsi`, `kabupaten`, `kecamatan`, `kelurahan_desa`, `kodepos`, `ID_User`) VALUES
(1, 'Daniel Reinaldo', 'Kos', 'Jl Bandung Raya No 20', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 58795, 'novan'),
(2, 'Age', 'Kos', 'Jl Age No 99', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 53111, 'novan'),
(3, 'Gerry', 'Kos', 'Jl Kos kosan No 88', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 53111, 'novan'),
(4, 'Tejo', 'Rumah', 'Jl Laksada Adisucipto No 100', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 58214, 'novan'),
(5, 'Joko Anwar', 'Kerja', 'Jl Godean No 78', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 58124, 'novan'),
(6, 'Dimas', 'Rumah', 'Jl Gerbang Hijau No 23', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 24555, 'novan'),
(7, 'Novan', 'Kos', 'Jl Jendral No 22', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 12345, 'cobacoba'),
(8, 'Novan', 'Kos', 'Jl HIjau Polos No 90', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 58222, 'tester'),
(9, 'Danny', 'Kos', 'Jl Laksada Adisucipto No 50', 'Jawa Tengah', 'Banyumas', 'Banyumas', 'Banyumas', 85444, 'novan'),
(12, 'Randy', 'Rumah', 'Jl Terang Benderang 12', 'Daerah Istimewa Yogyakarta', 'Bantul', '', '', 53111, 'novancoba2'),
(13, 'Dodo', 'Kos', 'Jl Kos kosan No 123', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', '', '', 53114, 'novancoba2'),
(14, 'Jacob Adiyaksa', 'Rumah', 'Jl Pangeran Diponegoro', 'Jawa Timur', 'Surabaya', '', '', 53111, 'idpembeli'),
(15, 'Daniel Reinaldo', 'Kos', 'Jalan Laksada Adisucipto No 100', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', '', '', 55281, 'idpembeli'),
(16, 'Daniel Reinaldo', 'Kos', 'Jl Laksada Adisucipto No 100', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', '', '', 55281, 'idpenjual'),
(17, 'Novan Andriyanto', 'Kos', 'Jl Laksada Adisucipto No 100', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', '', '', 55281, 'idpercobaa'),
(18, 'asdsad', 'Rumah', 'Jl Dr Wahidin No 25', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', '', '', 55314, 'idpercobaa'),
(19, 'asdsad', 'Rumah', 'Jl Dr Wahidin No 25', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', '', '', 55314, 'idpercobaa'),
(0, 'Halim', 'Kantor', 'Kantor', 'Daerah Istimewa Yogyakarta', 'Gunungkidul', '', '', 562536, 'pembeli'),
(0, 'Halim', 'Kantor', 'Kantor', 'Daerah Istimewa Yogyakarta', 'Bantul', '', '', 562536, 'pembeli');

-- --------------------------------------------------------

--
-- Table structure for table `f_materi`
--

CREATE TABLE `f_materi` (
  `ID_File` int(100) NOT NULL,
  `ID_Topic` varchar(100) NOT NULL,
  `judul_f` varchar(50) NOT NULL,
  `document` varchar(100) NOT NULL,
  `tgl_update` date NOT NULL,
  `video` varchar(100) NOT NULL,
  `audio` varchar(100) NOT NULL,
  `nama_fasilitator` varchar(50) DEFAULT NULL,
  `tgl_verify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_materi`
--

INSERT INTO `f_materi` (`ID_File`, `ID_Topic`, `judul_f`, `document`, `tgl_update`, `video`, `audio`, `nama_fasilitator`, `tgl_verify`) VALUES
(1, '1', 'Pengenalan', './upload/aa.docx', '2017-09-27', '', '', '71130212', '2017-09-27'),
(2, '1', 'Cara menanam', '', '2017-09-27', './upload/semangka.mp4', '', '71130212', '2017-09-27'),
(3, '2', 'Cara memilih benih unggul', './upload/aa.docx', '2017-09-06', '', '', '71130212', '2017-09-27'),
(4, '2', 'Cara mengelola benih', '', '2017-09-12', './upload/semangka.mp4', '', '71130212', '2017-09-27'),
(5, '6', 'Memilih lahan', './upload/aa.docx', '2017-10-01', '', '', '71130212', '2017-10-01'),
(6, '6', 'Memilih pupuk yang baik', './upload/99259d308b008ea6.docx', '2017-10-03', '', '', '71130212', '2017-10-01'),
(7, '6', 'Memilih pupuk yang baik', '', '2017-10-03', '', './upload/578559d308bda4c13.docx', '71130212', '2017-10-01'),
(8, '6', 'Mengatur jarak antar  tanaman', './upload/1023659d30a0f7ac95.docx', '2017-10-03', '', '', '71130212', NULL),
(9, '6', 'Penyiraman', './upload/2805659d30a627b1c0.docx', '2017-10-03', '', '', '71130212', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `Nama_Kabupaten` varchar(100) NOT NULL,
  `Nama_Provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`Nama_Kabupaten`, `Nama_Provinsi`) VALUES
('Bantul', 'Daerah Istimewa Yogyakarta'),
('Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('kota Yogyakarta', 'Daerah Istimewa Yogyakarta'),
('Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Sleman', 'Daerah Istimewa Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `Nama_Kecamatan` varchar(100) NOT NULL,
  `Nama_Kabupaten` varchar(100) NOT NULL,
  `Nama_Provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`Nama_Kecamatan`, `Nama_Kabupaten`, `Nama_Provinsi`) VALUES
('Banguntapan', 'Bantul', 'Daerah Istimewa Yogyakarta'),
('Dlingo', 'Bantul', 'Daerah Istimewa Yogyakarta'),
('Gondokusuman', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta'),
('Gondomanan', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta'),
('kasihan', 'Bantul', 'Daerah Istimewa Yogyakarta'),
('Ngaglik', 'Sleman', 'Daerah Istimewa Yogyakarta'),
('Ngawen', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('Pakem', 'Sleman', 'Daerah Istimewa Yogyakarta'),
('Panggang', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('Pengasih', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Semin', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('Sentolo', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Temon', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Turi', 'Sleman', 'Daerah Istimewa Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan_desa`
--

CREATE TABLE `kelurahan_desa` (
  `Nama_Desa` varchar(100) NOT NULL,
  `Nama_Kecamatan` varchar(100) NOT NULL,
  `Nama_Kabupaten` varchar(100) NOT NULL,
  `Nama_Provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelurahan_desa`
--

INSERT INTO `kelurahan_desa` (`Nama_Desa`, `Nama_Kecamatan`, `Nama_Kabupaten`, `Nama_Provinsi`) VALUES
('', 'Dlingo', 'Bantul', 'Daerah Istimewa Yogyakarta'),
('Klitren', 'Gondokusuman', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta'),
('Terban', 'Gondokusuman', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta'),
('Ngupasan', 'Gondomanan', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta'),
('Prawirodirjan', 'Gondomanan', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta'),
('Bangunjiwo', 'kasihan', 'Bantul', 'Daerah Istimewa Yogyakarta'),
('Tirtonirmolo', 'kasihan', 'Bantul', 'Daerah Istimewa Yogyakarta'),
('Donoharjo', 'Ngaglik', 'Sleman', 'Daerah Istimewa Yogyakarta'),
('Minomartani', 'Ngaglik', 'Sleman', 'Daerah Istimewa Yogyakarta'),
('Beji', 'Ngawen', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('Watusigar', 'Ngawen', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('Hargobingangun', 'Pakem', 'Sleman', 'Daerah Istimewa Yogyakarta'),
('Pakembingangun', 'Pakem', 'Sleman', 'Daerah Istimewa Yogyakarta'),
('Girimulyo', 'Panggang', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('Karang Sari', 'Pengasih', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Kalitekuk', 'Semin', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('kemejing', 'Semin', 'Gunungkidul', 'Daerah Istimewa Yogyakarta'),
('Kaliagung', 'Sentolo', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Salamrejo', 'Sentolo', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Palihan', 'Temon', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Sindulan', 'Temon', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Sindutan', 'Temon', 'Kulon Progo', 'Daerah Istimewa Yogyakarta'),
('Wonokerto', 'Turi', 'Sleman', 'Daerah Istimewa Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `ID_Komentar` int(100) NOT NULL,
  `ID_Penawaran` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Komentar` text NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`ID_Komentar`, `ID_Penawaran`, `ID_User`, `Komentar`, `Tanggal`, `Waktu`) VALUES
(1, 'PEN0002', 'idpembeli', 'Barangnya bagus sekali', '2018-01-06', '23:59:00'),
(2, 'PEN0001', 'idpembeli', 'Nice', '2018-01-13', '17:24:45'),
(3, 'PEN0001', 'idpembeli', 'Ada stok apa tidak?', '2018-01-15', '04:50:51'),
(4, 'PEN0002', 'idpenjual', 'Saya juga mau dong gan', '2018-01-16', '20:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `komentar_produk`
--

CREATE TABLE `komentar_produk` (
  `ID_Masukkan` int(100) NOT NULL,
  `ID_Penawaran` varchar(10) NOT NULL,
  `ID_User` varchar(50) NOT NULL,
  `Komentar` text NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar_produk`
--

INSERT INTO `komentar_produk` (`ID_Masukkan`, `ID_Penawaran`, `ID_User`, `Komentar`, `Tanggal`, `Waktu`) VALUES
(1, 'PEN0002', 'idpembeli', 'Barangnya bagus sesuai digambar', '2018-01-07', '20:18:20'),
(2, 'PEN0002', 'idpembeli', 'Barang palsu', '2018-01-07', '14:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `kode_kurir` int(10) NOT NULL,
  `nama_kurir` varchar(50) NOT NULL,
  `kota_awal` varchar(50) NOT NULL,
  `kota_tujuan` varchar(50) NOT NULL,
  `harga` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kurir`
--

INSERT INTO `kurir` (`kode_kurir`, `nama_kurir`, `kota_awal`, `kota_tujuan`, `harga`) VALUES
(1, 'JNE', 'kota Yogyakarta', 'Bantul', 25000),
(2, 'TIKI', 'kota Yogyakarta', 'Bandung', 35000),
(3, 'JNE', 'kota Yogyakarta', 'Bekasi', 40000),
(4, 'TIKI', 'Surabaya', 'Bandung', 50000),
(5, 'JNE', 'Banyumas', 'Surabaya', 30000),
(6, 'TIKI', 'Cilacap', 'Bandung', 30000),
(7, 'JNE', 'kota Yogyakarta', 'Banyumas', 20000),
(8, 'TIKI', 'kota Yogyakarta', 'Mojokerto', 50000),
(9, 'JNE', 'Banyumas', 'kota Yogyakarta', 50000),
(10, 'TIKI', 'Bantul', 'kota Yogyakarta', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `login_user`
--

CREATE TABLE `login_user` (
  `ID_User` varchar(10) NOT NULL,
  `tgl_login` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_user`
--

INSERT INTO `login_user` (`ID_User`, `tgl_login`) VALUES
('1234567', '2017-09-20'),
('1234567', '2017-09-02'),
('bala', '2017-09-06'),
('bala', '2017-09-19'),
('bolo', '2017-09-06'),
('bolo', '2017-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktifitas_pelatihan`
--

CREATE TABLE `log_aktifitas_pelatihan` (
  `ID_Log` varchar(10) NOT NULL,
  `ID_Permintaan_Pelatihan` varchar(10) NOT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Aktivitas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_aktifitas_pelayanan`
--

CREATE TABLE `log_aktifitas_pelayanan` (
  `ID_Log` varchar(10) NOT NULL,
  `ID_Permintaan_Pelayanan` varchar(10) NOT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Aktivitas` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_biaya_keluar`
--

CREATE TABLE `log_biaya_keluar` (
  `ID_Spesies` varchar(10) NOT NULL,
  `ID_aktifitas_spesies` varchar(10) NOT NULL,
  `ID_Aktivitas` varchar(10) NOT NULL,
  `ID_Petani` varchar(10) NOT NULL,
  `Tahun_Biaya` int(4) DEFAULT NULL,
  `ID_Biaya` varchar(10) NOT NULL,
  `Jumlah_Satuan` int(4) DEFAULT NULL,
  `Harga_Satuan` int(10) DEFAULT NULL,
  `Tgl_Pengeluaran` date DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_penawaran_prod`
--

CREATE TABLE `log_penawaran_prod` (
  `ID_Log` varchar(10) NOT NULL,
  `ID_Penawaran` varchar(10) NOT NULL,
  `Tanggal` datetime NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Aktivitas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_permintaan`
--

CREATE TABLE `log_permintaan` (
  `ID_Log` varchar(10) NOT NULL,
  `ID_Permintaan` varchar(10) NOT NULL,
  `Tanggal` datetime NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Aktivitas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_user_trans`
--

CREATE TABLE `log_user_trans` (
  `ID_User` varchar(10) NOT NULL,
  `Tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ID_Aktivitas` varchar(10) NOT NULL,
  `Keterangan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_aktifitas_spesies`
--

CREATE TABLE `master_aktifitas_spesies` (
  `ID_Aktivitas` varchar(10) NOT NULL,
  `ID_Spesies` varchar(10) NOT NULL,
  `Periode_Waktu` varchar(2) DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `ID_aktifitas_spesies` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_aktifitas_spesies`
--

INSERT INTO `master_aktifitas_spesies` (`ID_Aktivitas`, `ID_Spesies`, `Periode_Waktu`, `deskripsi`, `ID_aktifitas_spesies`) VALUES
('akt1', 'spt10', '1', 'Persiapan Lahan', 'akt1spt101'),
('akt1', 'spt1', '1', 'persiapan lahan', 'akt1spt11'),
('akt1', 'spt11', '1', 'Persiapan Lahan', 'akt1spt111'),
('akt1', 'spt2', '1', 'Persiapan lahan', 'akt1spt21'),
('akt1', 'spt3', '1', 'Persiapan lahan ', 'akt1spt31'),
('akt1', 'spt4', '1', 'Persiapan Lahan', 'akt1spt41'),
('akt1', 'spt5', '1', 'Persiapan Lahan', 'akt1spt51'),
('akt1', 'spt6', '1', 'Persiapan Lahan', 'akt1spt61'),
('akt1', 'spt7', '1', 'Persiapan Lahan', 'akt1spt71'),
('akt1', 'spt8', '1', 'Persiapan Lahan', 'akt1spt81'),
('akt1', 'spt9', '1', 'Persiapan Lahan', 'akt1spt91'),
('akt2', 'spt10', '1', 'Penanaman', 'akt2spt101'),
('akt2', 'spt11', '1', 'Penanaman', 'akt2spt111'),
('akt2', 'spt1', '1', 'Penanaman', 'akt2spt12'),
('akt2', 'spt2', '1', 'Penanaman', 'akt2spt21'),
('akt2', 'spt3', '1', 'Penanaman', 'akt2spt31'),
('akt2', 'spt4', '1', 'Penanaman', 'akt2spt41'),
('akt2', 'spt5', '1', 'Penanaman', 'akt2spt51'),
('akt2', 'spt6', '1', 'Penanaman', 'akt2spt61'),
('akt2', 'spt7', '1', 'Penanaman', 'akt2spt71'),
('akt2', 'spt8', '1', 'Penanaman', 'akt2spt81'),
('akt2', 'spt9', '1', 'Penanaman', 'akt2spt91'),
('akt3', 'spt10', '1', 'Pemupukan', 'akt3spt101'),
('akt3', 'spt11', '1', 'Pemupukan', 'akt3spt111'),
('akt3', 'spt1', '1', 'Pemupukan', 'akt3spt13'),
('akt3', 'spt2', '1', 'Pemupukan', 'akt3spt23'),
('akt3', 'spt3', '1', 'Pemupukan', 'akt3spt31'),
('akt3', 'spt4', '1', 'Pemupukan', 'akt3spt41'),
('akt3', 'spt5', '1', 'Pemupukan Kentang', 'akt3spt51'),
('akt3', 'spt6', '1', 'Pemupukan', 'akt3spt61'),
('akt3', 'spt7', '1', 'Pemupukan', 'akt3spt71'),
('akt3', 'spt8', '1', 'Pemupukan', 'akt3spt81'),
('akt3', 'spt9', '1', 'Pemupukan', 'akt3spt91'),
('akt4', 'spt10', '1', 'Panen', 'akt4spt101'),
('akt4', 'spt11', '1', 'Panen', 'akt4spt111'),
('akt4', 'spt1', '1', 'Masa Panen', 'akt4spt14'),
('akt4', 'spt2', '1', 'Masa Panen', 'akt4spt24'),
('akt4', 'spt3', '1', 'Panen', 'akt4spt31'),
('akt4', 'spt4', '1', 'Panen Bayam', 'akt4spt41'),
('akt4', 'spt5', '1', 'Panen Kentang', 'akt4spt51'),
('akt4', 'spt6', '1', 'Panen', 'akt4spt61'),
('akt4', 'spt7', '1', 'Panen', 'akt4spt71'),
('akt4', 'spt8', '1', 'Panen', 'akt4spt81'),
('akt4', 'spt9', '1', 'Panen', 'akt4spt91');

-- --------------------------------------------------------

--
-- Table structure for table `master_aktivitas`
--

CREATE TABLE `master_aktivitas` (
  `ID_Aktivitas` varchar(10) NOT NULL,
  `Nama_Aktivitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_aktivitas`
--

INSERT INTO `master_aktivitas` (`ID_Aktivitas`, `Nama_Aktivitas`) VALUES
('1', 'Membuat Diskusi Baru'),
('2', 'MMengomentari'),
('3', 'LogIn'),
('akt1', 'Persiapan lahan'),
('akt2', 'Menanam'),
('akt3', 'Memupuk'),
('akt4', 'Panen');

-- --------------------------------------------------------

--
-- Table structure for table `master_alat_tani`
--

CREATE TABLE `master_alat_tani` (
  `ID_Alat` varchar(10) NOT NULL,
  `Nama_Alat` varchar(50) NOT NULL,
  `Deskripsi_Alat` varchar(200) DEFAULT NULL,
  `Spesifikasi` varchar(200) DEFAULT NULL,
  `Harga_Terendah` int(12) DEFAULT NULL,
  `Harga_Tertinggi` int(12) DEFAULT NULL,
  `Fungsi` varchar(200) DEFAULT NULL,
  `ID_Kategori` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_alat_tani`
--

INSERT INTO `master_alat_tani` (`ID_Alat`, `Nama_Alat`, `Deskripsi_Alat`, `Spesifikasi`, `Harga_Terendah`, `Harga_Tertinggi`, `Fungsi`, `ID_Kategori`) VALUES
('ALA0001', ' Cangkul no 1', ' Alat buat menggemburkan tanah diladang', ' Terbuat dari kayu jati dan besi ditempa dengan baik', 200000, 250000, '   -membuat lubang di ladang\r\n-mengemburkan tanah', 'Kat1'),
('ALA0002', 'Sabit bahan besi kuat', 'Gagang dibuat dari karet dan besi ditempa dengan campuran titanium', 'panjang 50 CM ', 500000, 600000, 'Buat memotong apa saja', 'Kat1'),
('ALA0003', 'garpu buat ladang sawah', 'ukuran tinggi 50 cm', 'full besi', 200000, 250000, 'megaruk ladang', 'Kat1');

-- --------------------------------------------------------

--
-- Table structure for table `master_bahan_tani`
--

CREATE TABLE `master_bahan_tani` (
  `ID_Bahan` varchar(10) NOT NULL,
  `Nama_Bahan` varchar(50) NOT NULL,
  `Deskripsi_Bahan` varchar(200) DEFAULT NULL,
  `Spesifikasi_Bahan` varchar(200) DEFAULT NULL,
  `Harga_Terendah` int(12) DEFAULT NULL,
  `Harga_Tertinggi` int(12) DEFAULT NULL,
  `Fungsi_Bahan` varchar(200) DEFAULT NULL,
  `Jenis_Bahan` varchar(100) DEFAULT NULL,
  `ID_Kategori` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_bahan_tani`
--

INSERT INTO `master_bahan_tani` (`ID_Bahan`, `Nama_Bahan`, `Deskripsi_Bahan`, `Spesifikasi_Bahan`, `Harga_Terendah`, `Harga_Tertinggi`, `Fungsi_Bahan`, `Jenis_Bahan`, `ID_Kategori`) VALUES
('BAH0001', 'Bibit ampuh buat tanaman', 'Menghilangkan ham pada tanaman', 'berupa cairan dengan isi 100Ml', 12000, 15000, 'Membantu perkembangan tanaman', 'pupuk', 'Kat2'),
('BAH0002', 'Pupuk buat padi', 'Berberbentuk seperti garam berwarna putih', 'bungkus rapi ', 50000, 60000, 'Untuk membantu pertumbuhan padi', 'pupuk', 'Kat2'),
('BAH0003', 'Pupuk pertanian cabe', 'berupa cairan yang ditaburkan', 'isi 100 Ml', 50000, 80000, 'Membantu pertumbuhan cabai', 'pupuk', 'Kat2');

-- --------------------------------------------------------

--
-- Table structure for table `master_berita`
--

CREATE TABLE `master_berita` (
  `id` int(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `Id_User` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_berita_informasi`
--

CREATE TABLE `master_berita_informasi` (
  `id` int(100) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `NIK` varchar(10) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_berita_informasi`
--

INSERT INTO `master_berita_informasi` (`id`, `judul`, `isi`, `NIK`, `foto`, `tanggal`) VALUES
(7, 'Sambut Pagi dan Kisah Sukses Petani Sayur di Tengah Kota', '<p><span style=\"font-weight: 700; color: rgb(246, 118, 56); font-family: AcuminPro, arial, helvetica, sans-serif;\">Liputan6.com, Kupang -</span><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"> Tingginya kebutuhan hidup di kota dan tak memiliki lahan untuk berkebun, tak membuat pasangan suami istri (pasutri), Dominggus Leba (54) dan Regina Leba Bara (53), menyerah. Dengan sistem menyewa lahan kosong di Kelurahan Fatululi, Kecamatan Oebobo, Kota </span><a href=\"http://regional.liputan6.com/read/2830337/temuan-pemkab-kupang-bikin-siswa-smpn-3-kupang-bersekolah-lagi\" title=\"Kupang\" style=\"background-color: rgb(255, 255, 255); color: rgb(246, 118, 56); font-family: AcuminPro, arial, helvetica, sans-serif;\">Kupang</a><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">, Nusa Tenggara Timur, pasangan ini memanfaatkan lahan yang ada untuk menanam sayur-sayuran.</span><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">Meski hanya menyewa beberapa petak lahan, pasutri asal Kabupaten Sabu Raijua ini mampu menyekolahkan anak mereka hingga perguruan tinggi.</span><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">Kerasnya kehidupan kota menuntut keduanya harus berjuang keras. Lahan kosong berbatu disulap menjadi \"surga kecil\" yang menghijau. Bedeng-bedeng sayur dibangun berderet membentuk terasering.</span><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">\"Lahan ini kami sewa dari tahun 1999 dan menjadi sumber kehidupan kami di Kota Kupang. Satu bulan kami harus bayar di pemilik lahan sebesar Rp 280 ribu,\" ucap Regina kepada </span><span style=\"font-weight: 700; color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><a href=\"http://regional.liputan6.com/\" style=\"color: rgb(246, 118, 56);\">Liputan6.com</a></span><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">, Minggu pagi, 19 Februari 2017.</span></p><p style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">Menurut Regina, dahulu lahan yang disewanya itu dipenuhi rumput dan batu karang. Namun, dengan keuletan suaminya, tempat itu kini menjadi sawah kecil dan menjadi satu-satunya sumber penghasilan mereka.<br><br>Di samping lahan, terdapat sebuah sumur tua yang menjadi harapan Ibu Regina dan petani sayur lainnya untuk menyiram tanaman mereka.<br><br>\"Setiap pagi dan sore kami pikul air dari sumur untuk siram tanaman. Hasil dari kebun sayur kami jual ke pasar dan hasilnya buat biaya pendidikan anak-anak,\" Regina menuturkan.</p><p><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">Dari hasil menyewa lahan itu, anak sulungnya saat ini sudah lulus kuliah dan sudah bekerja. \"Mereka kami biayai dari hasil kebun kecil ini. Yang sulung sudah habis kuliah dan sudah kerja di puskesmas. Satu masih kuliah dan bungsu masih SMA,\" Dominggus menambahkan.</span><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">Di balik kesuksesan menyekolahkan anak, ada segudang perjuangan yang melelahkan tak pernah ditunjukkan. Dominggus selalu tersenyum walau terbakar teriknya matahari. Di hadapan anak-anaknya, ia selalu ceria walau sebenarnya menyimpan sejuta lelah. Kerutan di wajahnya menggambarkan perjuangan yang tak mudah.</span><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">Di balik kepenatannya, ia berharap pemerintah sudi membantu peralatan pertanian guna meringankan bebannya, sehingga dapat meningkatkan hasil </span><a href=\"http://regional.liputan6.com/read/2852655/buton-utara-jadi-kabupaten-pertanian-organik\" title=\"pertanian\" style=\"background-color: rgb(255, 255, 255); color: rgb(246, 118, 56); font-family: AcuminPro, arial, helvetica, sans-serif;\">pertanian</a><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"> yang bermuara pada peningkatan ekonomi.</span><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><br style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\">\"Kalau bisa pemerintah bantu alat semprot, bibit, obat hama dan pupuk. Soalnya harga pupuk saja mahal, belum lagi obat hama,\" ucap Dominggus.</span></p><p><span style=\"color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif;\"><br></span><br></p><figure class=\"read-page--photo-gallery--item\" id=\"gallery-inline-image-0\" data-image=\"https://cdn0-a.production.liputan6.static6.com/medias/1512203/big/034097500_1487516204-20170220-salam_pagi-petani2_kota-kupang.jpg\" data-description=\"Sepasang suami istri menyewa lahan kosong di Kota Kupang, NTT, untuk menanam sayur-sayuran. (Liputan6.com/Ola Keda)\" data-share-url=\"http://regional.liputan6.com/read/2862529/sambut-pagi-dan-kisah-sukses-petani-sayur-di-tengah-kota\" data-copy-link-url=\"http://regional.liputan6.com/read/2862529/sambut-pagi-dan-kisah-sukses-petani-sayur-di-tengah-kota\" data-title=\"Sepasang suami istri menyewa lahan kosong di Kota Kupang, NTT, untuk menanam sayur-sayuran. (Liputan6.com/Ola Keda)\" data-component=\"desktop:read-page:photo-gallery:item\" style=\"margin-bottom: 30px; padding: 0px; clear: both;\"><div class=\"read-page--photo-gallery--item__content js-gallery-content\" style=\"overflow: hidden; position: relative; background-color: rgb(221, 221, 221);\"><a href=\"http://regional.liputan6.com/read/2862529/sambut-pagi-dan-kisah-sukses-petani-sayur-di-tengah-kota#\" class=\"read-page--photo-gallery--item__link\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(246, 118, 56); display: block;\"></a></div></figure><p style=\"box-sizing: border-box; color: rgb(74, 74, 74); font-family: AcuminPro, arial, helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\"></p>', '71130094', '', '2017-03-01 19:43:58'),
(8, 'Uji Coba Aplikasi', '<p><img src=\"&#10;http://localhost/dutatani/tentang/744b8144030f96d074ede04006852c54.PNG\" style=\"width: 25%;\"></p><p>UJi Coba aplikasi</p>', 'admin', 'tentang/744b8144030f96d074ede04006852c54.PNG', '2017-03-15 22:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `master_detail_materi_ajar`
--

CREATE TABLE `master_detail_materi_ajar` (
  `ID_Materi_Ajar` varchar(10) NOT NULL,
  `ID_Sub_materi` varchar(10) NOT NULL,
  `Deskripsi_sub` varchar(200) NOT NULL,
  `file_materi` varchar(200) NOT NULL,
  `link_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_detail_user`
--

CREATE TABLE `master_detail_user` (
  `ID_User` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` tinyint(4) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `keluran_desa` varchar(50) NOT NULL,
  `nomor_telpon` varchar(15) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Foto` varchar(200) NOT NULL,
  `Status_Akun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_detail_user`
--

INSERT INTO `master_detail_user` (`ID_User`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `provinsi`, `kabupaten`, `kecamatan`, `keluran_desa`, `nomor_telpon`, `Email`, `Foto`, `Status_Akun`) VALUES
('1234567', 'a', 1, '2016-11-16', 'a', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', 'Gondokusuman', 'Terban', 'sw', 'as', 'adc5e881fc4e033f001d01a92aeed60a.PNG', 'Aktif'),
('71130120', 'aa', 1, '2016-10-30', 'aa', 'Daerah Istimewa Yogyakarta', 'Gunungkidul', 'Ngawen', 'Beji', 'aa', 'aa@yahoo.com', 'fce54cba532517e1ca955d5dd6398b23.PNG', 'Aktif'),
('71130121', 'a', 2, '2016-10-30', 'a', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', 'Gondomanan', 'Prawirodirjan', 'a', 'a@yahoo.com', '17f83131fbde0f9ac95aee73f9e58239.PNG', 'Aktif'),
('71130122', 'Dennis Markus', 1, '2016-10-30', 'Ddd', 'Daerah Istimewa Yogyakarta', 'Bantul', 'Banguntapan', 'Singosaren', 'da', 'dsas@yahoo.com', 'aa2627c3971eae64f01f98126d170834.jpg', 'Aktif'),
('741916', 'Argo Wibowo', 0, '0000-00-00', '', '', '', '', '', '', 'admin@gmail.com', '', ''),
('adminpjl', 'Admin Penjual', 1, '2018-04-12', 'Jl Godean', 'Daerah Istimewa Yogyakarta', 'Sleman', 'Godean', 'Godean', '081123123123', 'admin@gmail.com', '', 'Aktif'),
('adminpmb', 'Admin Pembeli', 1, '2018-04-12', 'Jl Godean', 'Daerah Istimewa Yogyakarta', 'Sleman', 'Godean', 'Godean', '081123123123', 'admin@gmail.com', '', 'Aktif'),
('ambarnur', 'ambar nur kustinari', 1, '2017-03-10', 'Kenekan PB 1 153 Yogyakarta', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', 'Gondomanan', 'Prawirodirjan', '', '', '5a3e5ead4cd3f2842a43c8350026a62c.jpg', 'Aktif'),
('dmarkus', 'Dennis Markus', 1, '2017-03-22', 'klitren lor', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', 'Gondokusuman', 'Klitren', '081575741', 'dennis.markus@ti.ukdw.ac.id', 'a6759ba18bce2c194c586e1e7b7cc805.jpg', 'Aktif'),
('fassatu', 'Rosa', 2, '2017-03-15', 'dutawacana ukdw', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', 'Gondokusuman', 'Terban', '081081', 'rosadelima@staff.ukdw.ac.id', 'maxresdefault.jpg', 'Aktif'),
('frmaya', 'Fransiska Maya', 2, '0000-00-00', 'Kenekan PB 1 153 Yogyakarta', 'Daerah Istimewa Yogyakarta', '', 'Gondokusuman', 'Klitren', '081904067865', 'fransiskamaya@ti.ukdw.ac.id', 'edb79c63322fff54340decebbc1798c5.jpg', 'Aktif'),
('intsatu', 'int 1', 1, '2013-02-12', 'iny1', 'Daerah Istimewa Yogyakarta', 'Gunungkidul', 'Ngawen', 'Beji', '089671044525', 'int1@yahoo.com', 'maxresdefault.jpg', 'Aktif'),
('mayafraya', 'Fransiska Maya', 2, '2016-12-13', 'Godean', 'Jawa Tengah', 'magelang', 'Secang', 'Candiretno', '089671044525', 'Gak@tahu.com', 'maxresdefault.jpg', 'Aktif'),
('pembeli', 'Argo', 1, '0000-00-00', 'a', 'Daerah Istimewa Yogyakarta', 'kota Yogyakarta', 'Banguntapan', 'Jagalan', '088237823535', 'aa@yahoo.com', 'DSC04192 copy.jpg', 'Aktif'),
('penjual', 'Argo Penjual', 1, '2018-04-19', 'Alamat', 'Daerah Istimewa Yogyakarta', 'Godean', 'Godean', 'Kelurahan', '081123123123', 'argo@gmail.com', 'hihjhskjdhfsdfh', 'Aktif'),
('superadmin', 'admin', 0, '0000-00-00', '', '', '', '', '', '', '', '', 'Aktif'),
('tesjanuari', 'Argo Wibowo', 1, '2019-01-29', 'Jl. Murai No. R36 Sidoarum 3 Godean Yogyakarta', 'Daerah Istimewa Yogyakarta', 'Bantul', 'Banguntapan', 'Tirtonirmolo', '085726410947', 'argoz.uchiha@gmail.com', '', 'Aktif'),
('uji_coba1', 'Dennis Markus', 1, '0000-00-00', '', 'Daerah Istimewa Yogyakarta', 'Bantul', 'Banguntapan', 'Singosaren', '', '', 'maxresdefault.jpg', 'Aktif'),
('userbiasas', 'User Biasa', 1, '0000-00-00', 'Biasa', 'Daerah Istimewa Yogyakarta', '', 'kasihan', 'Bangunjiwo', '0825123123123', 'aksjdkasj@gmail.com', 'e97ec2ed062f4add5f7a488278e3f68d.PNG', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `master_fasilitator`
--

CREATE TABLE `master_fasilitator` (
  `ID_User` varchar(10) NOT NULL,
  `Nama_Fasilitator` varchar(50) NOT NULL,
  `Alamat_Fasilitator` varchar(200) DEFAULT NULL,
  `Desa` varchar(50) DEFAULT NULL,
  `Kecamatan` varchar(50) DEFAULT NULL,
  `Kabupaten` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(50) DEFAULT NULL,
  `Telpon` varchar(15) DEFAULT NULL,
  `Pendidikan_Terakhir` varchar(3) DEFAULT NULL,
  `Jurusan` varchar(30) DEFAULT NULL,
  `Kompetensi_Keahlian` varchar(200) DEFAULT NULL,
  `Riwayat_Pendidikan` varchar(200) DEFAULT NULL,
  `Pengalaman_Kerja` varchar(200) DEFAULT NULL,
  `Foto` varchar(200) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `jns_kelamin` tinyint(4) NOT NULL,
  `Upload` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_fasilitator`
--

INSERT INTO `master_fasilitator` (`ID_User`, `Nama_Fasilitator`, `Alamat_Fasilitator`, `Desa`, `Kecamatan`, `Kabupaten`, `Provinsi`, `Telpon`, `Pendidikan_Terakhir`, `Jurusan`, `Kompetensi_Keahlian`, `Riwayat_Pendidikan`, `Pengalaman_Kerja`, `Foto`, `Email`, `tanggal_lahir`, `jns_kelamin`, `Upload`) VALUES
('71130121', 'Sutrisno', 'a', 'Prawirodirjan', 'Gondomanan', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta', 'a', 'a', 'a', 'a', 'a', 'a', './images/bambang.jpg', 'a@yahoo.com', '2016-10-30', 2, 10),
('71130122', 'Bambang', '', '', '', '', '', '', 'kaj', '', '', 'kaj', 'dnjalasdnj', '', '', '0000-00-00', 0, 11),
('dmarkus', 'Dennis Markus', 'klitren lor', 'Klitren', 'Gondokusuman', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta', '081575741', 'SMP', 'TI', '', '', '', 'a6759ba18bce2c194c586e1e7b7cc805.jpg', 'dennis.markus@ti.ukdw.ac.id', '2017-03-22', 1, 3),
('fassatu', 'Rosa', 'dutawacana ukdw', 'Terban', 'Gondokusuman', 'kota Yogyakarta', 'Daerah Istimewa Yogyakarta', '081081', 'S2', 'TI', 'Ti', 'TI', 'TI', 'maxresdefault.jpg', 'rosadelima@staff.ukdw.ac.id', '2017-03-15', 2, 50);

-- --------------------------------------------------------

--
-- Table structure for table `master_hasil_tani`
--

CREATE TABLE `master_hasil_tani` (
  `ID_Hasil` varchar(10) NOT NULL,
  `ID_Kategori` varchar(10) NOT NULL,
  `ID_Spesies` varchar(10) NOT NULL,
  `Nama_Hasil` varchar(225) NOT NULL,
  `Deskripsi_Hasil` varchar(200) NOT NULL,
  `Harga_Terendah` int(12) NOT NULL,
  `Harga_Tertinggi` int(12) NOT NULL,
  `Masa_Expayet` date NOT NULL,
  `Satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_hasil_tani`
--

INSERT INTO `master_hasil_tani` (`ID_Hasil`, `ID_Kategori`, `ID_Spesies`, `Nama_Hasil`, `Deskripsi_Hasil`, `Harga_Terendah`, `Harga_Tertinggi`, `Masa_Expayet`, `Satuan`) VALUES
('HAS0001', 'Kat3', 'spt1', 'Beras Super', 'Beras Super dengan kualitas terbaik', 150000, 160000, '2017-12-13', 'KUINTAL'),
('HAS0002', 'Kat3', 'spt9', 'Cape pedes', 'Merah dan pedas luar biasa', 50000, 55000, '2018-03-15', 'KG'),
('HAS0003', 'Kat3', 'spt5', 'Jual Kentang hasil Kulon Progo', 'Ukuran berdiameter besar', 80000, 10000, '2017-09-30', 'KG'),
('HAS0004', 'Kat3', 'spt7', 'Wortel seger dari jogja', 'Di tanam dengan pupuk nomor 1 di indonesia', 15000, 20000, '2017-10-20', 'KG'),
('HAS0005', 'Kat3', 'spt1', 'Beras Super Cap GK', 'Diolah dengan pupuk organik', 120000, 140000, '2018-05-10', 'KUINTAL');

-- --------------------------------------------------------

--
-- Table structure for table `master_jenis_sup`
--

CREATE TABLE `master_jenis_sup` (
  `ID_Jenis_Sup` varchar(10) NOT NULL,
  `Nama_Jenis_Sup` varchar(50) NOT NULL,
  `Deskripsi_Jenis_Sup` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_jenis_sup`
--

INSERT INTO `master_jenis_sup` (`ID_Jenis_Sup`, `Nama_Jenis_Sup`, `Deskripsi_Jenis_Sup`) VALUES
('1', 'Ra mudeng', 'Gak tau'),
('2', 'Mboh', 'Lali aku\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori`
--

CREATE TABLE `master_kategori` (
  `ID_Kategori` char(3) NOT NULL,
  `Nama_Kategori` varchar(40) NOT NULL,
  `Deskripsi` varchar(200) DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_kategori`
--

INSERT INTO `master_kategori` (`ID_Kategori`, `Nama_Kategori`, `Deskripsi`, `aktif`) VALUES
('760', 'Pemerintah Pusat', 'Siapa tau ada pemerintah pusat pengen gabung', 0),
('ADK', 'Admin Kelompok Tani', 'Admin Kelompok Tani', 0),
('ADP', 'Admin Petani', 'Admin Petani', 0),
('ADT', 'admin_tanaman', 'admin untuk tanaman', 0),
('FAS', 'Fasilitator', 'Fasilitator', 1),
('Mba', 'Pengunjung biasa', '', 0),
('Pem', 'Pemerintah Pusat', 'Siapa tau ada pemerintah pusat pengen gabung', 1),
('PET', 'Petani', 'Ini adalah petani', 1),
('PJL', 'Penjual', 'Penjual berupa broker atau pengguna umum', 1),
('PMB', 'Pembeli', 'User sebagai pembeli yang melakukan permintaan produk', 1),
('PMT', 'Pemerintahan', 'Pemerintahan', 1),
('SUP', 'Suplayer', 'Ini Suplayer', 1),
('UBS', 'User Biasa', 'User Biasa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori_alatbahan`
--

CREATE TABLE `master_kategori_alatbahan` (
  `ID_Kategori` varchar(10) NOT NULL,
  `Jenis_kategori` varchar(1) NOT NULL,
  `Nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori_materi`
--

CREATE TABLE `master_kategori_materi` (
  `ID_Ref` int(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `diskripsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori_produk`
--

CREATE TABLE `master_kategori_produk` (
  `ID_Kategori` varchar(10) NOT NULL,
  `Jenis_kategori` varchar(1) NOT NULL,
  `Nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_kategori_produk`
--

INSERT INTO `master_kategori_produk` (`ID_Kategori`, `Jenis_kategori`, `Nama_kategori`) VALUES
('Kat1', 'A', 'Alat'),
('Kat2', 'B', 'Bahan'),
('Kat3', 'H', 'Hasil');

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori_t`
--

CREATE TABLE `master_kategori_t` (
  `ID_Kategori` int(100) NOT NULL,
  `ID_Ref` int(50) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `pengantar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_kategori_t`
--

INSERT INTO `master_kategori_t` (`ID_Kategori`, `ID_Ref`, `nama_kategori`, `gambar`, `pengantar`) VALUES
(2, 2, 'Brokoli', './images/2383559bf5c2755704.jpg', 'Pengetahuin cara menanam Brokoli'),
(3, 1, 'Jeruk', './images/3117759c7c83fcc8a1.jpg', 'Pembelajaran seputar jeruk'),
(4, 3, ' Kayu jati', './images/2967959c7c9f007dd9.jpg', 'Pembelajaran  mengelola jati'),
(5, 1, 'Anggur', './images/1780659c7ca6f745a6.jpg', 'Pembelajaran seputar anggur'),
(6, 1, 'Buah naga', './images/452759c7cd95d443f.jpg', 'Pembelajaran seputar buah naga'),
(7, 1, 'Melon', './images/249259c7cddae8f8f.jpg', 'Pembelajaran seputar melon'),
(8, 1, 'Apel', './images/292959c7d0725e027.jpg', 'Pembelajaran seputar apel\r\n'),
(9, 1, 'Klengkeng', './images/3208659c7d0fb4f8d3.jpg', 'Pembelajaran seputar klengkeng\r\n'),
(10, 2, 'Bayam', './images/779859d4e068da64d.jpg', 'Pembelajaran seputar bayam');

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori_topik`
--

CREATE TABLE `master_kategori_topik` (
  `ID_kategori_topik` varchar(10) NOT NULL,
  `Judul_kategori_topik` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_kategori_topik`
--

INSERT INTO `master_kategori_topik` (`ID_kategori_topik`, `Judul_kategori_topik`) VALUES
('21c3ab2cf3', 'Adakah Pakbun Disini Yang Pernah Berkebun Jati ?'),
('5ef82a0851', 'Cara Menanam Mentimun Yang Baik Dan Benar'),
('6c316a7cf2', 'Uji Coba Aplikasi'),
('8a18c68f2f', 'Cara Menanam Pakcoy/pak Choi Yang Baik Dan Benar'),
('c1ca133853', '[ASK] Pengiriman Tanaman / Bonsai Ke Luar Negeri'),
('cf7bf6195b', 'mengendalikan hama padi dengan bio urine manusia'),
('d62272b90c', 'kucai');

-- --------------------------------------------------------

--
-- Table structure for table `master_kel_tani`
--

CREATE TABLE `master_kel_tani` (
  `ID_Kelompok_Tani` varchar(10) NOT NULL,
  `Nama_Kelompok_Tani` varchar(50) NOT NULL,
  `Alamat_Sekretariat` varchar(50) DEFAULT NULL,
  `Kabupaten` varchar(50) DEFAULT NULL,
  `Kecamatan` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(50) DEFAULT NULL,
  `Desa_Kelurahan` varchar(50) DEFAULT NULL,
  `Deskripsi` varchar(200) DEFAULT NULL,
  `Foto1` varchar(200) DEFAULT NULL,
  `Foto2` varchar(200) DEFAULT NULL,
  `Legalitas` varchar(100) DEFAULT NULL,
  `Bukti_Legalitas` varchar(200) DEFAULT NULL,
  `Kontak_Person` varchar(50) DEFAULT NULL,
  `Nomor_Telpon` varchar(15) DEFAULT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Tgl_Terbentuk` date DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_kel_tani`
--

INSERT INTO `master_kel_tani` (`ID_Kelompok_Tani`, `Nama_Kelompok_Tani`, `Alamat_Sekretariat`, `Kabupaten`, `Kecamatan`, `Provinsi`, `Desa_Kelurahan`, `Deskripsi`, `Foto1`, `Foto2`, `Legalitas`, `Bukti_Legalitas`, `Kontak_Person`, `Nomor_Telpon`, `ID_User`, `Tgl_Terbentuk`, `Email`) VALUES
('kelompok_a', 'Uchiha Tani', 'alamat', 'Bantul', 'kasihan', 'Daerah Istimewa Yogyakarta', 'Bangunjiwo', 'desc', 'kelompok_a.jpg', 'kelompok_a.jpg', '123', 'kelompok_a.jpg', 'argi', '0238492834', '1234567', '2019-01-01', 'argo@gmail.com'),
('kelompok_b', 'Kelompok Baru', 'alamat', 'Bantul', 'kasihan', 'Daerah Istimewa Yogyakarta', 'Bangunjiwo', 'deskripsi', 'kelompok b.jpg', 'kelompok b.png', 'legal', 'kelompok b.jpg', 'arg', '08123', '1234567', '2018-01-01', 'askdasd@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `master_kode_biaya`
--

CREATE TABLE `master_kode_biaya` (
  `ID_Biaya` varchar(10) NOT NULL,
  `ID_Spesies` varchar(10) NOT NULL,
  `Uraian_Biaya` varchar(100) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `harga_satuan` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_materi_ajar`
--

CREATE TABLE `master_materi_ajar` (
  `ID_Materi_Ajar` varchar(10) NOT NULL,
  `Nama_materi` varchar(100) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `deskripsi_materi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_materi_pelatihan`
--

CREATE TABLE `master_materi_pelatihan` (
  `ID_Materi` varchar(10) NOT NULL,
  `Nama_Materi` varchar(50) NOT NULL,
  `Deskripsi_Materi` varchar(200) DEFAULT NULL,
  `Materi_Sebelumnya` varchar(10) DEFAULT NULL,
  `Kebutuhan_Spesifikasi` varchar(200) DEFAULT NULL,
  `Level` varchar(20) DEFAULT NULL,
  `Jumlah_Jam` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_morf_tanaman`
--

CREATE TABLE `master_morf_tanaman` (
  `ID_Morfologi` varchar(10) NOT NULL,
  `Nama_Morfologi_Tanaman` varchar(50) DEFAULT NULL,
  `Nama_Divisi` varchar(10) DEFAULT NULL,
  `Nama_Sub_Divisi` varchar(10) DEFAULT NULL,
  `Nama_Ordo` varchar(10) DEFAULT NULL,
  `Nama_Famili` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_morf_tanaman`
--

INSERT INTO `master_morf_tanaman` (`ID_Morfologi`, `Nama_Morfologi_Tanaman`, `Nama_Divisi`, `Nama_Sub_Divisi`, `Nama_Ordo`, `Nama_Famili`) VALUES
('M12', 'aa', 'aaa', 'aaa', 'Aa', 'aaa'),
('morf1', 'Morfologi Padi', 'Magnolioph', 'Oryza', 'Poales', 'Poaceae'),
('morf10', 'Morfologi Bawang Merah', 'Magnolioph', 'Liliopsida', 'Asparagale', 'Amaryllida'),
('morf11', 'Morfologi Bawang Putih', 'Magnolioph', 'Liliopsida', 'Asparagale', 'Alliaceae'),
('morf2', 'Morfologi Jagung', 'Angiosperm', 'zea', 'Poales', 'Poaceae'),
('morf3', 'Morfologi Gandum', 'Magnoliop', 'Liliopsida', 'Poales', 'Poaceae'),
('morf4', 'Morfologi Bayam', 'Magnolioph', 'Magnoliops', 'Caryophyll', 'Amaranthac'),
('morf5', 'Morfologi Kentang', 'Magnolioph', 'Magnoliops', 'Solanales', 'Solanaceae'),
('morf6', 'Morfologi Kedelai', 'Magnoliops', 'Faboideae', 'Fabales', 'Fabaceae'),
('morf7', 'Morfologi Ketela', 'Magnolioph', 'Crotonoide', 'Malpighial', 'Euphorbiac'),
('morf8', 'Morfologi Salak', 'Angiosperm', 'Monocots', 'Arecales', 'Arecaceae'),
('morf9', 'Morfologi Cabai Rawit', 'Angiosperm', 'Eudikotil', 'Solanales', 'Solanaceae');

-- --------------------------------------------------------

--
-- Table structure for table `master_org_unit`
--

CREATE TABLE `master_org_unit` (
  `Org_Unit` varchar(10) NOT NULL,
  `Nama_Organisasi` varchar(100) NOT NULL,
  `Tingkatan` varchar(30) NOT NULL,
  `Org_Unit_Atasan` varchar(10) NOT NULL,
  `Pelayanan` tinyint(1) DEFAULT NULL,
  `Pendaftaran_Anggota` tinyint(1) DEFAULT NULL,
  `Pelatihan` tinyint(1) DEFAULT NULL,
  `Konsultasi` tinyint(1) DEFAULT NULL,
  `Penawaran` tinyint(1) DEFAULT NULL,
  `Permintaan` tinyint(1) DEFAULT NULL,
  `Memberi_Informasi` tinyint(1) DEFAULT NULL,
  `Meminta_Informasi` tinyint(1) DEFAULT NULL,
  `Berbagi_Informasi` tinyint(1) DEFAULT NULL,
  `Data_Spesifik_Anggota` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_org_unit`
--

INSERT INTO `master_org_unit` (`Org_Unit`, `Nama_Organisasi`, `Tingkatan`, `Org_Unit_Atasan`, `Pelayanan`, `Pendaftaran_Anggota`, `Pelatihan`, `Konsultasi`, `Penawaran`, `Permintaan`, `Memberi_Informasi`, `Meminta_Informasi`, `Berbagi_Informasi`, `Data_Spesifik_Anggota`) VALUES
('1', 'Super Admin', '5', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
('545e97834c', 'Unit Lama', '5', '1', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
('a96f313ccb', 'Pelayanan', '1', '1', 1, 0, 0, 0, 0, 0, 1, 1, 1, 1),
('d2d4bc2280', 'Pengelola Petani', '5', '545e97834c', 0, 1, 0, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_pelayanan`
--

CREATE TABLE `master_pelayanan` (
  `ID_Pelayanan` varchar(10) NOT NULL,
  `Nama_Pelayanan` varchar(50) NOT NULL,
  `Deskripsi_Pelayanan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_petani`
--

CREATE TABLE `master_petani` (
  `ID_User` varchar(10) NOT NULL,
  `Nama_Petani` varchar(50) NOT NULL,
  `Alamat_Petani` varchar(50) DEFAULT NULL,
  `Kabupaten` varchar(50) DEFAULT NULL,
  `Kecamatan` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(50) DEFAULT NULL,
  `Desa_Kelurahan` varchar(50) DEFAULT NULL,
  `nama_istri` varchar(50) NOT NULL,
  `jml_tng_kerja_musiman` int(2) NOT NULL,
  `jml_lahan` int(3) NOT NULL,
  `Foto` varchar(200) DEFAULT NULL,
  `Nomor_Telpon` varchar(15) DEFAULT NULL,
  `Pendidikan_Terakhir` varchar(4) DEFAULT NULL,
  `Jumlah_Tanggungan` int(2) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Agama` varchar(10) NOT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Deskripsi_Keahlian` varchar(200) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `jns_kelamin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_petani`
--

INSERT INTO `master_petani` (`ID_User`, `Nama_Petani`, `Alamat_Petani`, `Kabupaten`, `Kecamatan`, `Provinsi`, `Desa_Kelurahan`, `nama_istri`, `jml_tng_kerja_musiman`, `jml_lahan`, `Foto`, `Nomor_Telpon`, `Pendidikan_Terakhir`, `Jumlah_Tanggungan`, `Email`, `Agama`, `Tanggal_Lahir`, `Deskripsi_Keahlian`, `Status`, `jns_kelamin`) VALUES
('1234567', 'Argo wibowo', 'alamat', 'Bantul', 'kasihan', 'Daerah Istimewa Yogyakarta', 'Bangunjiwo', '', 0, 5, '1234567.jpg', '088234763248', 'SD', 2, 'asd@gmail.com', 'Islam', '2014-01-01', 'deskripsi', 1, 0),
('71130122', '', '', '', '', '', '', '', 0, 0, '', '', NULL, 23424, '', '', '0000-00-00', '', 1, 0),
('ambarnur', 'ambar nur kustinari', 'Kenekan PB 1 153 Yogyakarta', 'kota Yogyakarta', 'Gondomanan', 'Daerah Istimewa Yogyakarta', 'Prawirodirjan', '', 0, 0, '5a3e5ead4cd3f2842a43c8350026a62c.jpg', '', NULL, 2, '', 'katolik', '2017-03-10', '', 1, 1),
('bala', 'Budiman', 'aaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaa', 'aaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaa', '', 0, 0, NULL, '08145854', 'SD', NULL, NULL, '', '2017-09-20', 'Mencontek', 0, 0),
('bolo', 'Brimada', 'aaaaaaaa', 'aaaaaaaaa', 'aaaaaaaaa', 'aaaaaaaaaa', 'aaaaaa', '', 0, 0, NULL, '081455887', 'SD', NULL, NULL, '', '2017-09-14', 'Mencuri', 0, 0),
('intsatu', 'int 1', 'iny1', 'Gunungkidul', 'Ngawen', 'Daerah Istimewa Yogyakarta', 'Beji', '', 0, 0, 'maxresdefault.jpg', '089671044525', NULL, 2, 'int1@yahoo.com', 'Kristen', '2013-02-12', 'gak ada', 1, 1),
('ptn_test', 'Petani Test', 'Gilangharjo', 'Bantul', 'Pandak', 'Daerah Istimewa Yogyakarta', 'Gilangharjo', 'Test', 2, 3, NULL, NULL, 'SD', 3, NULL, 'Islam', '2019-03-03', 'Mencangkul', 1, 0),
('uji_coba1', 'Dennis Markus', '', 'Bantul', 'Banguntapan', 'Daerah Istimewa Yogyakarta', 'Singosaren', '', 0, 0, 'maxresdefault.jpg', '', NULL, 0, '', '', '0000-00-00', '', 1, 1),
('us1', 'Administrator tanaman', 'jl.kaliurang', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '08888888888', 's2', 0, 'admintanaman@gmail.com', 'Kristen', '1986-02-12', 'tidak ada', 0, 0),
('us10', 'Riyantiningsih', 'Dadapan', 'Sleman', 'Turi', 'Daerah Istimewa Yogyakarta', 'Wonokerto', '', 0, 0, NULL, '087738512353', 'SMA', 3, 'riyanti@yahoo.com', 'Katolik', '1975-06-17', 'menanam salak', 1, 0),
('us11', 'Siti Fatimah', 'Kebokuning', 'Bantul', 'Dlingo', 'Daerah Istimewa Yogyakarta', 'Terong', '', 0, 0, NULL, '08175420109', 'SMP', 0, 'siti.fatimah@yahoo.com', 'Islam', '1980-09-24', 'menananm padi', 1, 0),
('us12', 'Sarbini', 'Kebokuning', 'Bantul', 'Dlingo', 'Daerah Istimewa Yogyakarta', 'Terong', '', 0, 0, NULL, '000000', 'SMA', 0, 'belumada', 'Islam', '1969-03-16', 'menanam padi,jagung', 1, 0),
('us13', 'Yunaliyati', 'sendang', 'Kulon Progo', 'Pengasih', 'Daerah Istimewa Yogyakarta', 'Karang Sari', '', 0, 0, NULL, '0000000', 'SMA', 5, 'yunaliyati@yahoo.com', 'Katolik', '1976-08-09', 'Menanam Bawang Merah', 1, 0),
('us14', 'Utamiyem', 'Sendang', 'Kulon Progo', 'Pengasih', 'Daerah Istimewa Yogyakarta', 'Karang Sari', '', 0, 0, NULL, '000000', 'SMP', 0, 'tidak ada', 'Islam', '1970-11-11', 'tidak memiliki keahlian', 0, 0),
('us15', 'Kastopah', 'Sendang', 'Kulon Progo', 'Pengasih', 'Daerah Istimewa Yogyakarta', 'Karang Sari', '', 0, 0, NULL, '0000000', 'SD', 5, 'tidak ada', 'Islam', '1977-02-14', 'tidak memiliki keahlian', 0, 0),
('us2', 'Galih', 'jl damai', 'Sleman', 'Pakem', 'Daerah Istimewa Yogyakarta', 'Hargobingangun', '', 0, 0, NULL, '32432424324', 'S1', 2, 'malvin@gmail.com', 'Kristen', '1994-12-12', 'tidak adad', 1, 0),
('us3', 'Malvin', 'Kebokuning', 'Bantul', 'Dlingo', 'Daerah Istimewa Yogyakarta', 'Terong', '', 0, 0, NULL, '0000000', 'S1', 0, 'malvin@gmail.com', 'ateis', '1994-09-19', 'menanam padi, jagung', 1, 0),
('us4', 'Roehmad', 'Jalan Panggang Utama', 'Kulon Progo', 'Temon', 'Daerah Istimewa Yogyakarta', 'Sindulan', '', 0, 0, NULL, '081228953212', 'SMP', 0, 'RoehmadSuparto@yahoo.ocm', 'Islam', '1956-02-07', 'Mennanam padi,jagung, cabai', 1, 0),
('us5', 'Ngatilah', 'Jalan Panggang', 'Gunungkidul', 'Panggang', 'Daerah Istimewa Yogyakarta', 'Girimulyo', '', 0, 0, NULL, '082324612253', 'SMA', 0, 'ngatila@gmail.com', 'Islam', '1956-06-06', 'Menanamm Padi', 1, 0),
('us6', 'Pajiyanti', 'Jalan Siluk, Panggang', 'Gunungkidul', 'Panggang', 'Daerah Istimewa Yogyakarta', 'Girimulyo', '', 0, 0, NULL, '0000000', 'SD', 10, 'belumada@belumada.com', 'Islam', '1960-01-13', 'menanam padi', 1, 0),
('us7', 'Nisa Subekti', 'jl Siluk Panggang', 'Gunungkidul', 'Panggang', 'Daerah Istimewa Yogyakarta', 'Girimulyo', '', 0, 0, NULL, '087739773682', 'SD', 5, 'nisa@yahoo.com', 'Kristen', '1988-03-03', 'Menanam padi, Jagung, kacang, ketela', 1, 0),
('us8', 'Siti Yuningsih', 'Kopen Becici', 'Sleman', 'Turi', 'Daerah Istimewa Yogyakarta', 'Wonokerto', '', 0, 0, NULL, '085701145454', 'SMA', 0, 'yuningsih.siti@gmail.com', 'Islam', '1969-02-05', 'Menanam Salak', 1, 0),
('us9', 'Ida Krisharia', 'Imorejo', 'Sleman', 'Turi', 'Daerah Istimewa Yogyakarta', 'Wonokerto', '', 0, 0, NULL, '0000', 'SMA', 0, 'belumada@belumada.com', 'Katolik', '1972-12-23', 'tidak ada', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_peta_lahan`
--

CREATE TABLE `master_peta_lahan` (
  `ID_Lahan` int(11) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
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
  `status_lahan` enum('milik','sewa','garap') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_peta_lahan`
--

INSERT INTO `master_peta_lahan` (`ID_Lahan`, `ID_User`, `nama_lahan`, `Koordinat_X`, `Koordinat_Y`, `luas_lahan`, `jenis_lahan`, `Desa`, `Kecamatan`, `Kabupaten`, `Provinsi`, `status_organik`, `status_lahan`) VALUES
(1, 'ptn_test', 'lahan1', '-7.9310236', '110.3011639', 500, 'sawah', 'Gilangharjo', 'Pandak', 'Bantul', 'Daerah Istimewa Yogyakarta', 'organik', 'milik'),
(2, '1234567', 'lahan2', '-7.928363082196162', '110.29961786496813', 0, 'sawah', 'Donoharjo', 'Ngaglik', 'Sleman', 'Daerah Istimewa Yogyakarta', 'organik', 'milik'),
(3, '1234567', 'testing', '-7.927683721783466', '110.30019780631858', 300, 'sawah', 'Gilangharjo', 'Pandak', 'Bantul', 'Daerah Istimewa Yogyakarta', 'organik', 'milik'),
(4, '1234567', 'coba', '-7.92849131978409', '110.29981156822043', 21321, 'tegalan', 'Tirtonirmolo', 'kasihan', 'Bantul', 'Daerah Istimewa Yogyakarta', 'organik', 'milik'),
(5, 'ptn_test', 'test2', '-7.9307708224716515', '110.29598027692714', 5000, 'sawah', 'Minomartani', 'Ngaglik', 'Sleman', 'Daerah Istimewa Yogyakarta', 'organik', 'milik');

-- --------------------------------------------------------

--
-- Table structure for table `master_peta_lahan_detail`
--

CREATE TABLE `master_peta_lahan_detail` (
  `id_detail` int(11) NOT NULL,
  `id_lahan` int(11) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `longt` varchar(20) NOT NULL,
  `indeks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_peta_lahan_detail`
--

INSERT INTO `master_peta_lahan_detail` (`id_detail`, `id_lahan`, `lat`, `longt`, `indeks`) VALUES
(1, 1, '-8', '110', 1),
(2, 1, '-8.05', '109.98', 2),
(3, 1, '-8.1', '109.90', 3),
(4, 1, '-7.999930941239678', '109.9997367663309', 4),
(5, 2, '-7.928484678360535', '110.29984203643903', 1),
(6, 2, '-7.928317314428722', '110.29931728739098', 2),
(7, 2, '-7.928261526436312', '110.2993400861676', 3),
(8, 2, '-7.928326612426706', '110.29984970588043', 5),
(9, 3, '-7.927626605417482', '110.29994127817201', 1),
(10, 3, '-7.927832489955332', '110.30064363974827', 2),
(11, 3, '-7.9277421664288275', '110.30065570968884', 3),
(12, 3, '-7.92761863569137', '110.29995028871792', 5);

-- --------------------------------------------------------

--
-- Table structure for table `master_peta_lahan_foto`
--

CREATE TABLE `master_peta_lahan_foto` (
  `id_foto` int(11) NOT NULL,
  `ID_Lahan` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_peta_lahan_foto`
--

INSERT INTO `master_peta_lahan_foto` (`id_foto`, `ID_Lahan`, `foto`) VALUES
(1, 1, 'test.png'),
(2, 4, '1234567-coba.png'),
(3, 1, 'test.png'),
(4, 1, 'test.png'),
(5, 1, '1-1.png'),
(6, 1, '1-1.png'),
(7, 1, '1-1.png'),
(8, 1, '1-1.png'),
(9, 1, 'admin_ptn-1.png'),
(10, 1, 'admin_ptn-1.png'),
(11, 1, 'admin_ptn-1-Untitled.png');

-- --------------------------------------------------------

--
-- Table structure for table `master_peta_lahan_tanaman`
--

CREATE TABLE `master_peta_lahan_tanaman` (
  `id_detail_tanaman` int(11) NOT NULL,
  `ID_Lahan` int(11) NOT NULL,
  `ID_Spesies` varchar(10) NOT NULL,
  `kebutuhan_benih` int(11) NOT NULL,
  `kebutuhan_saprotan` int(11) NOT NULL,
  `bulan_tanam` varchar(2) NOT NULL,
  `bulan_akhir` varchar(2) NOT NULL,
  `rata_hasil_panen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_peta_lahan_tanaman`
--

INSERT INTO `master_peta_lahan_tanaman` (`id_detail_tanaman`, `ID_Lahan`, `ID_Spesies`, `kebutuhan_benih`, `kebutuhan_saprotan`, `bulan_tanam`, `bulan_akhir`, `rata_hasil_panen`) VALUES
(1, 1, 'spt1', 30, 30, '12', '03', 1200),
(2, 1, 'spt1', 20, 30, '12', '04', 2000),
(3, 3, 'spt1', 20, 30, '12', '03', 2000),
(4, 4, 'spt1', 20, 20, '12', '04', 1900),
(5, 5, 'spt1', 5, 50, '01', '04', 20),
(6, 5, 'spt1', 4, 30, '07', '10', 400);

-- --------------------------------------------------------

--
-- Table structure for table `master_produk_tani`
--

CREATE TABLE `master_produk_tani` (
  `ID_Produk` varchar(10) NOT NULL,
  `Nama_Produk` varchar(200) NOT NULL,
  `ID_Spesies` varchar(10) NOT NULL,
  `Deskripsi_Produk` varchar(200) DEFAULT NULL,
  `Satuan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_produk_tani`
--

INSERT INTO `master_produk_tani` (`ID_Produk`, `Nama_Produk`, `ID_Spesies`, `Deskripsi_Produk`, `Satuan`) VALUES
('pro1', 'Gabah langsung', 'spt1', 'Gabah  dengan batang', 'kuintal'),
('pro10', 'Biji Kedelai', 'spt6', 'biji kedelai', 'kuintal'),
('pro11', 'Ketela', 'spt7', 'Ketela', 'kuintal'),
('pro12', 'Buah Salak', 'spt8', 'Buah salak', 'kuintal'),
('pro13', 'Cabai rawit', 'spt9', 'Cabai rawit', 'kuintal'),
('pro14', 'Bawang Merah', 'spt10', 'Bawang Merah', 'kuintal'),
('pro15', 'Bawang Putih', 'spt11', 'Bawang Putih', 'kuintal'),
('pro2', 'Beras', 'spt1', 'Beras sudah giling', 'kuintal'),
('pro3', 'Jagung utuh', 'spt2', 'Utuh dengan kulit', 'kuintal'),
('pro4', 'Jagung Kupas', 'spt2', 'Tanpa kulit', 'kuintal'),
('pro5', 'Jagung biji', 'spt2', 'Jagung bijian', 'kuintal'),
('pro6', 'biji Gandum', 'spt3', 'Biji Gandum', 'kuintal'),
('pro7', 'Gandum Bubuk', 'spt3', 'Gandum bubuk', 'kuintal'),
('pro8', 'Bayam', 'spt4', 'Daun bayam', 'kuintal'),
('pro9', 'kentang', 'spt5', 'Kentang', 'kuintal');

-- --------------------------------------------------------

--
-- Table structure for table `master_produk_tani_commerce`
--

CREATE TABLE `master_produk_tani_commerce` (
  `ID_Produk` varchar(10) NOT NULL,
  `ID` varchar(10) NOT NULL,
  `ID_Kategori` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_produk_tani_commerce`
--

INSERT INTO `master_produk_tani_commerce` (`ID_Produk`, `ID`, `ID_Kategori`) VALUES
('PRO0001', 'HAS0001', 'Kat3'),
('PRO0002', 'ALA0001', 'Kat1'),
('PRO0003', 'BAH0001', 'Kat2'),
('PRO0004', 'HAS0002', 'Kat3'),
('PRO0005', 'ALA0002', 'Kat1'),
('PRO0006', 'BAH0002', 'Kat2'),
('PRO0007', 'HAS0003', 'Kat3'),
('PRO0008', 'ALA0003', 'Kat1'),
('PRO0009', 'BAH0003', 'Kat2'),
('PRO0010', 'HAS0004', 'Kat3'),
('PRO0011', 'HAS0005', 'Kat3');

-- --------------------------------------------------------

--
-- Table structure for table `master_spesies_tanaman`
--

CREATE TABLE `master_spesies_tanaman` (
  `ID_Spesies` varchar(10) NOT NULL,
  `Jenis_Tanaman` varchar(20) DEFAULT NULL,
  `Nama_Tanaman` varchar(50) NOT NULL,
  `Nama_Latin` varchar(50) DEFAULT NULL,
  `Habitat` varchar(50) DEFAULT NULL,
  `Masa_Tanam` int(4) DEFAULT NULL,
  `Akar` varchar(200) DEFAULT NULL,
  `Batang` varchar(200) DEFAULT NULL,
  `Daun` varchar(200) DEFAULT NULL,
  `Buah` varchar(200) DEFAULT NULL,
  `Biji` varchar(200) DEFAULT NULL,
  `Perkembangbiakan` varchar(200) DEFAULT NULL,
  `Foto1` varchar(200) DEFAULT NULL,
  `Foto2` varchar(200) DEFAULT NULL,
  `Iklim` varchar(50) DEFAULT NULL,
  `Jenis_Tanah` varchar(20) DEFAULT NULL,
  `Kelembaban` varchar(20) DEFAULT NULL,
  `ID_Morfologi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_spesies_tanaman`
--

INSERT INTO `master_spesies_tanaman` (`ID_Spesies`, `Jenis_Tanaman`, `Nama_Tanaman`, `Nama_Latin`, `Habitat`, `Masa_Tanam`, `Akar`, `Batang`, `Daun`, `Buah`, `Biji`, `Perkembangbiakan`, `Foto1`, `Foto2`, `Iklim`, `Jenis_Tanah`, `Kelembaban`, `ID_Morfologi`) VALUES
('spt1', 'Persawahan', 'Padi ', 'Oryza sativa', 'Sawah', 100, 'Akar, redikula,  serabut,tajuk dan akar rambut', 'berbatang rumput', 'Susunan daun berselang seling', 'lemma dan palea', 'lemma dan palea', 'Ditanam pada area yang memiliki banyak air,dl', 'spt1.jpg', 'spt1.jpg', 'Tropis', 'Tanah Basah', 'Tinggi', 'morf1'),
('spt10', 'Persawahan', 'Bawang Merah', 'Allium cepa', 'Daerah beriklim kering', 70, 'Perakaran pada bawang merah ini memiliki perakaran yang dangkal dan juga bercabang memencar, dengan kedalam mencapai 15-30 cm didalam tanah serta tumbuh di sekitar umbi bawang merah.', 'Batang bawang merah memiliki batang sejati disebut diskus, yang memiliki bentuk hampir menyerupai cakram, tipis dan juga pendek sebagai tempat melekatnya akar dan juga mata tunas', 'Daun bawang merah memiliki bentuk silindris kecil memanjang yang mencapai sekitar 50-70 cm, memiliki lubang dibagian tengah dan pangkal daun runcing', 'Buah bawang merah berbentuk  ulat dengan pangkal ujung tumpul yang terbungkus dengan biji berjumlah 2-3 butir, selain itu biji ini memiliki bentuk agak pipih berwarna bening dan juga agak keputihan.', 'Buah bawang merah berbentuk  ulat dengan pangkal ujung tumpul yang terbungkus dengan biji berjumlah 2-3 butir, selain itu biji ini memiliki bentuk agak pipih berwarna bening dan juga agak keputihan.', 'Reproduksi bawang putih sama dengan bawang merah yaitu melalui umbi lapis. Siung bawang putih ditanam dan mereka akan individu yang baru namun memiliki genetik yang sama dengan induknya', 'spt10.jpg', 'spt10.jpg', 'Tropis - subtropis', 'Tanah kering', '80-90%', 'morf10'),
('spt11', 'Perkebunan', 'Bawang Putih', 'Allium sativum', 'Daerah beriklim kering', 70, 'Perakaran pada bawang putih ini memiliki perakaran yang dangkal dan juga bercabang memencar, dengan kedalam mencapai 15-30 cm didalam tanah serta tumbuh di sekitar umbi bawang merah.', 'Batang bawang putihmemiliki batang sejati disebut diskus, yang memiliki bentuk hampir menyerupai cakram, tipis dan juga pendek sebagai tempat melekatnya akar dan juga mata tunas', 'Daun bawang putih memiliki bentuk silindris kecil memanjang yang mencapai sekitar 50-70 cm, memiliki lubang dibagian tengah dan pangkal daun runcing', 'Buah bawang putih berbentuk ulat dengan pangkal ujung tumpul yang terbungkus dengan biji berjumlah 2-3 butir, selain itu biji ini memiliki bentuk agak pipih berwarna bening dan juga agak keputihan.', ' Buah bawang putihberbentuk ulat dengan pangkal ujung tumpul yang terbungkus dengan biji berjumlah 2-3 butir, selain itu biji ini memiliki bentuk agak pipih berwarna bening dan juga agak keputihan.', 'Reproduksi bawang putih sama dengan bawang putih yaitu melalui umbi lapis. Siung bawang putih ditanam dan mereka akan individu yang baru namun memiliki genetik yang sama dengan induknya', 'spt11.jpg', 'spt11.jpg', 'Tropis - subtropis', 'Tanah kering', '80-90%', 'morf11'),
('spt12', 'Perkebunan', 'anggrek', 'anggresia', '-', 4, 'tunggang', 'kecil', 'ga punya', 'banyak', 'kecil', 'di kebun dicubit', 'spt12.jpg', 'spt12.jpg', 'Tropis', 'Tanah kering', 'tinggi', 'morf3'),
('spt2', 'Perkebunan', 'Jagung', 'Zea mays ssp. mays', 'Lahan kering', 60, 'Akar seminal, Adventif, Kait/penyangga', 'Batang tak bercabang', 'Daun tegak atau erect dan Daun menggantung atau pendant', 'Buah tongkol', 'kernel ', 'Pada saat penanaman tanah harus cukup lembab tetapi tidak becek. Jarak tanaman harus diusahakan teratur agar ruang tumbuh tanaman seragam dan pemeliharaan tanaman mudah. Beberapa varietas mempunyai po', 'spt2.jpg', 'spt2.jpg', 'Tropis dan sub tropis ', 'Tanah kering', 'Sedang', 'morf2'),
('spt3', 'Perkebunan', 'Gandum', 'T. aestivum (hard wheat)', 'dataran tinggi', 80, 'Serabut', 'Beruas dan berongga', 'daun tegak, dan menggantung', 'berbentuk oval dankeras', 'berbentuk oval dankeras', 'Tanah untuk menanam gandum harus gembur, oleh karena itu kita harus membajak tanah terlebih dahulu dengan menggunakan cangkul, kerbau, maupun traktor. Pembajakan tanah ini sebaiknya dilakukan minimal', 'spt3.jpg', 'spt3.jpg', 'Sub Tropis', 'Tanah kering', 'Tinggi, 80 hingga 90', 'morf3'),
('spt4', 'Persawahan', 'Bayam', 'Amaranthus', 'Liar', 15, 'Akar Tunggang', 'Tanaman bayam memiliki batang tumbuh dengan tegak, tebal dan banyak mengandung air. Batang pada tanaman ini memiliki panjang hingga 0.5-1 meter dan memiliki cabang monodial. Batang bayam berwarna keco', 'Tanaman ini memiliki daun tunggal, berwarna hijau muda dan tua, berbentuk bulat memanjang serta oval. Panjang daun pada bayam 1,5-6,0 cm bahkan lebih, dengan lebar 0,5 â€“ 3,2 cm dan memiliki pangkal ', 'Tidak ada buah', 'Tanaman bayam memiliki biji berukuran kecil, dan halus, memiliki bentuk bulat serta memiliki warna kecoklatan hingga kehitaman. Namun, ada beberapa jenis bayam yang terdapat biji berwarna putih dan me', 'Tanaman bayam menghendaki tanah yang gembur dan subur. Jenis tanah yang sesuai untuk anaman bayam adalah yang penting kandungan haranya terpenuhi.', 'spt4.jpg', 'spt4.jpeg', 'Sub tropis', 'Tanah kering', '40-60%', 'morf4'),
('spt5', 'Perkebunan', 'Kentang', 'Solanum tuberosum', 'curah hujan rata-rata antara 500-750 mm', 135, 'Akat Tunggang', 'Tegak, menyebar, menjalar', 'Daun  berseling, bertangkai, majemuk menyirip gasal', 'Buah kentang berwarna hijau tua sampai keunguan, berbentuk bulat, bergaristengah Â± 2,5 cm dan berongga.Buah kentang mengandung 500 bakal biji akan tetapi yang dapat berkembang hanya berkisar antara 1', 'Buah kentang berwarna hijau tua sampai keunguan, berbentuk bulat, bergaristengah Â± 2,5 cm dan berongga.Buah kentang mengandung 500 bakal biji akan tetapi yang dapat berkembang hanya berkisar antara 1', 'Perkembangbiakan vegetatif alami adalah perkembangbiakan secara tidak kawin pada tumbuhan yang terjadi dengan sendirinya tanpa bantuan manusia. Macam-macam perkembangbiakan vegetatif alami, antara lai', 'spt5.jpeg', 'spt5.jpg', 'dataran tinggi', 'Tanah kering', '80%-90%', 'morf5'),
('spt6', 'Persawahan', 'Kedelai', 'Glycine soja', 'sawah atau lahan kering', 75, 'Tanaman kedelai mempunyai akar tunggang yang membentuk akar-akar cabang yang tumbuh menyamping (horizontal)', 'Kedelai berbatang memiliki tinggi 30â€“100 cm. Batang dapat membentuk 3 â€“ 6 cabang, tetapi bila jarak antar tanaman rapat, cabang menjadi berkurang, atau tidak bercabang sama sekali.', 'Pada buku (nodus) pertama tanaman yang tumbuh dari biji terbentuk sepasang daun tunggal', 'Buah kedelai berbentuk polong, setiap tanaman mampu menghasilkan 100 â€“ 250 polong.', 'Buah kedelai berbentuk polong, setiap tanaman mampu menghasilkan 100 â€“ 250 polong.', 'Kedelai dapat ditanam dilahan bekas tanaman padi maupun dilahan tegalan/ lahan kering.', 'spt6.jpg', 'spt6.jpg', 'Sub Tropis', 'Tanah kering', ' lebih dari 80%', 'morf6'),
('spt7', 'Perkebunan', 'Ketela Pohon', 'Manihot utilissima', 'dapat tumbuh dimana saja dan kondisi apapun', 120, 'Akar pada Tanaman Ubi Kayu merupakan akar tunggang dan termasuk tumbuhan dikotil. Dalam Akar inilah Tanaman Ubi Kayu menyimpan cadangan makanan, dan juga yang akan membesar hingga membentuk  umbinya U', 'Batang pada Tanaman Ubi Kayu berbentuk bulat, panjangg, berkayu, berbuku â€“ buku dan tumbuh memanjang.', 'Daun pada Tanaman Ubi Kayu termasuk daun tunggal (folium simplek) yang bertulang daun (nervatio/ veneratio) berbentuk menjari (palminervis)', 'Buah pada Tanaman Ubi Kayu disebut sebagai Umbi. Umbi pada Tanaman Ubi Kayu ini terbentuk dari akar yang berubah bentuk dan fungsinya sebagai tempat penyimpanan makanan cadangan. ', 'Tidak ada', ' perkembangan biaknya secara vegetatif/tidak kawin.', 'spt7.jpg', 'spt7.jpg', 'Tropis', 'Tanah kering', '60-65%', 'morf7'),
('spt8', 'Perkebunan', 'Salak', 'Salacca zalacca', 'Tanah dengan keasaman (pH)  4,5 - 7,5.', 120, 'Akar serabut yang sebaran akarnya tidak luas,  akar mudah rusak bila kekurangan air', 'Pada bagian batang ini memiliki duri dalam jumlah yang banyak, hampir di seluruh permukaan batang tersebut terdapat durinya', 'Batang pohon yang melengkung ini memiliki bentuk daun sebagai pelepah', 'Buah salak yang terdapat pada Tanaman ini berada di tengah-tengah batang berduri', 'Biji salak terdapat pada buahnya', 'Tanaman ssalak sesuai bila ditanam di daerah berzona iklim Aa bcd, Babc dan Cbc. A berarti jumlah bulan basah tinggi (11-12 bulan/tahun), B: 8-10 bulan/tahun dan C : 5-7 bulan/tahun. Curah hujan rata-', 'spt8.jpg', 'spt8.jpg', 'Tropis', 'Tanah kering', 'Kelembaban Tinggi', 'morf8'),
('spt9', 'Persawahan', 'Cabai Rawit', 'Capsicum Frutescens', 'Curah hujan 1500-2500 mm/th', 80, 'Perakaran cabai rawit terdiri atas akar tunggang ', 'Batang tanaman cabai rawit memiliki struktur yang keras dan berkayu, berwarna hijau gelap, berbentuk bulat, halus dan bercabang banyak. ', 'Daun berbentuk bulat telur dengan ujung runcing dan tepi daun rata (tidak bergerigi/berlekuk) ukuran daun lebih kecil dibandingkan dengan daun tanaman cabai besar.', 'Buah cabai rawit dapat berbentuk bulat pendek dengan ujung runcing/berbentuk kerucut', 'Biji cabai rawit berwarna putih kekuningan-kuningan, berbentuk bulat pipih, tersusun berkelompok (bergerombol) dan saling melekat pada empulur', 'Cabe dapat tumbuh di dataran rendah sampai ketinggian 200 m di atas permukaan laut.  Tetapi bila udara sangat dingin sampai embun membeku (frost) mungkin tanaman akan mati', 'spt9.jpg', 'spt9.jpg', 'Tropis', 'Tanah kering', 'Kelembaban Rendah te', 'morf9'),
('T2', 'Persawahan', 'T2', 'latin', 'h1', 1, 't', 't', 't', 't', 't', 't', 'T2.png', 'T2.png', 'u', 'Tanah kering', 'j', 'M12'),
('t3', 'Persawahan', 'u', 'u', 'u', 8, '8', '8', '8', '8', '8', '8', 't3.jpg', 't3.jpg', '7', 'Tanah kering', '7', 'M12'),
('TES1', 'Perkebunan', 'TES', 'T1', 'ALAM', 1, 'AKAR', 'BATANG', 'DAUN', 'BUAH', 'BIJI', 'KEMBANG', 'TES1.png', 'TES1.png', 'IKLIM', 'Tanah kering', 'LEMBAB', 'M12');

-- --------------------------------------------------------

--
-- Table structure for table `master_supplier`
--

CREATE TABLE `master_supplier` (
  `ID_User` varchar(10) NOT NULL,
  `Nama_Supplier` varchar(200) NOT NULL,
  `ID_Jenis_Sup` varchar(10) NOT NULL,
  `Alamat_Supplier` varchar(200) DEFAULT NULL,
  `Desa` varchar(50) DEFAULT NULL,
  `Kecamatan` varchar(50) DEFAULT NULL,
  `Kabupaten` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(50) DEFAULT NULL,
  `Kontak_Person` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `No_Handphone` varchar(15) DEFAULT NULL,
  `No_Telpon` varchar(15) DEFAULT NULL,
  `Foto` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jns_kelamin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_supplier`
--

INSERT INTO `master_supplier` (`ID_User`, `Nama_Supplier`, `ID_Jenis_Sup`, `Alamat_Supplier`, `Desa`, `Kecamatan`, `Kabupaten`, `Provinsi`, `Kontak_Person`, `Email`, `No_Handphone`, `No_Telpon`, `Foto`, `tanggal_lahir`, `jns_kelamin`) VALUES
('71130122', '', '2', '', '', '', '', '', '', '', '', '', '', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_ternak`
--

CREATE TABLE `master_ternak` (
  `nomor_ternak` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `jenis_ternak` enum('kambing','sapi','kerbau','kuda','ayam','kelinci','bebek') NOT NULL,
  `keterangan_ternak` varchar(200) NOT NULL,
  `status_kepemilikan` enum('milik_sendiri','gaduh') NOT NULL,
  `jumlah` int(3) NOT NULL,
  `cara_pemeliharaan` enum('komunal','sendiri') NOT NULL,
  `sumber_pakan` enum('beli','tanam','cari') NOT NULL,
  `pengelolaan_kotoran` enum('dikomposkan','biogas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_ternak`
--

INSERT INTO `master_ternak` (`nomor_ternak`, `ID_User`, `jenis_ternak`, `keterangan_ternak`, `status_kepemilikan`, `jumlah`, `cara_pemeliharaan`, `sumber_pakan`, `pengelolaan_kotoran`) VALUES
('00001', '1234567', 'sapi', '', 'milik_sendiri', 5, 'komunal', 'tanam', 'dikomposkan');

-- --------------------------------------------------------

--
-- Table structure for table `master_user`
--

CREATE TABLE `master_user` (
  `ID_User` varchar(10) NOT NULL,
  `Password` varchar(70) NOT NULL,
  `PIN` int(6) NOT NULL,
  `Tingkat_Priv` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_user`
--

INSERT INTO `master_user` (`ID_User`, `Password`, `PIN`, `Tingkat_Priv`) VALUES
('1234567', 'f865b53623b121fd34ee5426c792e5c33af8c227', 123456, '0'),
('71130120', '71130120', 123456, '1'),
('71130121', 'fcea920f7412b5da7be0cf42b8c93759', 123456, '0'),
('71130122', '1ff464f17d137405fee2de369ed815016c191a65', 711300, '0'),
('71130123', '1234567', 711300, '0'),
('741916', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, ''),
('adminpjl', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, '1'),
('adminpmb', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, '1'),
('admin_ptn', 'f865b53623b121fd34ee5426c792e5c33af8c227', 123456, '1'),
('admin_sia', 'f865b53623b121fd34ee5426c792e5c33af8c227', 123456, '1'),
('ambarnur', 'b17491b6235ac54e3cf5b933bcea46dbb2a9d98c', 123456, '1'),
('bala', 'fcea920f7412b5da7be0cf42b8c93759', 123456, '0'),
('bolo', 'fcea920f7412b5da7be0cf42b8c93759', 123456, '0'),
('dmarkus', '0ddf626282043d4ee9dc6aa57f6eee94fd8a31a1', 123456, '0'),
('fassatu', '533619b83b1caea72dfe18d24b545202aae49de9', 123456, '1'),
('frmaya', '92492f384642f5322a0a639ecdaa96782674e194', 123456, '1'),
('intsatu', '4a4105c949c8fb95757c3ced5e1f811498f76dd7', 123456, '1'),
('mayafraya', '143ad9c15d88354aba49ab5123fe785bc1bb0db2', 123456, '0'),
('pembeli', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, '2'),
('penjual', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, '0'),
('ptn_test', 'f865b53623b121fd34ee5426c792e5c33af8c227', 123456, '0'),
('superadmin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, '1'),
('tesjanuari', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, '2'),
('uji_coba', '0c760bcd51cc46b768e3539e76cd9bcd22462b11', 123456, '1'),
('uji_coba1', '4c8e61873819e65058e67a400b84cce9cb67120f', 123456, '1'),
('us1', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, 'p'),
('us10', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us11', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us12', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us13', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us14', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us15', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us2', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us3', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us4', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us5', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us6', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us7', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us8', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('us9', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 123, '1'),
('userbiasas', '7c4a8d09ca3762af61e59520943dc26494f8941b', 123456, '1');

-- --------------------------------------------------------

--
-- Table structure for table `master_user_kat`
--

CREATE TABLE `master_user_kat` (
  `nomor` int(3) NOT NULL,
  `ID_Kategori` char(3) NOT NULL,
  `ID_User` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_user_kat`
--

INSERT INTO `master_user_kat` (`nomor`, `ID_Kategori`, `ID_User`) VALUES
(1, 'FAS', '71130121'),
(2, 'UBS', '71130123'),
(3, 'PET', '1234567'),
(4, 'PMT', '71130122'),
(5, 'FAS', '71130122'),
(6, 'PET', '71130122'),
(7, 'Mba', '71130122'),
(8, 'ADT', '71130122'),
(9, '760', 'mayafraya'),
(10, '760', 'frmaya'),
(11, 'FAS', 'dmarkus'),
(12, 'PET', 'ambarnur'),
(13, 'FAS', 'fassatu'),
(14, 'PET', 'uji_coba'),
(15, 'PET', 'uji_coba1'),
(16, 'PET', 'intsatu'),
(17, 'ADT', 'us1'),
(18, 'ADK', 'us10'),
(19, 'PET', 'us11'),
(20, 'PET', 'us12'),
(21, 'PET', 'us13'),
(22, 'PET', 'us14'),
(23, 'PET', 'us15'),
(24, 'ADT', 'us2'),
(25, 'ADP', 'us3'),
(26, 'PET', 'us4'),
(27, 'PET', 'us5'),
(28, 'PET', 'us6'),
(29, 'PET', 'us7'),
(30, 'PET', 'us8'),
(31, 'PET', 'us9'),
(32, 'ADT', 'superadmin'),
(33, 'UBS', 'userbiasas'),
(34, 'PMB', 'adminpmb'),
(35, 'PJL', 'adminpjl'),
(36, 'PJL', 'penjual'),
(37, 'PMB', 'pembeli'),
(38, 'PMB', 'tesjanuari'),
(39, 'PJL', '741916'),
(40, 'ADP', 'admin_ptn'),
(41, 'ADT', 'admin_sia'),
(42, 'PET', 'ptn_test');

-- --------------------------------------------------------

--
-- Table structure for table `master_user_org`
--

CREATE TABLE `master_user_org` (
  `NIK` varchar(10) NOT NULL,
  `kelola_website` tinyint(1) NOT NULL,
  `kelola_user` tinyint(1) NOT NULL,
  `Kelola_forum` tinyint(1) NOT NULL,
  `Password` varchar(70) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Nama_Karyawan` varchar(100) NOT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Alamat_Rumah` varchar(100) DEFAULT NULL,
  `No_Telpon` varchar(15) DEFAULT NULL,
  `Org_Unit` varchar(10) NOT NULL,
  `Jenis_Kelamin` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_user_org`
--

INSERT INTO `master_user_org` (`NIK`, `kelola_website`, `kelola_user`, `Kelola_forum`, `Password`, `Email`, `Nama_Karyawan`, `Tanggal_Lahir`, `Alamat_Rumah`, `No_Telpon`, `Org_Unit`, `Jenis_Kelamin`) VALUES
('3308161109', 1, 1, 1, '7c4a8d09ca3762af61e59520943dc26494f8941b', 'superadmin@gmail.com', 'Super Admin', '2018-03-01', 'Rumah Admin', '0857261123123', '1', 'L'),
('505', 1, 1, 1, '3ead28f890ec0f5b363587e15d61e0b4dca2ee6d', 'duta@yahoo.com', 'Uji', '2017-03-15', 'Dutawacana', '000', '545e97834c', 'L'),
('71130', 0, 1, 0, 'bf848135da46920f94a182a4fa50890119035c3f', 'oktadennis0910@gmail.com', 'Dennis Markus', '2017-03-14', 'Klitren', '089671044525', '545e97834c', 'L'),
('71130094', 1, 1, 1, '1ff464f17d137405fee2de369ed815016c191a65', 'a@yahoo.com', 'Fransiska Maya', '2016-11-15', 'a', 'a', 'a96f313ccb', 'P'),
('admin', 1, 1, 1, 'fcea920f7412b5da7be0cf42b8c93759', 'dennis.markus@ti.ukdw.ac.id', 'Dennis Markus', '2016-11-14', 'Gak punya dui', '0896710744525', '1', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `mengikuti`
--

CREATE TABLE `mengikuti` (
  `ID_Topic` varchar(100) NOT NULL,
  `ID_User` varchar(100) NOT NULL,
  `tgl_mengikuti` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mengikuti`
--

INSERT INTO `mengikuti` (`ID_Topic`, `ID_User`, `tgl_mengikuti`) VALUES
('1', '1234567', '2017-09-19'),
('1', '1234567', '2017-09-08'),
('2', '1234567', '2017-09-30'),
('1', 'bolo', '2017-09-15'),
('2', 'bolo', '2017-09-29'),
('2', 'bolo', '2017-09-19'),
('1', 'bala', '2017-09-03'),
('1', 'bala', '2017-09-09'),
('6', '1234567', '2017-10-03'),
('7', '1234567', '2017-10-04'),
('7', '1234567', '2017-10-04'),
('7', '1234567', '2017-10-04'),
('7', '1234567', '2017-10-04'),
('6', '1234567', '2017-10-04'),
('2', 'bolo', '2017-10-05'),
('2', 'bolo', '2017-10-05'),
('2', '1234567', '2017-10-05'),
('2', '1234567', '2017-10-05'),
('2', '1234567', '2017-10-05'),
('2', '1234567', '2017-10-05'),
('2', 'bolo', '2017-10-05'),
('2', '1234567', '2017-10-05'),
('2', '1234567', '2017-10-05'),
('2', 'admin', '2017-10-06'),
('2', 'admin', '2017-10-06'),
('2', 'admin', '2017-10-06'),
('2', 'admin', '2017-10-06'),
('6', '71130123', '2017-10-06'),
('2', 'admin', '2017-10-08'),
('2', 'admin', '2017-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Isi` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id`, `link`, `ID_User`, `Isi`, `status`, `tanggal`) VALUES
(1, 'forum/komentar/d62272b90c', 'ambarnur', 'Ada yang mengomentari diskusi anda', 0, '0000-00-00'),
(2, 'forum/komentar/6c316a7cf2', '71130122', 'Ada yang mengomentari diskusi anda', 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pesan` text NOT NULL,
  `tanggal_jam` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `nama`, `email`, `pesan`, `tanggal_jam`, `status`) VALUES
(1, 'Dennis Markus', 'dennis.markus@ti.ukdw.ac.id', 'Tidak ada menapilkan tentang kami', '2017-03-14 21:22:14', 0),
(2, 'Dennis Markus', 'dennis.markus@yahoo.com', 'sudah bagus kok webnya', '2017-03-15 22:29:30', 0),
(3, 'Dennis', 'dennis.markus@ti.ukdw.ac.id', 'Pesan uji coba', '2017-03-24 10:59:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `Nama_Provinsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`Nama_Provinsi`) VALUES
('Daerah Istimewa Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `ta`
--

CREATE TABLE `ta` (
  `id` int(11) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon` varchar(225) NOT NULL,
  `is_top` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ta`
--

INSERT INTO `ta` (`id`, `position`, `parent_id`, `menu_id`, `title`, `link`, `icon`, `is_top`) VALUES
(1, 1, 0, 1, 'Beranda', 'http://localhost/dutatani/', 'glyphicon glyphicon-home', 0),
(2, 2, 0, 1, 'Tentang Kami\n', 'http://localhost/dutatani/about', 'glyphicon glyphicon-info-sign', 0),
(3, 3, 0, 1, 'Forum Diskusi', 'http://localhost/dutatani/forum', 'glyphicon glyphicon-question-sign\r\n', 0),
(4, 4, 0, 1, 'Info Pertanian', '', 'glyphicon glyphicon-tree-conifer\r\n', 0),
(5, 5, 0, 1, 'Sistem Pertanian', '', 'glyphicon glyphicon-tree-conifer', 0),
(7, 6, 4, 1, 'Tanaman', 'http://dutaninusantara.com/lib/coba', 'glyphicon glyphicon-tree-deciduous', 0),
(8, 7, 4, 1, 'Lahan', '', 'glyphicon glyphicon-th-large', 0),
(9, 3, 0, 1, 'Informasi', 'youtube.com', 'glyphicon glyphicon-info-sign', 1),
(13, 8, 5, 0, 'Sistem Informasi Pertanian', 'http://localhost/dutatani/si_petani/login.php', 'glyphicon glyphicon-certificate', 0),
(16, 9, 5, 0, 'Sistem Informasi Aktivitas', 'http://localhost/dutatani/si_aktivitas/login.php', 'glyphicon glyphicon-certificate', 0),
(21, 10, 9, 0, 'SEM', 'sembilan', 'glyphicon glyphicon-camera\r\n', 1),
(22, 11, 8, 1, 'ANAK', 'asd', 'glyphicon glyphicon-plus-sign\r\n', 0),
(29, 9, 8, 1, 'MANTAB', '123', 'glyphicon glyphicon-off\r\n', 0),
(35, 3, 21, 0, 'TAMBAH', 'link', 'glyphicon glyphicon-asterisk\r\n', 1),
(36, 31, 0, 0, 'KIRI', 'as', 'glyphicon glyphicon-cd\r\n', 0),
(37, 7, 0, 0, 'ATAS', '123', 'glyphicon glyphicon-piggy-bank\r\n', 1),
(38, 8, 0, 0, 'About us', '123', 'glyphicon glyphicon-file\r\n', 1),
(39, 9, 5, 0, 'E-commerce Pertanian', '123', 'glyphicon glyphicon-usd\r\n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `ID_Topic` int(100) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Judul` varchar(50) NOT NULL,
  `Isi` text NOT NULL,
  `Gambar` varchar(255) NOT NULL,
  `Pengantar` text NOT NULL,
  `Tgl_Update` date NOT NULL,
  `Admin` varchar(30) DEFAULT NULL,
  `Tgl_Verify` date NOT NULL,
  `ID_Kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`ID_Topic`, `ID_User`, `Judul`, `Isi`, `Gambar`, `Pengantar`, `Tgl_Update`, `Admin`, `Tgl_Verify`, `ID_Kategori`) VALUES
(1, 'bolo', 'Memilih bibit Brokoli', 'Semangka yang renyah kaya air punya manfaat kesehatan. Agar dapat terserap optimal, semangka tak boleh dikonsumsi malam hari. Ini alasannya.\r\n\r\nSemangka yang berwarna merah mengandung tinggi kandungan lycopene. Dalam 100 gram, semangka punya kandungan energi sebesar 30 Kkal sehingga sangat cocok dijadikan sebagai buah untuk menunjang penurunan berat badan. \r\n\r\nDr. Shilpa Arora mengatakan bahwa semangka terdiri dari 94 persen air, lycopene, kalium dan beberapa nutrisi lain. Semangka juga mengandung serat yang dapat melancarkan sistem pencernaan. \r\n\r\nAkan tetapi konsumsi semangka di malam hari sebelum tidur tidak dianjurkan. \"Saya tidak merekomendasikan konsumsi semangka atau buah-buahan lain setelah jam 7 malam. Semangka mengandung sedikit asam yang jika dikonsumsi pada malam hari, dapat menunda proses pencernaan ketika tubuh sedang tidak aktif,\" jelas Arora dalam NDTV (17/04).\r\n\r\nIa menganjurkan agar semangka dikonsumsi siang hari sekitar pukul 12 sampai jam 1 siang karena pencernaan sedang aktif. \r\n\r\nProses pencernaan di malam hari lebih lambat. Sehingga dianjurkan untuk menghindari gula dan makanan asam. Mengonsumsi semangka sebelum tidur juga dapat mengganggu tidur karena Anda akan sering buang air kecil', './images/2454959cb45a78f601.jpg', 'Pembelajaran seputar semangka', '2017-09-27', 'Diterima', '2017-10-04', '2'),
(2, 'bolo', 'Memilih benih jeruk', 'Menanam jeruk bali di halaman rumah agarberbuah lebat – sama hal nya pada umumnya jeruk bali merupakan salah satu jenis jeruk yang sangat di sukai oleh kalanga masarakat, jenis jeruk bali merupkan jeruk yang tergolong super besar, jeruk bali sendiri ukuran matangnya bisa seukuran kelapa besar.Tidak terlalu susah memang menanam jeruk bali bila kita memiliki ilmunya tetapi bila kita tidak tau ilmu dasar dalam penanaman buah jeruk bali kita bisa kesulitan dalam hal ini, jeruk bali bisa di tanam di mana saja mau di kebun ataupu di halaman rumah keduanya sama-sama bagus, tetapi untuk kali ini kita akan membahsa tentan metode cara penanaman jeruk di halam rumah yang baik dan benar.Sebaiknya dalam proses penanaman jeruk di halaman rumah jangan terlalu dekat dengan rumah hal ini di lakukan untuk mengatisipasai ketika jeruk sudah mulai besar ranting yang berserakan di khawatirkan akan mengganggu dan yang paling beriso pertumbuhan jeruk yang semakin lama semakin membesar sewaktu – waktu akan tumbang akibat terpaa angin yang berbahaya bila hal ini sampai terjadi di dekat rumah oleh sebab itu sebaiknya dlama penanman jeruk setidaknya jaraknya 7-10 meter dari rumah.', './images/2342859cb642cd742a.jpg', 'Sebelum menanam alangkah baiknya jika kita memilih benih yang unggul', '2017-09-27', 'Diterima', '2017-10-04', '3'),
(6, '1234567', 'Menanam jeruk', 'Menanam jeruk bali di halaman rumah agarberbuah lebat – sama hal nya pada umumnya jeruk bali merupakan salah satu jenis jeruk yang sangat di sukai oleh kalanga masarakat, jenis jeruk bali merupkan jeruk yang tergolong super besar, jeruk bali sendiri ukuran matangnya bisa seukuran kelapa besar.   Tidak terlalu susah memang menanam jeruk bali bila kita memiliki ilmunya tetapi bila kita tidak tau ilmu dasar dalam penanaman buah jeruk bali kita bisa kesulitan dalam hal ini, jeruk bali bisa di tanam di mana saja mau di kebun ataupu di halaman rumah keduanya sama-sama bagus, tetapi untuk kali ini kita akan membahsa tentan metode cara penanaman jeruk di halam rumah yang baik dan benar.  Sebaiknya dalam proses penanaman jeruk di halaman rumah jangan terlalu dekat dengan rumah hal ini di lakukan untuk mengatisipasai ketika jeruk sudah mulai besar ranting yang berserakan di khawatirkan akan mengganggu dan yang paling beriso pertumbuhan jeruk yang semakin lama semakin membesar sewaktu – waktu akan tumbang akibat terpaa angin yang berbahaya bila hal ini sampai terjadi di dekat rumah oleh sebab itu sebaiknya dlama penanman jeruk setidaknya jaraknya 7-10 meter dari rumah.', './images/2772859d1d3442220a.jpg', 'Menama, jeruk yang baik memiliki beberapa step', '2017-10-02', 'Diterima', '2017-10-04', '3'),
(7, 'admin', 'Merawat selama pertumbuhan', 'Jeruk atau limau adalah semua tumbuhan berbunga anggota marga Citrus dari suku Rutaceae (suku jeruk-jerukan). Anggotanya berbentuk pohon dengan buah yang berdaging dengan rasa masam yang segar, meskipun banyak di antara anggotanya yang memiliki rasa manis. Rasa masam berasal dari kandungan asam sitrat yang memang menjadi terkandung pada semua anggotanya.Sebutan \"jeruk\" kadang-kadang juga disematkan pada beberapa anggota marga lain yang masih berkerabat dalam suku yang sama, seperti kingkit. Dalam bahasa sehari-hari, penyebutan \"jeruk\" atau \"limau\" (di Sumatra dan Malaysia) seringkali berarti \"jeruk keprok\" atau \"jeruk manis\". Di Jawa, \"limau\" (atau \"limo\") berarti \"jeruk nipis\".Jeruk sangatlah beragam dan beberapa spesies dapat saling bersilangan dan menghasilkan hibrida antarspesies (\'interspecific hybrid) yang memiliki karakter yang khas, yang berbeda dari spesies tetuanya. Keanekaragaman ini seringkali menyulitkan klasifikasi, penamaan dan pengenalan terhadap anggota-anggotanya, karena orang baru dapat melihat perbedaan setelah bunga atau buahnya muncul. Akibatnya tidak diketahui dengan jelas berapa banyak jenisnya. Penelitian-penelitian terakhir menunjukkan adalah keterkaitan kuat Citrus dengan genus Fortunella (kumkuat), Poncirus, serta Microcitrus dan Eremocitrus, sehingga ada kemungkinan dilakukan penggabungan. Citrus sendiri memiliki dua anakmarga (subgenus), yaitu Citrus dan Papeda.Asal jeruk adalah dari Asia Timur dan Asia Tenggara, membentuk sebuah busur yang membentang dari Jepang terus ke selatan hingga kemudian membelok ke barat ke arah India bagian timur. Jeruk manis dan sitrun (lemon) berasal dari Asia Timur, sedangkan jeruk bali, jeruk nipis dan jeruk purut berasal dari Asia Tenggara.Banyak anggota jeruk yang dimanfaatkan oleh manusia sebagai bahan pangan, wewangian, maupun industri. Buah jeruk adalah sumber vitamin C dan wewangian/parfum penting. Daunnya juga digunakan sebagai rempah-rempah.', './images/2872859d4e63892a6e.jpg', 'Selama pertumbuhan di perlukan perawatan yang tepat', '2017-10-04', 'Diterima', '2017-10-04', '3'),
(8, 'admin', 'Memupuk jeruk', 'aaaaaaaaaaaaaaaaaaa', './images/667059d58e4381f67.jpg', 'Memaaaaaa', '2017-10-05', NULL, '0000-00-00', '3');

-- --------------------------------------------------------

--
-- Table structure for table `trans_aktivitas_pertanian`
--

CREATE TABLE `trans_aktivitas_pertanian` (
  `ID_aktifitas_petani` varchar(36) NOT NULL,
  `ID_aktifitas_spesies` varchar(10) NOT NULL,
  `ID_Petani` varchar(10) NOT NULL,
  `Tanggal_Mulai` date DEFAULT NULL,
  `Tanggal_Selesai` date DEFAULT NULL,
  `Tahun_Aktivitas` int(4) DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_aktivitas_pertanian`
--

INSERT INTO `trans_aktivitas_pertanian` (`ID_aktifitas_petani`, `ID_aktifitas_spesies`, `ID_Petani`, `Tanggal_Mulai`, `Tanggal_Selesai`, `Tahun_Aktivitas`, `deskripsi`) VALUES
('akt1spt101us132010', 'akt1spt101', 'us13', '2016-01-01', '2016-01-03', 2016, 'Persiapan lahan'),
('akt1spt11us102015', 'akt1spt11', 'us10', '2016-01-01', '2016-03-05', 2015, 'Persiapan sawah'),
('akt1spt11us112016', 'akt1spt11', 'us11', '2016-01-03', '2016-01-05', 2016, 'Persiapan lahan sawah'),
('akt1spt11us122016', 'akt1spt11', 'us12', '2016-03-01', '2016-03-02', 2016, 'Persiapan Lahan tani'),
('akt1spt11us152016', 'akt1spt11', 'us15', '2016-03-01', '2016-03-03', 2016, 'Bajak sawah pengairan'),
('akt1spt11us22016', 'akt1spt11', 'us2', '2016-10-01', '2016-10-05', 2016, 'Persiapan lahan tani sawah'),
('akt1spt11us32016', 'akt1spt11', 'us3', '2017-01-01', '2017-01-05', 2016, 'Tanam'),
('akt1spt11us52016', 'akt1spt11', 'us5', '2016-03-01', '2016-03-02', 2016, 'Bajak sawah'),
('akt1spt11us62016', 'akt1spt11', 'us6', '2016-03-01', '2106-03-02', 2016, 'bajak sawah dan pengairan'),
('akt1spt11us82016', 'akt1spt11', 'us8', '2016-03-06', '2016-03-07', 2016, 'Persiapan lahan'),
('akt1spt21us142016', 'akt1spt21', 'us14', '2016-06-07', '2016-06-08', 2016, 'Pesiapan lahan'),
('akt1spt21us22016', 'akt1spt21', 'us2', '2017-02-02', '2017-02-05', 2016, 'jagung'),
('akt1spt21us32016', 'akt1spt21', 'us3', '2016-10-01', '2016-10-03', 2016, 'Persiapan'),
('akt1spt51us22016', 'akt1spt51', 'us2', '2017-02-07', '2017-02-08', 2016, 'deskrip'),
('akt1spt71us152016', 'akt1spt71', 'us15', '2016-03-01', '2016-03-01', 2016, 'Persiapan Lahan ketela'),
('akt1spt81us92016', 'akt1spt81', 'us9', '2016-01-05', '2016-03-10', 2016, 'Penggarapan lahan kebun salak'),
('akt1spt91us42016', 'akt1spt91', 'us4', '2016-03-01', '2016-03-05', 2016, 'Persiapan lahan'),
('akt2spt101us132016', 'akt2spt101', 'us13', '2016-02-04', '2016-02-04', 2016, 'Penanaman bibit'),
('akt2spt12us102016', 'akt2spt12', 'us10', '2016-01-08', '2016-01-09', 2016, 'Penanaman bibit'),
('akt2spt12us112016', 'akt2spt12', 'us11', '2016-01-04', '2016-01-04', 2016, 'Penanaman bibit'),
('akt2spt12us122016', 'akt2spt12', 'us12', '2016-03-04', '2016-03-05', 2016, 'Penanaman bibit padi'),
('akt2spt12us152016', 'akt2spt12', 'us15', '2016-03-04', '2016-03-04', 2016, 'menanam'),
('akt2spt12us22016', 'akt2spt12', 'us2', '2016-10-06', '2016-10-09', 2016, 'Tanam bibit'),
('akt2spt12us22017', 'akt2spt12', 'us2', '2017-03-16', '2017-03-16', 2017, 'coba'),
('akt2spt12us52016', 'akt2spt12', 'us5', '2016-01-03', '2016-03-03', 2016, 'Menamam benih padi'),
('akt2spt12us62016', 'akt2spt12', 'us6', '2016-03-03', '2016-03-03', 2016, 'Penanaman bibit'),
('akt2spt12us82016', 'akt2spt12', 'us8', '2016-03-08', '2016-03-08', 2016, 'Penanaman bibit'),
('akt2spt21us142016', 'akt2spt21', 'us14', '2016-07-13', '2016-07-13', 2016, 'penanaman bibit'),
('akt2spt21us32016', 'akt2spt21', 'us3', '2017-02-01', '2017-02-04', 2016, 'tanam jagung'),
('akt2spt71us152016', 'akt2spt71', 'us15', '2016-03-02', '2016-03-02', 2016, 'Penamanan batang ketela'),
('akt2spt81us92016', 'akt2spt81', 'us9', '2016-01-11', '2016-01-14', 2016, 'Penanaman bibit salak'),
('akt2spt91us42016', 'akt2spt91', 'us4', '2016-03-05', '2016-03-05', 2016, 'Penananman bibit cabe'),
('akt3spt101us132016', 'akt3spt101', 'us13', '2016-03-03', '2016-03-03', 2016, 'Pemupukan'),
('akt3spt13us102016', 'akt3spt13', 'us10', '2016-02-25', '2016-01-31', 2016, 'Pemupukan padi'),
('akt3spt13us112016', 'akt3spt13', 'us11', '2016-02-02', '2016-02-02', 2016, 'Pemupukan'),
('akt3spt13us122016', 'akt3spt13', 'us12', '2016-03-15', '2016-03-16', 2016, 'Pemupukan padi'),
('akt3spt13us152016', 'akt3spt13', 'us15', '2016-03-31', '2016-03-31', 2016, 'pemupukan'),
('akt3spt13us22016', 'akt3spt13', 'us2', '2016-10-19', '2016-10-30', 2016, 'Masa pemupukan stiap 1 minggu sekali'),
('akt3spt13us52016', 'akt3spt13', 'us5', '2016-03-04', '2016-03-04', 2016, 'Memupuk'),
('akt3spt13us62016', 'akt3spt13', 'us6', '2016-03-30', '2016-03-30', 2016, 'memupuk'),
('akt3spt13us82016', 'akt3spt13', 'us8', '2016-04-01', '2016-03-01', 2016, 'Pemupukan'),
('akt3spt23us142016', 'akt3spt23', 'us14', '2016-07-14', '2016-07-14', 2016, 'Pemupukan'),
('akt3spt23us32016', 'akt3spt23', 'us3', '2016-10-04', '2016-10-09', 2016, 'Pemupukan tanaman'),
('akt3spt71us152016', 'akt3spt71', 'us15', '2016-03-04', '2016-03-05', 2016, 'Memupuk '),
('akt3spt81us92016', 'akt3spt81', 'us9', '2016-01-20', '2016-03-21', 2016, 'pemupukan'),
('akt3spt91us42016', 'akt3spt91', 'us4', '2016-03-16', '2016-03-17', 2016, 'Pemupukan'),
('akt4spt101us132016', 'akt4spt101', 'us13', '2016-04-14', '2016-04-14', 2016, 'panen bawang merah periode 1'),
('akt4spt14us102016', 'akt4spt14', 'us10', '2016-04-02', '2016-04-03', 2016, 'Panen padi periode 1'),
('akt4spt14us112016', 'akt4spt14', 'us11', '2016-04-01', '2016-04-02', 2016, 'Panen periode 1'),
('akt4spt14us122016', 'akt4spt14', 'us12', '2016-06-30', '2016-07-01', 2016, 'Panen periode 1'),
('akt4spt14us152016', 'akt4spt14', 'us15', '2017-07-26', '2017-03-27', 2016, 'Panen'),
('akt4spt14us22016', 'akt4spt14', 'us2', '2016-10-30', '2016-10-31', 2016, 'Panen Hasil'),
('akt4spt14us52016', 'akt4spt14', 'us5', '2016-06-15', '2016-06-15', 2016, 'Panen'),
('akt4spt14us62016', 'akt4spt14', 'us6', '2017-06-15', '2017-06-06', 2016, 'Panen padi'),
('akt4spt14us82016', 'akt4spt14', 'us8', '2016-07-13', '2016-03-13', 2016, 'Panen periode 1'),
('akt4spt24us142016', 'akt4spt24', 'us14', '2016-08-08', '2016-08-08', 2016, 'Panen jagung'),
('akt4spt24us32016', 'akt4spt24', 'us3', '2016-10-30', '2016-10-31', 2016, 'Masa Panen'),
('akt4spt71us152016', 'akt4spt71', 'us15', '2016-04-03', '2016-04-04', 2016, 'Panen '),
('akt4spt81us92016', 'akt4spt81', 'us9', '2016-05-19', '2106-05-20', 2016, 'Panen buah salak'),
('akt4spt91us42016', 'akt4spt91', 'us4', '2015-06-22', '2016-06-22', 2016, 'panen cabai');

-- --------------------------------------------------------

--
-- Table structure for table `trans_anggaraan`
--

CREATE TABLE `trans_anggaraan` (
  `ID_anggaran` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `ID_Aktifitas` varchar(10) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `periode_tanam` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_ang_petani`
--

CREATE TABLE `trans_ang_petani` (
  `ID_Kelompok_Tani` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Tgl_Gabung` date DEFAULT NULL,
  `Tgl_Expired` date DEFAULT NULL,
  `Keterangan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_ang_petani`
--

INSERT INTO `trans_ang_petani` (`ID_Kelompok_Tani`, `ID_User`, `Tgl_Gabung`, `Tgl_Expired`, `Keterangan`) VALUES
('kelompok_a', 'ptn_test', '2019-03-12', '2020-09-30', 'cek'),
('kelompok_b', '1234567', '2019-03-03', '2019-10-18', 'cek');

-- --------------------------------------------------------

--
-- Table structure for table `trans_bukti_pembayaran`
--

CREATE TABLE `trans_bukti_pembayaran` (
  `ID_Bukti` int(11) NOT NULL,
  `ID_Permintaan` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `Nama_Rekening` varchar(50) NOT NULL,
  `No_Rekening` int(16) NOT NULL,
  `Jumlah_Bayar` int(11) NOT NULL,
  `Bukti` varchar(225) NOT NULL,
  `Keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_bukti_pembayaran`
--

INSERT INTO `trans_bukti_pembayaran` (`ID_Bukti`, `ID_Permintaan`, `ID_User`, `Nama_Rekening`, `No_Rekening`, `Jumlah_Bayar`, `Bukti`, `Keterangan`) VALUES
(1, 'PER0001', '896260', 'Dodoalantani', 12345677, 1200000, '2017_10_23_05_10_23_tesnimoni produk.png', ' kakak');

-- --------------------------------------------------------

--
-- Table structure for table `trans_detail_anggaran`
--

CREATE TABLE `trans_detail_anggaran` (
  `ID_detail_anggaran` varchar(10) NOT NULL,
  `ID_anggaran` varchar(10) NOT NULL,
  `ID_biaya` varchar(10) NOT NULL,
  `jumlah_anggaran` int(12) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_harga_prod`
--

CREATE TABLE `trans_harga_prod` (
  `ID_Produk` varchar(10) NOT NULL,
  `Tanggal` date NOT NULL,
  `Harga` int(15) NOT NULL,
  `ID_User` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_harga_prod`
--

INSERT INTO `trans_harga_prod` (`ID_Produk`, `Tanggal`, `Harga`, `ID_User`) VALUES
('PRO0001', '2017-09-17', 155000, '012461'),
('PRO0002', '2017-09-17', 245000, '012461'),
('PRO0003', '2017-09-17', 14500, '012461'),
('PRO0004', '2017-09-17', 53000, '012461'),
('PRO0005', '2017-09-17', 550000, '012461'),
('PRO0006', '2017-09-17', 55000, '012461'),
('PRO0007', '2017-09-17', 85000, '896260'),
('PRO0008', '2017-09-17', 23000, '896260'),
('PRO0009', '2017-09-17', 60000, '896260'),
('PRO0010', '2017-09-27', 17000, '012461'),
('PRO0011', '2017-09-27', 135000, '896260');

-- --------------------------------------------------------

--
-- Table structure for table `trans_hasil_panen`
--

CREATE TABLE `trans_hasil_panen` (
  `ID_Petani` varchar(10) NOT NULL,
  `ID_Spesies` varchar(10) NOT NULL,
  `Bulan_Panen` varchar(2) DEFAULT NULL,
  `Tahun_Panen` varchar(4) NOT NULL,
  `Periode_Panen` varchar(2) NOT NULL,
  `Jumlah_Hasil_Panen` int(4) DEFAULT NULL,
  `ID_Produk` varchar(10) NOT NULL,
  `Luas_lahan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_hasil_panen`
--

INSERT INTO `trans_hasil_panen` (`ID_Petani`, `ID_Spesies`, `Bulan_Panen`, `Tahun_Panen`, `Periode_Panen`, `Jumlah_Hasil_Panen`, `ID_Produk`, `Luas_lahan`) VALUES
('us10', 'spt1', '5', '2010', '1', 10, 'pro2', 1000),
('us10', 'spt1', '5', '2011', '1', 12, 'pro2', 1000),
('us10', 'spt1', '5', '2012', '1', 13, 'pro1', 1000),
('us10', 'spt1', '6', '2013', '1', 10, 'pro2', 1000),
('us10', 'spt1', '7', '2014', '1', 13, 'pro1', 1000),
('us10', 'spt1', '1', '2015', '1', 9, 'pro2', 1000),
('us10', 'spt1', '4', '2016', '1', 10, 'pro1', 1000),
('us11', 'spt1', '8', '2010', '1', 19, 'pro2', 2000),
('us11', 'spt1', '6', '2011', '1', 21, 'pro1', 2000),
('us11', 'spt1', '6', '2012', '1', 12, 'pro2', 2000),
('us11', 'spt1', '6', '2013', '1', 17, 'pro1', 2000),
('us11', 'spt1', '7', '2014', '1', 16, 'pro1', 2000),
('us11', 'spt1', '1', '2015', '1', 9, 'pro2', 2000),
('us11', 'spt1', '4', '2016', '1', 20, 'pro1', 2000),
('us12', 'spt1', '6', '2010', '1', 10, 'pro1', 1500),
('us12', 'spt1', '6', '2011', '1', 8, 'pro2', 1500),
('us12', 'spt1', '8', '2012', '1', 10, 'pro2', 1500),
('us12', 'spt1', '7', '2013', '1', 8, 'pro1', 1500),
('us12', 'spt1', '7', '2014', '1', 1, 'pro2', 1500),
('us12', 'spt1', '6', '2015', '1', 10, 'pro1', 1500),
('us12', 'spt1', '7', '2016', '1', 15, 'pro2', 1500),
('us13', 'spt10', '4', '2010', '1', 8, 'pro14', 1500),
('us13', 'spt10', '5', '2011', '1', 9, 'pro14', 1500),
('us13', 'spt10', '7', '2012', '1', 10, 'pro14', 1500),
('us13', 'spt10', '6', '2013', '1', 1, 'pro14', 1500),
('us13', 'spt10', '4', '2014', '1', 10, 'pro14', 1500),
('us13', 'spt10', '8', '2015', '1', 4, 'pro14', 1500),
('us13', 'spt10', '4', '2016', '1', 15, 'pro14', 1500),
('us14', 'spt2', '7', '2010', '1', 10, 'pro3', 2000),
('us14', 'spt2', '8', '2011', '1', 9, 'pro3', 2000),
('us14', 'spt2', '5', '2012', '1', 12, 'pro3', 2000),
('us14', 'spt2', '6', '2013', '1', 9, 'pro3', 2000),
('us14', 'spt2', '4', '2014', '1', 11, 'pro3', 2000),
('us14', 'spt2', '2', '2015', '1', 8, 'pro3', 2000),
('us14', 'spt2', '8', '2016', '1', 20, 'pro3', 2000),
('us15', 'spt1', '7', '2016', '1', 10, 'pro1', 1000),
('us15', 'spt7', '4', '2010', '1', 10, 'pro11', 1000),
('us15', 'spt7', '3', '2011', '1', 9, 'pro11', 1000),
('us15', 'spt7', '5', '2012', '1', 7, 'pro11', 1000),
('us15', 'spt7', '4', '2013', '1', 10, 'pro11', 1000),
('us15', 'spt7', '3', '2014', '1', 8, 'pro11', 1000),
('us15', 'spt7', '4', '2015', '1', 7, 'pro11', 1000),
('us15', 'spt7', '4', '2016', '1', 20, 'pro11', 1000),
('us2', 'spt1', '5', '2016', '1', 10, 'pro1', 1000),
('us2', 'spt1', '7', '2016', '2', 20, 'pro1', 200),
('us2', 'spt1', '2', '2017', '2', 20, 'pro3', 3000),
('us2', 'spt1', '1', '2018', '4', 10, 'pro1', 1000),
('us2', 'spt1', '3', '2019', '2', 30, 'pro1', 3000),
('us3', 'spt1', '5', '2017', '2', 20, 'pro1', 4555),
('us3', 'spt1', '2', '2018', '2', 100, 'pro2', 4000),
('us3', 'spt2', '2', '2016', '1', 10, 'pro5', 1000),
('us4', 'spt9', '7', '2010', '1', 5, 'pro13', 1000),
('us4', 'spt9', '6', '2011', '1', 8, 'pro13', 1000),
('us4', 'spt9', '8', '2012', '1', 8, 'pro13', 1000),
('us4', 'spt9', '5', '2013', '1', 9, 'pro13', 1000),
('us4', 'spt9', '8', '2014', '1', 6, 'pro13', 1000),
('us4', 'spt9', '6', '2015', '1', 7, 'pro13', 1000),
('us4', 'spt9', '7', '2016', '1', 10, 'pro13', 1000),
('us5', 'spt1', '6', '2016', '1', 25, 'pro2', 2500),
('us6', 'spt1', '6', '2016', '1', 10, 'pro2', 1000),
('us8', 'spt1', '7', '2016', '1', 20, 'pro1', 1500),
('us9', 'spt8', '4', '2010', '1', 5, 'pro12', 2000),
('us9', 'spt8', '6', '2011', '1', 7, 'pro12', 2000),
('us9', 'spt8', '5', '2012', '1', 10, 'pro12', 2000),
('us9', 'spt8', '7', '2013', '1', 11, 'pro12', 2000),
('us9', 'spt8', '7', '2014', '1', 9, 'pro12', 2000),
('us9', 'spt8', '4', '2015', '1', 10, 'pro12', 2000),
('us9', 'spt8', '5', '2016', '1', 50, 'pro12', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `trans_kalender_tanam`
--

CREATE TABLE `trans_kalender_tanam` (
  `ID_Spesies` varchar(10) NOT NULL,
  `Nama_Kalender` varchar(50) NOT NULL,
  `Masa_Tanam` varchar(2) NOT NULL,
  `Kabupaten` varchar(50) NOT NULL,
  `Provinsi` varchar(50) NOT NULL,
  `Tanggal_Awal` date NOT NULL,
  `Tanggal_Akhir` date NOT NULL,
  `Pengolahan_Lahan_Awal` date NOT NULL,
  `Pengolahan_Lahan_Akhir` date NOT NULL,
  `Persiapan_Lahan_Awal` date NOT NULL,
  `Masa_Penanaman_Awal` date NOT NULL,
  `Masa_Pemupukan` date NOT NULL,
  `Masa_Panen` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_kalender_tanam`
--

INSERT INTO `trans_kalender_tanam` (`ID_Spesies`, `Nama_Kalender`, `Masa_Tanam`, `Kabupaten`, `Provinsi`, `Tanggal_Awal`, `Tanggal_Akhir`, `Pengolahan_Lahan_Awal`, `Pengolahan_Lahan_Akhir`, `Persiapan_Lahan_Awal`, `Masa_Penanaman_Awal`, `Masa_Pemupukan`, `Masa_Panen`) VALUES
('spt1', 'Kalender Tanam Padi Bantul DIY 2016', '90', 'Bantul', 'Daerah Istimewa Yogyakarta', '2016-10-01', '2017-01-31', '2016-10-11', '2016-10-30', '2016-10-01', '2016-11-27', '2016-11-28', '2017-01-31'),
('spt1', 'Kalender Tanam Padi Kulon Progo DIY 2016', '90', 'Kulon Progo', 'Daerah Istimewa Yogyakarta', '2016-10-01', '2016-12-01', '2016-10-10', '2016-10-16', '2016-10-01', '2016-10-20', '2016-10-21', '2016-12-01'),
('spt1', 'Kalender Tanam Padi Gunungkidul  DIY 2016', '99', 'Gunungkidul', 'Daerah Istimewa Yogyakarta', '2016-10-19', '2017-01-01', '2016-10-10', '2016-10-20', '2016-10-01', '2016-10-30', '2016-10-31', '2017-01-01'),
('spt2', 'Kalender Tanam Jagung Bantul DIY 2016', '60', 'Bantul', 'Daerah Istimewa Yogyakarta', '2016-10-01', '2016-12-01', '2016-10-10', '2016-10-15', '2016-10-05', '2016-10-20', '2016-10-31', '2016-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `trans_komentar_diskusi`
--

CREATE TABLE `trans_komentar_diskusi` (
  `nomor_komentar` int(100) NOT NULL,
  `ID_topik` varchar(10) NOT NULL,
  `ID_user` varchar(10) NOT NULL,
  `Komentar` text NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_komentar_diskusi`
--

INSERT INTO `trans_komentar_diskusi` (`nomor_komentar`, `ID_topik`, `ID_user`, `Komentar`, `Tanggal`, `Waktu`) VALUES
(10, 'cf7bf6195b', 'dmarkus', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">mantap infonya nih min,, baru tau ternyata bisa dipake buat pengendalian hama. Kapan2 aku mau coba deh,,, biat pesing yg penting tanaman aman terkendali....</span>                        ', '2018-03-01', '2017-03-24 11:47:41'),
(11, '5ef82a0851', 'dmarkus', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Terimakasih tips menanam mentimunnya mas.</span>                        ', '2017-03-01', '2017-03-01 13:19:02'),
(12, '8a18c68f2f', 'dmarkus', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Terimakasih untuk infonx</span><img src=\"http://www.kebunpedia.com/styles/default/xenforo/smilies/happy.png\" class=\"mceSmilie\" alt=\":happy:\" title=\"happy    :happy:\" style=\"vertical-align: text-bottom; margin: 0px 1px; max-width: 100%; color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">                        ', '2017-03-01', '2017-03-01 13:19:27'),
(13, 'c1ca133853', 'ambarnur', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Memasukkan dan mengirim keluar&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/tanaman/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">tanaman</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;ke LN, memanv tidak mudah. Itu menyangkut kekhawatiran negara lain juga Indonesia bahwa impor tanaman bisa membanyak hama penyakit yg dapat merajalela di negara masing2. Selain itu ditakutkan tanaman yg datang sebagai pendatang tersebut ternyata bersifat dominan dan mengalahkan tanaman endemik lokal. Alasan tersebut di atas menyebabkan tiap negara mensyaratkan peraturan yg bermacam2. Dari karantina sampai phytosanitary certificate.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Mungkin pak bun bisa kontak dan bicara dgn bagian karantina di bandara utk mendapat info lebih detail.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Jalan lain yg memungkinkan :</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">1. Menjual di DN dan meminta pembeli luar yg mengurus dokumen eksportnya.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">2. Kerjasama dgn perush yg sdh biasa melakukan eksport tanaman ke luar.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Semoga bermanfaat</span>                        ', '2017-03-01', '2017-03-01 13:32:05'),
(14, '21c3ab2cf3', 'ambarnur', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Target marketnya untuk pohon jati biasanya toko furniture&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Kalau saya lihat di daerah saya ..pohon jati umumnya ditanam secara perorangan tanpa ada kerja sama dgn pihak terkait&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Karena harga pohon jati itu sangat mahal jd masyarakat banyak menanam diperkarangan rumah .</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Jikalau ada lahan ditanam serentak itupun lahan yang susah air terutama lahan diperbukitan ...&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Begitu setahu saya jd system jual perpohon dan negosiasi oleh pembeli ... deal angkut ...</span>                        ', '2017-02-01', '2017-03-24 11:40:19'),
(15, 'cf7bf6195b', 'ambarnur', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Wahh, perlu dicoba ini...tanaman padiku ludes diserang tikus...!!</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Makasih infonya...</span>                        ', '2017-03-01', '2017-03-01 13:32:43'),
(16, '8a18c68f2f', 'ambarnur', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">kok loyo gitu ya, waktu pindah akar sehat tidak, keliatan tidak siram aja hehehe...</span>                        ', '2017-03-01', '2017-03-01 13:35:05'),
(17, '5ef82a0851', 'ambarnur', '<span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">ternyata threadnya sudah ada yah.</span><br style=\"margin-top: 0px; color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">disini ada tambahan tipsnya min, udah ada threadnya jg&nbsp;</span><img src=\"http://www.kebunpedia.com/styles/default/xenforo/clear.png\" class=\"mceSmilieSprite mceSmilie8\" alt=\":D\" title=\"Big Grin    :D\" style=\"vertical-align: text-bottom; margin: 0px 1px; max-width: 100%; width: 18px; height: 18px; background: url(&quot;styles/default/xenforo/xenforo-smilies-sprite.png&quot;) -20px 0px no-repeat rgb(255, 254, 252); color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px;\">                        ', '2017-03-01', '2017-03-01 13:35:17'),
(18, 'd62272b90c', '71130122', 'Terima kasih infonya gan', '2017-03-15', '2017-03-15 22:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `trans_pelaksanaan_pelatihan`
--

CREATE TABLE `trans_pelaksanaan_pelatihan` (
  `ID_User` varchar(10) NOT NULL,
  `Tanggal_Pelaksanaan` date DEFAULT NULL,
  `ID_Permintaan_Pelatihan` varchar(10) NOT NULL,
  `Pembahasan` varchar(200) DEFAULT NULL,
  `Sesi` varchar(1) DEFAULT NULL,
  `Jumlah_Peserta` int(3) DEFAULT NULL,
  `Bukti_Materi` varchar(200) DEFAULT NULL,
  `Bukti_Daftar_Hadir` varchar(200) DEFAULT NULL,
  `Catatan` varchar(200) DEFAULT NULL,
  `Foto_Kegiatan_1` varchar(200) DEFAULT NULL,
  `Foto_Kegiatan_2` varchar(200) DEFAULT NULL,
  `Jam_Awal` timestamp NULL DEFAULT NULL,
  `Jam_Akhir` timestamp NULL DEFAULT NULL,
  `Nomor_Pelaksanaan_pelatihan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_pembayaran`
--

CREATE TABLE `trans_pembayaran` (
  `ID_Pembayaran` varchar(10) NOT NULL,
  `ID_Permintaan` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `No_Rekening` int(25) NOT NULL,
  `Nama_Rekening` varchar(225) NOT NULL,
  `Jumlah_Pembayaran` int(11) NOT NULL,
  `Bukti_Pembayaran` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_pembayaran`
--

INSERT INTO `trans_pembayaran` (`ID_Pembayaran`, `ID_Permintaan`, `ID_User`, `No_Rekening`, `Nama_Rekening`, `Jumlah_Pembayaran`, `Bukti_Pembayaran`) VALUES
('PEM0001', 'PER0001', '721300', 2147483647, 'Gerry', 150000, 'bukti.jpeg'),
('PEM0002', 'PER0002', '721300', 93847509, 'andre', 1500000, 'andre.jpeg'),
('PEM0003', 'PER0003', '721300', 93847509, 'Andre', 1500000, 'andre.jpeg'),
('PEM0005', 'PER0006', '721300', 343244, 'Dodo', 124455, 'bukti.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `trans_penawaran_prod_tani`
--

CREATE TABLE `trans_penawaran_prod_tani` (
  `Nomor` int(11) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `ID_Penawaran` varchar(10) NOT NULL,
  `Tanggal_Penawaran` date DEFAULT NULL,
  `Spesifikasi_Barang` varchar(200) DEFAULT NULL,
  `ID_Produk` varchar(100) NOT NULL,
  `Kondisi_Barang` varchar(30) DEFAULT NULL,
  `Merk` varchar(30) DEFAULT NULL,
  `Tahun_Produksi` int(4) DEFAULT NULL,
  `Gambar1` varchar(200) DEFAULT NULL,
  `Gambar2` varchar(200) DEFAULT NULL,
  `Status_Produk` varchar(225) DEFAULT NULL,
  `Stok` int(3) DEFAULT NULL,
  `Satuan_Barang` varchar(10) DEFAULT NULL,
  `Validasi_Admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_penawaran_prod_tani`
--

INSERT INTO `trans_penawaran_prod_tani` (`Nomor`, `ID_User`, `ID_Penawaran`, `Tanggal_Penawaran`, `Spesifikasi_Barang`, `ID_Produk`, `Kondisi_Barang`, `Merk`, `Tahun_Produksi`, `Gambar1`, `Gambar2`, `Status_Produk`, `Stok`, `Satuan_Barang`, `Validasi_Admin`) VALUES
(17, 'adminpjl', 'PEN0001', '2017-09-17', 'Khas Kulon Progo dibuat dengan bibit yang berkualitas', 'PRO0007', 'Baru', 'Cap Pak Amin', 2017, '14_09_17_kentang2.jpg', '14_09_17_kentang2.jpg', 'Aktif', 12, 'KG', 1),
(18, 'adminpjl', 'PEN0002', '2017-09-17', 'beras wangi dan bersih', 'PRO0001', 'Baru', 'Buatan Jogja', 2017, '20_09_17_beras1.jpg', '20_09_17_beras1.jpg', 'Mati', 100, 'KG', 0),
(19, 'adminpjl', 'PEN0003', '2017-09-27', 'Gagang mengunkan pegangan kayu berwarna hitam', 'PRO0002', 'Baru', 'Asli Gunung Kidul', 2016, '02_09_27_hvn bnvm.jpg', '02_09_27_hvn bnvm.jpg', 'Aktif', 12, 'BUAH', 1),
(20, 'adminpjl', 'PEN0004', '2017-09-27', 'Isi 50 ml, berbentuk cairan berwana kuning', 'PRO0009', 'Baru', 'Asli Kulon Progo', 2016, '02_09_27_Slide3.JPG', '02_09_27_Slide3.JPG', 'Aktif', 100, 'BUAH', 1),
(21, 'adminpjl', 'PEN0005', '2017-09-27', 'Beras wangi dan bersih', 'PRO0011', 'Baru', 'Asli Gunung Kidul', 2016, '04_09_27_beras1.jpg', '04_09_27_beras1.jpg', 'Aktif', 100, 'KG', 1),
(22, 'adminpjl', 'PEN0006', '2017-10-02', '-terbuat dariemas', 'PRO0005', 'Baru', 'Asli Bantul', 2016, '08_10_02_cbnvbn.jpg', '08_10_02_cbnvbn.jpg', 'Aktif', 12, 'BUAH', 1),
(23, 'adminpjl', 'PEN0007', '2017-10-03', 'jhxkjsh', 'PRO0003', 'Baru', 'Asli Bantul', 2017, '07_10_03_Pupuk_PERTANIAN_CABAI_Nasa_terlaris.jpeg', '07_10_03_Pupuk_PERTANIAN_CABAI_Nasa_terlaris.jpeg', 'Aktif', 12, 'ML', 1),
(24, 'adminpjl', 'PEN0008', '2017-10-07', 'pedas dan merah', 'PRO0004', 'Baru', 'Asli Gunung Kidul', 2017, '08_10_07_cabe1.jpg', '08_10_07_cabe2.jpg', 'Aktif', 5, 'KG', 1),
(25, 'adminpjl', 'PEN0009', '2017-10-07', 'Wortel ENak', 'PRO0010', 'Baru', 'Asli Bantul', 2017, '08_10_07_carrots-537x358.jpg', '08_10_07_carrots-537x358.jpg', 'Aktif', 2, 'KG', 1),
(26, 'adminpjl', 'PEN0010', '2017-10-20', 'buat pertanian', 'PRO0008', 'Baru', 'Empu Cangkul', 2018, '05_10_20_garuk dan garpu2.JPG', '05_10_20_garuk dan garpu2.JPG', 'Mati', 12, 'BUAH', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trans_permintaan`
--

CREATE TABLE `trans_permintaan` (
  `ID_Permintaan` int(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `ID_Penawaran` varchar(10) NOT NULL,
  `kode_kurir` int(10) NOT NULL,
  `Qty` int(3) DEFAULT NULL,
  `Harga` int(12) DEFAULT NULL,
  `Tgl_Kebutuhan` date DEFAULT NULL,
  `Tgl_Permintaan` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Status_Kirim` varchar(20) DEFAULT NULL,
  `Nama_Ekspedisi` varchar(225) NOT NULL,
  `No_Resi` varchar(225) NOT NULL,
  `kode_alamat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_permintaan`
--

INSERT INTO `trans_permintaan` (`ID_Permintaan`, `ID_User`, `ID_Penawaran`, `kode_kurir`, `Qty`, `Harga`, `Tgl_Kebutuhan`, `Tgl_Permintaan`, `Status`, `Status_Kirim`, `Nama_Ekspedisi`, `No_Resi`, `kode_alamat`) VALUES
(38, 'adminpjl', 'PEN0003', 10, 1, NULL, '2018-01-16', '2018-01-17', 'Sudah Dibayar', 'Belum Dikirim', '', '', 17),
(39, 'adminpmb', 'PEN0002', 9, 2, NULL, '2018-01-17', '2018-01-16', 'Sudah Dibayar', 'Belum Dikirim', '', '', 14),
(40, 'adminpjl', 'PEN0004', 10, 5, NULL, '2018-01-17', '2018-01-16', 'Sudah Dibayar', 'Belum Dikirim', '', '', 16),
(41, 'adminpmb', 'PEN0004', 9, 2, NULL, '2018-01-17', '2018-01-16', 'Sudah Dibayar', 'Belum Dikirim', '', '', 14),
(42, 'adminpmb', 'PEN0006', 9, 1, NULL, '2018-01-17', '2018-01-16', 'Sudah Dibayar', 'Belum Dikirim', '', '', 14),
(43, 'adminpmb', 'PEN0002', 10, 1, NULL, '2018-01-17', '2018-01-17', 'Sudah Dibayar', 'Belum Dikirim', '', '', 17),
(44, 'adminpjl', 'PEN0002', 10, 1, NULL, '2018-01-17', '2018-01-17', 'Belum Dibayar', 'Belum Dikirim', '', '', 17),
(45, 'pembeli', 'PEN0001', 1, 1, NULL, '2018-04-12', '2018-04-12', 'Belum Dibayar', 'Belum Dikirim', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trans_permintaan_pelatihan`
--

CREATE TABLE `trans_permintaan_pelatihan` (
  `ID_Permintaan_Pelatihan` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `ID_Materi` varchar(10) NOT NULL,
  `Tanggal_Awal_Permintaan` date DEFAULT NULL,
  `Tanggal_Akhir_Permintaan` date DEFAULT NULL,
  `Tempat` varchar(50) DEFAULT NULL,
  `Alamat` varchar(200) DEFAULT NULL,
  `Desa` varchar(50) DEFAULT NULL,
  `Kecamatan` varchar(50) DEFAULT NULL,
  `Kabupaten` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(50) DEFAULT NULL,
  `Kontak_Person` varchar(50) DEFAULT NULL,
  `Telpon` varchar(50) DEFAULT NULL,
  `Jumlah_Target_Peserta` int(3) DEFAULT NULL,
  `Surat_Permintaan` varchar(200) DEFAULT NULL,
  `Tanggal_Awal_Setuju` date DEFAULT NULL,
  `Tanggal_Akhir_Setuju` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_permintaan_pelayanan`
--

CREATE TABLE `trans_permintaan_pelayanan` (
  `ID_Permintaan_Pelayanan` varchar(10) NOT NULL,
  `ID_User` varchar(10) NOT NULL,
  `ID_Pelayanan` varchar(10) NOT NULL,
  `Tanggal_Permintaan` date DEFAULT NULL,
  `Permasalahan` varchar(200) DEFAULT NULL,
  `Solusi` varchar(200) DEFAULT NULL,
  `Tanggal_Respon` date NOT NULL,
  `Penanggungjawab` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_realisasi_biaya`
--

CREATE TABLE `trans_realisasi_biaya` (
  `ID_detail_anggaran` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `harga` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trans_struk_org`
--

CREATE TABLE `trans_struk_org` (
  `ID_Kelompok_Tani` varchar(10) NOT NULL,
  `Tgl_Awal` date DEFAULT NULL,
  `Tgl_Selesai` date DEFAULT NULL,
  `Nama_Ketua` varchar(100) DEFAULT NULL,
  `Telpon_Ketua` varchar(20) DEFAULT NULL,
  `Nama_Wakil_Ketua` varchar(100) DEFAULT NULL,
  `Telpon_Wakil_Ketua` varchar(20) DEFAULT NULL,
  `Nama_Sekretaris` varchar(100) DEFAULT NULL,
  `Telpon_Sekretaris` varchar(20) DEFAULT NULL,
  `Nama_Bendahara` varchar(100) DEFAULT NULL,
  `Telpon_Bendahara` varchar(20) DEFAULT NULL,
  `Scan_Struktur_Organisasi` varchar(200) DEFAULT NULL,
  `Scan_Susunan_Pengurus` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_struk_org`
--

INSERT INTO `trans_struk_org` (`ID_Kelompok_Tani`, `Tgl_Awal`, `Tgl_Selesai`, `Nama_Ketua`, `Telpon_Ketua`, `Nama_Wakil_Ketua`, `Telpon_Wakil_Ketua`, `Nama_Sekretaris`, `Telpon_Sekretaris`, `Nama_Bendahara`, `Telpon_Bendahara`, `Scan_Struktur_Organisasi`, `Scan_Susunan_Pengurus`) VALUES
('kelompok_a', '2017-01-01', '2020-01-01', 'Argo', '0283468', 'Uchiha92893482934', '8979234234', 'Sasuke', '9028349834', 'Bendahara Konoha', '923892374', 'kelompok_a.jpg', 'kelompok_a.jpg'),
('kelompok_b', '2018-01-01', '2019-01-01', 'ketua', '98293848924', 'wakil', '9882387', 'sekre', '023948', 'bendahara', '928349234', 'kelompok b.jpg', 'kelompok b.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `trans_topik_diskusi`
--

CREATE TABLE `trans_topik_diskusi` (
  `ID_topik` varchar(10) NOT NULL,
  `ID_kategori_topik` varchar(10) NOT NULL,
  `ID_user` varchar(10) NOT NULL,
  `ID_Produk` varchar(10) NOT NULL,
  `Judul_Topik` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isi_diskusi` text NOT NULL,
  `parent` int(11) NOT NULL,
  `Status_Diskusi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_topik_diskusi`
--

INSERT INTO `trans_topik_diskusi` (`ID_topik`, `ID_kategori_topik`, `ID_user`, `ID_Produk`, `Judul_Topik`, `tanggal`, `waktu`, `isi_diskusi`, `parent`, `Status_Diskusi`) VALUES
('21c3ab2cf3', '21c3ab2cf3', 'dmarkus', '', 'Adakah Pakbun Disini Yang Pernah Berkebun Jati ?', '2018-03-01', '2017-03-24 11:51:56', '<p><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Selamat siang pakbun dan bubun</span><br style=\"margin-top: 0px; color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Saya anak bawang mau tanya nih,&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Saya bekerja di sebuah perusahaan bergerak di bidang agroforestry, yaitu kerjasama penanaman pohon&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/jati/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">jati</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">.&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Bagi pak bun dan bubun yang pernah menjalani kerjasama seperti ini atau memiliki lahan jati,&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Biasanya siapa sih yang berminat menanam kayu jati untuk kerjasama ?&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Atau lebih tepatnya siapa sih target market untuk kerjasama penanaman pohon jati ?&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Mungkin ada master gardener yang bersedia sharing, silahkan.&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Terima kasih&nbsp;</span><br></p>', 0, ''),
('5ef82a0851', '5ef82a0851', 'frmaya', '', 'Cara Menanam Mentimun Yang Baik Dan Benar', '2017-03-01', '2017-03-01 13:13:29', '<p><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Melihat banyaknya manfaat dari mentimun wajar jika akhirnya permintaan untuk buah/sayuran ini selalu tinggi. Jika Anda tertarik untuk membudidayakan mentimun, berikut kami tampilkan ulasan mengenai&nbsp;</span><b style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">cara menanam mentimun yang baik dan benar</b><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">:</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">1. Syarat tanam</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Mentimun umumnya bisa tumbuh diberbagai daerah dengan berbagai ketinggian dan suhu, namun ketinggian antara 1000 sampai dengan 1200 mdpl dengan suhu antara 21-27oC adalah tanah yang ideal. Media lahan haruslah tersinari matahari dengan baik, karena tanaman ini termasuk ke dalam tanaman yang rentan sehingga perlu memiliki perawatan yang baik. Tingkat keasaman tanah yang disarankan adalah 6 sampai dengan 7 pH.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">2. Persiapan lahan</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Lahan yang baik untuk penanaman mentimun adalah tanah yang memiliki unsur hara yang masih baik, tanah harus digemburkan dahulu dengan cara di cangkul atau dibajak sedalam kurang lebih 20-30 cm untuk membalikan posisi tanah dari bawah ke atas. Setelah tanah siap kemudian dibuat bedengan dengan spesifikasi sebagai berikut ;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Buat ukuran bedengan dengan ukuran lebar 1 meter serta tinggi sekitar 20-30 cm</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Panjang bedengan sesuai dengan panjang lahan</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Jarak antara bedengan adalah sekitar 20 cm</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Buat parit diantara bedeng dengan rapi untuk drainase</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Setelah tanah bedengan siap kemudian tutup bedengan dengan mulsa plastik pada waktu siang hari atau saat cuaca panas agar panjang dan ketahanan mulsa berada pada kondisi maksimal.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Lubangi bedengan yang telah ditutupi mulsa dengan diameter 10 cm</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Jarak antara lubang bedengan satu baris mendatar adalah 40 cm</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Sementara jarak antar lubang bedengan satu baris ke bawah aadalah 50-60cm</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Setelah bedengan siap langkah selanjutnya adalah dengan memberikan pupuk alami yang berasal dari kotoran hewan, pada setiap lubang bedeng.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">3. Penanaman</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Momen yang paling baik untuk menanam mentimun adalah saat akhir musim hujan, karena musim kering adalah waktu yang paling cocok untuk menanam mentimun. Gunakanlah bibit mentimun yang bagus, agar hasil tanaman juga bagus. Penanaman bibit dengan cara ditugal bisa dengan menggunakan tugal manual maupun otomatis, ke dalam tugal adalah 5 sampai dengan 7 cm. Dalam satu lubang tugal idealnya diisi dengan 2 sampai dengan 3 buah bibit mentimun. Kemudian tutup lubang dengan rapi, namun jangan terlalu dipadatkan karena akan menekan bibit.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">4. Perawatan</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Setelah bibit mentimun ditanam maka tahap selanjutnya adalah merawat atau memelihara mentimun agar tumbuh dengan baik. Terdapat beberapa bagian dalam perawatan mentimun seperti ;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Pengairan</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Pengairan bisa dilakukan setelah tanaman berkecambah diumur 1-4 hari, lalu saat tanaman memiliki batang atau daun pada umur 15 sampai dengan 20 hari. Tanah jangan sampai terlihat lembab, karena akan tidak baik untuk pertumbuhan tanaman mentimun, pengairan sampai tanah terlihat basah.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Pemupukan</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Pupuk yang digunakan untuk pertumbuhan tanaman mentimun adalah pupuk organik, UREA, TSP serta KCL.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">a. Pupuk organik diberikan saat tahap pengolahan tanah</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">b. Pupuk Urea yang digunakan sekitar 75 Kg/ha, dengan pembagian sekitar 25 - 35 Kg diberikan pada waktu tanam mentimun sementara yang lainnya diberikan setelah penyiangan pertama atau saat waktu tanam berada di 15-20 hari.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">c. Pupuk TSP dan KCL diberikan saat waktu tanam dengan disebar secara merata, komposisinya 40 Kg/ha TSP dan 20 kg/ha KCL.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Pengendalian hama dan penyakit</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Hama dan penyakit yang menyerang mentimun biasanya adalah Gulma, hama, kepik hijau dan karat daun.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Untuk Gulma pengendaliannya dengan pestisida Roundup yang diberikan saat tanam maupun saat tanaman mulai berbunga.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Kepik</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Kepik pengendaliannya bisa dengan pemusnahan telur secara manual atau menggunakan insektisida seperti Surecida 20 EC, Dursban 20 EC, 35 EC, atau Azodrin 15 WCS di berikan saat tanaman berumur 20 hari.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Hama</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Untuk hama pengendaliannya bisa dengan insektisida yang dilakukan pada saat tanaman mentimun berumur 7-8 hari.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">- Karat Daun</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Pengendaliannya dengan Fungisida Dithane M-45 yang diberikan pada saat tanaman berumur 20 hari. Selain itu bisa juga dengan pembasmian manual dengan mencabut secara rapi kemudian dibakar.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">5. Waktu panen</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Mentimun sudah memasuki masa siap panen saat berumur 75 hari dari waktu tanam. Panen bisa dilakukan setiap hari secara bertahap dengan mengambil terlebih dahulu buah yang sudah siap panen. Setelah panen buah mentimun harus dikemas dalam kemasan yang baik untuk menghindari kerusakan, karena buah ini memiliki kulit yang rentan dan gampang rusak.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Selain itu setelah dipanen, mentimun juga harus diletakan dalam suhu yang sejuk karena buah ini rentan sekali kehilangan cairan jika ditempatkan dalam cuaca yang panas, sehingga agar buah tetap terjaga kesegarannya harus ditempatkan dalam cuaca yang baik.</span><br></p>', 0, ''),
('6c316a7cf2', '6c316a7cf2', '71130122', '', 'Uji Coba Aplikasi', '2017-02-15', '2017-03-24 11:31:30', '<p>Saat ini sedang uji coba aplikasi</p>', 0, ''),
('8a18c68f2f', '8a18c68f2f', 'frmaya', '', 'Cara Menanam Pakcoy/pak Choi Yang Baik Dan Benar', '2017-03-01', '2017-03-01 13:12:21', '<p><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Jika Anda tertarik untuk membudidayakan sayuran ini maka berikut kami tampilkan beberapa tips dan&nbsp;</span><b style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">cara menanam Pakcoy/Pak Choi&nbsp;yang baik</b><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;agar memiliki hasil yang optimal&nbsp;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>1.Syarat Tumbuh</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Sayuran Pak Choy bisa hidup dalam berbagai tempat tropis maupun subtropis, daerah baik dataran tinggi maupun rendah, namun yang perlu diperhatikan untuk media pertumbuhan Pak Choy adalah media tanah haruslah subur, setidaknya memiliki unsur hara yang masih cukup baik. Tanah harus memiliki pancaran &nbsp;sinar matahari yang baik serta cukup air.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>2. Persiapan Lahan</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Gemburkan tanah yang akan menjadi media penanaman Pak Choy, gali tanah dengan kedalaman antara 20 sampai dengan 30 cm. Lalu buatlah sebuah bedengan yang nanti akan menjadi media tanam Pak Choy, bedengan yang akan dibuat haruslah berupa bedengan dengan bedengan dengan lebar 2 meter, dengan panjang menyesuaikan dengan panjangnya lahan.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Di antara sela bedengan buatlah sebuah saluran air atau drainase yang memiliki lebar kurang lebih 50 cm untuk kelancaran air agar tidak menggenangi bedengan saat musim hujan. Setelah bedengan selesai dibuat maka ratakan bagian permukaan bedengan kemudian berikan pupuk kandang pada media tanam agar tanah menjadi lebih subur. Perhitungan pupuk kandang yang digunakan adalah 7 sampai dengan 10 ton pupuk untuk media lahan seluas satu hektar. Setelah diberi pupuk berikan air agar tanah menjadi padat dan pupuk bisa menyerap dengan baik.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>3. Proses penanaman</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">a. Persemaian</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"></b><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Untuk menaman sayuran Pak Choi bisa dengan bibit atau disemaikan terlebih dahulu, jika disemaikan maka digunakan bedengan terpisah dari bedengan utama untuk menyemaikan bibit hingga berdaun. Media tanam bedengan adalah tanah yang halus dan gembur dicampur dengan pupuk kompos dengan komposisi 1:1.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Agar lebih maksimal sebelum benih ditabur untuk persemaian, bibit harus direndam terlebih dahulu dalam sebuah larutan yang berasal dari Previkur N dengan konsentrasi 0.1. Rendam bibit dalam larutan kurang lebih selama 2 jam lalau bibit yang sudah direndam kemudian dikeringkan.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>b. Bibit</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Jika akan menanam sayuran Pak Choy langsung dengan bibit maka dibutuhkan bibit Pak Choy dengan kisaran antara 1.5 sampai dengan 2 Kg per hektarnya. Penanaman dilakukan dengan cara menaburkan benih dengan jarak sekitar 9x9cm. Dalam setiap titik tanam jangan hanya menaburkan satu bibit namun bisa juga dengan memberi 2-3 biji tanam, hal ini untuk menghindari kurang berkembangnya satu benih sehingga dengan memberikan 2-3 bibit maka jika ada satu benih yang kurang berkembang masih bisa digantikan oleh bibit lainnya.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>4. Perawatan Tanaman</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Perawatan tanaman untuk sayuran Pak Choy hampir sama dengan sayuran pada umumnya, seperti ;</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>a. Pemupukan</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Pemupukan pada tanaman Pak Choy dilakukan dengan menggunakan pupuk NPK dengan porsi sebanyak 300 kg per hektar. Pupuk ini ditaburkan saat tanaman berumur 12 hari sejak awal tanam.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>b. Pengendalian hama dan penyakit</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Berbagai hama yang biasa datang menghinggapi Pak Choy adalah ulat, kutu loncat, kumbang, Siput. Pengendaliannya dengan cara menyemprotkan pestisida yang aman untuk tanaman.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>c. Pengairan</b></span></p><p><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;</span><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Agar tanaman Pak Choy selalu segar dan tumbuh dengan subur maka Pak Choy perlu untuk disiram dengan kisaran waktu teratur dan secukupnya.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>d. Perawatan lainnya</b></span></p><p><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Perawatan lainnya meliputi perawatan dari gulma, perawatan bedengan dan drainase agar tetap menjadi media lahan yang baik bagi Pak Choy.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><b>5. Panen</b></span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Sayuran Pak Choy sudah bisa dipanen dengan baik saat tanaman berumur 28 sampai dengan 30 hari dari waktu penanaman awal. Namun semua tergantung dari perawatan, cuaca dan bibit. Sayuran Pak Choy yang sudah memiliki syarat untuk dipanen memiliki bagian pangkal sehat, daun tumbuh subur dan hijau serta tanaman menunjukkan pertumbuhan yang serempak dan merata.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Untuk memanen bisa dengan mencabut dari akar dengan hati-hati atau bisa juga dengan mengambil sebagian pangkal. Hati-hati saat akan dipanen karena bagian pangkal dan daun akan rawan rusak, daun dan pangkal yang mulus akan memiliki nilai ekonomis lebih.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Sementara pangkal dan daun yang rusak atau tergores memiliki nilai ekonomis yang berkurang, jadi harap berhati-hati dalam memanen dan menyimpan Pak Choy. Pak Choy yang sudah dipanen dikumpulkan di tempat yang teduh, jangan terlalu lama disimpan di ladang namun segera bawa ke tempat penyimpanan yang memiliki iklim yang sejuk, dan tidak terkena sinar matahari langsung yang dapat merusak kesegaran Pak Choy.</span><br></p>', 0, '');
INSERT INTO `trans_topik_diskusi` (`ID_topik`, `ID_kategori_topik`, `ID_user`, `ID_Produk`, `Judul_Topik`, `tanggal`, `waktu`, `isi_diskusi`, `parent`, `Status_Diskusi`) VALUES
('c1ca133853', 'c1ca133853', 'dmarkus', '', '[ASK] Pengiriman Tanaman / Bonsai Ke Luar Negeri', '2017-03-01', '2017-03-01 13:30:25', '<p><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Hi, Salam kenal, saya Ramdani dari Pesona&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/bonsai/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">Bonsai</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">. Ini adalah postingan ke 2 saya setelah saya menuliskan secercah salam perkenalan dii thread perkenalan. Saya sangat berterima kasih kepada KebunPedia karena ternyata setelah saya membaca materi di forum ini banyak ilmu dan wawasan seputar&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/tanaman/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">tanaman</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">, hampir seluruh tanaman. Pertama kali aya mengenal forum ini dari Link yang saya lihat di KebunBibit dan salah satu forum besar lain nya yaitu Ads-id . Ketika saya melihat forum ini saya langsung terpikat dan bergabung menjadi salah satu anggota yang masih newbie di forum ini, jadi di mohon untuk para master dan suhu untuk memberikan bimibingan nya&nbsp;</span><img src=\"http://www.kebunpedia.com/styles/default/xenforo/clear.png\" class=\"mceSmilieSprite mceSmilie1\" alt=\":)\" title=\"Smile    :)\" style=\"vertical-align: text-bottom; margin: 0px 1px; max-width: 100%; width: 18px; height: 18px; background: url(&quot;styles/default/xenforo/xenforo-smilies-sprite.png&quot;) 0px 0px no-repeat rgb(255, 254, 252); color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px;\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Next topik, Balik lagi ke laptop, eh ..... ke topik hhheee, sesuai judul yang saya tulis di atas, ada pertanyaan besar yang belum bisa saya jawab sampai saat ini baik secara implementasi di lapangan/fakta ataupun secara teori searhing di mbah google,,, idih.... apaan sih bahasanya ko ga nyambung ya&nbsp;</span><img src=\"http://www.kebunpedia.com/styles/default/xenforo/clear.png\" class=\"mceSmilieSprite mceSmilie8\" alt=\":D\" title=\"Big Grin    :D\" style=\"vertical-align: text-bottom; margin: 0px 1px; max-width: 100%; width: 18px; height: 18px; background: url(&quot;styles/default/xenforo/xenforo-smilies-sprite.png&quot;) -20px 0px no-repeat rgb(255, 254, 252); color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px;\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;.....</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Langsung ya ke pokok bahasan, saya adalah salah satu owner perusahaan Bonsai yang memiliki sekitar 1.000 lebih Pohon Bonsai.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Sekilas cerita : Kami mendirikan Toko Bonsai sejak Bulan Juni 1984 di kota hujan Bogor, Awalnya kami melakukan penjualan Bonsai hanya melalui offline dan belum menjamah online, karena dengan perkembangan zaman dan perkembangan tekhnologi digital, kami mencoba untuk memasarkan Bonsai secara digital/online, dan hasilnya ternyata sungguh luar biasa, kami sering melakukan&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/pengiriman/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">pengiriman</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;ke berbagai sudut Nusantara. Omset pun kiat menanjak, Alhamdulillah saya bersyukur dengan karunia tersebut, akan tetapi banyak yang perlu kami persiapkan karena ini baru awal dan masih banyak tantangan yang harus di hadapi karena dalam marketing pemasaran adalah pertarungan yang sengit hhhee. Jadi kami belum menjadi apa-apa dan masih harus banyak melakukan perbaikan secara kualitas, kuantitas dan hal tersebut harus berkesinambungan serta konsisten&nbsp;</span><img src=\"http://www.kebunpedia.com/styles/default/xenforo/clear.png\" class=\"mceSmilieSprite mceSmilie1\" alt=\":)\" title=\"Smile    :)\" style=\"vertical-align: text-bottom; margin: 0px 1px; max-width: 100%; width: 18px; height: 18px; background: url(&quot;styles/default/xenforo/xenforo-smilies-sprite.png&quot;) 0px 0px no-repeat rgb(255, 254, 252); color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px;\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Kendala yang saya alami sekarang adalah tentang masalah pengiriman tanaman, untuk pengiriman secara nasional sudah terpecahkan karena kini kami sering melakukan pengiriman tanaman ke seluruh nusantara dengan mudah, Alhamdulilah patut di syukuri. Jadi apa yang menjadi masalah dan belum terpecahkan ?</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">\"Pengiriman Tanaman Ke Luar Negeri\" . Yang kami alami sekarang adalah kesulitan untuk melakukan pengiriman tanaman ke luar negeri. Prioritas kami adalah Bonsai, kedepannya mudah-mudahan bisa merambah lebih jauh ke&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/tanaman-hias/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">tanaman hias</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;dan&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/bibit/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">bibit</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">, semoga untuk bibit bisa bekerjasama dengan kebun bibit (Mudah-mudahan owner kebunbibit baca) heheee....</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Banyaknya permintaan order dari luar negeri membuat saya berpikir keras dan mencari solusi agar apa yang saya cari bisa terjawab yaitu problem kesulitan pengiriman ke luar negeri.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Saat saya mencari referensi tentang&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/ekspedisi/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">ekspedisi</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">&nbsp;yang melayani&nbsp;</span><a href=\"http://www.kebunpedia.com/tags/ekspor/\" class=\"Tinhte_XenTag_TagLink\" title=\"\" style=\"color: rgb(29, 122, 27); border-radius: 5px; padding-top: 0px; padding-bottom: 0px; padding-left: 3px; margin: 0px -3px; background: url(&quot;styles/default/Tinhte/XenTag/tag.png&quot;) right bottom no-repeat rgb(255, 254, 252); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; padding-right: 12px !important;\">ekspor</a><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">, diantaranya DHL dan EMS Pos Indonesia, saya langsung menghubungi call center mereka, akan tetapi jawaban yang sya dapatkan adalah : Tanaman tidak bisa di kirim ke luar negeri.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Beberapa calon pelanggan telah menghubungi saya mulai dari USA, Australia, UK, Saudi Arabia, Malaysia, Singapore, Srilanka, dll . Calon pelanggan tersebut terbuang secara percuma karena ketidak sanggupan saya untuk melakukan pengiriman ke luar negara.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Dari problem saya diatas, mudah-mudahan di forum ini ada yang bisa sharing dan berbagi ilmu kepada saya dan memberikan solusinya.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Sekian dari saya, maaf agal banyak cerita kaya cerpen hhheee.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Terima kasih, mohon maaf jika ada salah kata, Salam hangat - Pesona Bonsai.</span><br></p>', 0, ''),
('cf7bf6195b', 'cf7bf6195b', 'frmaya', '', 'mengendalikan hama padi dengan bio urine manusia', '2017-03-01', '2017-03-01 13:14:01', '<p><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Tikus dan penggerek batang menjadi hama utama pada tanaman padi. Petanipun tidak kehabisan akal untuk mengendalikan kedua jenis hama padi tersebut. Salah satu cara yang dilakukan petani Pinrang adalah mengusir tikus dengan bau urine manusia.</span><br style=\"margin-top: 0px; color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">System repelant memiliki prinsip yaitu menciptakan suasana yang tidak disukai oleh tikus lewat bau yang ditimbulkan oleh suatu bahan tambahan yang diberikan pada tanaman padi. Bahan bisa dibuat dari buah, daun atau rempah-rempah. Tapi bahan yang sudah dicoba dan terbukti ampuh yaitu urine manusia yang telah difermentasi dengan menggunakan EM4.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Cara pembuatannya pun sangat mudah, yaitu setelah urine terkumpul sebanyak 1 liter lalu dicampur dengan air tajin sebanyak 1 liter dan ditambah EM4 sebanyak 250 ml. setelah itu difermentasi selama 7 hari. Aplikasinya yaitu untuk serangan ringan dengan mencampur Bio urine sebanyak 250ml / tangki (15 liter air) dan untuk serangan berat dosisnya bisa ditambah menjadi 500ml / tangki dan diulangi setiap 10 hari.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Dari hasil aplikasi yang telah dilakukan, ternyata mampu menghentikan aktivitas makan hama tikus setelah dilakukan penyemprotan. Hasil fermentasi bio urine ini memiliki bau yang sangat pesing / tajam sehingga akan membuat hama tikus yang memiliki penciuman yang baik tidak betah lalu pergi. Bio urine ini juga mampu mengapus jejak tikus sehingga tikus tidak memiliki lagi petunjuk jalan dalam melakukan aktivitasnya. Seperti diketahui bahwa tikus akan selalu berjalan dengan rute yang sama yang mana sebelumnya telah ia tandai dengan bau urinenya sendiri.</span><br style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\"><span style=\"color: rgb(20, 20, 20); font-family: Tahoma, Geneva, sans-serif; font-size: 14.6667px; background-color: rgb(255, 254, 252);\">Selain hama tikus bio urine manusia juga mampu mengendalikan hama penggerek batang padi yang mana hama ini juga termasuk hama utama dengan tingkat kerusakan yang ditimbulkan juga sangat tinggi. Bio urine bekerja dengan cara mengacaukan system perkawinan ngengat penggerek batang. Ngengat jantan dan ngengat betina berkomunikasi dengan bau feromon sex yang dikeluarkan oleh betina, dengan dilakukannya penyemprotan bio urine yang memilki bau khas maka akan menutupi bau feromon sex betina sehingga tidak akan terjaadi perkawinan. (Mubarak Harun)</span><br></p>', 0, ''),
('d62272b90c', 'd62272b90c', 'ambarnur', '', 'kucai', '2017-03-01', '2017-03-01 13:36:36', '<div class=\"messageContent\" style=\"margin: 0px; padding: 0px 0px 2px; min-height: 100px; overflow: hidden; color: rgb(20, 20, 20); font-family: &quot;Trebuchet MS&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\"><article><blockquote class=\"messageText SelectQuoteContainer ugc baseHtml\" style=\"margin-bottom: 0px; padding: 0px; font-size: 11pt; font-family: Tahoma, Geneva, sans-serif; line-height: 1.4;\">Alo salam kenal semuanya,<br style=\"margin-top: 0px;\"><br>saya anggota baru disini. mau berguru dari para senior disini. Oh ya saya tinggal di Purwokerto, Banyumas, Jateng<br><br><br>Saya ingin mengetahui menanam kucai agar dapat menghasilkan panen optimal. karena saya melihat kucai peluangnya besar.<br>terima kasih untuk sharingnya<div class=\"messageTextEndMarker\" style=\"margin: 0px; padding: 0px; height: 0px; font-size: 0px;\">&nbsp;</div></blockquote></article></div><div class=\"messageMeta ToggleTriggerAnchor\" style=\"margin: -5px; padding: 15px 5px 5px; font-size: 11px; overflow: hidden; zoom: 1; color: rgb(20, 20, 20); font-family: &quot;Trebuchet MS&quot;, Helvetica, Arial, sans-serif;\"><div class=\"privateControls\" style=\"margin: 0px; padding: 0px; float: left;\"></div></div>', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balas_komentar`
--
ALTER TABLE `balas_komentar`
  ADD PRIMARY KEY (`ID_Balas`),
  ADD KEY `ID_Komentar` (`ID_Komentar`,`ID_Penawaran`,`ID_User`),
  ADD KEY `ID_Penawaran` (`ID_Penawaran`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ID_Chat`);

--
-- Indexes for table `f_materi`
--
ALTER TABLE `f_materi`
  ADD PRIMARY KEY (`ID_File`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`Nama_Kabupaten`),
  ADD KEY `Nama_Provinsi` (`Nama_Provinsi`),
  ADD KEY `Nama_Provinsi_2` (`Nama_Provinsi`);
ALTER TABLE `kabupaten` ADD FULLTEXT KEY `Nama_Kabupaten` (`Nama_Kabupaten`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`Nama_Kecamatan`),
  ADD KEY `Nama_Kabupaten` (`Nama_Kabupaten`),
  ADD KEY `Nama_Provinsi` (`Nama_Provinsi`);

--
-- Indexes for table `kelurahan_desa`
--
ALTER TABLE `kelurahan_desa`
  ADD PRIMARY KEY (`Nama_Desa`),
  ADD UNIQUE KEY `Nama_Desa` (`Nama_Desa`,`Nama_Kecamatan`,`Nama_Kabupaten`,`Nama_Provinsi`),
  ADD KEY `Nama_Kecamatan` (`Nama_Kecamatan`,`Nama_Kabupaten`,`Nama_Provinsi`),
  ADD KEY `Nama_Kabupaten` (`Nama_Kabupaten`),
  ADD KEY `Nama_Provinsi` (`Nama_Provinsi`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`ID_Komentar`),
  ADD KEY `ID_Penawaran` (`ID_Penawaran`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `komentar_produk`
--
ALTER TABLE `komentar_produk`
  ADD PRIMARY KEY (`ID_Masukkan`),
  ADD KEY `ID_Penawaran` (`ID_Penawaran`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`kode_kurir`);

--
-- Indexes for table `log_aktifitas_pelatihan`
--
ALTER TABLE `log_aktifitas_pelatihan`
  ADD PRIMARY KEY (`ID_Log`),
  ADD KEY `ID_Permintaan_Pelatihan` (`ID_Permintaan_Pelatihan`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `log_aktifitas_pelayanan`
--
ALTER TABLE `log_aktifitas_pelayanan`
  ADD PRIMARY KEY (`ID_Log`),
  ADD KEY `ID_Permintaan_Pelayanan` (`ID_Permintaan_Pelayanan`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `log_biaya_keluar`
--
ALTER TABLE `log_biaya_keluar`
  ADD KEY `ID_Aktivitas` (`ID_Aktivitas`,`ID_Petani`,`ID_Biaya`),
  ADD KEY `ID_Biaya` (`ID_Biaya`),
  ADD KEY `ID_Petani` (`ID_Petani`),
  ADD KEY `ID_aktifitas_spesies` (`ID_aktifitas_spesies`),
  ADD KEY `ID_Spesies` (`ID_Spesies`);

--
-- Indexes for table `log_penawaran_prod`
--
ALTER TABLE `log_penawaran_prod`
  ADD PRIMARY KEY (`ID_Log`),
  ADD KEY `ID_Penawaran` (`ID_Penawaran`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `log_permintaan`
--
ALTER TABLE `log_permintaan`
  ADD PRIMARY KEY (`ID_Log`),
  ADD KEY `ID_Permintaan` (`ID_Permintaan`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `log_user_trans`
--
ALTER TABLE `log_user_trans`
  ADD KEY `ID_User` (`ID_User`,`ID_Aktivitas`),
  ADD KEY `ID_Aktivitas` (`ID_Aktivitas`);

--
-- Indexes for table `master_aktifitas_spesies`
--
ALTER TABLE `master_aktifitas_spesies`
  ADD PRIMARY KEY (`ID_aktifitas_spesies`),
  ADD KEY `ID_Spesies` (`ID_Spesies`),
  ADD KEY `ID_Aktivitas` (`ID_Aktivitas`),
  ADD KEY `ID_aktifitas_spesies` (`ID_aktifitas_spesies`);

--
-- Indexes for table `master_aktivitas`
--
ALTER TABLE `master_aktivitas`
  ADD PRIMARY KEY (`ID_Aktivitas`);

--
-- Indexes for table `master_alat_tani`
--
ALTER TABLE `master_alat_tani`
  ADD PRIMARY KEY (`ID_Alat`),
  ADD KEY `ID_Kategori` (`ID_Kategori`);

--
-- Indexes for table `master_bahan_tani`
--
ALTER TABLE `master_bahan_tani`
  ADD PRIMARY KEY (`ID_Bahan`),
  ADD KEY `ID_Kategori` (`ID_Kategori`);

--
-- Indexes for table `master_berita`
--
ALTER TABLE `master_berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_berita_informasi`
--
ALTER TABLE `master_berita_informasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `master_detail_materi_ajar`
--
ALTER TABLE `master_detail_materi_ajar`
  ADD PRIMARY KEY (`ID_Materi_Ajar`,`ID_Sub_materi`),
  ADD KEY `ID_Materi_Ajar` (`ID_Materi_Ajar`);

--
-- Indexes for table `master_detail_user`
--
ALTER TABLE `master_detail_user`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `master_fasilitator`
--
ALTER TABLE `master_fasilitator`
  ADD PRIMARY KEY (`ID_User`);

--
-- Indexes for table `master_hasil_tani`
--
ALTER TABLE `master_hasil_tani`
  ADD PRIMARY KEY (`ID_Hasil`),
  ADD KEY `ID_Kategori` (`ID_Kategori`),
  ADD KEY `ID_Spesies` (`ID_Spesies`);

--
-- Indexes for table `master_jenis_sup`
--
ALTER TABLE `master_jenis_sup`
  ADD PRIMARY KEY (`ID_Jenis_Sup`);

--
-- Indexes for table `master_kategori`
--
ALTER TABLE `master_kategori`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indexes for table `master_kategori_alatbahan`
--
ALTER TABLE `master_kategori_alatbahan`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indexes for table `master_kategori_produk`
--
ALTER TABLE `master_kategori_produk`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indexes for table `master_kategori_t`
--
ALTER TABLE `master_kategori_t`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indexes for table `master_kategori_topik`
--
ALTER TABLE `master_kategori_topik`
  ADD PRIMARY KEY (`ID_kategori_topik`);

--
-- Indexes for table `master_kel_tani`
--
ALTER TABLE `master_kel_tani`
  ADD PRIMARY KEY (`ID_Kelompok_Tani`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `master_kode_biaya`
--
ALTER TABLE `master_kode_biaya`
  ADD PRIMARY KEY (`ID_Biaya`),
  ADD KEY `ID_Spesies` (`ID_Spesies`);

--
-- Indexes for table `master_materi_ajar`
--
ALTER TABLE `master_materi_ajar`
  ADD PRIMARY KEY (`ID_Materi_Ajar`),
  ADD KEY `ID_User` (`ID_User`),
  ADD KEY `ID_User_2` (`ID_User`);

--
-- Indexes for table `master_materi_pelatihan`
--
ALTER TABLE `master_materi_pelatihan`
  ADD PRIMARY KEY (`ID_Materi`),
  ADD KEY `ID_Materi` (`ID_Materi`),
  ADD KEY `Materi_Sebelumnya` (`Materi_Sebelumnya`);

--
-- Indexes for table `master_morf_tanaman`
--
ALTER TABLE `master_morf_tanaman`
  ADD PRIMARY KEY (`ID_Morfologi`);

--
-- Indexes for table `master_org_unit`
--
ALTER TABLE `master_org_unit`
  ADD PRIMARY KEY (`Org_Unit`),
  ADD KEY `Org_Unit_Atasan` (`Org_Unit_Atasan`);

--
-- Indexes for table `master_pelayanan`
--
ALTER TABLE `master_pelayanan`
  ADD PRIMARY KEY (`ID_Pelayanan`);

--
-- Indexes for table `master_petani`
--
ALTER TABLE `master_petani`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `master_peta_lahan`
--
ALTER TABLE `master_peta_lahan`
  ADD PRIMARY KEY (`ID_Lahan`);

--
-- Indexes for table `master_peta_lahan_detail`
--
ALTER TABLE `master_peta_lahan_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `master_peta_lahan_foto`
--
ALTER TABLE `master_peta_lahan_foto`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `master_peta_lahan_foto` (`ID_Lahan`);

--
-- Indexes for table `master_peta_lahan_tanaman`
--
ALTER TABLE `master_peta_lahan_tanaman`
  ADD PRIMARY KEY (`id_detail_tanaman`),
  ADD KEY `master_peta_lahan_tanaman_ibfk_1` (`ID_Spesies`),
  ADD KEY `master_peta_lahan_tanaman_ibfk_2` (`ID_Lahan`);

--
-- Indexes for table `master_produk_tani`
--
ALTER TABLE `master_produk_tani`
  ADD PRIMARY KEY (`ID_Produk`),
  ADD KEY `ID_Spesies` (`ID_Spesies`);

--
-- Indexes for table `master_spesies_tanaman`
--
ALTER TABLE `master_spesies_tanaman`
  ADD PRIMARY KEY (`ID_Spesies`),
  ADD KEY `ID_Morfologi` (`ID_Morfologi`);

--
-- Indexes for table `master_supplier`
--
ALTER TABLE `master_supplier`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `ID_Jenis_Sup` (`ID_Jenis_Sup`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `master_ternak`
--
ALTER TABLE `master_ternak`
  ADD PRIMARY KEY (`nomor_ternak`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`ID_User`);

--
-- Indexes for table `master_user_kat`
--
ALTER TABLE `master_user_kat`
  ADD PRIMARY KEY (`nomor`),
  ADD KEY `ID_Kategori` (`ID_Kategori`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `master_user_org`
--
ALTER TABLE `master_user_org`
  ADD PRIMARY KEY (`NIK`),
  ADD UNIQUE KEY `NIK_2` (`NIK`),
  ADD KEY `Org_Unit` (`Org_Unit`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`Nama_Provinsi`);

--
-- Indexes for table `ta`
--
ALTER TABLE `ta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`ID_Topic`),
  ADD KEY `FK User` (`ID_User`);

--
-- Indexes for table `trans_aktivitas_pertanian`
--
ALTER TABLE `trans_aktivitas_pertanian`
  ADD PRIMARY KEY (`ID_aktifitas_petani`),
  ADD KEY `ID_Aktivitas` (`ID_Petani`),
  ADD KEY `ID_aktifitas_spesies` (`ID_aktifitas_spesies`);

--
-- Indexes for table `trans_anggaraan`
--
ALTER TABLE `trans_anggaraan`
  ADD PRIMARY KEY (`ID_anggaran`),
  ADD KEY `ID_User` (`ID_User`,`ID_Aktifitas`),
  ADD KEY `ID_Aktifitas` (`ID_Aktifitas`);

--
-- Indexes for table `trans_ang_petani`
--
ALTER TABLE `trans_ang_petani`
  ADD PRIMARY KEY (`ID_Kelompok_Tani`,`ID_User`),
  ADD KEY `ID_Kelompok_Tani` (`ID_Kelompok_Tani`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `trans_bukti_pembayaran`
--
ALTER TABLE `trans_bukti_pembayaran`
  ADD PRIMARY KEY (`ID_Bukti`);

--
-- Indexes for table `trans_detail_anggaran`
--
ALTER TABLE `trans_detail_anggaran`
  ADD PRIMARY KEY (`ID_detail_anggaran`),
  ADD KEY `ID_detail_anggaran` (`ID_anggaran`,`ID_biaya`);

--
-- Indexes for table `trans_harga_prod`
--
ALTER TABLE `trans_harga_prod`
  ADD UNIQUE KEY `ID_Produk_2` (`ID_Produk`,`Tanggal`),
  ADD KEY `ID_Produk` (`ID_Produk`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `trans_hasil_panen`
--
ALTER TABLE `trans_hasil_panen`
  ADD PRIMARY KEY (`ID_Petani`,`ID_Spesies`,`Tahun_Panen`,`Periode_Panen`),
  ADD KEY `ID_Petani` (`ID_Petani`),
  ADD KEY `ID_Spesies` (`ID_Spesies`),
  ADD KEY `ID_Produk` (`ID_Produk`);

--
-- Indexes for table `trans_kalender_tanam`
--
ALTER TABLE `trans_kalender_tanam`
  ADD PRIMARY KEY (`ID_Spesies`,`Masa_Tanam`,`Kabupaten`),
  ADD KEY `ID_Spesies` (`ID_Spesies`);

--
-- Indexes for table `trans_komentar_diskusi`
--
ALTER TABLE `trans_komentar_diskusi`
  ADD PRIMARY KEY (`nomor_komentar`),
  ADD KEY `ID_topik` (`ID_topik`);

--
-- Indexes for table `trans_pelaksanaan_pelatihan`
--
ALTER TABLE `trans_pelaksanaan_pelatihan`
  ADD KEY `ID_Fasilitator` (`ID_Permintaan_Pelatihan`),
  ADD KEY `ID_Permintaan_Pelatihan` (`ID_Permintaan_Pelatihan`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `trans_pembayaran`
--
ALTER TABLE `trans_pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD KEY `ID_Permintaan` (`ID_Permintaan`,`ID_User`),
  ADD KEY `ID_User` (`ID_User`);

--
-- Indexes for table `trans_penawaran_prod_tani`
--
ALTER TABLE `trans_penawaran_prod_tani`
  ADD PRIMARY KEY (`ID_Penawaran`),
  ADD UNIQUE KEY `Nomor` (`Nomor`),
  ADD KEY `ID_Supplier` (`ID_User`,`ID_Produk`),
  ADD KEY `ID_Barang` (`ID_Produk`);

--
-- Indexes for table `trans_permintaan`
--
ALTER TABLE `trans_permintaan`
  ADD PRIMARY KEY (`ID_Permintaan`);

--
-- Indexes for table `trans_permintaan_pelatihan`
--
ALTER TABLE `trans_permintaan_pelatihan`
  ADD PRIMARY KEY (`ID_Permintaan_Pelatihan`),
  ADD KEY `ID_User` (`ID_User`,`ID_Materi`),
  ADD KEY `ID_Materi` (`ID_Materi`),
  ADD KEY `ID_User_2` (`ID_User`),
  ADD KEY `ID_Materi_2` (`ID_Materi`);

--
-- Indexes for table `trans_permintaan_pelayanan`
--
ALTER TABLE `trans_permintaan_pelayanan`
  ADD PRIMARY KEY (`ID_Permintaan_Pelayanan`),
  ADD KEY `ID_User` (`ID_User`,`ID_Pelayanan`),
  ADD KEY `ID_Pelayanan` (`ID_Pelayanan`);

--
-- Indexes for table `trans_realisasi_biaya`
--
ALTER TABLE `trans_realisasi_biaya`
  ADD KEY `ID_detail_anggaran` (`ID_detail_anggaran`);

--
-- Indexes for table `trans_struk_org`
--
ALTER TABLE `trans_struk_org`
  ADD KEY `ID_Kelompok_Tani` (`ID_Kelompok_Tani`);

--
-- Indexes for table `trans_topik_diskusi`
--
ALTER TABLE `trans_topik_diskusi`
  ADD PRIMARY KEY (`ID_topik`),
  ADD KEY `ID_kategori_topik` (`ID_kategori_topik`,`ID_user`),
  ADD KEY `ID_user` (`ID_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balas_komentar`
--
ALTER TABLE `balas_komentar`
  MODIFY `ID_Balas` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `ID_Chat` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `f_materi`
--
ALTER TABLE `f_materi`
  MODIFY `ID_File` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `ID_Komentar` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `kode_kurir` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `master_berita`
--
ALTER TABLE `master_berita`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_berita_informasi`
--
ALTER TABLE `master_berita_informasi`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `master_kategori_t`
--
ALTER TABLE `master_kategori_t`
  MODIFY `ID_Kategori` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `master_peta_lahan`
--
ALTER TABLE `master_peta_lahan`
  MODIFY `ID_Lahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `master_peta_lahan_detail`
--
ALTER TABLE `master_peta_lahan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `master_peta_lahan_foto`
--
ALTER TABLE `master_peta_lahan_foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `master_peta_lahan_tanaman`
--
ALTER TABLE `master_peta_lahan_tanaman`
  MODIFY `id_detail_tanaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `master_user_kat`
--
ALTER TABLE `master_user_kat`
  MODIFY `nomor` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ta`
--
ALTER TABLE `ta`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `ID_Topic` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `trans_bukti_pembayaran`
--
ALTER TABLE `trans_bukti_pembayaran`
  MODIFY `ID_Bukti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `trans_komentar_diskusi`
--
ALTER TABLE `trans_komentar_diskusi`
  MODIFY `nomor_komentar` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `trans_penawaran_prod_tani`
--
ALTER TABLE `trans_penawaran_prod_tani`
  MODIFY `Nomor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `trans_permintaan`
--
ALTER TABLE `trans_permintaan`
  MODIFY `ID_Permintaan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_aktifitas_pelatihan`
--
ALTER TABLE `log_aktifitas_pelatihan`
  ADD CONSTRAINT `log_aktifitas_pelatihan_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `log_aktifitas_pelatihan_ibfk_3` FOREIGN KEY (`ID_Permintaan_Pelatihan`) REFERENCES `trans_permintaan_pelatihan` (`ID_Permintaan_Pelatihan`);

--
-- Constraints for table `log_aktifitas_pelayanan`
--
ALTER TABLE `log_aktifitas_pelayanan`
  ADD CONSTRAINT `log_aktifitas_pelayanan_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `log_aktifitas_pelayanan_ibfk_3` FOREIGN KEY (`ID_Permintaan_Pelayanan`) REFERENCES `trans_permintaan_pelayanan` (`ID_Permintaan_Pelayanan`);

--
-- Constraints for table `log_biaya_keluar`
--
ALTER TABLE `log_biaya_keluar`
  ADD CONSTRAINT `log_biaya_keluar_ibfk_1` FOREIGN KEY (`ID_Aktivitas`) REFERENCES `master_aktifitas_spesies` (`ID_Aktivitas`),
  ADD CONSTRAINT `log_biaya_keluar_ibfk_2` FOREIGN KEY (`ID_Biaya`) REFERENCES `master_kode_biaya` (`ID_Biaya`),
  ADD CONSTRAINT `log_biaya_keluar_ibfk_3` FOREIGN KEY (`ID_Petani`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `log_biaya_keluar_ibfk_4` FOREIGN KEY (`ID_Spesies`) REFERENCES `master_spesies_tanaman` (`ID_Spesies`),
  ADD CONSTRAINT `log_biaya_keluar_ibfk_5` FOREIGN KEY (`ID_aktifitas_spesies`) REFERENCES `master_aktifitas_spesies` (`ID_aktifitas_spesies`);

--
-- Constraints for table `log_penawaran_prod`
--
ALTER TABLE `log_penawaran_prod`
  ADD CONSTRAINT `log_penawaran_prod_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `log_penawaran_prod_ibfk_3` FOREIGN KEY (`ID_Penawaran`) REFERENCES `trans_penawaran_prod_tani` (`ID_Penawaran`),
  ADD CONSTRAINT `log_penawaran_prod_ibfk_4` FOREIGN KEY (`ID_User`) REFERENCES `master_supplier` (`ID_User`);

--
-- Constraints for table `log_user_trans`
--
ALTER TABLE `log_user_trans`
  ADD CONSTRAINT `log_user_trans_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `log_user_trans_ibfk_2` FOREIGN KEY (`ID_Aktivitas`) REFERENCES `master_aktivitas` (`ID_Aktivitas`);

--
-- Constraints for table `master_aktifitas_spesies`
--
ALTER TABLE `master_aktifitas_spesies`
  ADD CONSTRAINT `master_aktifitas_spesies_ibfk_1` FOREIGN KEY (`ID_Spesies`) REFERENCES `master_spesies_tanaman` (`ID_Spesies`),
  ADD CONSTRAINT `master_aktifitas_spesies_ibfk_2` FOREIGN KEY (`ID_Aktivitas`) REFERENCES `master_aktivitas` (`ID_Aktivitas`);

--
-- Constraints for table `master_berita_informasi`
--
ALTER TABLE `master_berita_informasi`
  ADD CONSTRAINT `master_berita_informasi_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `master_user_org` (`NIK`);

--
-- Constraints for table `master_detail_materi_ajar`
--
ALTER TABLE `master_detail_materi_ajar`
  ADD CONSTRAINT `master_detail_materi_ajar_ibfk_1` FOREIGN KEY (`ID_Materi_Ajar`) REFERENCES `master_materi_ajar` (`ID_Materi_Ajar`);

--
-- Constraints for table `master_detail_user`
--
ALTER TABLE `master_detail_user`
  ADD CONSTRAINT `master_detail_user_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `master_kel_tani`
--
ALTER TABLE `master_kel_tani`
  ADD CONSTRAINT `master_kel_tani_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`) ON UPDATE CASCADE;

--
-- Constraints for table `master_kode_biaya`
--
ALTER TABLE `master_kode_biaya`
  ADD CONSTRAINT `master_kode_biaya_ibfk_1` FOREIGN KEY (`ID_Spesies`) REFERENCES `master_spesies_tanaman` (`ID_Spesies`);

--
-- Constraints for table `master_materi_ajar`
--
ALTER TABLE `master_materi_ajar`
  ADD CONSTRAINT `master_materi_ajar_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `master_materi_pelatihan`
--
ALTER TABLE `master_materi_pelatihan`
  ADD CONSTRAINT `master_materi_pelatihan_ibfk_1` FOREIGN KEY (`Materi_Sebelumnya`) REFERENCES `master_materi_pelatihan` (`ID_Materi`);

--
-- Constraints for table `master_org_unit`
--
ALTER TABLE `master_org_unit`
  ADD CONSTRAINT `master_org_unit_ibfk_1` FOREIGN KEY (`Org_Unit_Atasan`) REFERENCES `master_org_unit` (`Org_Unit`);

--
-- Constraints for table `master_petani`
--
ALTER TABLE `master_petani`
  ADD CONSTRAINT `master_petani_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `master_peta_lahan_foto`
--
ALTER TABLE `master_peta_lahan_foto`
  ADD CONSTRAINT `master_peta_lahan_foto` FOREIGN KEY (`ID_Lahan`) REFERENCES `master_peta_lahan` (`ID_Lahan`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `master_peta_lahan_tanaman`
--
ALTER TABLE `master_peta_lahan_tanaman`
  ADD CONSTRAINT `master_peta_lahan_tanaman_ibfk_1` FOREIGN KEY (`ID_Spesies`) REFERENCES `master_spesies_tanaman` (`ID_Spesies`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `master_peta_lahan_tanaman_ibfk_2` FOREIGN KEY (`ID_Lahan`) REFERENCES `master_peta_lahan` (`ID_Lahan`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `master_produk_tani`
--
ALTER TABLE `master_produk_tani`
  ADD CONSTRAINT `master_produk_tani_ibfk_1` FOREIGN KEY (`ID_Spesies`) REFERENCES `master_spesies_tanaman` (`ID_Spesies`);

--
-- Constraints for table `master_spesies_tanaman`
--
ALTER TABLE `master_spesies_tanaman`
  ADD CONSTRAINT `master_spesies_tanaman_ibfk_1` FOREIGN KEY (`ID_Morfologi`) REFERENCES `master_morf_tanaman` (`ID_Morfologi`);

--
-- Constraints for table `master_supplier`
--
ALTER TABLE `master_supplier`
  ADD CONSTRAINT `master_supplier_ibfk_1` FOREIGN KEY (`ID_Jenis_Sup`) REFERENCES `master_jenis_sup` (`ID_Jenis_Sup`),
  ADD CONSTRAINT `master_supplier_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `master_ternak`
--
ALTER TABLE `master_ternak`
  ADD CONSTRAINT `master_ternak_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_petani` (`ID_User`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `master_user_kat`
--
ALTER TABLE `master_user_kat`
  ADD CONSTRAINT `master_user_kat_ibfk_1` FOREIGN KEY (`ID_Kategori`) REFERENCES `master_kategori` (`ID_Kategori`),
  ADD CONSTRAINT `master_user_kat_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `master_user_org`
--
ALTER TABLE `master_user_org`
  ADD CONSTRAINT `master_user_org_ibfk_1` FOREIGN KEY (`Org_Unit`) REFERENCES `master_org_unit` (`Org_Unit`);

--
-- Constraints for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD CONSTRAINT `pemberitahuan_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `trans_aktivitas_pertanian`
--
ALTER TABLE `trans_aktivitas_pertanian`
  ADD CONSTRAINT `trans_aktivitas_pertanian_ibfk_1` FOREIGN KEY (`ID_Petani`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `trans_aktivitas_pertanian_ibfk_2` FOREIGN KEY (`ID_aktifitas_spesies`) REFERENCES `master_aktifitas_spesies` (`ID_aktifitas_spesies`);

--
-- Constraints for table `trans_anggaraan`
--
ALTER TABLE `trans_anggaraan`
  ADD CONSTRAINT `trans_anggaraan_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `trans_anggaraan_ibfk_2` FOREIGN KEY (`ID_Aktifitas`) REFERENCES `master_aktivitas` (`ID_Aktivitas`);

--
-- Constraints for table `trans_ang_petani`
--
ALTER TABLE `trans_ang_petani`
  ADD CONSTRAINT `trans_ang_petani_ibfk_1` FOREIGN KEY (`ID_Kelompok_Tani`) REFERENCES `master_kel_tani` (`ID_Kelompok_Tani`) ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_ang_petani_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `master_petani` (`ID_User`),
  ADD CONSTRAINT `trans_ang_petani_ibfk_3` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `trans_detail_anggaran`
--
ALTER TABLE `trans_detail_anggaran`
  ADD CONSTRAINT `trans_detail_anggaran_ibfk_1` FOREIGN KEY (`ID_anggaran`) REFERENCES `trans_anggaraan` (`ID_anggaran`);

--
-- Constraints for table `trans_hasil_panen`
--
ALTER TABLE `trans_hasil_panen`
  ADD CONSTRAINT `trans_hasil_panen_ibfk_1` FOREIGN KEY (`ID_Petani`) REFERENCES `master_petani` (`ID_User`),
  ADD CONSTRAINT `trans_hasil_panen_ibfk_2` FOREIGN KEY (`ID_Spesies`) REFERENCES `master_spesies_tanaman` (`ID_Spesies`),
  ADD CONSTRAINT `trans_hasil_panen_ibfk_3` FOREIGN KEY (`ID_Produk`) REFERENCES `master_produk_tani` (`ID_Produk`);

--
-- Constraints for table `trans_kalender_tanam`
--
ALTER TABLE `trans_kalender_tanam`
  ADD CONSTRAINT `trans_kalender_tanam_ibfk_1` FOREIGN KEY (`ID_Spesies`) REFERENCES `master_spesies_tanaman` (`ID_Spesies`);

--
-- Constraints for table `trans_komentar_diskusi`
--
ALTER TABLE `trans_komentar_diskusi`
  ADD CONSTRAINT `trans_komentar_diskusi_ibfk_1` FOREIGN KEY (`ID_topik`) REFERENCES `trans_topik_diskusi` (`ID_topik`);

--
-- Constraints for table `trans_pelaksanaan_pelatihan`
--
ALTER TABLE `trans_pelaksanaan_pelatihan`
  ADD CONSTRAINT `trans_pelaksanaan_pelatihan_ibfk_2` FOREIGN KEY (`ID_Permintaan_Pelatihan`) REFERENCES `trans_permintaan_pelatihan` (`ID_Permintaan_Pelatihan`),
  ADD CONSTRAINT `trans_pelaksanaan_pelatihan_ibfk_3` FOREIGN KEY (`ID_User`) REFERENCES `master_fasilitator` (`ID_User`),
  ADD CONSTRAINT `trans_pelaksanaan_pelatihan_ibfk_4` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`);

--
-- Constraints for table `trans_permintaan_pelatihan`
--
ALTER TABLE `trans_permintaan_pelatihan`
  ADD CONSTRAINT `trans_permintaan_pelatihan_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `trans_permintaan_pelatihan_ibfk_2` FOREIGN KEY (`ID_Materi`) REFERENCES `master_materi_pelatihan` (`ID_Materi`);

--
-- Constraints for table `trans_permintaan_pelayanan`
--
ALTER TABLE `trans_permintaan_pelayanan`
  ADD CONSTRAINT `trans_permintaan_pelayanan_ibfk_2` FOREIGN KEY (`ID_User`) REFERENCES `master_user` (`ID_User`),
  ADD CONSTRAINT `trans_permintaan_pelayanan_ibfk_3` FOREIGN KEY (`ID_Pelayanan`) REFERENCES `master_pelayanan` (`ID_Pelayanan`);

--
-- Constraints for table `trans_realisasi_biaya`
--
ALTER TABLE `trans_realisasi_biaya`
  ADD CONSTRAINT `trans_realisasi_biaya_ibfk_1` FOREIGN KEY (`ID_detail_anggaran`) REFERENCES `trans_detail_anggaran` (`ID_detail_anggaran`);

--
-- Constraints for table `trans_struk_org`
--
ALTER TABLE `trans_struk_org`
  ADD CONSTRAINT `trans_struk_org_ibfk_1` FOREIGN KEY (`ID_Kelompok_Tani`) REFERENCES `master_kel_tani` (`ID_Kelompok_Tani`) ON UPDATE CASCADE;

--
-- Constraints for table `trans_topik_diskusi`
--
ALTER TABLE `trans_topik_diskusi`
  ADD CONSTRAINT `trans_topik_diskusi_ibfk_1` FOREIGN KEY (`ID_kategori_topik`) REFERENCES `master_kategori_topik` (`ID_kategori_topik`),
  ADD CONSTRAINT `trans_topik_diskusi_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `master_user` (`ID_User`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
