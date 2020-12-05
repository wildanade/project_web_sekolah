-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 03:00 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` varchar(5) NOT NULL,
  `judul_berita` varchar(100) NOT NULL,
  `tgl_post` varchar(25) NOT NULL,
  `isi_berita` text NOT NULL,
  `jml_view` int(4) NOT NULL,
  `id_kategori` varchar(4) NOT NULL,
  `id_admin` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul_berita`, `tgl_post`, `isi_berita`, `jml_view`, `id_kategori`, `id_admin`) VALUES
('IB001', 'Penerimaan Siswa Baru Tahun 2021/2022', '02 - Desember - 2020', 'aaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbb ccccccccccccccccccccccccc dddddddddddddddd\r\naaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbb ccccccccccccccccccccccccc dddddddddddddddd\r\naaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbb ccccccccccccccccccccccccc dddddddddddddddd', 5, 'IK02', 'IA001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` varchar(4) NOT NULL,
  `nm_kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nm_kategori`) VALUES
('IK01', 'Event'),
('IK02', 'Info PSB');

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE `tb_login` (
  `id_admin` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`id_admin`, `username`, `password`, `status`) VALUES
('IA001', 'surya', '12345678', 'aktif'),
('IA002', 'wildan', '87654321', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pendaftaran`
--

CREATE TABLE `tb_pendaftaran` (
  `id_pendaftar` varchar(6) NOT NULL,
  `nm_lengkap` varchar(50) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `tmpt_lahir` varchar(100) NOT NULL,
  `tgl_lahir` varchar(25) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `nm_ayah` varchar(50) NOT NULL,
  `pekerjaan_ayah` varchar(50) NOT NULL,
  `no_ayah` varchar(15) NOT NULL,
  `nm_ibu` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(50) NOT NULL,
  `no_ibu` varchar(15) NOT NULL,
  `penghasilan_ortu` varchar(50) NOT NULL,
  `kat_pendaftaran` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_pendaftaran`
--
ALTER TABLE `tb_pendaftaran`
  ADD PRIMARY KEY (`id_pendaftar`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD CONSTRAINT `tb_berita_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tb_login` (`id_admin`),
  ADD CONSTRAINT `tb_berita_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
