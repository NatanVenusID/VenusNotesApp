-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2020 at 07:22 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_venusuniversity`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(125) NOT NULL,
  `isi` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `foto`, `tgl_berita`) VALUES
(1, 'Sepinya Ragunan di Hari Pertama Long Weekend', 'Jakarta - Libur panjang rupanya tak membuat kawasan Taman Margasatwa Ragunan dibanjiri pengunjung. Saat ini Taman Margasatwa tersebut beroperasi setiap hari mulai pukul 08.00-12.00 WIB.', 'berita2.jpg', '2020-08-20 19:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `id_istilah` int(20) NOT NULL,
  `istilah` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `arti` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kamus`
--

INSERT INTO `tb_kamus` (`id_istilah`, `istilah`, `arti`) VALUES
(1, 'dart', 'bahasa flutter'),
(4, 'integer', 'Tipe data yang hanya bilang bulat '),
(5, 'SizedBox', 'Memberi jarak ke widget dibawahnya'),
(6, 'boolean', 'Tipe data yang hanya berisi benar atau salah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_merupa`
--

CREATE TABLE `tb_merupa` (
  `id_user` int(20) NOT NULL,
  `username` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `fullname` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_daftar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_merupa`
--

INSERT INTO `tb_merupa` (`id_user`, `username`, `email`, `fullname`, `password`, `alamat`, `tgl_daftar`) VALUES
(1, 'a', 'a', 'a', '0cc175b9c0f1b6a831c399e269772661', 'a', '2020-08-23 14:23:42'),
(2, 'natan92', 'natan92@venus.com', 'natanael krisetya', 'e10adc3949ba59abbe56e057f20f883e', 'kudus', '2020-08-23 15:43:51'),
(3, 'eirene93', 'eirene93@venus.com', 'eirene', 'e10adc3949ba59abbe56e057f20f883e', 'semarang', '2020-08-25 20:08:02'),
(4, 'novita97', 'novita@venus.com', 'novita', 'e10adc3949ba59abbe56e057f20f883e', 'kudus', '2020-08-25 20:10:05'),
(5, 'zzz', 'zzz', 'zzz', 'f3abb86bd34cf4d52698f14c0da1dc60', 'zzz\n\n', '2020-08-27 19:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_notes`
--

CREATE TABLE `tb_notes` (
  `id` int(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_notes`
--

INSERT INTO `tb_notes` (`id`, `title`, `content`) VALUES
(29, 'hello', 'thanks');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(20) NOT NULL,
  `username` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_daftar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `email`, `full_name`, `sex`, `password`, `alamat`, `tgl_daftar`) VALUES
(3, 'asa', 'as', 'asa', 'as', 'f970e2767d0cfe75876ea857f92e319b', 'as', '2020-08-17 19:10:02'),
(4, 'eirene98', 'eirene98@venus.com', 'eirene charalita', 'perempuan', 'e10adc3949ba59abbe56e057f20f883e', 'kudus', '2020-08-17 19:27:32'),
(5, 'd', 'd', 'd', 'd', '8277e0910d750195b448797616e091ad', 'd', '2020-08-17 20:19:09'),
(6, '', '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '2020-08-17 20:55:26'),
(7, 'c', 'd', 'd', 'Perempuan', '8277e0910d750195b448797616e091ad', 'd', '2020-08-18 18:05:48'),
(8, 'asaasasa', 'asasasasa', 'asa', 'as', 'f970e2767d0cfe75876ea857f92e319b', 'as', '2020-08-18 19:53:48'),
(9, 'www', 'ee', 'ee', 'Laki-laki', 'd2f2297d6e829cd3493aa7de4416a18f', 'eeee', '2020-08-18 19:58:15'),
(10, 'admin', 'aaa', 'admin', 'Laki-laki', '4297f44b13955235245b2497399d7a93', 'ssdd', '2020-08-18 20:04:08'),
(11, 'ggggggj', 'gg', 'gg', 'Laki-laki', 'd40cee75b933268d16da9472ff14b1ee', 'gg', '2020-08-19 20:31:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`id_istilah`);

--
-- Indexes for table `tb_merupa`
--
ALTER TABLE `tb_merupa`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tb_notes`
--
ALTER TABLE `tb_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_kamus`
--
ALTER TABLE `tb_kamus`
  MODIFY `id_istilah` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_merupa`
--
ALTER TABLE `tb_merupa`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_notes`
--
ALTER TABLE `tb_notes`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
