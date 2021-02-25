-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 25 Feb 2021 pada 04.09
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisfokol_janissary3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_video2`
--

CREATE TABLE `guru_mapel_video2` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `filex` longtext DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_video2`
--

INSERT INTO `guru_mapel_video2` (`kd`, `kd_guru_mapel`, `filex`, `postdate`) VALUES
('8b82a26a8a58555283d2314fb1b8890d', '041c7cc5a8fb9320f6f3b538ce538b4c', '20210224173735.mp4', '2021-02-24 17:37:35'),
('5fabbc222760139dd8575353aec21f4b', '041c7cc5a8fb9320f6f3b538ce538b4c', '20210224173736.mp4', '2021-02-24 17:37:36'),
('6037612c887e5a0c2d957b52ff4bc66a', '041c7cc5a8fb9320f6f3b538ce538b4c', '20210224173739.mp4', '2021-02-24 17:37:39');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru_mapel_video2`
--
ALTER TABLE `guru_mapel_video2`
  ADD PRIMARY KEY (`kd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
