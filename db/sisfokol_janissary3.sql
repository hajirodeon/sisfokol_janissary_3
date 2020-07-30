-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 30 Jul 2020 pada 05.58
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

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
-- Struktur dari tabel `adminx`
--

CREATE TABLE `adminx` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `usernamex` varchar(15) NOT NULL DEFAULT '',
  `passwordx` varchar(50) NOT NULL DEFAULT '',
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `adminx`
--

INSERT INTO `adminx` (`kd`, `usernamex`, `passwordx`, `postdate`) VALUES
('e4ea2f7dfb2e5c51e38998599e90afc2', 'admin', '14e1398817e2ff21d2268eb5e169de65', '2020-07-29 19:58:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel`
--

CREATE TABLE `guru_mapel` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `postdate` datetime DEFAULT NULL,
  `mapel_kode` varchar(100) DEFAULT NULL,
  `mapel_nama` varchar(100) DEFAULT NULL,
  `tapel` varchar(100) DEFAULT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel`
--

INSERT INTO `guru_mapel` (`kd`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_kode`, `user_nama`) VALUES
('041c7cc5a8fb9320f6f3b538ce538b4c', '2020-07-16 04:35:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '170001', 'Orang BIASAWAE'),
('bed40a0fdbd30f3d100fb2bc9b6b8fdd', '2020-07-16 04:35:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 2', '1700011', 'Joker'),
('0c30f1a85dc9c7c4275aa8afb7ed51b5', '2020-07-29 21:50:17', 'ELEK', 'Elektronika', '2019xgmringx2020', 'X TGB 1', '170003', 'Keenu Reeves'),
('fb2811f4b77a8d8e1c86807dd81d7a57', '2020-07-29 21:50:17', 'IPA', 'IPA', '2020xgmringx2021', 'X TGB 1', '170006', 'Jet Li'),
('3caacc1f3f86c1bd743481ba732eb65f', '2020-07-17 03:58:04', 'PENJASKES', 'Pendidikan Jasmani dan Kesehatan', '2020xgmringx2021', 'X TKJ 2', '170007', 'Bruce Lee'),
('5b8e5fa8f5be23d7f75532500919c67e', '2020-07-29 08:04:59', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', '1700011', 'Joker'),
('c87c64244d02b4a50c838ac30910c147', '2020-07-29 21:50:17', 'BJAWA', 'Bahasa Jawa', '2020xgmringx2021', 'X TGB 2', '1700011', 'Joker');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_artikel`
--

CREATE TABLE `guru_mapel_artikel` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `rangkuman` varchar(255) DEFAULT NULL,
  `isi` longtext DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_artikel`
--

INSERT INTO `guru_mapel_artikel` (`kd`, `kd_guru_mapel`, `kategori`, `judul`, `rangkuman`, `isi`, `postdate`) VALUES
('3c3489b73c6f241b1405ef43fd568f61', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Praktek', '11', '2333', 'xkkirixpxkkananxsad sad sadxkkirixxgmringxpxkkananx', '2020-07-25 08:16:13'),
('bef9fa527a86c2b5450a0b119ba3403f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Kliping', 'judul artikel1', 'sekilas...', 'xkkirixpxkkananxisi...xkkirixxgmringxpxkkananx', '2020-07-27 09:33:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_artikel_msg`
--

CREATE TABLE `guru_mapel_artikel_msg` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel_artikel` varchar(50) DEFAULT NULL,
  `dari` varchar(50) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `msg` longtext DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_artikel_msg`
--

INSERT INTO `guru_mapel_artikel_msg` (`kd`, `kd_guru_mapel_artikel`, `dari`, `user_kode`, `user_nama`, `msg`, `postdate`) VALUES
('3840b19d3ac159d09b226616ed9b655e', '1da0e8c0fb54d2bf4c24c2bbbe0acb2a', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok deh.....', '2020-07-24 14:14:30'),
('185bfbc57996ec07298e4f6cb174f1af', '1da0e8c0fb54d2bf4c24c2bbbe0acb2a', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'sip deh....', '2020-07-24 14:14:40'),
('a6f7258e65dff0d9ae39f9bc5623ad0e', 'cb830a3138e43fc167356e815e176e2f', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok...', '2020-07-25 08:14:10'),
('fe6cfc5fe265c3391a29fad06aab9f9b', 'cb830a3138e43fc167356e815e176e2f', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'coba deh... dipikir...', '2020-07-25 08:14:22'),
('dc399bc683f6360997b64005f1ed4423', '3c3489b73c6f241b1405ef43fd568f61', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok deh', '2020-07-25 08:41:03'),
('de36c2e0674b08735058aae9ec4acb44', '3c3489b73c6f241b1405ef43fd568f61', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok sip....', '2020-07-26 03:02:48'),
('5de2b3f92116fbcfbfcdad97fbdf56a8', 'cb830a3138e43fc167356e815e176e2f', 'c8501a58dde52c15ac3ac56fbe669603', NULL, NULL, 'ok ya...', '2020-07-26 03:48:36'),
('8bb65a59108e0afcb4cd44642201aabf', 'cb830a3138e43fc167356e815e176e2f', 'c8501a58dde52c15ac3ac56fbe669603', NULL, NULL, 'ok sip.....', '2020-07-26 03:51:58'),
('8b2176781ff8f4015aace8189addd67d', '3c3489b73c6f241b1405ef43fd568f61', 'c8501a58dde52c15ac3ac56fbe669603', NULL, NULL, 'Sip deh...', '2020-07-26 05:31:13'),
('7ca48306b24b48625ba81cdd2df18533', 'cb830a3138e43fc167356e815e176e2f', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'Ok ya...', '2020-07-26 08:30:29'),
('b66f4cb5e6d4953518a2fc53a386e48b', 'cb830a3138e43fc167356e815e176e2f', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'Akuhajir', '2020-07-26 08:31:12'),
('e8ed91f33d97adb8dbdd9905e1ac6e29', '3c3489b73c6f241b1405ef43fd568f61', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'Malu dong', '2020-07-26 08:32:29'),
('2b47d7be556f83aa04e13adf2cf3b38d', '3c3489b73c6f241b1405ef43fd568f61', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'mewah.....', '2020-07-26 14:30:38'),
('eafb97ed458570a0399edfe558800bb8', 'bef9fa527a86c2b5450a0b119ba3403f', '193718556c9ea38a77468dedf9a57d7e', NULL, NULL, 'ok...', '2020-07-29 07:54:42'),
('67aebe6b5ccca32b93d9c049ccedc7b9', 'bef9fa527a86c2b5450a0b119ba3403f', '193718556c9ea38a77468dedf9a57d7e', NULL, NULL, 'siap', '2020-07-29 07:56:50'),
('2cd4c35204844300a1b5a12e205846dd', 'bef9fa527a86c2b5450a0b119ba3403f', '193718556c9ea38a77468dedf9a57d7e', NULL, NULL, 'sip...', '2020-07-29 07:57:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_chatroom`
--

CREATE TABLE `guru_mapel_chatroom` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `kd_user` varchar(50) DEFAULT NULL,
  `user_tipe` varchar(100) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `msg` longtext DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_chatroom`
--

INSERT INTO `guru_mapel_chatroom` (`kd`, `kd_guru_mapel`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `msg`, `postdate`) VALUES
('1391d13ef6d7753fc23748a12b936972', '041c7cc5a8fb9320f6f3b538ce538b4c', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, NULL, 'halo anak xstrix anak.... sedang apa nih...???', '2020-07-26 04:42:46'),
('bf502badd49607a0cfbf43a6c7bcb8ae', '041c7cc5a8fb9320f6f3b538ce538b4c', '772c45c3a19d620b7cbf864a377eee3f', 'SISWA', '280010', 'Julia Perez', 'wah.... apaan nih...', '2020-07-26 04:40:18'),
('b73ab931eafc3b0aa1c6add3da5a7e77', '041c7cc5a8fb9320f6f3b538ce538b4c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Orang TeknikNIh', 'bagus deh...', '2020-07-26 04:36:46'),
('37aaafc2d2efe993b4adcf1d77e2aa7a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Orang TeknikNIh', 'pasti bisa dong', '2020-07-26 04:36:08'),
('0422ce04b9cd0abec27d593aaeebd1d1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Orang TeknikNIh', 'coba a...', '2020-07-26 04:36:01'),
('00ac23ee8a49e11f2c1dd3b961a4adec', '041c7cc5a8fb9320f6f3b538ce538b4c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Orang TeknikNIh', 'ok...', '2020-07-26 05:30:49'),
('5c3c1e9957e546f124da4cf2f76ecd63', '041c7cc5a8fb9320f6f3b538ce538b4c', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, NULL, 'selamat sore....', '2020-07-27 09:43:34'),
('96a16f3566b4c672567c995c4589ecac', '041c7cc5a8fb9320f6f3b538ce538b4c', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, NULL, 'sore...', '2020-07-28 18:24:24'),
('4dae8372632dbad025e39b5e57cf7e5e', '041c7cc5a8fb9320f6f3b538ce538b4c', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'pagi ya...', '2020-07-29 07:49:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_file_materi`
--

CREATE TABLE `guru_mapel_file_materi` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `ket` longtext DEFAULT NULL,
  `filex` longtext DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_file_materi`
--

INSERT INTO `guru_mapel_file_materi` (`kd`, `kd_guru_mapel`, `ket`, `filex`, `postdate`) VALUES
('ce84fd60f3e16725f8698c8de791500c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'teknik zoom', 'zoom.satelite.mp4.zip', '2020-07-30 09:32:26'),
('c140e60596330b4dfcf4098b6db436f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'teknik zoom lagi...', 'zoom.satelite.mp4.zip', '2020-07-30 09:32:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_forum`
--

CREATE TABLE `guru_mapel_forum` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `topik` varchar(255) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_forum`
--

INSERT INTO `guru_mapel_forum` (`kd`, `kd_guru_mapel`, `topik`, `postdate`) VALUES
('ff85e9d1253fed3cb26eef8746e4a347', '041c7cc5a8fb9320f6f3b538ce538b4c', 'ok...', '2020-07-24 13:56:19'),
('9b5a8347770b7c869fb26f9bcd3e3bdc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'coba forum... topik...', '2020-07-25 08:55:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_forum_msg`
--

CREATE TABLE `guru_mapel_forum_msg` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel_forum` varchar(50) DEFAULT NULL,
  `dari` varchar(50) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_forum_msg`
--

INSERT INTO `guru_mapel_forum_msg` (`kd`, `kd_guru_mapel_forum`, `dari`, `user_kode`, `user_nama`, `msg`, `postdate`) VALUES
('33f7b0519d49430132830cae4ea4d93e', '9b5a8347770b7c869fb26f9bcd3e3bdc', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok........', '2020-07-26 14:38:49'),
('d01d0891d061a667900a37fff25a6969', '9b5a8347770b7c869fb26f9bcd3e3bdc', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'okkkk', '2020-07-26 14:32:25'),
('47a96e260f70f44a80af3a10c17d0449', 'ff85e9d1253fed3cb26eef8746e4a347', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok...', '2020-07-24 14:04:46'),
('f9c5f1da5f36f0b8f631524f54557dc6', 'ff85e9d1253fed3cb26eef8746e4a347', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'sip jg nih.....', '2020-07-24 14:04:59'),
('0de45be5533c2d66f2a4ca6deed95fa9', '9b5a8347770b7c869fb26f9bcd3e3bdc', 'e5cabee927429398b4d2a289166d511b', NULL, NULL, 'dddd', '2020-07-25 15:43:12'),
('73202c58d146746096e36db02aadabd5', '9b5a8347770b7c869fb26f9bcd3e3bdc', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'aq pasti bisa', '2020-07-26 02:47:23'),
('4bfa48fc9fcc0dbd39f6016cf7378f85', 'ff85e9d1253fed3cb26eef8746e4a347', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok deh.... siap...', '2020-07-26 02:50:20'),
('29c710cb9d34db7b10bbf43b588202d3', '9b5a8347770b7c869fb26f9bcd3e3bdc', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'ok', '2020-07-26 03:07:23'),
('fdd49478aa998f5b65eb4be19401cde1', 'ff85e9d1253fed3cb26eef8746e4a347', '4a91033bfe52de0aedecd767ee4075c5', NULL, NULL, 'mboh karep e piye, ora jelas...xpentungxxpentungxxpentungx', '2020-07-26 03:08:37'),
('c08d16a28ac3cb9e6b56bfc1f9afd43e', '9b5a8347770b7c869fb26f9bcd3e3bdc', 'c8501a58dde52c15ac3ac56fbe669603', NULL, NULL, 'ok wagu,,,', '2020-07-26 04:22:36'),
('3a7166bfefa5c04e254e282f4f24e7ca', '9b5a8347770b7c869fb26f9bcd3e3bdc', '193718556c9ea38a77468dedf9a57d7e', NULL, NULL, 'ok...', '2020-07-29 07:55:21'),
('236fb5c1f899ee1204b53ff4ad53e9e1', '9b5a8347770b7c869fb26f9bcd3e3bdc', '193718556c9ea38a77468dedf9a57d7e', NULL, NULL, 'sap..', '2020-07-29 07:57:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_jadwal`
--

CREATE TABLE `guru_mapel_jadwal` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(100) DEFAULT NULL,
  `no` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `durasi` varchar(100) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `aktif` enum('true','false') NOT NULL DEFAULT 'false',
  `soal_jml` varchar(10) DEFAULT NULL,
  `soal_postdate` datetime DEFAULT NULL,
  `proses` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_jadwal`
--

INSERT INTO `guru_mapel_jadwal` (`kd`, `kd_guru_mapel`, `no`, `nama`, `durasi`, `postdate`, `aktif`, `soal_jml`, `soal_postdate`, `proses`) VALUES
('2f10197efe2e6ea52be9a59898f5bcb7', '041c7cc5a8fb9320f6f3b538ce538b4c', '1', 'latihan 1', '1', '2020-07-27 02:51:42', 'true', '11', '2020-07-30 09:37:27', 'false'),
('777dd00d4cdbd156b6362140d350de61', '041c7cc5a8fb9320f6f3b538ce538b4c', '2', '2222', '2', '2020-07-27 02:59:54', 'true', '5', '2020-07-28 03:57:38', 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_kalender`
--

CREATE TABLE `guru_mapel_kalender` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) NOT NULL,
  `tgl` date NOT NULL,
  `ket` longtext NOT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_kalender`
--

INSERT INTO `guru_mapel_kalender` (`kd`, `kd_guru_mapel`, `tgl`, `ket`, `postdate`) VALUES
('f17cb39dc9cf2bddde722bd4ad5614a3', '041c7cc5a8fb9320f6f3b538ce538b4c', '2019-09-24', 'ok...', NULL),
('71b17cb2a375a6665e8f54913d80b914', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020-07-11', 'belajar di rumah saja...', NULL),
('3c9bbd3d3699515814d7bf843853f79e', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020-07-01', 'sip deh.....', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_kategori`
--

CREATE TABLE `guru_mapel_kategori` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) NOT NULL,
  `kategori` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_kategori`
--

INSERT INTO `guru_mapel_kategori` (`kd`, `kd_guru_mapel`, `kategori`) VALUES
('58c10fa225937bb08c1e5c3de2e20d2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Praktek'),
('ed069341125e91fe070aa9ca8cd1209f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Kliping'),
('849a751a13c66795fed8d9ab6af23a45', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Tugas'),
('9c283434992d2927489d4ec0ea313608', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Pidato');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_link`
--

CREATE TABLE `guru_mapel_link` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `url` longtext NOT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_link`
--

INSERT INTO `guru_mapel_link` (`kd`, `kd_guru_mapel`, `judul`, `url`, `postdate`) VALUES
('5af3b4c1a572160db4f68d768ac34565', '041c7cc5a8fb9320f6f3b538ce538b4c', 'google', 'https:xgmringxxgmringxwww.youtube.comxgmringxwatch?v=M7gvuxstrix0abes', '2020-07-26 03:05:17'),
('b53066def317235c110769b49044cdf1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'asdsad', 'https:xgmringxxgmringxwww.youtube.comxgmringxwatch?v=M7gvuxstrix0abes', '2020-07-27 09:37:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_log`
--

CREATE TABLE `guru_mapel_log` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_guru_mapel` varchar(100) DEFAULT NULL,
  `ket` varchar(100) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `mapel_kode` varchar(100) DEFAULT NULL,
  `mapel_nama` varchar(100) DEFAULT NULL,
  `tapel` varchar(100) DEFAULT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `user_tipe` varchar(100) DEFAULT NULL,
  `user_kd` varchar(100) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `dibaca` enum('true','false') NOT NULL DEFAULT 'false',
  `dibaca_postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_log`
--

INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('80fd6235de9ab7a0b333092be99b0808', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 15:24:04', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b1967fee3b91e79bce68f1a3d2dba521', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 15:25:09', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7c6daf9eeac9a7627ce54b62004c0057', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 15:29:21', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7d926945732968c8c6d69be3b83cfc0a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-24 15:29:22', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b277e6ff10711842248522b6a339c7e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-24 15:29:24', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5d617d2c87169f48a070886900ad52f4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 15:29:25', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5864a882091265031380fc3cab17af4c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 15:29:26', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('25fa2482b314586cf8c39b45b1385e3b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 15:29:29', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('62c8a5251f18fad2f5f41417ac0affcc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 15:29:30', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('448e30e2c2248bc9e28fe9a3531f9896', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 15:29:34', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('44350c6c014cd92512179cf909cb9c35', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-24 15:29:38', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3e8a1b3b16d378570e8dcabc4e3b20b4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-24 15:29:43', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('27761479bd82e7377dac3fc7d4e5ec5c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-24 15:29:46', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('422a46a060bc815cd8411f0dc3d749ce', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-24 15:29:48', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4b779518999d1a9369bdda7642ab0774', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-24 15:29:51', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9c25b7bb7669cd5a2be750a665d38e2f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-24 15:29:53', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3a5d0dd0e6b6ea76ea62713ef4ca9022', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 15:29:57', '', '', '', '', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2f27b53f81ee5d7c7106543321365a31', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 15:33:23', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0d0f25735b342e5ca3813478d38cb0fc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-24 15:33:24', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7da363c295daddabbc51ac32346030a4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-24 15:33:25', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('73c3241dfda12c4e9650e362ca10488c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 15:33:26', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f9f407bb123ffde4e3d5a210fcce9657', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 15:33:28', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6591972319a5a42360133354c7b4e245', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 15:33:30', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6ec992387aa70476aa3582380d458e7f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 15:33:31', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cf882b0622c8844f3d0175e8d68ff89c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 15:33:33', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e4338978dda2a9870ac12cb4f03309a7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-24 15:33:37', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('68044812a8d4ff4697943fdb8260edc6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 15:33:40', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5a4e249a20f630f5cd573ebb56d1037d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-24 15:33:42', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a8461e711ae6bfb99eec3f1735ac72fe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-24 15:33:44', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6511bbfb0d12b52f4ecb662563e7ac0f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-24 15:33:46', 'BING', 'Bahasa Inggris', '2020/2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8da87259214500c596c7c91ddcb9eb8c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 15:37:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8362a04e8a2721ad736fd9c18cc2775f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 15:37:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('591c85714b83ee7025ad8b744923ea37', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-24 15:37:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('70d847617a8d0120603fa232610c8c4a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-24 15:37:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bfda2d14173221e6daea523e57e4e617', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 15:37:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('12a47e8d4d3c2661e1fe5bb24f62f54e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 15:37:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a445d71c4a03b965659d919021b0056d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 15:37:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b9a170b4d017bcba068ff9f551ea5111', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 15:37:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fc62cf91ef60830b23a541f2020a05c0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 15:37:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8a2bba472c097c4a37edde842a759fbf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 15:37:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ffeb6c82b2b1baae0dd18305616aa5ac', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 15:38:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ac7609a46363386bf734a7c8e84ce743', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 15:38:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('59200e36979089a4088866b3c7cdd6e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-24 15:38:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cb88025eeb0cb1cc2883e0c82624ba8c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-24 15:38:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d7e1140bd46c5192889a7ae89737d494', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 15:38:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bce41a2354210c8d384f2a0e94a2205a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 15:38:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dd6e5c7749f85812039f14c8ccfb0919', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 15:38:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7e2c4a9c61f3bb5a5ea2935825bd2ea1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 15:38:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5148dd65bcd1a9b0aaa3486bc070919d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 15:38:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6478e11b0f9557f94e10840e420a7ed1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 23:02:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c84c3395343053d70de2013f6ab1a06b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 23:03:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', '', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f4adb8d8e1b538e02abb878e9c34cc73', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 23:21:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dd064bdcd8d75b0cfb0c61b995d1ace5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 23:21:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4c8c4951a20424aba61d43e4aa0413c4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-24 23:21:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7a853134bd05f0d6c97cd82d36ad0827', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-24 23:21:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a62fc352c6d884732ecc5099d5aafe8b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 23:21:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('31e1a9f0809808fc4e1821fa71b938a8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:21:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4bc32f0f0042a6fdbe36fd99d4dc7a48', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:21:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0add4948e46ccd9ced0ca519f1820bc1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 23:21:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0cb850dcc9a6862404d03df8ae761804', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 23:21:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ea21eb8be77156e710223004cd524f57', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-24 23:21:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6aa934639c786afe42403cb954ed342b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-24 23:21:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3fba111c849b8ef90e4f54937998c04a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-24 23:22:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6ffe2aed06bc980409f2928d169abb23', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-24 23:22:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d2a257129512f7545be5b7c105d46a7c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 23:22:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('829c73f438b3ce277558982b0655194c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 23:23:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a84d08124291113e87d4e6d5c686db21', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 23:24:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3f4a90c336df2a5cb8f322c9248fa983', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-24 23:24:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b31f86fd40da02dda10aef6282a1b02f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:24:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('36b75162d7f2a2de237569130f6a09ec', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:25:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('889e2834053b5f99c8f0eafffab7faba', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:25:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('292420a5cc3927c8f173e2715ec933d4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:26:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fcd203b5d8a14ca5c194db3dd428b2e4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:26:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d3087396bd250b6398067c8f93496dbf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:27:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1c8b3bd7c2441392e7d5127df7d60b17', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:27:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b4bee23c8f8353926471c2d67eba6a76', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:27:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3e7209a1ab0f104dce292298107d2141', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:27:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a11d6505a3623ff0b8a9eaa2a87f17aa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 23:27:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bd8e3a18241d40aa0d7d13d6fb3275f8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 23:28:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2f880208b7a8e11252d542cb3d88979d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 23:28:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('135e2307f4e3454c7e1558a1b12fb219', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 23:29:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('62df9ba4bf694c8e6ff20ad48db40fd9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 23:29:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ed01eb329158f03431d0c372f520c8ab', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 23:38:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('49b1cad250a28f349859ecdde86c9892', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 23:39:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('30dddcc105737022313af8e4ab32dc93', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-24 23:39:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('35368652ba3bc0e611f57b35b3e2c5d3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-24 23:40:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('088a2aefced7ca719a177faa2f48c43b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-24 23:40:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c3058d10fc90c283e3142f3323027dff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 23:40:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('af8e9c89b83d1c54e06bdb8ce7cf147b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:40:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c4f2ad1856c4a27904e1223f81d378db', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:40:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5262570150f6da3a3f63ee45d6895555', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-24 23:41:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('744fa35eded50a608a44f0e663caa45f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:41:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5f7d78722cb0951e73453f87cf8ae1a4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-24 23:41:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0718dc2b4253443c168d792d8842c296', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 23:41:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0b4068103d6c000ede3861ead8fcc6ed', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-24 23:42:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8da75b5a086ed0ab01aea62193757f24', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 23:42:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f36447b63a7d6f14cab79e8fd341d77a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 23:42:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f605ca83f0dedd94eaac5d6539a812fa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-24 23:42:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b7833dc25d989ea5b9b85fb09446aba6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-24 23:42:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0d398b8a50eb82bfaaeddeedd0a38b5c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-24 23:43:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dfea5608ed6f7333f8a3c59d921c9a90', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-24 23:44:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ee00345e887e1f9083435167fe3f8987', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-24 23:44:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('848d85e3680ba6061ff774aeeabaffc8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-24 23:44:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('079a9b1f1b6559e6edb12826d467f389', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-24 23:44:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cc8000ac0d17283bbfa6db46134cae45', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-24 23:44:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('efd63bacbd99fe591fa7141f9ea38692', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-24 23:45:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('86a0b93f9a11f655d019dbf0de452e1c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-24 23:45:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c0112fb6ff2f21a12133d61aea698838', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-24 23:45:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('700b028bc5332f19456b624c36fcbf94', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-24 23:46:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('991cd8bea8f48bcdac5ed6ecc1bfb439', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:25:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('00a1dd7868b7bdc0cac6f691ca96eb62', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:26:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e2d8828d321b227afc28bf41fdd48069', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 02:26:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('12cb85c7f50a91d75ebc2c588eb4c74d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:26:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('47f72aafacfa1cdc7783ce7bb72cd5ad', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 02:26:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b19020f6791b068a38f7413ac223453f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 02:26:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('33824c97519985499fd716d76f2f7608', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 02:26:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c13fec05a48cdc53fc7cb62526d4b4e7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 02:26:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8deaf688d28f2c74df57f913ce7c9f41', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 02:26:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4ce80c528beb1134988507fce4764f4c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 02:26:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d99993533fc4be1036dbf2e4e0eee97c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 02:27:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('78ca9c363237c7ea7062f77ab058ec19', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 02:27:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('703d2dcd543d82f9d5d07d5ed9fd2234', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 02:27:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c9c0bd9174c1ac1c76b743b481983a43', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 02:27:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('172df6a39330a4d29f4c2f74e77fcc92', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 02:27:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('751e2f0226a4f8b13f59e2684b17baa6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 02:27:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c81f6cce467aebadcab6636ae6080134', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 02:27:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4ca99c7ac50d3d0f7af9c2030d2fd546', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 02:28:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0bd70b17aca488bf993742e721fad712', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-25 02:28:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c9d7c5eaad036c08ac240d4e871733fd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-25 02:29:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('712a73367fa4b64ab0ed5f49212ef402', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:29:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('766b1b1881120e88d794d1f55434c36e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:29:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8341bfd2cb93cc9f1cac2a28c94dad28', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:29:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a346167103f94935456b0fecb3932ff7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:30:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('90239ed615af29a2067347a73788f7e8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 02:30:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eb502d555274b1dbe184e2a1077d5358', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 02:30:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7ef167c2a3d8d4d30e1a3318ca4e07b2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-25 02:30:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0d513a8d7d0b40406251d0ecf032901f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-25 02:30:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3342b02422391350789d5cedad567f59', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-25 02:31:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('60aeceda2a695550588f7189ef7b9060', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-25 02:31:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('24ecdd325e5fd805673f01e7be9a8de6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:31:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('131e708b9e5f17bedd0aef50c897d29b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:32:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('de757e818ce6fafa84f2e2824cdf3c0a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 02:32:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b3f2649921f2664dce2a724f7c96bddd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 02:32:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('95fc01634b3a29cd4f9fabfeebe1e719', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:32:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3689eb83fd9e8c4f0ddab8f5b4b0a730', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:33:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('22aab2894692a41a11bd5911e7b739b3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:34:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c4eeda184fa67ee52df482f521cbcc07', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:34:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('82d9251344a483d27d5c5a9c328776c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:36:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('73e41d723c14a9aeb68dd613a7cf8ff9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:37:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4e8a331028311a52dfa648a9dda1edca', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 02:37:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e379afb6c6eff290e06358ee184691c4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:37:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bf2431936fa01a67366bd03f4ad28412', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:38:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7f5e7c39c8f72151f245a7ab05c737d1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:40:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ffcea930b56e69e3f7199150d894b574', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:41:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('89dae63575ae253e8c616852d5d1992f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:41:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('281f67e7d40218d0cab8aa2617a63d5b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:42:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('700d6016ad5b0f8998ecfa64655067ce', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:42:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5619d4382512424b43385968a9b4d90a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:42:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6ab723a7399906199026516efaa7e9fb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:43:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4f352797b7e482d9fb2506e9e8f178cd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:43:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('87e4baf25f16f2e383ffe800659517b1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:44:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b10000c0ccd73cc5113ad19e4a2d56da', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:44:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ee2b378ae2d3b0c14ccf48bc32778c3e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:44:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a391fd08f27c56ecda46f73e83b4c7a3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 02:44:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6f37faed65f80b6ad8c1890ab43f9df3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 02:44:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3f9b71ad27832c31804250e8567e847e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 02:44:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9067573c193e2a7a87085be8b084f1a6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 02:44:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fc0caebf371d6219717b3ffd023179c5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 02:44:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('61897998512b507abe0760cd44bbcaac', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 02:45:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b4125b3eee2c51d08ef6873cb8fd0757', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 02:45:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a1f2c88e08ee031cc515c2fc5d156557', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 02:45:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e7a46f4349bd005fd51ab557dd6ac7a6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 02:46:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('93def41f56965ef54db049df68920a86', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 02:46:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2fd2f7c5644a14f30082b8e270d80cb0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 02:47:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6921fbb6f95269c09d0600fd774b87d8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 07:30:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e11e68b6819eb56d13133be23df4a489', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 07:58:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('daacea61f60a38902e07bdb929cd4ccc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 07:58:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('79189ed0d08d4d8a781b242261e335f1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 07:59:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6334e586feff2879a552c15683bfd5e8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 08:00:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('41349b8f8c4555b3c552d02da88bda03', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 08:00:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('216d070731c51db992e7b2bd0c15d7c5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 08:01:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('09b6cc7f8ee82112d5b429d16d4efd29', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 08:02:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6e1d778236b0dd2eba6d1fcbad87be34', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 08:02:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('63786cd07e99dfed12ede5e8c834709b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:04:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4c1542599ddf614e19ac7118eb89f603', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 08:04:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('17652f22fe248b49552743e794e0f135', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:04:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bc9f5ec275dd4860f702e4ffe28750c5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:04:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d18c3de155d07be8a5ecaa81b0e61804', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:05:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d9bec2dfc54db3981f74c0f8adcd9e94', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:05:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c6baea342292e2e7e6801182ba2ce604', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:05:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('367ad3d2ffd18d16532c7d8ad9036588', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:05:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ca218218c95da2a517a6a61f3c7c76d7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:05:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8434767438031f88a5989d7df599b8cf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:05:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b4b614ebb32b2f0ddd145da063a7a347', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:05:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('15e9fdbe9aff75490419c77ecd897a18', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:11:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0286ad0316fbfbbd59a099ced0f044fb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:11:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a922df8fafc3438255d3ebb5c6fe22ca', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:11:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL);
INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('b04305ccee32e586bf637fc0e3268ded', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:12:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('41f7dca9feae837b0e8acdb1e5e5342e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:12:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1974a9305fe55be1f52cf39ea7034e6e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:12:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('be67d4a8e4dab0c7dc4f0bbaa20eab1c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:12:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2c3cf4dcfe8c34061430e87ef38dc681', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:13:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cb830a3138e43fc167356e815e176e2f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:13:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e1ecbadbc940f5d8390cdb82df91bbda', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:13:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3134d1b6c99e61c28c94841b90e35955', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:13:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f604be1b658999987796d6af62b42242', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:14:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('01d61eca32c496e91e37f4ae24936b58', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:14:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fd3a61441698ba5b8c7b1ce93fdb0e4a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:14:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d77b84e773ea50de296e35645bae2af8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:14:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('57c214302d1ee3671a90302bceb0ff2e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:14:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3c3489b73c6f241b1405ef43fd568f61', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:14:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('08f9f90b102a05f29284578fdd5c2f9c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:14:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1a9abdab58cd20ceeedd8692db852bc1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:15:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('253d1366134cf7411cf1efce4711192a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:16:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5991ed5412a3c6b7a922756282972642', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:16:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('755121f98d2a838153a61d1085888d99', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:17:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('81779f0b2222a3e637fbb9a0ce8b5177', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:17:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7732127bb67db78c053bd8fa57f05b16', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:17:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('63c89e30630e7b033fe48dc8f38141b4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:18:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('88f1db203844e78ba2205ad61b549389', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:18:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6195a0d42636e6e964a39278733bd4d2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:18:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fb5dd678db3ea1991a526960c1e24986', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:18:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e3df904a4437f1f762adbc65847b16db', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:18:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6bd4f117e8e20ae86396406368af69d0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:18:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('46acb000e4ca3fefcd9e885557a6ad5f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:19:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0a6b8cd4428c81709eb40886c88cb8cc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:19:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a97dfab29c69800a74de0673a5b7bb4d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:19:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fc37e213fae7dd9210f8159114ffd4d1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:40:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('70a70899a6a5dfa176c083a2054c7a43', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:40:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7722aca07e566c4c4ac5ef73f46669bb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:40:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0b71d277b666f70e9188a7cedf35416e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:40:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dc3ff26e7f868836de32b1ca6d48688f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:40:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cabea8c6f84f03a1bdc75a589012ed2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:41:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5028b5570a064d0e476d06107aed1c24', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:41:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('37ee683df219557db88be4405d0ac81c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:45:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('833bbd2f5b5052db5913b2ee3208059e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:45:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6ea292643104284f39e75d656180f278', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:45:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('10b036d36e2c8ed1cc8ff882b24a1c70', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:45:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9644d968623bf0adc4b461273d32ab1e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:45:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('216ba1c23c3633df1c3b4c4519d51c83', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:45:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fcebe956070e729e6c5552d81c11071e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:46:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7921375b6d2cfddc851f6163c98f681a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:47:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f4693fc81dcbba898dd948cc40230e58', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:47:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a07c0f57c5711325ca26055b31688db5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 08:47:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('65a1946b8ecbdfd20dae734c7ddac813', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:47:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('35f9571df5720b4d83f45fb143608a80', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:49:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('194855332ace959d42be4a3e8840ae77', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:49:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('25867fe030f35925a6b322d585202730', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:49:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1fdb2afe79ff8f6425b9e5d2a75b4393', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:49:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('185191a628dac7ab106e0ab8ac4d2ff0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:49:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('875931fbd106f8647b91d37db344448c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bf87b0e2e4d07c205c32cd7ccc055f0e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a35c2b0cbfb0fc6cf23d5457f76e85c0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a150a81f7abf3b84cbcfaac2ce3084a1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7193b65bb161d6f54e34df4fef1e5974', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:50:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('42204ba747c2ccbafeba9d82665157a0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7140ac6967d55e2a2a6d99f88efc168d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c86119bc43b4997d2b4da0e1142811aa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-25 08:50:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a6784584a39d8d423e1b028841c59d88', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:50:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('689cd1edf25c8b1e2e14e7a946951017', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 08:50:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('29ed51583732b4890d4a3c89fa91b92c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b4e78861cb16a6e475f9742e1afa3846', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 08:50:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('083e0f83b3d6bda28b0e2289c03174ea', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:50:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fcccbb18ced960c34d1f40fd186b9fc3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:50:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6c22c4a4430d43ac9b371850d15b05bc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:51:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b7a989ffb83aa4da588593b2615db111', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:51:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('126699a78a3a76697584faa6a0cb7124', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 08:51:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('74f54c84beeeeb85c9eed3cdd62b48f4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-25 08:51:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6050ddf1d66adc5c7d475e4bfed7cd6e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 08:51:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f3abca99952e6265b99b7350080ca20e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:51:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7f00a6fa78e2914c348bd30919cca1fd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:51:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f0a3d12de3321458193979a90fe2a353', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:51:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('925c7972ff58089065ed5888266a4308', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:51:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8d23fe859da47d30cd4f94774cf5f18d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:54:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fd9787c8de712c389a3b9aa5fa30daeb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:54:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c9006258b3e305f62973d591a7abc058', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:54:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d11be118ba8c6fa62545cc4bca47ff04', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 08:54:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a6bdb0dc898e292e2f74508eacb0601b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:54:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c537ce7c817ea36d78231c2417028b7b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:54:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9c5fb9a20998474031a1cb85b7cf1dfb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:54:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('447664618600a54d38a355cb72a936aa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 08:54:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c4a533f0bedcb33074293c5fd3f5b281', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:54:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3da1be17bfd010c78dfaea41d628bbc9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:54:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('56f79c01103a78731ec154caf8960376', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:54:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e9332629ac19a988df5d2572ac1a041f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:54:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e7a3d83f6fd233f10616aba10c06a877', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 08:54:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8ee645ef756296289ff7db4db5d54401', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-25 08:54:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('464749866c2d1a175ba8bd2f58452edd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 08:54:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3b6dbe26f8ad593032eb58d0d5d29c21', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:54:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e50d57e311ec3a43dc806dc8617089b0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:54:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('432fb1e3a50a4a01f1fc06722ffa6e1a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:55:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4d1a12b54e151bad5892c4f34885b490', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:55:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c800dc9058b20dd1eb54b5c873ac744c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:56:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4aba0bda2779dba0aa26585f2094936e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 08:56:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8de33aca53f1132563be58fc9896e742', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:56:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('be9bc517f81c58fd0178439d827a7e5f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:56:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('84a31a20cc7ffbf2bb8f83d9548e9b8a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:56:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a8ad35d276cd2aa1d161de70c7cac56b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:56:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('121cc7ae692768181b27350550c7208b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:56:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9e518a8b624390014d13596d2425ba3f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 08:56:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9c35f373a2af35f66794337ce75cee6a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:56:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('80d02f5bd8ccc943ca1e28e3fae90407', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:56:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9969e382914df2461d0e1d770c5b9022', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:56:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5f8dc91fee529546705a432502570c58', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:56:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d9596117f1d47684da631908c349cfee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-25 08:57:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3f58c94dca2344fd1ba12a248cbfd550', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:58:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ab1b58b8220d11a7b7f00c8d1e0fb6d9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:58:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('55e7e9ce8d5507a10e75c8f3f97a1558', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 08:58:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ea569039b28f3a5c667ed0c5192c800c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-25 08:58:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('931b6638d2dae790f3a7a51db99e5241', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 08:58:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('aa992926e2aefb513f1e9805fe59a340', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 08:58:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('33959fbb22ffb0c3e7e37c7132fdd079', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 08:58:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6eded82dc2509e2dfad20af6b9c2c77c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-25 08:59:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b22dec1e13bf2bbb45d672619c3acc30', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 08:59:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8036cf95044d877c447ba7075e621a12', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 08:59:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6a73bb9aded8727e8caf79ee46b2d6c8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 08:59:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('880fc79565dd1fd5284305102675591b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 09:02:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c25388af9cf78da75c5a514c8c77a56b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 09:02:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3ab32a5d7126f6769952d93d854c8b14', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 09:02:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f2e891e85d999a72aa816d26960fa42f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 09:02:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e09d98ca6cd5deebc84e2834d8cea1c3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-25 09:02:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('164c20b6e70db6739287808540ce8fc4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-25 09:02:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9d97de1b45ea90781aca57bf6ed43415', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-25 09:02:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f11a4bfad7363238122dcfc0aed531ec', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-25 09:02:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('23a1c3ded3a65866d9efbf5c5ceb06e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-25 09:02:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b215e0d44209910267be86a7da06c5c2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-25 09:02:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a7972ce2103fc7cbd8945b4f7ba50650', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:02:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('527ba8b8e2c5dc233f3452ef31a98052', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:02:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cbbaba24e55787b04457ae7ddddc564d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:02:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eb280996c219555e892a3d0898255876', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:02:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d050d978fe1968ff3b5ab5d9fa2f1c34', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:02:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('00adf4f4a24ab8c9b3de488d87175ef3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 09:02:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('665d19bec0fdf99bfcdcde5a80338b43', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:02:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4421ea9be0fcd08b214dfff6854c3e90', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:03:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ebb90158b163914f55ad9e31ec76014c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:03:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a247786c3ca3ceb217bbe694dd209d2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-25 09:03:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e95c1ec5b4123c629669d2e2fb575cc0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 09:03:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('612db0875738d3ce98ebaf149b820ab3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 09:18:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('922daffeedf669fdf8986578ce593d15', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-25 09:18:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8f4afaffea2c7ff594e30b5d9d025968', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:51:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('55a09fb2209397c04072020322d888ea', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:55:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('f90870b8c2f0e0221139dcd3cc9370e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:55:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('f5f94b35380c757b9b6e2c1242ec58df', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:56:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('edc0fc26b14f4507e586ecdd77d53862', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:58:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('4c28aee292c0c47304b0c93397db9c98', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:58:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('c09a05e7fa5d5a0bbd67709516f96359', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:58:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('103f93dad6bb16e49c10332472cc25aa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:58:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('1a3e1884da210d826cba6b1f75fc0733', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 14:59:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('ef04c1dd6d4e0ddcc8ec753bc4142008', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:00:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('c97b5a414f73d733f3c181d3bedc9a4f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:00:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('c87fb682579535734a713b6d43ebbd5c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:01:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('2e025c2751343b885f1c23973c6457b8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:01:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('0c5d1e3febc1a238dd94a044d39264c0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:17:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('b4057f6846937279634e676331c7a17d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:19:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('c5d85f3b46a5bc0d8f79214fc335a642', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:24:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('2f1334e2936c15a54b776cb991e2a334', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:24:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('200e856efb47257b0f7f3817eeb9b57b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 15:24:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('3db19d0f376d6f48816139182b32d08c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-25 15:36:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('9eda55a011ec336213c5c58794165748', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 15:53:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('1e37b02757aa4f41eb81e0def809894d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 15:54:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('594f05cea893c45818a9f0bc4221775d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 15:54:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('2df53051ddab2e830ee2f3b28951a249', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-25 15:54:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('e7cfb64bf0a84e685fbaab280ce5a2bd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:07:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d4192f1429925a89dea6b5ffaaadf48e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:07:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('33a86447e5b37d3bb2f23eb2070074c7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:09:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('365b0ae8a8c8fb7ffab2663272c85680', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:09:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9bf7ea3cda6d3934fb4c2aa0f7208136', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:09:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9830a49c2c934301fea1d046ac92e0ea', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:09:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b8ce618fed98bca6a557a407e69d4388', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:09:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('11e3ad29abf47ebb3d9403e5a7135f09', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8a5f22c9f1b7698cdd70e3d7e502cf3e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('adb7f3470088b2897f89c300e821ece0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b673ae1149c60fa8b142d632b2e2cd98', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('423727f1b7ae806e7bc94bb77548c6a9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a74df0c2fc26d2697c92fb144a75967a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8ed04599afebd3fd72225e36ec6595d8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c0a6a5be5ebfcabafeaba47028247a78', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:10:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d792fc89277ad1706a59357933c60992', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:11:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fb65a9a3d6a99b12d9c8bb725b3e0a4a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:12:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('631c3b514f95e620aebea9bae1d1fa3e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:12:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('92dc392950c2074fbe5a0880a8b5bbb8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:12:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8dfc42ea181165d1a38dad5b21c0fd32', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-25 16:15:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'e5cabee927429398b4d2a289166d511b', '7654321', '7654321', 'false', NULL),
('a7b3e572a92520883bb019bc8e034817', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 02:46:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('651acfd87071fa1814462f4a58313bad', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 02:46:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0aa5b26cb1c61fe32730bd1458dce899', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 02:46:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d07d50936fd1bb15c5f2a3757b3f5399', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 02:47:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('29950e5f4d1ae2170e45346b2272881d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 02:47:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c8b550f01b81c420e86ab399014ce1fb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 02:47:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('15677f6329a7b8a5dbd9d9a734741e4e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 02:50:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6f38e641750658145ac8ae559112c1bb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 02:50:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e007a8522a7951266bcc70a2e71d7257', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 02:50:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL);
INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('e65eaf941d358041274c048c226b3e71', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 02:53:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d8589a182083ac5a8943e77269fe98dc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 02:53:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fde8e956d4da1353171e3c23b65d8ef2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 02:53:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('493c7b1143d1b32a1403add2fc6e5e79', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 02:53:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('139ac2886d28b42c234b530486063bec', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:53:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9ab0b50cd596d9b09dc9252842fd0ad9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:53:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1b7735df36400df796719e7fb1160c8b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:53:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('90da03cadd0983e256412505481a57d1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:54:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a035424a75e5658be2395142810f4aa6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:54:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8e5a0260625e7a87fbcf650a16d01bf9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:57:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('80b6a7f0dee9c70a18f3e0e2f784dcf7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:58:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4628754b2c07d5adeb5701bb4b153cff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:59:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('24a557e16b2736ee512e023b7fb2020e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 02:59:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1fb831de816c0ef02db05dec0d34d3f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 03:00:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7959f6825f515cc17aa08b60a81601fd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 03:00:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d53865edeac83e3c2babdc96dc4c8a95', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:00:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fa4d8ee63afd2f9a4ec98e7db4fedc6b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 03:00:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b411643dcb69dbd48c4b9bb6476412bb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 03:00:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('51e975fe1c27665dea5a8bbc7d1682aa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 03:01:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0d2107f579625c6ef13ffa36d7f8d490', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 03:01:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5f71492f783add50b51c0cfdc839ed69', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 03:01:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5281fb46a04f2b6835c5779520bf4bd9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 03:02:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ff41244837ec1ff9b5b605123175a97a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 03:02:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('42ff7a85edfee1833d7934bea804eb19', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 03:02:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5af25773b4b98dd29bddbd567f4e216a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 03:03:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('af14ed8ee1b4d66f072c98d25a116d38', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 03:04:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0a19ff43527a319275d067dd5d3053f3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 03:04:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e48687da7b85e345137915d19c6f9426', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 03:04:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('14b2daa7f6b22447ae57a26b5952f797', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 03:04:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a398ebe3c7e0959c0de4dd3c52f94e3f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 03:04:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2e1dc906050396fe5db080bbaf17e3e6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 03:05:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ec0b17e7e2fe4a6cec06741249c54386', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 03:05:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('509fa493bbd49ac23d5fc9f4acdb261b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 03:05:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9051800f3817109cb1274a8d1ad8a654', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 03:05:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f6a6eef563304c29fbd6f5d47844a8c4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 03:06:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d7e3d697a246df51b156af6b8fb30c50', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 03:06:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9bbd58f6ccf3db021bd4f232588f957a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 03:06:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b8e61fdfbeae22c1be0d770c5220b168', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 03:07:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c2cf5c169017cb6f1bbdccc0d9c49c52', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 03:07:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2ab68305cfb6d83b1d290354601a9d3d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 03:07:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0b1a5950b5121c4a0bd01fc6e47f5e4b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 03:08:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0dc56bd70b179cbb11a8919814125950', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 03:08:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4c1eb644b0b2cdbce67730dc20790d90', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 03:08:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('329fa28a7d842ba97d804d39fb99ab54', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-26 03:08:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('79302ceea85680d3f2dc03e59859c137', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 03:08:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8d16a3ed3142ef270030224c54b5ed28', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 03:09:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e71df1c38cde0df0e7d621a55666fc38', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 03:09:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('74b78c5ab1db86887c4ef56a98a83e32', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-26 03:09:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('01d40f20b160125db5f02ec033020d9d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-26 03:09:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9a554f7d21fbc32c3a83c03bc6eec866', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:09:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f7dca6ccf97946c477ca1cdad975e78f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:10:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b1f5025655264f8430689ae17782f859', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-26 03:13:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3bdc70ca3125a5fac2d3c16f15c6f21f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 03:14:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2d780e8fa095aa56f83e0724c8df93da', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:24:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('611a42f9727230177ba0c026a3db218b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:24:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('16c35be84afe2387ba476d90b96b2c98', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:24:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('16e985c1aa18605567217ff3f8c5621e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:33:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('161cb17efc65a976c6449ab9658aef7c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 03:33:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f1573fb873d2e731152488538cd9a846', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 03:33:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f0619830b70d11fd81f580887b20ff6e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:34:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('da174309a3767cc753adf0de4e5961fb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:55:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a6e75a12f073d9a74638bfa2ed145995', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:57:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4f1afc43a6f2980dfbd0e4e7ad5a3af2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:57:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7a6780270e72cdbd301e29e22fe7656b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:57:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('436b16fd6217c64f67b35b9732b9d62e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:57:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7806eaaf0bf08ece14cc5890e8ea7542', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 03:58:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d9ac687e098590e083a33118f7e5eed5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 04:04:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('28d1f9c371960fff0a140370f4a33258', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 04:04:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2367215f98d348cd030cfc9b37a12c8a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:09:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('16d31d5e5e15ff36552e4d1e21eb36ba', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:09:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e0f8f4323d08c6b5cf8d2da8d57cd2c6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:11:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7fe91fe1b033d3d9ee31e9ce63076f4d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:11:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('595f52f727a30f449aac947747b6bf8c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 04:17:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4a1bacaea0a2339ea926fa6e9bea28f3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:18:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0d1745ba164f345f485593f7f391bea0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:20:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8c5fc3a98a5fbfecd06925ebd1fccda8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:22:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5febcba6aeb061e09c36b687617125a6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:24:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ee8902f1abbfdbd7f9746b15ed70c8f1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:27:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ac48fb70a61660ab0509058d2005fc05', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:34:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1b41a27beb249f23816404297996b556', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:35:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6b7b1ad60311398686ab17998e469581', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:36:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5d8a10779e0d28d8fcc25755a24864df', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:36:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0fb7d476b54dea4945e14a9cd328a4b9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:36:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('39d12385a11e260dd7fddb663517414c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:39:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('034be05078f44da4b4567d46ac14bd09', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:39:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('105eb8cd6c2b2ae7c674fee3de891a96', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 04:39:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1d93b6cec943d03a14c8878a4b44cd03', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:40:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '772c45c3a19d620b7cbf864a377eee3f', '280010', 'Julia Perez', 'false', NULL),
('6a668e6cba3fa2fec26faa5e5b2b4af4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:40:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '772c45c3a19d620b7cbf864a377eee3f', '280010', 'Julia Perez', 'false', NULL),
('46bf836ffe16a50c9b08e22348318476', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:40:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '772c45c3a19d620b7cbf864a377eee3f', '280010', 'Julia Perez', 'false', NULL),
('b90b8d4611adcffa4068a1e1237e57ec', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:40:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '772c45c3a19d620b7cbf864a377eee3f', '280010', 'Julia Perez', 'false', NULL),
('824b125fb665f16b6c8e313de2a3d585', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:41:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '772c45c3a19d620b7cbf864a377eee3f', '280010', 'Julia Perez', 'false', NULL),
('249794acaaaacd5ed8a68f4a560ce52f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 04:42:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('701e1d6ca2862813aaad4e14c3c11bef', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:42:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('70c15e75dafeb533e24683691811ad88', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 04:42:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a922a59b35e03631b422b14da0e16531', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 05:29:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('dd64bf5191d774128910d213197f90f9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 05:30:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('dbbb197ca82a69114ee064507be537a5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 05:30:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0eadfa5ab21c93b7c34b30ecf1570b93', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 05:32:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b801b3bdb989b232aed45d41dc0b9401', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 05:33:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5114018f8a3c87d3a3408ff49981af66', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 05:33:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('694679dd9ae1a8c609813dc3529dfd69', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 05:33:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce2c3b6e0d3d7553964c78ce92cde914', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:13:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6229c719159496af393a90191d5c4aa9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 07:13:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fe7a0be3a51f228135c3ac762d5e1d2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 07:13:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('673a232185a2a417fbe486900bd15617', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:14:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c630c30ad74ff8eebe690e629a223156', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:14:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('498b82629929833d829cfee147323dd9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:14:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f9d6e2dc0f604ea02e2a66f88ee23888', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 07:15:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('41a0a017e5bb4be149de3911bc961f9e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 07:16:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dd9aa5feea5b80d68c95dee5b00fdfd5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 07:16:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b82d988e7a4b04ad02e86fa4b838adc1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 07:17:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c2a44eda34e7be18ca91355500d8b14a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 07:17:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1e7b8ae0b84e57cea0baffcf8fa51ef7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 07:18:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('892b0e02a3647dd6b9c4176e2d6173c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 07:18:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('95a0037eab89b54f9ebd09a595c3c6be', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 07:19:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a683a840591c445c2e86ed676b4e094c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-26 07:19:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce7e12d1f13929d1788005820ff60167', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 07:20:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('aadc09efaf5718c44ff4304e481f7f8f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-26 07:20:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1d32ad623b79af29e95dc99b08710bdd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-26 07:21:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bf7ec3cf90ca6d80babea868bf28701f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:21:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('956e3b1478cd5af5610b2af24ae594f8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:23:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('98e2de833dd6a13dd8045b978d46f5ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 07:24:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('97650dacce48a38d3494689b400a89b2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 07:24:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce56f92dd2594d38fd4c6a5011a35fc0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 07:24:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3245f04cb23e56a7d6461e5321a7f2c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 07:24:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3838a17e2ef620cc30fb15fdbddbd8ca', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 07:24:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('95764cc3a34ba7f8cfe242d6416eb6f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 07:24:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('034ec34bdb51957297293beb18d4c5fe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 07:24:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e7eb4b92729ec8a8111857c80cec2542', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-26 07:24:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8c2ad6cc585180121df657214ad25b5e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:24:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bb1d29a8f36b844db0bf98ff52839922', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 07:24:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2310e3b12fe948a8f8458db49b5e34e8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 07:24:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2202d26c33a12cb06773e3b945bf99a5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:24:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f9175010d74f520c98bf958c85294e94', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:27:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8d7b7caab957ff68260c0d6301b9f249', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:27:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('db04f95896ad29aec8d5d2de7b513d8d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:28:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2fedec0e5938f3addb28c269a12c553f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 07:28:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c55abe0ee97d2c2725bf483ab461abd1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:29:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1a91918b6616da16bb144b98d4ecc858', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:29:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2c5fc1f004cdb4c7c426c6fc325b0a55', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:29:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1c15613e7037bf8a7adb15c5bbc6b04c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:39:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('227a1a54a50a7310c0150e7b71529bb2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:39:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b6e586ba64908184f20ec5439ccd0587', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:39:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('689b07f57a5079c7e4031e28dcd43575', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:39:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('626462336921e120a250a11ee056d696', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:40:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9ac044296a460a10c22b4f6e0eed2e13', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:40:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ac935830ada247928546b49d399e7ac8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:40:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c27e7ad36d1f9eede7f8f3adb43796f8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:42:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5cb12bf5a6d8af1309092e52097007f9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:42:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3a4c4a7b6da57253aba55da1009e5ac9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:42:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ce445db5c7e4102bf7483b7e50904dc4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:42:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('413e8963d3a6456e96359b216d1e7abd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:42:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6a676aed257ef9f09aa94da1c4a80adc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:42:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9be130264da55680e92e678e2174bfa9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:42:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('424504f874e0a986508ba3568d5cfe9f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:43:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b7e0864e180bf500de125e36520cfbb6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-26 07:48:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1b6cf2e09844446e60a8a2c4c03056ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 07:48:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fd177ade501fa2b8f3b28b581af96d82', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 07:48:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f2a8ef0d9c56f70a0e65e0ade94a5daa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 07:48:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6196109e1428bee3dfc37cc004dcbdd3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 07:48:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('69f2695d439de55c44714a90007b6ed7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 07:48:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e88634acdb76687f6fe561a199cf51a7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 07:48:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2d804af15074d23d43e6fca36ecec7c2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:48:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('82812a21a2b31345af6b3734d05cd461', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-26 07:48:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5c60e813eb25b099389bad4f5ee5dca5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 07:49:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f4c4152353d181488c2e4f2985d5892b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:49:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4ec5fc3fb50665d51d53663a1517488e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:50:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bae720a4847b1c8caa587f7c287c5469', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:50:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5deca1af985319fcd58edd730897dfac', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 07:56:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6e27b91f1892d3f1c5b746c44ff8385c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 08:01:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9b6ffb59484a5c49d5289b8346131e8f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 08:01:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('db20456749eb94e573a74a279decadfa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 08:01:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('51ef714f0d7436475426918f83e83c6b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 08:01:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('436f66e181e5e2d5690864de463b0cee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:01:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('71783d032cf03146eb30c8960376f1d1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 08:06:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ef6598dc0947dfba6f02589272b9b8e5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-26 08:09:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1b67c226bcb6f56bc90bbdf89ece9ce0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 08:09:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f261888a7ab9391e505c578078771dc8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 08:09:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c1e98e43ecff120af81a43ef2ea9505f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 08:30:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5cc7004d2539d8add54ed652f82cf3ba', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:30:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a869c9f969ed92cff774509bc9314f85', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:30:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2cd8122a96559c3a715b878c2da3deab', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:30:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('85e92a18850d34e6dd4467c802f6d3ea', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:30:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('caff7f07d2e5dfbeb114a3ee36bdc756', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:31:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9cceedde4368a1ee1edab44eb96236e8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:31:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b60e2fc40cf15daa35dac7514b0ecb48', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 08:31:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('88ae6d81594c8c1cf850fa44473c192c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 08:31:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('abf51fa3f0c5a3e22e3d4dcace7f9279', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 08:31:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('07bc79b53a5131a409d0843f77e5e933', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:32:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e12f2db98d9c6340387914b259af4d5d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:32:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5312043740bc0b26918def9a79b38ad0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:32:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3416fb6aefdd89090abb7ce0f193242e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-26 08:33:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3423f16fe47f1b3ddda7482dade8b37f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 08:33:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL);
INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('1b45aed20a2b20e47a74817b8483e687', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 08:33:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('78d35c40ee25b3cf4e0c567319a9bbbb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 08:34:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('95afc474e3f6e0249c3cb1c94a2d038b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:34:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1600a0dcd168346cb25fa5e1768436fe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:34:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2fd0ae88f51ca2d81675bde02f31fbe0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:34:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4283437a2bd9beff67b0e5e5110fac83', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 08:46:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e44aae21b68d3030109bbd6d4f46b8f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:47:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('650c8f3219bdf535bc5501efc70eb20f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:47:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('182b5018c3ddfc02fa72efbc6c3aaeb6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 08:47:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('03464439fe78a3e50ab21e9ad4e03d7c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:00:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4e75c37138147e787dc3bf5645db282e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 14:00:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fc4f73af6298d37b8c2895b469c51793', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:01:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('488f72e0800239f15c1497ac32d7761f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 14:01:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5a47cda8328b43b602927d76b8404e0e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:01:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0799ffa9279fca0e0094a397c4dfca28', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 14:01:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('19d3d4fcec7e2f70c99488bf78e1c57c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:01:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9743ddb3951fca448802708289fc74d6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 14:01:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7edf99261a8e25205382b9f3f8f10a3d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:01:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e089dbb0fc79b2ee91bb09569cc92a00', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 14:01:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6f6047a7f13b428c10e9b9ef09e6ce31', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:01:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b58b47c17c4a340497a2e5fe73dffbd4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 14:01:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('94b7922e2114caf5f5118f9e8bb154d6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:02:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5969636d720bad22b3d5a0cdc72e30f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:03:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fa988723bc9a26c38f4b1a1984040d18', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:03:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b275b6e0a1768071d5c6f0bcce985179', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:06:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b95e1c75cc75dc08b7cb874ddf0deab2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:06:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('33e664c990ed5d05b83b7fc49951a950', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:09:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f8a50e8cc14f1b4ef81a4faa6f570e61', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:17:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('17dbb485f4f70fbaacd3712f4c8427c2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:18:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2a12f6af21a883cfc7abc31d885dda0a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:18:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('17ef772c39c9029466677573d51e2279', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:18:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('00490b358c7c1545c1d0f6854993b308', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:18:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5d20c2160614c252581ef80008806ef6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:19:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5e998f8b3ec8e15fa2b739b2aedf425a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:19:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a904f524758f49a34768298058c8cd6f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:21:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('163e1a47093ac697505021eb88f1611a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:23:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1fbc7368fbcc072edf2f080afbebba7c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:24:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('85cf3c0826430d1076faf7474ec0c4d2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:25:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e8617a7d63881fac37a7cdd925c8783f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:26:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5ea427272074fa87201f23ad19076ef9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:26:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('feadacfa91662599c0c9ec27be8d9931', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-26 14:26:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('073d0eeebb0a8ef17bc54c1b38f1c2de', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:26:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c4bb6beca0da2cb4769360cf089ef9ff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:28:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('17e18fb0638b42c74e616bcde1d97669', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:28:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9aa999791e91a5d0c8368ffb056d77f2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:28:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('02a39b1dc30a71d4071abe6e87923864', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:28:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('896946f549ffaef448e5b1bbbf36b11b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:29:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f683998cff2c88f92db5102d26d2ba57', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-26 14:29:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c9697527299efd92a31e51faa3cace56', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:29:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0bca6df92ee6733315acd85e7b97a695', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:30:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b9a4acd6b3f42d7317350ecc0cd8a307', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:30:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f3a86951b15fc80682ecd642a417f595', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:30:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('27a0e54926c9defffeeb46cbaa9d77cf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:30:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('de8a196a5b373ef95f333ad142acbe4c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:31:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f6450461b1a00b2c427fccc11e9c3d1e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:31:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('caf6a1e14caa4c8965b10ac9ea3f2a92', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 14:31:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dce22c2891bde2508e2bad1ddbb63b78', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 14:31:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('64f6edf808d618465bef370175c81d82', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-26 14:31:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1f69d5d66542a4585330379a29e5deb4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 14:31:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2bb6267cf8344ea90631a27012460b4c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 14:31:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6a776c756f3ff8c18f6d5f411d292f8f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-26 14:31:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('42eba8fdec12067b2f7cb95d114a8f17', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:32:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('41d85df716ee23f7428ee85dfdaa3a7c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:32:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('815263074e86859f2062c1c9ee9787ed', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:32:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8a4b830fc3c20641974411a7f0c795c3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:32:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8fa02d8057c220b0d8ee2236db2b8f14', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-26 14:33:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eaa9dff87f82d05236f6d3db575de25b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-26 14:33:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dc8094e1e5f93ef67f62e1147896d410', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:34:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1bc484f6da6f78c39c491dc71b2e8bfc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-26 14:34:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eab08c38f296dff7cb0151e0ed74ae00', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-26 14:35:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('03f67a97febc3407f0f3f547225e9f88', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:35:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eff1732593854363be63b7b1670c461e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-26 14:38:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b7177572b5512f15489165ede39a783b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:38:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5474ea8a7f158099d3605fe405723d29', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:38:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('529b4141b439ddfe339b60bf6aefb7fd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-26 14:38:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b4a948591cc1b2e575fd02d389a80fc0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-26 14:39:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6acdbb6bedf304e3ae9464950e31f533', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:39:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('704bae507802536f94e2ec8505d10bff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:39:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b2510bdce6362259e4601247b3eb308c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:39:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6353cf338f596a2e0c8ab18dc100f023', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 14:39:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('623935d233c0380f7a44cfed8b409778', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 14:46:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9665292008c9f5f1d7be0bf2344ae203', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:46:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('39e7ff47097337d68ab520d98348e3e7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-26 14:46:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d6ca86480fd8789524491238cd1c6e93', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-26 14:46:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a28d72d182f0848a9e2f50cbe420213d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-26 14:49:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e73350b1be0d2369795eed35d2c01e5e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-26 14:49:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('55231adf55855cb0da7ef54a37a56e3b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-26 14:50:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cc5ba8c67aab60fef7282f2847d3cadd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:50:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a94015dc75e9d744f849ba88fdc4d9eb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:52:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('96ed446b6233d821d2d1b9ad2eb4b950', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:52:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('36de4ad9677ed484e85195bf23c19105', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:53:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('17643d9e8dcd9164ae49b914fffff8e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:53:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('45ae8608f734bd7349d82d566d45f3d4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:53:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('bd418eb6679f5d44862ccd7ed3b6e5c6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:53:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e3ce992c7053f3095c9290e936a24dd5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:54:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('06526db6917cb4c10a479dff76f8746d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:54:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9d0ffbc8628d57eba5509b443a38f5fa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:54:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('473594c7152434a0ad23487848d32c88', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:55:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1a6f867ab1ca04f82055639a3dfccc68', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:55:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('66e0f87581dfb6b07b6b0c806f97ca61', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:55:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7674b1381f3d50841712820a5908e38c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:57:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6e85a02a6d520bd05e0ce5d9d82e68c4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:57:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cc7231e4e9e5fee5858afbbc19fe710d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:57:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8021f5ad8f13500d5aca3f2d1400d56e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:57:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6a6ac72e73fb9275bc04e79ae95d8ca8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:57:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('75b392d32178f26b31a7446b9343650d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:58:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('67ab2a392a2b301eedc34759f26b433e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:59:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0fb2a64e1442be0cb5b72240fc2b4745', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:59:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b5b8b1b83c0f4c610f83c6e5f528117c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-26 14:59:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b069dd870b9e54117d76ac2844fdefbd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 02:16:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e353b2fb003f197dc6808d38997f3555', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-27 02:16:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('28b4cd69507b0113f5927976fe505dd1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:25:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2c727a8ed39b6a501b669e0f8ae973c3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-27 09:25:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('edd47a35a9b7be1275f610d22f5e6c4e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-27 09:27:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7b8ef05f318928fa2c96b4ca941cfc31', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-27 09:27:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bf4fb4be5be1267c802bff52aabc2290', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-27 09:28:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('660c71e2a3bd07a9dd6950a4c723e667', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-27 09:28:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3f725fc9ed5bc209fa79c337599ae575', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-27 09:28:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9ccf7669b924e1ed63cf805916ebf69a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-27 09:29:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7602f3441fa49fcda020871dd75bb1fd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-27 09:29:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bbd0aecaae5a3aa314c59149112b6fa0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-27 09:30:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f1c53cb5bdbf9918e1c085800a34de53', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-27 09:30:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b8210ddf16e3bb7990ba1ea716549626', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-27 09:30:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1f3c30f496a5176955dbb0425297ebed', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-27 09:30:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce7a6df9ffb3d55ad0a21ac06098ba3f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-27 09:30:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bb45483098fbf3d86bf96e62048f1450', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-27 09:30:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('22086970285655afe90f0fe6b1c7d4ce', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-27 09:31:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8e15cdafcd2b8ce1310243008da55834', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-27 09:31:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a3961a61b022f515831288453d4689af', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:31:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('888a91c29d3bb34b3185fc224c551632', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:32:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c5dc3c018e98177f7df0e2bc63b736c2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:32:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1e34ed27e30cbe30043e18931dfd5206', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:32:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('73a1f3af68a9572789e10030c255c12a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cff1d1ea1f04c5ed8e833ef17d28f1d2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bef9fa527a86c2b5450a0b119ba3403f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fbc657b3031ea30abd3de5785b79127f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8fb0af0c311070bef084c69d841adace', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('51e0cd75efb63f1ab39699baa03f2ab3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7994cbb48fda39773d83d11bd571f71e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dfbcf33fd6cbb6bc7606482072f0207d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f1c28fec86a4e00ff74ae0f634226225', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 09:33:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3a5deadca512c084a1b96c8bb5e166af', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 09:34:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('67d7b0beeb58ba487bfb2ef029813353', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 09:34:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8377bc432da317ab56c13fe55b1c6103', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 09:34:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d37f34e15b77ed1c92fd444d1304a33e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 09:35:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dfc918bcf81582760fb9432659c2b474', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 09:35:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7ae85efc80ac253499622005e1123d83', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-27 09:35:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('58ff1ca3e321992792bea7ff5b35c6b5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-27 09:36:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7d6e406d57d4850e9287750ab562775a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-27 09:36:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('db472ea022604ecd33d4dca01eab8f7b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-27 09:36:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7e1e6dad3e86692584efa60a08427655', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-27 09:37:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c1eb155192d857950e0800380bc4c069', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-27 09:37:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0dcba72c1f8bdb0b1f1bda5d40db9117', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-27 09:37:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('68db071ddbde20a909177f2a8e05dcd3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-27 09:37:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c6370ac0f7f04b8dbb0d58e600d9fcc6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-27 09:37:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('29f01616b207bda19d26e62695363ae1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-27 09:37:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4cee312b047d4bfad1646a58bdf2e8c5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-27 09:38:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('68e1f6984a5d5c9c1a3ac73cb0251491', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:38:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4febd755371a92ceb06f8f5bbdeb07c1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:38:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('18d7ceb55a5f3952b48bf645d4f42f25', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:38:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('60bcde64ac65ba3e8e72b3d1ec28b260', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:38:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0a0b121e07ae710a4b663996a851388d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:38:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c83aab555caae6f93c2215875cb677ca', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:38:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5f8d0577cf8a62af38d4f2c359d72569', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:39:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ea08812d93114e7c3578d6f40fe37eb2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:39:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3b8a99169ed68c8fe226f3cf42d1e4ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:39:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bd00d794d58c7c2179788e21eb561dc9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:39:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0810be31ea6ef2c01393c3d34aa20258', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-27 09:39:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3478b2ee15e43cd7a652af9f15bf9fd4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:40:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0eab708575180162ca1cbf87e67f0956', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:40:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('321553034cc643a1483326934974aec2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:40:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a554ccd49aa5ebb91a48d4fad9674ee7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:41:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c356c071316bbbab637fec1f319a67cf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:41:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b8747184ca6d5c78e6ad4b5e0a8f59ae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:42:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('59bdac8de4e1de036fb7a3d7044beaf2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:42:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b27aa3bff3e3d6b55ac24e213c81d389', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:42:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f0d58165a2586e5a1d0b9d630d45a18e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:43:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c70d86cd0a88cdb69b6c8125d5479f8c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-27 09:43:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('665ad4bef41ff8169d42aea1b45e5529', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-27 09:43:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5c41363548fa5d126355c87c6dc2ef0c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-27 09:43:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9b31af71ae0c074604fabfb9ee22dfff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-27 09:43:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ff01c804bf7d518a63c7c8f3f6f99991', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-27 09:43:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('19e246b2e5cbef6145719a5fadd63ae2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-27 09:43:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2319faf86b99a55b21496b69ddfbf9d0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-27 09:44:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c95187799389b20a0994e3c1650f78fc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-27 09:44:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('932de8421ec60ab5310876ee1b52e08d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:45:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3d3035206e9dbf7610a8c94728928f38', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:46:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ffd239eaf3a2796bd5d58003ddd38a5a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:46:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('32bb51446e19016a3e4b9cb6174bd126', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:46:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1fdec1e1a1843c8125d5f43ee0ddd420', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:48:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0ab2dd206c5c7d7f9a48700bcc82ebf8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:48:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f13c98efebae4170e52bece5d8b518f4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 09:51:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3e4caeefa7c50b480ece465b37a8cf3b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:51:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6d3546e021e4bd8527b13699df0be557', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:51:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL);
INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('3b0eda9a89a048d29ca70113e729b641', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:52:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3de475df6e4d4755308cb958574e437b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:52:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4056df3af298390620c1020578648557', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:53:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f36a5e28a4bf21691ee54d6b350f25c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:53:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('649f65cc9ccf5f9f44681d7e8a1cfd2e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:53:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2feebb407cbe986ba8fae7f4e0a42701', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:53:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('72ebee2dbe4d7c3f98f48000d37e7e7e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:53:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4d82488c7adc5289f97628dbe30087b2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:53:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('815a409d9f5d4f08136d523a54cb947a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:54:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b141d0a9854b86a4faaa75f96325fe39', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:54:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dd39f7dfd89cfc1683aeda3792b04988', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-27 09:54:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a4df2a4cdb757b459817364e9d2098e0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 10:08:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('47aa541caa615cbbe6952d13fbae9eef', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-27 10:08:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('091eb22167379cd5b367cba8cfcb8f58', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 10:08:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('812e5ed20c65651f406fbe17d6017321', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 10:11:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e74290da5df16b7876d9d2fd23357eab', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 14:08:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('58b62d5e6e51e7d2d047894870fe34f5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-27 14:11:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4cff79ed75a47609097eeba024f181b4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 14:13:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9fbd5e2c2783c531d6fa481c6bf5db97', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 14:13:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cc3c70e44e927213cbaa7efaad479180', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-27 14:13:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5a27cc5a53124ada0d0e390db718a6f6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 14:15:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7eeb5490005457902fa7d1b4f0fba4a7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:15:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e374d7a4297366a7c28a2448a50afd60', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:22:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c81260752a55afb398e26d332da48b1c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:22:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f14a77856e984e6cb90f5442fde9dc49', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 14:24:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b27b3244bd5d0b6ef64f52a020d1dc13', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:24:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4b7115e543f3b9a7018b7b3e5aedcb6a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:25:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8f0c52b4d432ecc8855f2a1b2a15d817', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:25:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5fad99757c85bb14f10a934e5febee40', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:26:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2d774a2455fd124654a07a9889bfb153', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:28:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4595e61e15a4cb36dd686b72cf9e7b19', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:29:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('115b3332d6b73575e74ea3e2f8b9a547', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:29:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f2b6e1558e5674f3803e7245bcc7fb7b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:29:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ed009e0b031edad22a5c18857f7979ae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-27 14:31:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f91232486cd06f5b268ccb670080073f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-27 22:58:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('efebfab9f8aa1a8d57a3e8ae9c30881b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-27 22:58:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c0918b1859ab6d86d0c71424832a1515', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 22:58:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('758bb18345e011d00c12a43d9935d27f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 22:58:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('41f7120d9a8382232a11b76ca0665017', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:03:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('31153acaa1880aa57ab9079f9c417dee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:03:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fb9cfe1565b10df8cb5e56de26f791e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:04:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c42b33b94f3fba15ca1e8c531c30270d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:06:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8fe50bcea70cf648f9e47ad6a1bbef2f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:07:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b924a427edd9603f400777a39037fa67', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:09:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('890a2f5e45199c35cf5c8bcf29f7163f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:09:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e064d203dae050c031920ba37e525059', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:09:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b5c9f4c671281d941281fcca7d05b274', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:09:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c691f34d01ce0f680737ee6de7ae1686', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:09:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('febe31529293c8aace397df391ca71c5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:09:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('118b4d5574394a55801629758901e95c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:09:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7c3af1604d38502499bbdf96c60104b1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:11:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1742e692ee43293e0504df7d6744fba4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-27 23:11:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b49d4f2ffbad76740f4497cd740cac69', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:11:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('25ff999cc24b2776ed95660414c2593d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:12:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e4dedeaad623156061d2cc2539cdf2f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:13:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('54000b6076abcf90d06d9d6b2ebcf761', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:13:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6c4aa6ec751d495da23398642c0cf7db', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:13:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f7de6d5daf800d57dbd3d93ffd2920fe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:13:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9ee9bd57eee513f5f2dc714a14ecbda1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:13:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d35cfe88cd530a18971e0e9295bc0ffd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:13:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('82abccc2307c483ee37bf7d6436b3070', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:13:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8d8d5b12b9f14ef245fce78d297a41e7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:14:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8dbb71a31a008a809496578c5cde66d8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:14:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ef71f803b2b74885129e19e26a4e15dd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:15:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3fae9dd6ea8afc0d956d5a4be14db8db', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:15:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a8f84ada1a03473eb05337d47d35a815', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:16:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c3077a029b15b74c085cee6f371115f0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:16:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b73f52adafae73f8287358db61a658e9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:17:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8ae4d0ace4ad8595f6c540f7eca86c29', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:17:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ef371d33f30490bdc6bc4c8fb93ddcfb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:17:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('83e2a53ca50b5abfa468aaaed05a52c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:18:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('dff72b183967d0f76ffb52f644afebc8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:18:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3ef39245702903278deba60fb6a401bf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:26:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('bd68bd9bdedc13f2bea37a92f61a3589', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:26:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9cbc5cde4270adbca37b48dff99ac1ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:27:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('14bfed0c7142311c0ffd273e3c917cfd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:28:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('011e9113a0e3491a198fca232aa6dff7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:28:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c157c2b6a93ddc8751f49d38dd4cf80f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:28:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8db2a0e853070d22ea1c6d2810481f38', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:29:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('22a07a8adef76739cb1cb18d3ddb1e87', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:31:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('828b4e879d0a6cbb14b3890ae1c18ef0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:31:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('103d1d0f5f35edbccd5d38d74f489143', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:32:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5b7a050f7e42aae4cce02a15d57c73c4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:32:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('76df55e694e6bbe87108251ea5d7a5ae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:33:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('60fff78c03dadd7d0cb3addf8c0d30fd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:33:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0be81b128565532e449a1ecd842f5ea9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:33:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0be034d3d7d9469f65234a94381443c2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:33:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('162a368ad71fa2aff84b3b694907d56d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:34:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('bca9d36cb79cfdba6c3a56b73fe67b15', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:34:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('eae7500cccd82f5082e7bf711e08c2ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:35:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b48ba53d867c6b17d24f2138621dd8bf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:35:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fe45c31afd2e7e222a76b41766e725f5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:36:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cf82ba56a0f5f3220dd05a073b89e758', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:36:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('318d4983dc3926e18c65a1bd0196e469', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:36:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('807b80efff039c9f45f8364ff4d40739', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:36:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('30ed183faab62e415074b10d0a55676c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:36:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('465b0a578f5b09d224c927c783689d08', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:36:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0b085ba83eaa8b2cd1077c8a2715691a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:36:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f9b482ab1c337c7a6241945d33e57421', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:37:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c95004915f9565a1853d03874c5270fb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:37:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9ad282fdf6bbba13edc17b637ef53402', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:38:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('91651860f9e6d012f143737c30a5db5e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:38:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a1e32963ba816fa197a3f230ec7aeb17', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:42:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2ba6b9790be5a1c79822adaa150dd0ca', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:42:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7174e45ee93420d1bc50fd20a7ae5e66', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:42:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('386ac5ea6cffb342a48a64a78007f92f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:42:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('653e6bd514147268f2667e74c4f17018', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:44:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('96d4583d0354c42d79e8e26b8281a371', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:44:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ac720c6582718fbb519b56f9782ae074', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:46:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('df8f5d509e68d0b4768ba857cddb0b3d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:46:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2d47ec934fffd6f556f2c1798db619e5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:46:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3beb76bce1d6eba1061ed02c6d905809', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:47:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('65337168a86a0c18edee526e0d414dad', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:53:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('444b4922f596c2f4c23ee02981003282', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:53:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('489a9e0584bb777c8415e6df826c7325', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:55:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('98adc6f20fc9b9cf318b41bc39e3485e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:55:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('81362f9e65e210f19ef4c7e769f9eb60', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:57:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c922acf29740adabbf0225379645fd90', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-27 23:57:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9bd95cdbb11a05c3dcc445819c8dae95', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:02:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3961fad3b206e453d2ff6cd9028faa60', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:02:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0807fcf457b2579a4fa7c282517cb49a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:03:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ac0d7fb3eed1f0bbc933f40906accde1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:11:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a1283b479a8796d9afecbf10cde6928f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:11:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1bb7df15bf00c00b93205599606872ae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:11:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('aa9e3a38d5444f5667964350d4f88015', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:11:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('836ea213e12a263299b45097f56161fb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:14:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('43a949d90791d704582ee8e2f898a909', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:14:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5e3a1df540091de7da921a5155b22e4f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:14:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('38c6fb0f1eb382a3fb835ed83ddbfe5c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:15:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cbfc482261c44b3823a8cd015f1346f0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:16:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b532109235a9ad38d9608c16a6af24f5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:18:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('dc587c0375c720542a827a35136b760b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 00:18:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fc620fb70c18d694d6fcc959c584ecd3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:18:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e48722c613cf4ba9037f5aa09c7db98a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:20:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('205b40345c106585af803d0966b5f7aa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:20:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('50d96ab3207f53fa86d001438eef9e2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:20:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d1f76634fdec1cfd1a654240a1314168', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:22:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('bf6afbeed0a88260294a066a91c1e2a5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:22:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('02c099b0c3c084c83eb68f017dcc3040', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 00:22:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f5e84268316e33a41e0eba77f052dfe0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:22:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c248d7e670ea05183d1f91441521671f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:22:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2b7b24966f5963d2e0fce429756cec6c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:22:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9deb1255dc26bd39e251b829909c0bd0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:23:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('eb2b01b478f0fe734e6dae792a415634', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:23:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8492b7a27908969a7930a350f95072d0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:23:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a8384d48ccdc8afb26665445b74f501a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 00:23:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8473d5366f443d9185fe1c2f8e204b67', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:23:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8f4a0267193f07ca71c3040b9b07852e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:24:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d84b2caa01c07676887ccb585ba5fe0b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:25:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('64666a57a40132675608eb6661c541ef', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:25:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('eb08e33fd75be25bbc4e20f334d711c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:25:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3d9698186fa521ca7560950c67337c9d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:25:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('70bdf5a1253eee88ccf252c7dad48367', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:25:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ef17581cb855b461f6d799bcac4dc783', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 00:26:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a97a62a905b4b2b44aa20b4d8b758b40', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 00:26:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f8c8167ee3a2577816d74e277a52fa01', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:26:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cb7fbf38093748d8b52436902daf4c98', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:26:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d26596bfda9b6f2c3b18ed156bd4378b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 00:26:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8e6895093abac4d1635eafc5b3394fc5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 00:28:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fd8ad90c0fa96475261f9b55cffaf469', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 00:28:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('29bc3bd1ed520737553a66506628caac', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-28 03:00:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6103f4df5e779415e78e18727ebd6466', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:00:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f636c49547298d11d7e26325e791fa17', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:00:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ce024269a6b35bbce46483b253d80eae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:01:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ad026530a418cc5f7d03b333d85dc9c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:01:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cb86b3bae60d61a7976bfe738b0b3bd8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:02:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3f3f40fba9d71cd0be90f2bbd22ce051', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:02:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a1deb8e1c2702af6ec5fcad0764be84f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:04:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('254003673732c54288fd19e447e033db', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:04:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('18fdc8aa18281c865dc38f30ad986de5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 03:05:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c226c620a77242ef3f906af2d57713cb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 03:05:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7c8e63504b033e2ae4bc554569998a78', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-28 03:21:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('18dff9c5bd79724e46b7498d2a0db8b0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:21:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('70a63837064c42cb9790cdbde4717ddb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:21:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e7a67ca653bcd078a48a74e3a5b8af05', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:22:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6d4234d96de969434d8299dc740a23e8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:22:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5f42805cc0c406ade973d96689039f7d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:22:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('02af3c67139a66ec4f26339bb22d698f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:22:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('056329296c769842798c8e35ccd2ffde', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:22:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fc09b34098c99666662e43ec0253b1e5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:29:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ff78d23db2aa4ffb368737ce17a2f115', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:30:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('200117b5e857830637f616e548e08321', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:30:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d5493f52d8a5c2cecf6c2c954fda69da', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:30:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5704f906d3f420b6705aedace24071c8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:31:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('780636dd95207efccb4b861769c2adaf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:31:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('946758cf87d939e728bbc3bfc783bf75', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-28 03:34:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4b0820e8ee03db6486a3cb7a67723faa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-28 03:34:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('721527d15d809d809e27ac200fce0bb0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-28 03:34:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2f6d773f1ac2aaca1217f7bc520286a4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 03:34:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('aa58c24c20ffe15078bd8b688106688f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 03:34:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL);
INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('577e8b86279e1aa426b532d846467c48', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 03:34:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('25b57e56065d558ceda2a0da7f80222c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:35:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d9cde08e884ee07639b9c759d2e4d990', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:35:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('46cb690dbdd211976901a1bf19f7e8c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:37:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5be0585d5045ca3ea01016ced4116c7f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:37:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3cc2965378058548652c6ecee59dcd7d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:37:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e43245bceecbaf80003d97053ff109e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:38:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8b1b8e53edde25c0f379119bbc1faecb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:38:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('21af0c7822876ae069c661f88d1c484d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:40:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8aa980226bbeda2a1fa463bfdc0a7e15', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:40:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2781502f6e76b2a29dc80f9aad902197', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:42:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fee006d978baa510907997ba2084f254', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:43:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e611e19a191dfae91ddb6aedf29bc4b9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:45:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4a270a1863f95a5d7bd834e2bba503a5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:45:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fa3d668a0ad702a165ba2ccc4671db06', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:49:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8a518bc0bd214d99ccdc6adeaf9fde60', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:53:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4cdc88967dc329479177deb63912aa86', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:54:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('bd6cacd250fba4e4ed18b2862446b588', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:55:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d25f575f5a38a19f58a75d3c9831b3a3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:55:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d5264c6c128164be3edce883b3977ea5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:55:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('859b3fc9dba6fe287454098b535c6de4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 03:55:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('482f702827e0593be11d212783d629b4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-28 03:57:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3a0dc460258fca6c526e0e3ecd9f4b1c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:57:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2d912ebecedcf50d3c3ea3c818d14a62', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:58:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1330109e2fd050a7e38eb262e7875d90', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:58:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6293a2dd405593447f1588cd9f79b585', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:58:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7cfcc26ffa93727d2e1726f501a68a87', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:58:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('71862a66f65abc7827254831565272f1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 03:58:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f89d144d45892afad0bae4b9b0d23e52', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:58:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b578591d0e8314f926d02cdb713d20c8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 03:59:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('259cd92b4c9cd2f501590f67dcb7ff9c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:02:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2c8edffeb3e189fa7a0076fdbcb9d08b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:02:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ac4059626192baebe2d00500af053d3d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:02:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('763c917eb022e54c6679a961b3990f6d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:04:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ce1da714e18db2c3b2bcfcf9f11f53b2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:04:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6967f54651ed4bf5a41a10b8f3548420', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:05:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ae1ee6fde18613e987af34f39476363c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:05:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9850ea680f8838577b058bbb8a366798', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:07:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c52bbbf364f4aeb6147f1e27513b7541', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:07:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('67fa3cd7108a0d64d9a1d5f1e5564ffe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:07:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6089ff908fbba4dea31297c4dc1fc0ab', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:07:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('65f86bbbe78a4ee02ef8c17061aa957d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:07:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4fc4620275b8fba00ca4f108685db457', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:07:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4a44db420231ac8d33a87170ffcbcd29', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:08:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8cd6cf796a006d4fe38e2c8bae377c86', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:08:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8f0fd22845b9a312a59ef7a5894299ff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:09:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('bfae968334251cd25b9a17348ee192fc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:09:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0e41b89c31ca9f0b6046109a9261d874', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 12:09:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a5f064e639a321226b24d9f8447a7e80', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-28 12:31:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b2b593ed9bfd70a7f6f4abd205a9233b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:31:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('365ddc2b13b929374a3496e8ada05a1f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:31:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('235439210919bab9ff31b0ba3e472e16', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:32:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('38c280af53957732994d37811f35398d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:36:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2b2f97f709b5de50144693529839ab2b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:36:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fb0396e5adf055a8baf64d66c8d2c1b7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:36:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1a05f879e0d3540d5177f20a0d80312d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:37:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('579a90be909b08bf0eef67d365a03138', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:37:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('cb31b1b4417ff6b9a7430c43d3d8b72a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:37:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('506e35d4fee4b3a266cb7c848e1b79e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:37:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a4c875ddc9a93fe4e7b30cb0a359c1f9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:38:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('df6fe605dea39562d9ce8adab1d86626', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:38:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a3f3fc9f5476282376bc17765ade4518', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:38:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ed230ca92cfbeafe590119f8dc677d05', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:38:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0ebeda0c0a7192a35621129b7f23f566', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:38:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('68a768c574761b61cecabe02b0b4cc25', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:39:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6f6d53d077c4abbd32b465623ee282e6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:39:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6ed4e84a18516b736c0e333a66a91a2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:39:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7ff4a194e2c9b979d51688187144521f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:39:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d55c1869dfb4709768aa2fbcd4ae2d9c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:40:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('907933f1d7856688ca0d5f4611c56e22', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:42:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b31564f5ecdba2bfbb8515f14e42cfbf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:43:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5e0cea9d2ca4eea23422a4db800b9dc4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:43:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('16ce7a3a1a74e9b2b17001628393c773', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:46:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d430f16cb8839b6617af8a2d25292478', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:48:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('51406333e5282c13d624757993d4e4ce', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:49:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1fcce699bd2db66b6e11d725b991456f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:49:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8b3e9e219d18c8c96f9fd414e552adeb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:50:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ee0ba287798d15c3f5cff18a2cb76611', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:50:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0bd84ff4b7cd04af3da87902b3ee0ce2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:50:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('fd7d8af0048617e0ea77fc0a0c297aad', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:51:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('dd83a73c45bbd692202f1f23ef703758', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:51:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('18d747f156ca4878a8fc42c96163279e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:51:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('311ff9d89d698df29e67b5e4e65a814d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 12:51:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a0c8206a4df661fe3389c9b75cb5023b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:51:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('060b6cb6023abb16a4891f9323ef847c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:52:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('10fb9c5f2a6b57f899be46e2eab7999d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:52:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('9bcb1dd5c4130ac555eae180b4110293', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 12:53:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d023645d7105e22f38f6f48cec73c96d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-28 17:22:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('dd994fc35ab64f714068e13970143202', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 17:22:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('0a0c0c48dc3c89a0b06313cfde7720ae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:22:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('450b436fe39bccbef0e1a3c25a97f822', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 17:22:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f49d4d63a947daf8600337f14cb4e501', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:22:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7462d91ea8268bbd7d817fe3b49105ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 17:22:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e4cfccf329fc4199a6995e9746b4f5fe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:22:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2239757a7ab7bffd30b5e1b75d747698', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 17:22:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f90f77aa3eb776cd647283fb838a9a75', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:23:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f2066efb9e8fed3735e93669cfbc8192', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:23:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e8077fe539bb467c82a17317b7985891', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:23:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1d0b71888896fd4ebd07022d96e2722f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:30:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('d93cfda51c8ac99adb5cde0379788075', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:31:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e931f862e7a2baedd66ced1158e5f5a3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:31:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('e22f0f734312f34cad22b7592dc137f4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:31:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c73a46cd783a9b3d5fbd7717718076a8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:31:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('da793189a40fedfb71fdf77b9b573e82', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:32:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('246309b684b3651de639f9568a6d9b5b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:32:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3f0b0df4d3ecd0b0ad2d3a2ce53a2930', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:33:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('51352784ae2a7ffb2cc9106dc45bdfc8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 17:34:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2547fd7f4c57ce0356f823c1fd606ccd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:34:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('8fc168d49442f018e1cc8aa64f2eb013', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 17:34:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('801a3faaff553ef320be5912bfa2254f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-28 17:34:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('4c769998aec5c49f368467f3518c0386', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 17:34:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('b3b7271cd5e51bea9963454dcf2f9b53', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 17:36:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d3b9530255ccf7f5c88c0abca8ef4466', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-28 18:23:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6d08993ceda84e6ace2165af792930a4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-28 18:23:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7eefbc54d2bf0b4605ec3d23e916a011', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kategori', '2020-07-28 18:23:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('278a6a04fe59f0b867951059aaf16854', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-28 18:23:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bd8ef3ebcf3ce3559248301749f70230', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-28 18:23:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6f5f331162cea584a1fb711319bb5142', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-28 18:23:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('404f778d48de89a34f434bbb9520dec9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-28 18:24:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a433d988316dcef396adebb5ada12b5f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:24:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('226bb3c435ef64da177dc21ed73caeb4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:24:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c0c03f056d1c013674a27a3160dc8667', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:24:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('826991a8472813c5bfc57cdf23bc0d3b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-28 18:24:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1f2c45c68cc09e44630526b6ceff0919', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Polling', '2020-07-28 18:24:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e83f94d6f89c6c0534e73638b0ecac40', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-28 18:24:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('20608f68a162c5bf319a6926b5b4b474', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-28 18:24:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e42b596d9023c2193ed026e0533a96b4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-28 18:24:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b88ff8aeb3070c1ce5a22fa0ea42ac99', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu BroadCast Pesan', '2020-07-28 18:24:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('34c26751c5e31edaaa84078bd7da9388', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 18:24:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ad9737a6a247718aa22244c8f6c10f5f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 18:24:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('83f120cfbd193ca823c3a5585664fda0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 18:24:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('774b2f49b5814ecb67e2b6aa7ea83306', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-28 18:25:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('71c43b2e82a35a715c9935ba14d03fa0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-28 18:25:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5ace5b72aa894b73b2a0d95c39fdbc9c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-28 18:25:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ba8e0731780e23ae3fdc3105b07829e1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-28 18:25:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('ea2902fdd9d8d199f59483e7411e2c48', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-28 18:25:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c30b98dbd490ce86ebfc4b28260a7fc4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-28 18:25:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('96898f8076c6959b15e152589b22ffe8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:26:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('6c0815df0bebb5670648c33f22c322b8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:26:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('2ead7c8f4ece0b78b4999f9cc122b3b3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:26:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('478c88d70e92a8db7e836756ca9f94a0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:27:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('3a95d1c332d0750cd05dc9fb51217e9b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-28 18:28:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('a3893e1e656fd041c30f84d03498f890', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-28 18:28:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('f349c69fb9f90e38af306246e58f485a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-28 18:28:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('52e58b2411d6f7a6b750b4aeaa87cd07', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-28 18:28:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('5032f27fb1e5fafb1b4874dd8a2459d9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-28 18:28:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('72b9e63dfbdafaf053aebb3983938693', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-28 18:28:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('1b6aa98ce4c0082cec063e81b84eed4a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:43:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('7d80328e8275c7b51ce6f60feea1b770', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:47:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('151e273ef77ce2be3eb8a73a96e3784f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 07:47:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('4362411f500c16a7088e045287acb48a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-29 07:48:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('7511f8b967876bb6d07fdc90379a14bd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-29 07:48:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('81a155c1bb873cc44aa896da4e3e2fb7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-29 07:48:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('1235aa0644e77b7c069d0faa6f279876', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-29 07:48:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('84305c27417dc26451e4102b5176f2ae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 07:48:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('e388b220988def901db64080304c0abc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 07:48:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('565d51631bb4fb3d9f8e16724264932d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-29 07:48:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('06408471e8cf5b4a8346d55f23dc6625', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-29 07:48:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('97267e86f248696836b2b9ab7adc5b93', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-29 07:48:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('ed345e1a524253179177baa989c28416', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-29 07:48:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('2287486adae3ff558a20e4b783a7f71f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kerjakan Soal', '2020-07-29 07:49:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('e1c103b3aa45e8ee9da8604600aad618', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-29 07:49:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('fd3590806ff7a0196eea602d954fc0f4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 07:49:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('8d70cc2b14a8523095df2aa6e954916d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 07:49:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('974e3e20610338d48a3dc274d28be7ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:51:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('721f4e05fec6e9502f084eced5fed4ca', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:52:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('e800f269a3367c7fb25a4e6a63dc2fbb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:52:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('33e62b171e9020b10360a10ce8573faa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 07:52:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('e7a37a26a64be9b90486449c0ec635b1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 07:52:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('e39c62b31b2992db142cf91ed30c9023', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-29 07:52:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('ad2f138efc4e9acafa2db3a9b5d89ff7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-29 07:52:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('51be2cce93f8bfa9fc57de62b56173b5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 07:52:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('f86a2005720ca424283c5242c144d960', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-29 07:52:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('457710ac7b35724a1ba59b66b3897400', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-29 07:52:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('8e6f01eb12a07d1abc2ad3e1c5d753d7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 07:52:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('9d861c3ebc8609b22aa31ff5161f9f5b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:53:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('82aa7b27e3c0d0ee9c13b11a88b5cf30', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:53:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('7992a593e6d2991eb26813f4658b4da0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:53:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('0bbf6a5c75a16adcd2fb5c9be508ad68', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:53:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('ae8e3bb2c21ddb8d8ca489aacf771ce1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:54:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('1935aa6a4215b0dba32033e1419c23fe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:54:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('c416fea849e03b0ed310076864c691bb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:54:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('75c3c857d7ff90599c46cce201770b82', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:54:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('459e22af1ba9652dd360b4abca60cb7a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:54:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('04e97e23be6001d60870a026b913ec22', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:54:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('66e190a2c8d3ec24a0729364252dd03f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:54:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('aec056f40af84aabd48d8c6ba152d404', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:54:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('c1e2e1963ed16529b39fcc7061fd605f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:54:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('16d3a0a33abe12172d6edc34a722b641', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 07:55:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('3334a47e99562e2c086188158d8d5b1b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 07:55:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('36676c0a5823948992f3b2c8e3c3fec8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 07:55:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL);
INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('8068549dacc86bd582901c2b33336c06', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:55:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('ef846da13917f74fdb7236fac10ff1f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:56:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('cb6ad69fd6bed733802d5205667d6ad3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:56:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('9634854bdfd25aecdd928a97ba1fb856', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:56:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('bbd9cf74e1128a841583ce91c9518b80', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:56:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('744a23d8246a6aab47816a64a23c1c99', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:56:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('2fd9892819b24384ae70d5c2d8651aef', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:57:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('00fab65909dff2c4c21cf28823e37ec1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:57:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('e9d518588a07c887e5ec84f38f67af24', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:57:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('292e9142fcc272542c5a40f8c0f0557f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:57:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('f5f4731666f33e16e4795915d73c6bda', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 07:57:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('4695e0b5987f58b55c7b7dc608359eaf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 07:57:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('2742687ae84c7ad762f523edd5de206d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-29 07:57:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('8d9c6c3bbdeb567f1a007f3341426d4f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-29 07:57:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('87847a43cae921067c708417b0c71656', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 07:57:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('298d68398946a7fd602aa38d62ff3154', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 07:57:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('3415554fa0f54d13cc87188d47a02b49', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 07:57:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('81ddc4bc74b0a6a44118acea1bee3a51', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 07:57:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('8687ea57d97528aaed672d8c6c5d508b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 07:57:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('473fc5a99c48d4e51a823a468b49c035', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 07:57:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('1bcfb72e12dd5fc3ffe586fa3db30d85', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-29 07:57:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('1bd74b2ffd6a0ef578c9c54d30602eac', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-29 07:57:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('34804f01bd85dc01f8186089959141e1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 07:57:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('01a170fbc14a1a05383ce387fbec00d6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-29 07:58:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('dc709e4f96e058176f31d02962db968e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 07:58:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('78702e9ffee32e9c5a0abd8e608c9d4b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:58:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('68f0bfa60cab2a35049179abedc965ae', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 07:59:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('afc329c9a55e8d457c4357ca1508dc7a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 08:00:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('b557296e3eeead89b8237719dcca637c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-29 08:00:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('9d32e6989c4ccf823809292d22929ca2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-29 08:01:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('e84b2d4314d743748b248629737cac19', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-29 08:01:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('86d4eaf2e2f3cda30235460c6b383af7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-29 08:01:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'false', NULL),
('376547930dc5c236ce479a5c34babb0e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 08:01:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eeb0488435328b038f4789da8bf8ae61', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-29 08:02:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('57ba16b67380893537570f13296af437', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 08:02:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cf58a1e289b3b6c08742a13086b5a925', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 08:02:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('543fffda2725ccd2346cbcea299330c3', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Tanya Jawab', '2020-07-29 08:05:21', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'GURU', 'ba917a5a74d6529f878af6707c361177', '170052', 'MASRIFAH', 'false', NULL),
('6724f6bf983e73ce8931a0fe9b7c9682', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Daftar Siswa', '2020-07-29 08:05:28', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'GURU', 'ba917a5a74d6529f878af6707c361177', '170052', 'MASRIFAH', 'false', NULL),
('48327b388768f027e7fcc3b4f70c46a1', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Beranda', '2020-07-29 08:11:39', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('7045f1a87b51f0e7e3a213e062efc968', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Beranda', '2020-07-29 08:11:49', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNih', 'false', NULL),
('c505b6ea458f4ce0009ccbe9c940a2f8', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Beranda', '2020-07-29 21:06:05', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '6f3f3d1b960233ebefbf39c15e52ed07', '7383', 'ACHMAD EKA MAULANA', 'false', NULL),
('21c2d931b87a4077be5d407a73b6f3eb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 22:08:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cc92524f6c5531f7265988eb235c7f37', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 22:08:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d85408bf015f26261c8798704e2ef6ee', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-29 22:08:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e247cfbde4347a1454178d69766fe984', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-29 22:08:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('242277393cdc7e6e926ba788ae5e7c88', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-29 22:08:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('07641e13862e1d54ab7e63ef7a1d3291', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-29 22:09:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2d0d67c4be37107e34a48273e8bd22d1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-29 22:09:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6b066a4e950066573e84c416826f07ca', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 22:09:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('9aa79cc013465a8e08ac23510816fa1d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Berita', '2020-07-29 22:09:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('6a0c8e9bafb6a3faa600a9716dad9ccc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Artikel', '2020-07-29 22:09:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('47bc0599007dc784571197ab4171834f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:09:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('a4b3a6d700c64ed34ccb383444a4437e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-29 22:09:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('bc3a33ad4ef1483e598d02f8cf9d98eb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-29 22:09:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('cfcde73c92a2d6dda1dd44ae33083ede', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 22:10:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('1a732144fb179a8784599ed74b88732c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 22:10:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('b993bf9487f0bda7808e41cef653e2cc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kalender', '2020-07-29 22:10:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('7c1e388dd06734c7e79d1b62f91619e6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Forum', '2020-07-29 22:10:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('d464e2fcf22508fed424d5ec8561a740', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Link', '2020-07-29 22:10:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('77a7af8d2a5475a1286404c1a3e7539b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu ChatRoom', '2020-07-29 22:10:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('26a61375a3694b1c9f05b11b95a6921a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Soal', '2020-07-29 22:10:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('7b997bb7e87cf8b77393b23087f0a021', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 22:10:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('baaec3a25baa9849236d2720e22b8506', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-29 22:10:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('b07e9b61cea7a4f721e45aebb4a2fb83', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log History', '2020-07-29 22:10:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('72a83375a6422654737ac708b3eba9ca', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Beranda', '2020-07-29 22:11:20', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'SISWA', '130e36f6ca2e8441c634828e58959afd', '280011', 'ACHMAD EKA MAULANA', 'false', NULL),
('56e7e41f8adb146020dc55165b2a815e', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Tanya Jawab', '2020-07-29 22:13:23', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('ba52bef6a2cfa5444a32e3986f6ef5c1', 'c87c64244d02b4a50c838ac30910c147', 'Menu Tanya Jawab', '2020-07-29 22:13:41', 'BJAWA', 'Bahasa Jawa', '2020xgmringx2021', 'X TGB 2', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('71658ac0c0c303b1c3faf03d9a3c0795', 'bed40a0fdbd30f3d100fb2bc9b6b8fdd', 'Menu Tanya Jawab', '2020-07-29 22:13:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 2', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('d277f4b17e8b4264ec3e2f339515dbe1', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Tanya Jawab', '2020-07-29 22:13:48', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('7b61711ba3d0383dd8b0bd1f27609c09', 'c87c64244d02b4a50c838ac30910c147', 'Menu Tanya Jawab', '2020-07-29 22:13:51', 'BJAWA', 'Bahasa Jawa', '2020xgmringx2021', 'X TGB 2', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('3889098e6b760a60664347e9f20fbd3f', 'c87c64244d02b4a50c838ac30910c147', 'Menu Tanya Jawab', '2020-07-29 22:14:45', 'BJAWA', 'Bahasa Jawa', '2020xgmringx2021', 'X TGB 2', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('8ea487961f6a0ab432fd1bf84ab77bd3', '5b8e5fa8f5be23d7f75532500919c67e', 'Menu Tanya Jawab', '2020-07-29 22:14:49', 'IPA', 'IPA', '2020xgmringx2021', 'X TKJ 1', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('c540d2a84d0197f3d7f510d168e99c30', 'bed40a0fdbd30f3d100fb2bc9b6b8fdd', 'Menu Tanya Jawab', '2020-07-29 22:14:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 2', 'GURU', '9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'Joker', 'false', NULL),
('579564ff524a54819edd1c14d7058acb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 22:46:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('85d0ec9d627e371390cafdf493d05a38', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:08:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('64b92141c8e8070fc33543083434d5d4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:08:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bec45c75b5b3cb25dc40fdd0f9bb0b7c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:08:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('43e62fbc8a13596d643e6f7a24faaf9d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:09:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eecbef3a2d56e35d06ec855b4f0e0d7b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:09:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e32d86bbc728345e26b6526da5124adf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:09:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('71e709eaa631d9a3ea20017474014057', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:09:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('619e170514e01073edd5537611c16868', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:09:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0c694a97fd51e3834eec04be9362b44d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:09:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6d9aa0792688ac6e54fe216886bcb666', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:09:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b9ebc32ac54c11d04382e115f707d3f6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3143359048430763bbd82f19baa5ff72', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d1c7c0b6dcf533877d01bfed68863af6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0b673eda0ab57b4fa0d44c3eea3df3c2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4eabfdb2bf90a7459379dd4d099d27bb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fd0bd71230b00bfe5598ed55eeca6c6c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('38bc7b952b2b979b372c4ced3079d28a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6dfb4622f1161090c58dc39277656047', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:10:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b2cc5d577231a408bb557d048610cefd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:11:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2383bfee2fe20c1eb653a68d59de35a7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:11:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fe3d11661ab242eda81dda81a1739f4c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:11:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('533a301caf6efda4ecd25fb060f00454', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:11:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('717736606610f37a8d887f16de9d7111', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:12:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9713ee4b7299dc9c9f1d50a62deb8924', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:13:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2077f496f31d2674f4d69fa27906eb27', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:13:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1272a5b442273fe259a63e7fb50b6502', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:13:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('214501f0efc4b1ccb4a86e34c0a1e34e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:13:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d3709792d2bdb8110d57df31eb9e8b96', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:13:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5f7e25487336625269ea8bbf686bf4a4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:13:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('89e718f69b05a910bf61086e38210239', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:13:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5563eea2b20732b49bb369678021d447', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:14:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ebe915d4e0945ba1feca22fb3285a0d7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 23:14:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0864af27764deaeba151c3c0e5e83767', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-29 23:16:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0002758b07f0445f6bd835f1de899ad4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 23:16:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f0aaea6cd611f630e2b23ab6ad4cd695', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-29 23:20:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('c930d2f2fa84af737e73383418ac5196', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-29 22:27:53', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('4596710a0815127fff46a104a3ad54d6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-29 22:40:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8e7feec8f4a6bcfd839001cf92d1614c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:40:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('93d96c168f998a891462e4e2ed5850de', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:45:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a8400d5d785ddb483a406315a7f2424a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:45:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('806cc64670acc81dbb74d00d5ced8f25', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:45:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b8df9c2163be4818aa513ddcd2c2267f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:46:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d4c5e4db2b1895715274a0df7869ace8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:46:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('56cf19f691e9222f04200946fcdb4806', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:49:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('180cd536a2d7da14df09742e1ffb0936', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-29 22:49:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b8c8df9945669f4302bcaa96a96d99eb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:00:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f0f0bdd592a3f89a002a3c9953a4f65c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:02:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d238dbc1cf6211417031677c4cd0de32', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:02:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4ebef222f5a1f7caef25d08bf1e54900', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:05:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('267a039de8049f8d77b067f5af4debcc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:05:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1f6d45904afc72d5b15f31a10ad75464', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:05:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('df3651f2f144936781b948a2dd0b5786', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:06:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3018c74c85baa6a7d049ee968e78d4ac', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:06:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('27590f187a6ca4c4add977e873278a8b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:06:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1d7a93b43fa2bc846d4fde4a3db09ba1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:06:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8a6000b4ba0ebf23e4f544a70fb03c5b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:08:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6fd857479778cf233eed7f727e775c53', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:08:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a3e158fa6a1fd2800c57a78dd9d6e296', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:08:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f1f5e4d380acb23b9c8c0349f83b8798', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:08:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5dd00cc266f2542c8eed9a8026950777', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:10:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6e92bb1df2f3c72ca2b0c016f123b3e1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:10:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e0d77dc52c330c91fd05a60149e4c6b9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:10:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c0d07bd35009ec50b914b467b6f46dbe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:11:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b40b1d4562c81bae39c8e41c29962583', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:11:20', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ee6101a698eac6102aaee9ca0d305c62', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:11:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f9e91480ba2b8dd03d00223313fc80d2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:11:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce918f39f811e90afb4b0e6be80e91c7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:12:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1f63c4c1f5c31f606cf61136268341a5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:12:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('90c41319720c73c92ba9b86b2dc6f3b4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:12:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('572ba10160840f3648ccbd95528787a8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:12:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3859ccd8521b9ccbe6435e3d9c4c3a92', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:17:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('77a163748d07787a32db6ff7bdccc44b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:18:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b9959843a87a05122a89f3fe09c83a2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:18:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('245440b850c4fbc108809b90f5f7ecc3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:20:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('91057a6929a9d876fc8017b473738faa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:21:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c68a588cd1d8d6cf9603b268b229ed3c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:21:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9f3f1c2bbbd717e958591d060603e16e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:22:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3e58a8cdb0d47fb4f43bb23ed01d4a10', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:22:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c688913b24ab6bef2aeb103f28b45a2d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:23:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5447ab64994c3d9e2ac1320d4203e543', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:23:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1bb9e0bb9b3a151a0446642506484a12', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:23:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('40509878ad1c29d415c992652d442a0d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:25:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('78664e7c2a7d3a15c91694c3c505a7ec', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:27:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('87db9b25475da14bdf808a8f45996f1c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:27:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('692d58bab1cb79b82d85fe29858b29a2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:27:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3ede6963a8aa0b6c1da96768a679d947', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:27:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d5d5fc1fd126c710d69e84db43ea65db', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:27:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dc3d02ec04647ad3e97de41e14f490d8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:28:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5ae54e17be966c2388451c8baa0c519e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:28:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2ce0ddd15903535888a4e047275498a4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:29:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e502fc988789cface80316a8a9bce5f6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:30:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1af2e5fb98ea1f8e542bc6f337f7d578', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:30:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7c0b806b1a51788b29ea55ae62407e15', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:30:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('497caaf7fa0ffeb4278499573f8a790e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:32:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ac08073f4fbf6c059ef65e3ae4b6ec06', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:32:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce84fd60f3e16725f8698c8de791500c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:32:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c140e60596330b4dfcf4098b6db436f7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:32:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ba080ca580a17d98a2ed0b2b6cd6f710', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:32:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c40e29d78597f927126d60321633164c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Video Youtube', '2020-07-30 09:33:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('dd5dfc7df0473889cae1c140af7c2cda', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-30 09:33:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('285e433d40a3c94bdcb86d9f0b115b1b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:33:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('014edbe1ca11ced172a44e512ce2d54f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:34:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b7f64da95e42e218fa7b3afc19d6bea9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:34:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('72229cfb29343a9bb0ba6a98ffc4dd4e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:34:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0c4df77f5fef05f1a682d9847f71ef35', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('47890e9f959fa9ac2c89cfecffa6911a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:07', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('974ece2a80f733af6b200121c35b5eb1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bd00ee42cb3fb2fa4b7e9882708529c5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4fe887ec9e6b51fdf205a666b124bccf', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1008e947caac46f6fde0b12d709eae90', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fc6a30f88ed2bf04fe7e4002380ca25e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a5a441e44859d4e38f825e18ff43b86a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:36:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ad1b6fee54c9fc94c2fd98f62c371a46', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:37:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('87bb2da648cb8fce2d0a8aa7222a9444', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:37:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e5112fa138ab23e62267cf56437beb8f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:37:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1bcc000feaca98c1ad3510865460c232', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:37:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d1d1128c478afa524a5913a7e5bd5bd1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:38:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8b758b0a6268a95b68a6906e3e4b49e0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log Pengerjaan Soal oleh Siswa', '2020-07-30 09:38:27', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL);
INSERT INTO `guru_mapel_log` (`kd`, `kd_guru_mapel`, `ket`, `postdate`, `mapel_kode`, `mapel_nama`, `tapel`, `kelas`, `user_tipe`, `user_kd`, `user_kode`, `user_nama`, `dibaca`, `dibaca_postdate`) VALUES
('132adb5ab5cbf152514cdc8f0b7b3e65', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:38:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9480f00c7150c0021a6187d5753290b1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:38:35', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9d646ed2a1e6d13290a3b1f10f4e4e15', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:38:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('54eeea78049180f60fc5082c5fcbcc5a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:38:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c132af0d04261cefb6a5df65a6585506', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:38:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('423d424fd3ca1473f21401f803b0f5fc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:39:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('11bbe178dc17981f7d1bdc390e252036', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Analisis Soal', '2020-07-30 09:39:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('00d63172a4d7e5cfa9c4f00b355883e2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Analisis Soal', '2020-07-30 09:40:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('91c29dde273b5d25acd547f55263d947', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Log Pengerjaan Soal oleh Siswa', '2020-07-30 09:41:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d0a5cde4441227130a1ddc1a0232af30', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:41:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f86692375b745571a169e221453070b0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:42:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6d41bf5a83874b18bea56969a2537dd8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Analisis Soal', '2020-07-30 09:42:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce02ad512e642160dded4480916f3641', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Rekap Nilai Siswa', '2020-07-30 09:42:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('adc1b8c7971ff9ebdc2011387c99b096', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:42:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ea9c0734cca776e743e713a4582b8fde', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Daftar Siswa', '2020-07-30 09:46:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b3b0511ae55addec49b560c7d88a4367', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:46:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('73b985e10211eb7f6dc608bcecf53226', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:52:55', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a94251a31ba3ef6b9333606448816979', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:52:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e45b1149216f2f9732162a1b5e67ede9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:53:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ce0210648f01834265a607e329e228eb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:53:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d08c095e55bd43fa8319bede8e15fdb8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f99552d321c53e3479d1a9faf4530696', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('65636a9105bf1bc444f922907b15e5cc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:31', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a1022b61a9d8facd5bb1f0129c0cc25d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('cd2797f5cf989151552440f38ce26ee7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('75ca8baa31386af701cfd3456a665df8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('54235c025c08f1f902364f10cbe6e24a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5254c87a6409d0237bbba85fd1ba0776', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:54:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a81533a1c52b45e0f301b5c929bf2c9b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:55:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('403fe53bcb67aab8f6058d250c7a3ff0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:55:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('008161fbc3f6603c12c29bdd5b3aeec5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:55:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ae8f42782831fef9465a9ab71609869e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:55:34', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fbe96512e761ebfcfc8aba8e8a391fe2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:55:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c47ce00a6d98c85abb146c8bf316266f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 09:55:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b5874f50c15f17e0a97481c03a6b4818', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-30 09:56:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('4fde3d41d12d6707b6e8ec003b21a116', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-30 09:56:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('e3d2914ceb8f828259acd3fd7c83786c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-30 09:56:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('9091548278199e912dce878a7fcc63ad', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-30 09:56:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('b247c628e7f9cbcc864dc51716a392bc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Beranda', '2020-07-30 09:56:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('49a2184b6494baf8e28170541f0b81b9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:57:08', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('bd5a24fb36cc92e23d6d7879b92ae7d5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu File Materi', '2020-07-30 09:57:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('2fb58e09c7914554b0ac3577ea4b9699', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 09:57:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('2969b8e747367779510fb7ca8cba0caa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 09:57:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('3dcccdca95d9c95e61eee4e8d51bb82f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 09:58:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('795dde461b8736ce7845b0eab1404316', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 09:58:49', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('5f6f3a35579c6cb062e8c43e1e199377', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 09:59:05', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('d2c2c1a695a8645b97e6674a44bcdaa6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 09:59:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('b2be5932b9e584d2964e8040e1912bb1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 10:06:45', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('c85db876d926749b544a801e5dc66c67', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:06:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('d139ced648424de28f2b5794d1a3fdf4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:07:50', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('4987dcd78f7807ac53260237ce15e3f5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:08:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('857f296705685ff90528ea8f0644c9a9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 10:09:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('3c1b57553c45829f1e5f75ba3b35622a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:09:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('c681c13c7d354921eb48c54702e9cc97', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:19:51', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('45fa280a6d2f691c43673280e7b687c6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:20:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('6765a047c4479396e1932714057d86e5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:20:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('75170fa5479b1f1e2304a438336f8977', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 10:20:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('ad7d6aa0cc0d64a864804cd37f28260c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 10:21:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('4bdd367323e6cdfb743a670dabb8dfff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Kumpulkan Tugas', '2020-07-30 10:22:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('8d7ec4ac5ee8cd59e78dc05af86c0f0e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tugas', '2020-07-30 10:22:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'SISWA', 'f4f5d296afead37410f18a6ca7bff265', '280005', 'Orang TeknikNih', 'false', NULL),
('64af992f481dfe35890056658337fa2a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Tanya Jawab', '2020-07-30 10:22:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('e76ca44782fe7db752ead30d7c72a84e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:22:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a3c0ad49f98501ec752358a2565c00a0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:22:56', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2f5ec606cef88f7078e55e80952154b9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:22:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4aebccfcfda006f6d6d5eff61b0704d9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:23:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d39d3cb5c721d498bf0f29fd4de2e4c9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:23:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5a8fd04657e21d62278a1f731904dc3d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:24:12', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('815cf834070e4431502cc4d1e4edc428', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:24:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6d3b6b78b9164092d71d407bd5d70259', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:24:17', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d3ca0ed7b70633b5965e4b55a5b75fb5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:24:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7f8341dc44d4f459fa28e2f65844f440', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:24:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b17b6104910d06622b48fa6821a05e07', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:24:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d6cd1f53733ff1ef4d5e8ad969894846', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:24:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c6f6912dd0ac02684517164ed9ab8aaa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:01', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2885aa82be51d598af54fc1990c4e8dd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('0b5543b929e5a5d05167029ed054b250', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ca4a1bb695b68caf797be4adb0b81e39', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f29ef9d6e29c943a4a6158bf97f0d34c', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3159b2e11da9014f5b574c048e50e35d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('09e661ee0c51036a890714336110256f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b30bee151220af4accd680dd90a61855', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:25:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('87be4d3025f884176e8fde02d52f3d71', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:26:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('38b355db89b712f5eb756784333d1ac0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:26:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('89a0240a94e651b9f8fbf1277cedaef0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:26:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9bbc4b3f6edcb9cab3ebfe4da2102a85', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:26:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('db842515727e00465185a0913e81e0a7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:27:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b7102db75bc7d2204a943f0eb997d584', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:27:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ede04488b61b657af4343f0c13437d48', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:27:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f00ed9cd738efd0de2bcad6a72b4ff4d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:27:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6f8679fd2ded012a21be25402de0cc94', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:28:18', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('15650731f6db3725ef067d3d321d3ec7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:28:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('94743eadced63aaf83acd0e270a65860', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:28:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3ac64171af5c0d10f1dd91158f63dedb', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:29:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fd7cb41583a96ca2f668fd58554bfb3e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:29:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('12b7f012f7a1b5eabb5199eedb3bd08b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:30:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('18d930e3d8e309098a007d74c64c8a1d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:30:25', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3318befaf04e4bf9a971cf9eb3daaf97', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:30:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('97b42a8fb436073123a25a6e5f0293f6', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:30:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('adfbc5ebf8c3a60c851944ca9ae88999', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:31:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5471fc682d1f51bd778e1367387f01d7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:31:36', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b96a343253ce4790aaa3785e76f8edd1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:32:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('78eca7ca2aef52f8b6e8957381f7f60f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:32:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9b0e48a945f65ac9a1a8cd6d9e589d06', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:32:28', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('95b1dab3de4b7fc49e61bde03e12bd2b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:34:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('86eb9c3e1d454cec4cdadb260eaacef7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:00', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('fd8c6d0de04111b469467a00bfdd1098', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6d85588e67f1ca37f10622da4d785404', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:10', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('85107f76f2883720caa36a946cf554dc', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9d848fea427a325db67956fefc97be56', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:30', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b95c0aad59ad3fbe9e13ab279f8fa3a2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('65ddfcbed9c3934d2587375786ac548e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('640d3a9f1d37728ef429d01cbea9f726', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:35:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6093f67ab236076055054964d704b2c8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:37:37', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('558af4ebd09eeef17c1c184682ee1195', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:37:39', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('bcbf42a9a71b9c1d7f6ef46f8657b0a4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:37:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ee76c6fe41ebd230bef6fbc12ee40d3a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:37:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('30d7acc697e62ef6aa8cfc0c5863a01e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:38:02', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('33dfc187b996f8efcebcd62ae2832d2e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:38:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9c0beddd894a6dd58e10794bd89b5720', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:38:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f25dfa2592b84a5bca41e5e896d68b8a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:38:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8e393d6ff9e0a8e830e7b0f15ae0a6b8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:38:40', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('1a5d8ce0db39fbd3fb83a83764f75342', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:42:16', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c1489230a736c0eb961b39f03fb27045', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:42:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('89267ffd4b0032678e3136902a4938cd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:42:47', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('5fbd660072d71800e15c67e3e444e0c3', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:43:42', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('7bf55026b5a84ecc111917036fd3f7ff', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:43:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('3fbd0d1d158fa81d83adb3972bde1d0e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:46:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b4e291827d4a89f1701d67ad5e5d0743', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:46:32', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('46ecbb9d4a7282df39de26a871504b11', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:46:38', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('db76fef702942f97aac20275415ebe9d', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:46:41', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9d91317c9c12f9e97944637c5428eec8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:46:57', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('de8de60fa058d3dc6eb4b6ede3dcaf7a', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:47:29', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('db5608e9afd5815e57bf6c55cf7af60e', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:48:15', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9ebebd6b744b56649aaf54b87291b7fe', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:48:43', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a363163c1c96536c247b3398f2b8e903', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:48:52', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('45139e71bd314d7319f308361fb0ec89', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:48:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6722ab91068c578c9a41073f7aad3b3f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:50:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b90980e131496120cb5adf7fc0da1076', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:50:13', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('175478eed29c9e36ea1a695d09ecabd1', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:50:22', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('8b34c60c202484c7f1c96235bcd858bd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:50:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('39b46e05ff93f4b20a975fa476a4b533', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:51:44', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('b5a1c86e620921006a7981e65e035aac', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:51:48', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('90dfdaffcaa3fea9d742d9fc12d123e4', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:51:54', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6b92894cdbc3b82bef9b5e71fa560823', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:52:03', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('05f697f8edf48ef0e1905dd83c27e2b0', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:52:04', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('2a967cb1b78a898920c8861c4af2a009', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:52:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('6bc0db10d88ebb146e2e01c49a4f7b85', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:52:59', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('ed161207c918cd66b44b08228a6aa9a2', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:06', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('380b5d386ff78afb69b56688d54886cd', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:09', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('4319f0d2255bc6c333b17f0ef3e1ce48', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:14', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('d5caa06ca59ee978b882e234ed42ec47', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:19', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('a3724ccafa98473b9d4d57469328b2aa', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:26', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('f91183a79fcc1d50a35fd717a56e1fa5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:33', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9a593304b346ecf1dbe5894d69c84982', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:46', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('19aa94c0ef3ea4cee13b8e7d71d25a64', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:53:58', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('9af8e1c8537fe190ac839888463d0e3f', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:55:11', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('c67a1a7c6dc9a5cdcca3e42f06de4de5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:55:21', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('960db84d8879f8fb678e5beb4bd68563', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:55:23', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL),
('eff7904c8d72a8845fd6735165860935', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Menu Entri Soal', '2020-07-30 10:55:24', 'BING', 'Bahasa Inggris', '2020xgmringx2021', 'X TKJ 1', 'GURU', '4a91033bfe52de0aedecd767ee4075c5', '170001', 'Orang BIASAWAE', 'false', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_news`
--

CREATE TABLE `guru_mapel_news` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) NOT NULL,
  `kd_kategori` varchar(50) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `rangkuman` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_news`
--

INSERT INTO `guru_mapel_news` (`kd`, `kd_guru_mapel`, `kd_kategori`, `kategori`, `judul`, `rangkuman`, `isi`, `postdate`) VALUES
('81779f0b2222a3e637fbb9a0ce8b5177', '041c7cc5a8fb9320f6f3b538ce538b4c', '', 'Praktek', '12222', '33333', 'xkkirixpxkkananxsad sad sad asd sfsxkkirixxgmringxpxkkananx', '2020-07-25 08:18:38'),
('660c71e2a3bd07a9dd6950a4c723e667', '041c7cc5a8fb9320f6f3b538ce538b4c', '', 'Pidato', 'coba judul', 'sekilas...', 'xkkirixpxkkananxisiinya........xkkirixxgmringxpxkkananx', '2020-07-27 09:30:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_news_msg`
--

CREATE TABLE `guru_mapel_news_msg` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel_news` varchar(50) NOT NULL,
  `dari` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_news_msg`
--

INSERT INTO `guru_mapel_news_msg` (`kd`, `kd_guru_mapel_news`, `dari`, `user_kode`, `user_nama`, `msg`, `postdate`) VALUES
('1c080cca02118f6ca1151560e8af2f90', '9f993a6e0d2bbbc664147fb206e2d1c8', '170001', '', '', 'sdsdsd', '2020-07-22 14:55:06'),
('8129e6c61b99201ab1d5675f7948e5bf', 'e747feb7491bebafbe048295a0573170', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'bagus ya...', '2020-07-24 14:10:08'),
('e0b7b6596d97433dd4d4ff7666566468', 'c184d9a84779f3a6b6c86d6c994a7c2c', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'sip deh...', '2020-07-24 14:10:46'),
('d87374719bae5ced161c495fd736f721', 'c184d9a84779f3a6b6c86d6c994a7c2c', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'ok deh...', '2020-07-24 14:11:40'),
('16c8edbb6c130c46038d59b9da0224ee', '81779f0b2222a3e637fbb9a0ce8b5177', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'ok...', '2020-07-25 08:18:46'),
('5c792c0434633e94fa64678bc32ebb94', '81779f0b2222a3e637fbb9a0ce8b5177', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'sip deh....', '2020-07-25 08:19:50'),
('08721ed1137f970782d0832b61753f9d', '81779f0b2222a3e637fbb9a0ce8b5177', 'e5cabee927429398b4d2a289166d511b', '', '', 'ok...', '2020-07-25 15:08:13'),
('cf8de946bb1d7c6b60654082951d760b', '81779f0b2222a3e637fbb9a0ce8b5177', 'e5cabee927429398b4d2a289166d511b', '', '', 'ok deh.....', '2020-07-25 15:12:20'),
('01a8fac77cc942d427bf99b9a8709684', '81779f0b2222a3e637fbb9a0ce8b5177', 'e5cabee927429398b4d2a289166d511b', '', '', 'ok deh...', '2020-07-25 15:17:06'),
('5f620d8b06e9b8cc8107239138d376c0', '81779f0b2222a3e637fbb9a0ce8b5177', 'c8501a58dde52c15ac3ac56fbe669603', '', '', 'yg bagus ya...', '2020-07-26 03:24:53'),
('9601d5463d149a602a9392ca12146d88', '81779f0b2222a3e637fbb9a0ce8b5177', 'c8501a58dde52c15ac3ac56fbe669603', '', '', 'sip deh,,,,', '2020-07-26 03:28:31'),
('6fb5491adfbbefd7c182062ed233168b', '81779f0b2222a3e637fbb9a0ce8b5177', 'c8501a58dde52c15ac3ac56fbe669603', '', '', 'ok...', '2020-07-26 03:31:42'),
('a66d437461a2c64e8b434542f8db59d9', '81779f0b2222a3e637fbb9a0ce8b5177', 'c8501a58dde52c15ac3ac56fbe669603', '', '', 'belajar aja kok', '2020-07-26 03:32:01'),
('ca82938d2b9100a419f3ee1c8b9c8649', '81779f0b2222a3e637fbb9a0ce8b5177', 'c8501a58dde52c15ac3ac56fbe669603', '', '', 'aq pasti bisa', '2020-07-26 03:36:58'),
('8ad3530ce18225c0763a20b297913464', '81779f0b2222a3e637fbb9a0ce8b5177', 'c8501a58dde52c15ac3ac56fbe669603', '', '', 'ok... siapa...', '2020-07-26 03:55:18'),
('712b57f95e18a9817cf8c04bf2bb4bde', '81779f0b2222a3e637fbb9a0ce8b5177', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'Akuhajir', '2020-07-26 08:31:44'),
('d19fe2cdc88a9131d61d81aac71feac4', '81779f0b2222a3e637fbb9a0ce8b5177', 'c8501a58dde52c15ac3ac56fbe669603', '', '', 'Oh... Yes', '2020-07-26 08:33:33'),
('bdf32ed163a9cb714c277894c7eaada9', '81779f0b2222a3e637fbb9a0ce8b5177', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'ok...', '2020-07-26 14:03:27'),
('4abb5e4e5949bffd54375f90b01c2333', '81779f0b2222a3e637fbb9a0ce8b5177', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'waduh......', '2020-07-26 14:06:37'),
('5728e9df93135ab97df0c88631c565d0', '81779f0b2222a3e637fbb9a0ce8b5177', '4a91033bfe52de0aedecd767ee4075c5', '', '', 'ok... sip.....', '2020-07-26 14:28:55'),
('a8eb30adcb9e7e854ebdd48ca73f4caf', '660c71e2a3bd07a9dd6950a4c723e667', '193718556c9ea38a77468dedf9a57d7e', '', '', 'bagus nih....', '2020-07-29 07:53:59'),
('32d201fb88dc4411c6bf16088cf3ca52', '81779f0b2222a3e637fbb9a0ce8b5177', '193718556c9ea38a77468dedf9a57d7e', '', '', 'kurang tahu nih....', '2020-07-29 07:54:14'),
('8f0a6cd76ec8ed6116f932bb2465f048', '660c71e2a3bd07a9dd6950a4c723e667', '193718556c9ea38a77468dedf9a57d7e', '', '', 'ok..', '2020-07-29 07:57:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_polling`
--

CREATE TABLE `guru_mapel_polling` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) NOT NULL,
  `topik` varchar(100) NOT NULL,
  `opsi1` varchar(50) NOT NULL,
  `opsi2` varchar(50) NOT NULL,
  `opsi3` varchar(50) NOT NULL,
  `opsi4` varchar(50) NOT NULL,
  `opsi5` varchar(50) NOT NULL,
  `nil_opsi1` varchar(5) NOT NULL DEFAULT '0',
  `nil_opsi2` varchar(5) NOT NULL DEFAULT '0',
  `nil_opsi3` varchar(5) NOT NULL DEFAULT '0',
  `nil_opsi4` varchar(5) NOT NULL DEFAULT '0',
  `nil_opsi5` varchar(5) NOT NULL DEFAULT '0',
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_polling`
--

INSERT INTO `guru_mapel_polling` (`kd`, `kd_guru_mapel`, `topik`, `opsi1`, `opsi2`, `opsi3`, `opsi4`, `opsi5`, `nil_opsi1`, `nil_opsi2`, `nil_opsi3`, `nil_opsi4`, `nil_opsi5`, `postdate`) VALUES
('263db6e0c8a98b77e60756ad44b83768', '041c7cc5a8fb9320f6f3b538ce538b4c', 'coba polling', 'bagus', 'ok', 'sip', 'mantap', 'gak tahu', '1', '1', '1', '1', '1', '2020-07-24 01:45:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_soal`
--

CREATE TABLE `guru_mapel_soal` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `jadwal_kd` varchar(50) DEFAULT NULL,
  `waktu` varchar(100) DEFAULT NULL,
  `durasi` varchar(100) DEFAULT NULL,
  `no` varchar(10) DEFAULT NULL,
  `isi` longtext DEFAULT NULL,
  `kunci` varchar(1) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `guru_mapel_soal`
--

INSERT INTO `guru_mapel_soal` (`kd`, `kd_guru_mapel`, `jadwal_kd`, `waktu`, `durasi`, `no`, `isi`, `kunci`, `postdate`) VALUES
('a71fa7a225f6edc2d3f4725c4a54faa4', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '2', 'xkkirixpxkkananxtanya 2xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxA.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxB.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxC.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxD.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxE.xkkirixxgmringxpxkkananx', 'A', '2020-07-28 03:06:08'),
('5637a2448498acd48200ef0e3d40fdf6', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '1', 'xkkirixpxkkananxapa yang dimaksud dengan teknik...?xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxA.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxB.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxC.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxD.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxE.xkkirixxgmringxpxkkananx', 'C', '2020-07-28 03:05:49'),
('b00dd0bf973bc0e01a150def0da184aa', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '4', 'xkkirixpxkkananxtanya 4xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananx&nbspxkommaxxkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxA.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxB.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxC.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxD.xkkirixxgmringxpxkkananx\r\n\r\nxkkirixpxkkananxE.xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:06:28'),
('6c613993ba0b66e08b06c2d7057c085c', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '5', 'xkkirixpxkkananx5xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:06:42'),
('b399c6933a7d9eae127a67bd1e1e68c6', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '6', 'xkkirixpxkkananx6xkkirixxgmringxpxkkananx', 'C', '2020-07-28 03:06:50'),
('07a107001248af9ab671da98dfed1016', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '7', 'xkkirixpxkkananx7xkkirixxgmringxpxkkananx', 'A', '2020-07-28 03:06:58'),
('a959bcb05ed1dac605b31e57864e3289', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '8', 'xkkirixpxkkananx8xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:07:05'),
('462a4ef08a6650b176b74e79ddb470c5', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '9', 'xkkirixpxkkananx9xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:07:11'),
('bbb3245ef3d3978ce7f6e55a072e10bf', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '10', 'xkkirixpxkkananx10xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:07:18'),
('8cab3d08d359238aab35a4b06b9e1a06', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '11', 'xkkirixpxkkananx11xkkirixxgmringxpxkkananx', 'D', '2020-07-28 03:07:26'),
('e4a51254462391714071eb21d0485f13', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', NULL, NULL, '1', 'xkkirixpxkkananx1xkkirixxgmringxpxkkananx', 'A', '2020-07-28 03:56:03'),
('32f96f84e657a153e106d56e3f3dbc01', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', NULL, NULL, '2', 'xkkirixpxkkananx2xkkirixxgmringxpxkkananx', 'C', '2020-07-28 03:56:10'),
('666ead496869b35842dfc7c92df91558', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', NULL, NULL, '3', 'xkkirixpxkkananx3xkkirixxgmringxpxkkananx', 'C', '2020-07-28 03:56:19'),
('c9a62f915fbe489e6a6dac7df71601ac', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', NULL, NULL, '4', 'xkkirixpxkkananx4xkkirixxgmringxpxkkananx', 'A', '2020-07-28 03:56:33'),
('097b6d79067e10c3ea89ad6f425ee680', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', NULL, NULL, '5', 'xkkirixpxkkananx5xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:56:41'),
('b585cee90d58aa92b0f298a8afaa3716', '041c7cc5a8fb9320f6f3b538ce538b4c', 'f904ae195d1a121746faf2a7f77507e6', NULL, NULL, '1', 'xkkirixpxkkananx1xkkirixxgmringxpxkkananx', 'A', '2020-07-28 03:57:06'),
('a04f4a23f70c20537e6aa30f4d3d6252', '041c7cc5a8fb9320f6f3b538ce538b4c', 'f904ae195d1a121746faf2a7f77507e6', NULL, NULL, '2', 'xkkirixpxkkananx2xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:57:11'),
('b49842db3f6ad3f30fcdbf7de46856c5', '041c7cc5a8fb9320f6f3b538ce538b4c', 'f904ae195d1a121746faf2a7f77507e6', NULL, NULL, '3', 'xkkirixpxkkananx3xkkirixxgmringxpxkkananx', 'B', '2020-07-28 03:57:18'),
('0327430a7086dad1ab753ae4bd15c7b7', '041c7cc5a8fb9320f6f3b538ce538b4c', 'f904ae195d1a121746faf2a7f77507e6', NULL, NULL, '4', 'xkkirixpxkkananx4xkkirixxgmringxpxkkananx', 'A', '2020-07-28 03:57:25'),
('c2847916bfb90bf91283ce222a66cd34', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', NULL, NULL, '12', 'xkkirixpxkkananx12xkkirixxgmringxpxkkananx', 'C', '2020-07-30 09:34:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_soal_filebox`
--

CREATE TABLE `guru_mapel_soal_filebox` (
  `kd` varchar(50) NOT NULL,
  `soal_kd` varchar(50) DEFAULT NULL,
  `filex` longtext DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_tanya`
--

CREATE TABLE `guru_mapel_tanya` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) NOT NULL,
  `dari` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `tanya` longtext NOT NULL,
  `jawaban` longtext NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_tanya`
--

INSERT INTO `guru_mapel_tanya` (`kd`, `kd_guru_mapel`, `dari`, `user_kode`, `user_nama`, `tanya`, `jawaban`, `postdate`) VALUES
('e8c066fb59db79077d05ced7ffba8255', '041c7cc5a8fb9320f6f3b538ce538b4c', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNIh', 'sebutkan satu saja ya...', 'ok... siap....', '2020-07-27 09:54:18'),
('e842d6631ccf2e32b1c92e8a7474aa5b', '041c7cc5a8fb9320f6f3b538ce538b4c', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNIh', 'gimana bu, apakah bisa.....???', 'bisa....', '2020-07-28 18:24:45'),
('2830cb91ca90d6e80665930e8404e955', '041c7cc5a8fb9320f6f3b538ce538b4c', 'c8501a58dde52c15ac3ac56fbe669603', '280005', 'Orang TeknikNIh', 'ok... sip.....', '', '2020-07-27 09:52:48'),
('849998e788ffde5fd110797191b1d5a6', '041c7cc5a8fb9320f6f3b538ce538b4c', '193718556c9ea38a77468dedf9a57d7e', '7404', 'MUHAMMAD ADI PRATOMO', 'ijin gabung ya bu', '', '2020-07-29 07:49:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_tugas`
--

CREATE TABLE `guru_mapel_tugas` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `topik` varchar(255) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_tugas`
--

INSERT INTO `guru_mapel_tugas` (`kd`, `kd_guru_mapel`, `topik`, `postdate`) VALUES
('06998158a48c27c3ed159eb29767bc48', '041c7cc5a8fb9320f6f3b538ce538b4c', 'Bikin majalah dinding yang bagus ya... besok dikumpulkan...xpentungxxpentungx', '2020-07-29 22:47:32'),
('2ad8bbacdf63fb94c5add56b2995cce8', '041c7cc5a8fb9320f6f3b538ce538b4c', 'jangan lupa, bikin video pendek untuk cerpen', '2020-07-29 23:16:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel_video`
--

CREATE TABLE `guru_mapel_video` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `url` longtext NOT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru_mapel_video`
--

INSERT INTO `guru_mapel_video` (`kd`, `kd_guru_mapel`, `judul`, `url`, `postdate`) VALUES
('e806de1bafa2a6cf3509f9ed75d2d9e9', '041c7cc5a8fb9320f6f3b538ce538b4c', 'coba', 'https:xgmringxxgmringxwww.youtube.comxgmringxwatch?v=M7gvuxstrix0abes', '2020-07-24 13:46:25'),
('6e5dde677ad437e16fe641dda07c0535', '041c7cc5a8fb9320f6f3b538ce538b4c', 'ok deh', 'https:xgmringxxgmringxwww.youtube.comxgmringxwatch?v=M7gvuxstrix0abes', '2020-07-27 09:38:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kelas`
--

CREATE TABLE `m_kelas` (
  `kd` varchar(50) NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_kelas`
--

INSERT INTO `m_kelas` (`kd`, `kelas`) VALUES
('e0b89cb96736efb876ee9793a11b1b9b', 'X TKJ 1'),
('75a36c9944d290544923e81583b11921', 'X RPL 1'),
('4b942ffb01a223d713f900a3513f1488', 'X TKR 1'),
('023d7308e248e819f28e8f93cd3b133c', 'X TGB 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_mapel`
--

CREATE TABLE `m_mapel` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kode` varchar(50) DEFAULT NULL,
  `mapel` varchar(100) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_mapel`
--

INSERT INTO `m_mapel` (`kd`, `kode`, `mapel`, `postdate`) VALUES
('4598dd5b9ac644eaec4af76c548743be', 'BINDO', 'Bahasa dan Sastra Indonesia', '0000-00-00 00:00:00'),
('d8022de243b4ce12b64f03a48158d39f', 'BING', 'Bahasa Inggris', '0000-00-00 00:00:00'),
('fc76ca9f6ebcf0f34ab21b55cefdb912', 'IPA', 'IPA', '0000-00-00 00:00:00'),
('c89e31c6134d92194320f6661e446dfb', 'IPS', 'IPS', '0000-00-00 00:00:00'),
('8afc44d568dbc8e74709b598628e8330', 'KOMP', 'Komputer', '0000-00-00 00:00:00'),
('8c5d87f3695190b00ffc7ab43e8aed24', 'ELEK', 'Elektronika', '0000-00-00 00:00:00'),
('558dc5761abfa074e9b9f6ef52499a4d', 'BD1', 'Bahasa Daerah', '0000-00-00 00:00:00'),
('a572500460f997c17f391716e9ccdcdf', 'BJAWA', 'Bahasa Jawa', '2020-07-29 21:43:43'),
('1fcea08f19467a3a0c3e5aedb9308a9d', 'PENJASKES', 'Pendidikan Jasmani dan Kesehatan', '2020-07-29 21:43:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_tapel`
--

CREATE TABLE `m_tapel` (
  `kd` varchar(50) NOT NULL,
  `tapel` varchar(100) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_tapel`
--

INSERT INTO `m_tapel` (`kd`, `tapel`, `postdate`) VALUES
('c87eeab939405de5cb86af2b4fb9b5eb', '2020xgmringx2021', '2020-07-17 02:54:13'),
('a00dc23ddf14c4b3e646c638c9f1caad', '2019xgmringx2020', '2020-07-17 02:54:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `usernamex` varchar(100) DEFAULT NULL,
  `passwordx` varchar(100) DEFAULT NULL,
  `nomor` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tipe` varchar(100) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `tapel_kd` varchar(50) DEFAULT NULL,
  `tapel_nama` varchar(100) DEFAULT NULL,
  `kelas_kd` varchar(50) DEFAULT NULL,
  `kelas_nama` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`kd`, `usernamex`, `passwordx`, `nomor`, `nama`, `tipe`, `postdate`, `tapel_kd`, `tapel_nama`, `kelas_kd`, `kelas_nama`) VALUES
('ed0c62d152b0115edd2b44df45ac50a9', '280003', 'dce490378947f8a211010aeee31cf599', '280003', 'Indra Birowo', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '5c623aae36c37785bc8c6aede401bd3b', 'X TKJ 2'),
('799f80d2808aed163f503f6196de9909', '280001', '04ed4a760d6ad5d752f8ce17766226e6', '280001', 'Desi Ratnasari', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '5c623aae36c37785bc8c6aede401bd3b', 'X TKJ 2'),
('e8f16a2a4423a379b3f0918fa5923ae4', '280010', '78d87c74b01f7218243cff8184ef0bce', '280010', 'Julia Perez', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('f4f5d296afead37410f18a6ca7bff265', '280005', 'd0e2aca22a8b597ead0cf5317c3d1f26', '280005', 'Orang TeknikNih', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('81ad99385d8a79f09f7f57869876e311', '280004', '1fe1fc0354223b6490b45d1844e74a2c', '280004', 'Paramitha Rusady', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('6ec37d90fe443e26253e213c80bb52f3', '280002', '710639d70cd18087008d474b4ac85ff2', '280002', 'Achmad Albar', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('a2de7297c7608a735f295b0cd6352508', '280043', '20c6d11eaeff398892a0c29e741064dc', '280043', 'ZIADATUL AZZA', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('a3e147ca2cc5a7a83083723b202571c2', '280042', '43ebb8f9b59f9f468605f37a3156290a', '280042', 'SEPTIAN ARGA MUTIMULKHAQ', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('0172c2401ed4763447e522f8310532f9', '280041', '60daf582d91994fdf1392ba9edc8885e', '280041', 'RIO BAGUS PURNOMO', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('cbb7ba74e8b692abb2f36800dd89f162', '280040', '1c88c9e84caa8236dc8786dbc46d19ab', '280040', 'PUSPA JIWA PARAHITA YUNTA', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('397e33b4ba51bc683b6850148be23173', '170002', 'afa2328c1739488edb7f5efb9cd604a2', '170002', 'Van Damme', 'GURU', '0000-00-00 00:00:00', '', '', '', ''),
('4a91033bfe52de0aedecd767ee4075c5', '170001', '24e004fb41eadb665483b48401cf8403', '170001', 'Orang BIASAWAE', 'GURU', '0000-00-00 00:00:00', '', '', '', ''),
('1525ce4ad9f34171a725ad5a2c2059e1', '170003', 'd87dc2090f3a1c5f8a608da82af5e0db', '170003', 'Keenu Reeves', 'GURU', '0000-00-00 00:00:00', '', '', '', ''),
('8493b580f4504947ddc31ea23d5bd3cb', '170004', '3d32806ddfd7397332bc60e839d7897c', '170004', 'Alicia Silverstone', 'GURU', '0000-00-00 00:00:00', '', '', '', ''),
('205a54b0333f57b7f217b2995d028083', '170005', '077dbccbfb0357df14616bffee5852b5', '170005', 'Gigi Leung', 'GURU', '0000-00-00 00:00:00', '', '', '', ''),
('84819620df1925981096dffdee506e2c', '170006', 'bf4a211f50b3bc00b94de5ec8748b5ab', '170006', 'Jet Li', 'GURU', '2009-03-25 11:30:21', '', '', '', ''),
('abd5df21e34eacf9d32782c0122cba31', '170007', '75468b89351446704ed9414a74983df7', '170007', 'Bruce Lee', 'GURU', '0000-00-00 00:00:00', '', '', '', ''),
('ebfa66a6dbfd21413d1035db2ca987a6', '170008', '9bea5b3c047517a4da0fd6c63c872131', '170008', 'Sophie Marceau', 'GURU', '2020-07-16 03:18:38', '', '', '', ''),
('0a2a7ea8d30d9e15038f86ed50a84d6c', '170009', 'c8c66cdfc2286951af36bd11f26575f2', '170009', 'Brad Pitt', 'GURU', '0000-00-00 00:00:00', '', '', '', ''),
('8b094e397cb52ea67f63c14dc8274e5b', '170050', 'c726ff6d3a3905fdab6e9bf470f977aa', '170050', 'SUMARTI', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('b6d2ba1c1c764ed2c50f6e02d7eca696', '170049', '22349c1a34658f958b6e7b311be105dd', '170049', 'KAMSARI', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('4a350bdaa2c0137f070a29509c9829c1', '170048', '6c25dae867c5ca6712f728f63bb47d73', '170048', 'BRAMANTYA ADI PRAKOSO', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('fe877498ad1ab9fd67bc4968f61d1981', '170051', '610f04e6e520df1f2e195605dc47eddb', '170051', 'SUPANDI', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('63e15a787ef84a12b47281ea608c5880', '170052', '08d51cf6756a229925db7f88ac23cfd5', '170052', 'MASRIFAH', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('e2d9201b242bbe9f0b0f144be0c15f61', '280039', '68911263e29da01072b247df6b7cddd0', '280039', 'ONI NUR HIKMAH', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('fe70bf9813098d16262423f2e71b1403', '280038', '90ad8ffea0f7ee5b254f27b3e352a466', '280038', 'NOVIKA ARDIYANTO', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('4663fd458ec5183622cc67ca26078d90', '280037', '3e7cbe5a6123d9bfbfaeb8812b823c1c', '280037', 'MUKHAMMAD TASTAF TIYAN', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('14b8cb103c3888e99d792c4f31648b04', '280036', '153f4bb35dd26081dac0f10a03263d51', '280036', 'MUKHAMAD KHOIRUL ANAM', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('9d5d69671a3c6d176aa80eb13411b945', '280035', '7097f992f3bd221be93afdba6b452814', '280035', 'MUHAMMAD SADAM ZAKARYA', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('d7de2b2e8b75630a833f42d808c104a2', '280034', '86c9928982db961d654b1f913a7392e9', '280034', 'MUHAMMAD HENDI PURNOMO', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('67007af64c0ba89cfff729a9db0737e9', '280033', 'e4f2575952e9c8e6d841d451c1997a5c', '280033', 'MUHAMMAD HAWWIN SHOLUCKY', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('f603c08525638247b54f1cf391a001bb', '280032', 'd71a0b5e81b97fa43f163a2fad194fd7', '280032', 'MUHAMMAD AZHAR WAHYU HANIF', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('919a093e3cc8892b454cb1c09ba42492', '280031', 'e0c7191d77817bdb0c5553735fdd3dd1', '280031', 'MUHAMMAD ARI DARUSSALAM', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('58d4730cf1938320b84a33d70db53fd2', '280030', '8261c00e4a9568af963b2b223c34bdca', '280030', 'MUHAMMAD ADI PRATOMO', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('317a63d60186da6d26d0ac34eb1d8187', '280029', 'e5d01068e26a027afcb48db1e49ee49f', '280029', 'MUHAMAD IRFAN AMINUDIN', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('2078e5148cd052e591739fa125ed5956', '280028', '367ee24de70bd29d59c21cb2cdc77999', '280028', 'MUHAMAD ARYA ARDINATA', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('eefa68a069a7e0b11764369dd1da46c6', '280027', '308f29f6d4aa734973144da479e0eb64', '280027', 'MUH KHOIRUN NIAM', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('e61e07900098519a978287aad1f101ab', '280026', '0a4e7603e57e6a8b7c6640b5d356cf44', '280026', 'MOH SYIHABUL MILLAH', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('4e08528f3f7a757157d26f152cb155a8', '280025', '02841bee80cacf7a5b4934967a2e7738', '280025', 'MIFTACHUL LUKMAN', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('3270e3b7233e4a679a37d62291071e32', '280024', '9f89d21214c9e85e33d0cd6165c205f8', '280024', 'M. RASIHAN ANWAR', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('0b64ccdf9b4bab5e351173fa77988a63', '280023', '21ff0455a2f0ded8b5698f01c6ac4d1a', '280023', 'M. FARID FADHLURROHMAN', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('f69c4b6b9649ea0a151a56161dc51fb3', '280022', 'fc7a8a742e4cb92e6ac49505531eedee', '280022', 'M. AFFAN NADHIF', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('7f024bf17a19cab3c79113df1b4d2f21', '280021', '6cd0f4f622d39614ae4c84815e98571a', '280021', 'LISA INDRIYANI', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('71bac476637f1bcef06310917b8b58ea', '280020', '425a202697e2e9d976d0cb2a500cc07f', '280020', 'INASAPUTRI', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('9ff27c13530df33c57ffab2bc420ac5c', '280019', '39e4e52176f91e9ed6ebb8105427d842', '280019', 'ILHAM PRATAMA YUDA', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('03a90cd30d10aa1ecdab35e0c9d4b906', '280018', 'dec137fdb24879834148831939e5df04', '280018', 'HUSAIN MURTADHO ABDULLAH', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('41ad7a016f5164937bd4d876c8665c3f', '280017', 'fc7e1da316fd20e47da3318807b0ac32', '280017', 'HANUM PUTRI WARDA', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('d38683e691c2be4d5b791153e227b7f2', '280016', '45e13ca571056ff79a0be8111f1a54da', '280016', 'CHULUT ZULVASARI', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('7571d7568125647d607bbb2775ef7929', '280015', '96b82f2904321e00d9d542f240fce42f', '280015', 'AWALUDIN TEGAR ABDUL ROHMAN', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('ea8ffc7a3b1fd074a3395c14d5208d0e', '280014', 'b74c854fe8b2729f53daa0b3aab79f34', '280014', 'ANNADA NAZILU NISFA LAIL', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('f0431a53cf75751653834e193ed890c9', '280013', 'd9c74fa6c48e079591bd21e12a377ae9', '280013', 'AJI NUR CHOLIS', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('69426d7321c198d979df561d29b38ba9', '280012', '70f67c9f015def105bdf3fa8f81bb33f', '280012', 'AHMAD AGUNG KURNIAWAN', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('130e36f6ca2e8441c634828e58959afd', '280011', '13e0a96d94a0756492e9327a38027a55', '280011', 'ACHMAD EKA MAULANA', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1'),
('a06e5a5bb8923353fdb4d44f0936bf53', '170040', '9d966a96b83cb939a320157b16b9f6da', '170040', 'NING BUDI INDARWATI', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('5b13ae1b7bf3ce1600a053f2100e013a', '170041', '73d1276f07fc3e853587a4e8e6140d23', '170041', 'MUZAYANAH', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('8c3de688fdc462a1272d0cff2c56f4c6', '170042', '96772f5bea6c5132a3b07bcfbf964bf3', '170042', 'KASTARI', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('76ee517d529342e7fb2c7c14135f2b0b', '170043', 'e3be32658ea52f0fa2b1a7a37c472388', '170043', 'KUSWATI', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('192e7525715c8185166b7ea6c56aadbb', '170044', '240e23eebf039a0dc1ec15529a3c2ecc', '170044', 'M FATIHURROZAQ', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('e1b0a0378b83d8e96653e0fcbf849835', '170045', '41954cfecfcc37a4831f8dfd3574950a', '170045', 'SITI MARDHIYAH', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('52e82593324ea2352ec52af9a31002de', '170046', 'c2b55efb44a8729424b4a293129778a0', '170046', 'ARIA CAHYADIYANTO', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('2057c53253db1238a05e54a207f785a3', '170047', '6162525d68bd90eb3a528fb102cbafd9', '170047', 'WORO PRIHARJANTI', 'GURU', '2020-07-29 08:04:27', NULL, NULL, NULL, NULL),
('2e5140e952c7c174d87e151da750a0fd', '1111111', '7fa8282ad93047a4d6fe6111c93b308a', '1111111', '1111111', 'GURU', '2020-07-29 21:38:30', NULL, NULL, NULL, NULL),
('cc6eb9255cf214a5930d6462792140c1', '1700012', '114009d23c84adb621de0307cc0227e4', '1700012', 'Jack Sparrow', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('9aff0a515e4c5521f71f0f8acc5378d2', '1700011', 'b6fffa5e8de53f3c7b168d487b6ebb3f', '1700011', 'Joker', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('c725a92c73afbfa08570d73635f4d32c', '1700010', '20f8c4bb4c8c8d7df323f97ee53597a1', '1700010', 'Angelina Jolie', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('cfaa660829f9d4e5e206f2526a86395e', '1234567', 'fcea920f7412b5da7be0cf42b8c93759', '1234567', '1234567', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('fa3a37c3c812127940dd2b26cbf9895e', '170053', '98b94c6babd669725c492f76b7fa06db', '170053', 'ACHMAD SULTON', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('5884c1fef46120ebf6a6863831de0ff0', '170054', '7d0e20354a66fceb73fdb392817e2af5', '170054', 'AHMAD ROZIKIN', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('9bbc06e48b098dacde38e0887f523d37', '170055', 'da9f3e7e9980b49668585efb69e22936', '170055', 'NURUL HIKMAH', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('ebea8b88a13d06b810a572c92df8dd41', '170056', '2804d74a6d791a722f18e2628754d8a4', '170056', 'NUR CHANIFAH', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('c90fd6c38086f3b455736fa5b40e5ebd', '170057', '4f914fc341a1b45fcd31964ea140184b', '170057', 'BAHTIAR RIFAxpsijixI', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('438a929ede865c8c2e4ce84538b7a39d', '170058', 'd525382a34b7540826e4ca1fa8fb67ba', '170058', 'SOEKISWANTO ADHY SOERYANTO', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('2828f40e2bf2736d16c71497f9263c8a', '170059', 'cc99604f893a3175a98fd3226492766d', '170059', 'KARTINI', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('becca0c681722553c8000922f41a33d9', '170060', '8b4581ffc3edad89176b445daeae60eb', '170060', 'DJUNARI', 'GURU', '2020-07-29 21:36:31', NULL, NULL, NULL, NULL),
('f67ae5e6d5e176e2941e1aa4c1107639', '7692', '15bb63b28926cd083b15e3b97567bbea', '7692', 'NAFA IMAMATUL FITRI', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('b0661479f723320beeac54c511d6461d', '7693', '1f8f69b53d86cf2a952bf95d87a59b0c', '7693', 'NORRICH ARDIAN HIDAYAT', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('b712bc11257f0ced5bc36c026a598180', '7694', 'be315e7f05e9f13629031915fe87ad44', '7694', 'NUR MUHAMMAD KHOLIS MUSA', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('6e0995b4f9a65a3b608299ed2913c6a3', '7695', 'f0a5944c6a815b7bb44323d783eede4d', '7695', 'RIZQI MAULANA', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('e2474cc22e5b3933b9d87724aea610f0', '7696', 'ac6b3cce8c74b2e23688c3e45532e2a7', '7696', 'SAHRUL GHOFUR', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('06d7ec753ec0107a5ad95757cf226634', '7697', 'a62344a91db0bb372d136f651af0ac97', '7697', 'SHANDY ARYA PRAMANA', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('dcffb8f06f2e8ca078c59aabca4c8381', '7698', 'c570c225d1fb8a72ad79995dd17a77bc', '7698', 'TEGAR KUNCORO', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('557ac87f2cf138315cc1e4ac05eff5f7', '7699', '2048d4501a8ee60d3d586159d163dbeb', '7699', 'YUDHA SAPUTRA', 'GURU', '2020-07-29 18:15:53', NULL, NULL, NULL, NULL),
('68707dc0e5d6b31a99b8c1fc42ddbb4e', '280006', '19e9772d8226406cf637be4030cc477a', '280006', 'Nicolas Saputra', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '5c623aae36c37785bc8c6aede401bd3b', 'X TKJ 2'),
('fcdf0478ee96030409aa8007d2d1ba06', '280008', '96aad5e6ed1a2dce18845d9d8e2bc486', '280008', 'Ine Febrianti', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '5c623aae36c37785bc8c6aede401bd3b', 'X TKJ 2'),
('751d09a93f5ca7ce0723fb8fa3ea57cb', '280009', '848962d06777c283a4b15e35249f65e9', '280009', 'Ratu Felisha', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '5c623aae36c37785bc8c6aede401bd3b', 'X TKJ 2'),
('798ffec3e3b1efa69e09e1e14745e066', '280007', '2f72a2e01460fdfcc8701be0de3509ab', '280007', 'Ririn Dwi Ariyanti', 'SISWA', '2020-07-29 21:24:35', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '0e3c17ca981b35a60b6407f6114cb73d', 'XI TKR 1'),
('2c7ea74972615e79a3586fee4473fb54', '1234567', 'fcea920f7412b5da7be0cf42b8c93759', '1234567', '1234567', 'SISWA', '2020-07-29 21:33:18', '322639a34022e27be17fff1b6e9c7d5e', '2020xgmringx2021', '4a8a7b79a7b1e26a882ae2b56bb41c77', 'X TKJ 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_soal`
--

CREATE TABLE `siswa_soal` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `jadwal_kd` varchar(50) DEFAULT NULL,
  `siswa_kd` varchar(50) DEFAULT NULL,
  `soal_kd` varchar(50) DEFAULT NULL,
  `jawab` varchar(1) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `kunci` varchar(1) DEFAULT NULL,
  `benar` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `siswa_soal`
--

INSERT INTO `siswa_soal` (`kd`, `kd_guru_mapel`, `jadwal_kd`, `siswa_kd`, `soal_kd`, `jawab`, `postdate`, `kunci`, `benar`) VALUES
('22753380224dec4155d2fd717ae7b016', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', '5637a2448498acd48200ef0e3d40fdf6', 'B', '2020-07-28 17:23:06', 'C', 'false'),
('94a4b5fa9a5e4385f20c453a2322c892', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', 'a71fa7a225f6edc2d3f4725c4a54faa4', 'C', '2020-07-28 17:23:07', 'A', 'false'),
('cb2d432be2e48c65a19960fcbd486bbd', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', 'b00dd0bf973bc0e01a150def0da184aa', 'B', '2020-07-28 17:23:11', 'B', 'true'),
('b690a2288ed561068f9323253d1fc8bd', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', '6c613993ba0b66e08b06c2d7057c085c', 'C', '2020-07-28 17:23:12', 'B', 'false'),
('1ad86572c0ab98fe97c59e1dd1c1be12', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', 'b399c6933a7d9eae127a67bd1e1e68c6', 'B', '2020-07-28 17:23:16', 'C', 'false'),
('fe7d78ea3627351cfd59edbf3ce7c47b', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', '07a107001248af9ab671da98dfed1016', 'B', '2020-07-28 17:23:17', 'A', 'false'),
('199ce5da591f30149c810ec6c8168f6a', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', 'a959bcb05ed1dac605b31e57864e3289', 'B', '2020-07-28 17:23:20', 'B', 'true'),
('cc33949671d627585b39d6c2671daec9', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', '462a4ef08a6650b176b74e79ddb470c5', 'B', '2020-07-28 17:23:22', 'B', 'true'),
('96568e78444272dadf3749311395e240', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', '193718556c9ea38a77468dedf9a57d7e', 'e4a51254462391714071eb21d0485f13', 'B', '2020-07-29 07:48:39', 'A', 'false'),
('89c4e41d99c8d833a7dc9c7a9b6d3ecc', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', '193718556c9ea38a77468dedf9a57d7e', '32f96f84e657a153e106d56e3f3dbc01', 'B', '2020-07-29 07:48:41', 'C', 'false'),
('d30caf4b23d976732c2b81a71dfce065', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', '193718556c9ea38a77468dedf9a57d7e', '666ead496869b35842dfc7c92df91558', 'C', '2020-07-29 07:48:44', 'C', 'true'),
('26594d04fb629937318be0a73cb4c8a9', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', '193718556c9ea38a77468dedf9a57d7e', 'c9a62f915fbe489e6a6dac7df71601ac', 'B', '2020-07-29 07:48:45', 'A', 'false'),
('09e1606bfe43bdeb11d8bcc6805516e5', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', '193718556c9ea38a77468dedf9a57d7e', '097b6d79067e10c3ea89ad6f425ee680', 'E', '2020-07-29 07:48:49', 'B', 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_soal_nilai`
--

CREATE TABLE `siswa_soal_nilai` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `jadwal_kd` varchar(50) DEFAULT NULL,
  `siswa_kd` varchar(50) DEFAULT NULL,
  `jml_benar` varchar(3) DEFAULT NULL,
  `jml_salah` varchar(3) DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_proses` datetime DEFAULT NULL,
  `waktu_akhir` datetime DEFAULT NULL,
  `skor` varchar(5) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `jml_soal_dikerjakan` varchar(10) DEFAULT NULL,
  `selesai` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `siswa_soal_nilai`
--

INSERT INTO `siswa_soal_nilai` (`kd`, `kd_guru_mapel`, `jadwal_kd`, `siswa_kd`, `jml_benar`, `jml_salah`, `waktu_mulai`, `waktu_proses`, `waktu_akhir`, `skor`, `postdate`, `waktu_selesai`, `jml_soal_dikerjakan`, `selesai`) VALUES
('8f8056e7410f623b278f8ae2ea8aabd8', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', 'c8501a58dde52c15ac3ac56fbe669603', NULL, NULL, '2020-07-28 12:52:06', '2020-07-28 17:34:37', '2020-07-28 12:53:06', NULL, '2020-07-28 12:52:06', NULL, NULL, 'false'),
('f559be87eb35a0205406bf164fc1a156', '041c7cc5a8fb9320f6f3b538ce538b4c', '2f10197efe2e6ea52be9a59898f5bcb7', 'c8501a58dde52c15ac3ac56fbe669603', '3', '5', '2020-07-28 17:23:00', '2020-07-28 17:34:18', '2020-07-28 17:23:00', NULL, '2020-07-28 17:23:00', '2020-07-28 17:23:24', '8', 'true'),
('31cd5d232a625319c71330e33dc6fb1e', '041c7cc5a8fb9320f6f3b538ce538b4c', '777dd00d4cdbd156b6362140d350de61', '193718556c9ea38a77468dedf9a57d7e', '1', '4', '2020-07-29 07:48:32', '2020-07-29 07:49:02', '2020-07-29 07:49:32', NULL, '2020-07-29 07:48:49', '2020-07-29 07:48:50', '5', 'true');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_tugas`
--

CREATE TABLE `siswa_tugas` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `tugas_kd` varchar(50) DEFAULT NULL,
  `siswa_kd` varchar(50) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `filex` longtext DEFAULT NULL,
  `nilai` varchar(10) DEFAULT NULL,
  `nilai_postdate` datetime DEFAULT NULL,
  `nilai_ket` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `siswa_tugas`
--

INSERT INTO `siswa_tugas` (`kd`, `kd_guru_mapel`, `tugas_kd`, `siswa_kd`, `postdate`, `filex`, `nilai`, `nilai_postdate`, `nilai_ket`) VALUES
('6765a047c4479396e1932714057d86e5', '041c7cc5a8fb9320f6f3b538ce538b4c', '2ad8bbacdf63fb94c5add56b2995cce8', 'f4f5d296afead37410f18a6ca7bff265', '2020-07-30 10:20:32', 'zoom.satelite.mp4.zip', 'A+', '2020-07-30 10:53:58', 'bagus deh.... lanjutkan...'),
('4bdd367323e6cdfb743a670dabb8dfff', '041c7cc5a8fb9320f6f3b538ce538b4c', '06998158a48c27c3ed159eb29767bc48', 'f4f5d296afead37410f18a6ca7bff265', '2020-07-30 10:22:24', 'zoom.satelite.mp4.zip', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog`
--

CREATE TABLE `user_blog` (
  `kd` varchar(50) NOT NULL,
  `kd_user` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `foto_path` varchar(255) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL DEFAULT '-',
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(255) NOT NULL DEFAULT '-',
  `email` varchar(255) NOT NULL DEFAULT '-',
  `situs` varchar(255) NOT NULL DEFAULT '-',
  `telp` varchar(100) NOT NULL DEFAULT '-',
  `agama` varchar(30) NOT NULL DEFAULT '-',
  `hobi` varchar(100) NOT NULL DEFAULT '-',
  `aktivitas` varchar(100) NOT NULL DEFAULT '-',
  `tertarik` varchar(100) NOT NULL DEFAULT '-',
  `makanan` varchar(100) NOT NULL DEFAULT '-',
  `minuman` varchar(100) NOT NULL DEFAULT '-',
  `musik` varchar(100) NOT NULL DEFAULT '-',
  `film` varchar(100) NOT NULL DEFAULT '-',
  `buku` varchar(100) NOT NULL DEFAULT '-',
  `idola` varchar(100) NOT NULL DEFAULT '-',
  `pend_akhir` varchar(100) NOT NULL DEFAULT '-',
  `pend_thnlulus` varchar(4) NOT NULL,
  `moto` varchar(100) NOT NULL DEFAULT '-',
  `kata_mutiara` varchar(100) NOT NULL DEFAULT '-',
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_blog`
--

INSERT INTO `user_blog` (`kd`, `kd_user`, `user_kode`, `user_nama`, `foto_path`, `tmp_lahir`, `tgl_lahir`, `alamat`, `email`, `situs`, `telp`, `agama`, `hobi`, `aktivitas`, `tertarik`, `makanan`, `minuman`, `musik`, `film`, `buku`, `idola`, `pend_akhir`, `pend_thnlulus`, `moto`, `kata_mutiara`, `postdate`) VALUES
('b370687d623581b29f191c4ac066c11a', '4a91033bfe52de0aedecd767ee4075c5', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-17 08:53:03'),
('a7b2e0f12e8378bb887b1a9ccfd66d66', 'e5cabee927429398b4d2a289166d511b', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-25 09:18:23'),
('77a80011e8d3a60f8ab41a2d59a6b9fd', 'c8501a58dde52c15ac3ac56fbe669603', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-26 03:16:24'),
('c01a0cc68cd73c92adb707a155458e86', '772c45c3a19d620b7cbf864a377eee3f', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-26 04:39:59'),
('cb4bc2bd6769dfdba6effc0ab6f8ec81', '92b88f920c5b58e9aff71a14247c98ce', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-29 07:20:24'),
('9af6fd3e2d64c47f886fe9e628681a12', '614bc83b72e3eb7f4ab1a33714f18bf9', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-29 07:32:21'),
('6afc275d8470151d62fdb9896bbe7176', '17d0aea3c8d7daf39e8f6d8dccc40a8c', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-29 07:41:29'),
('b6fa6b6cbf82a48aa68f9b0319c3ced0', '193718556c9ea38a77468dedf9a57d7e', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-29 07:43:49'),
('bdd9e1e8f5f519034b148ec9968bcc63', 'ba917a5a74d6529f878af6707c361177', '', '', '', '-', '0000-00-00', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '', '-', '-', '2020-07-29 08:05:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_album`
--

CREATE TABLE `user_blog_album` (
  `kd` varchar(50) NOT NULL,
  `kd_user` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_album_filebox`
--

CREATE TABLE `user_blog_album_filebox` (
  `kd` varchar(50) NOT NULL,
  `kd_album` varchar(50) NOT NULL,
  `filex` longtext NOT NULL,
  `ket` longtext NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_album_msg`
--

CREATE TABLE `user_blog_album_msg` (
  `kd` varchar(50) NOT NULL,
  `kd_user_blog_album` varchar(50) NOT NULL,
  `dari` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_artikel`
--

CREATE TABLE `user_blog_artikel` (
  `kd` varchar(50) NOT NULL,
  `kd_user` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `kd_kategori` varchar(50) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `rangkuman` varchar(255) NOT NULL,
  `isi` longtext NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_artikel_msg`
--

CREATE TABLE `user_blog_artikel_msg` (
  `kd` varchar(50) NOT NULL,
  `kd_user_blog_artikel` varchar(50) NOT NULL,
  `dari` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_msg`
--

CREATE TABLE `user_blog_msg` (
  `kd` varchar(50) NOT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `tapel` varchar(100) DEFAULT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `kd_user` varchar(50) DEFAULT NULL,
  `user_tipe` varchar(100) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `untuk` varchar(50) DEFAULT NULL,
  `uuser_tipe` varchar(100) DEFAULT NULL,
  `uuser_kode` varchar(100) DEFAULT NULL,
  `uuser_nama` varchar(100) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `dibaca` enum('true','false') NOT NULL DEFAULT 'false',
  `dibaca_postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_blog_msg`
--

INSERT INTO `user_blog_msg` (`kd`, `kd_guru_mapel`, `tapel`, `kelas`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `untuk`, `uuser_tipe`, `uuser_kode`, `uuser_nama`, `msg`, `postdate`, `dibaca`, `dibaca_postdate`) VALUES
('4917944c322fc11ac21c1ec02532c33d', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'e5cabee927429398b4d2a289166d511b', 'SISWA', '7654321', '7654321', '[Bahasa Inggris]. belajar di rumah yang rajin ya...', '2020-07-25 08:02:43', 'false', NULL),
('5add99dba70438072308061895561e3a', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', NULL, '170001', 'Orang BIASAWAE', '16b91234e2622effbf76db4c3eff28a1', NULL, '280002', 'Achmad Albar', '[Bahasa Inggris]. coba ya...', '2020-07-25 08:00:36', 'false', NULL),
('3cb654ff94503396d6057881051293de', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', NULL, '170001', 'Orang BIASAWAE', 'e5cabee927429398b4d2a289166d511b', NULL, '7654321', '7654321', '[Bahasa Inggris]. coba ya...', '2020-07-25 08:00:36', 'false', NULL),
('f7703d71ef360250893c5262372ac21a', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '16b91234e2622effbf76db4c3eff28a1', 'SISWA', '280002', 'Achmad Albar', '[Bahasa Inggris]. belajar di rumah yang rajin ya...', '2020-07-25 08:02:43', 'false', NULL),
('394a80dec478253ad0fc595304cc3b1d', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'e5cabee927429398b4d2a289166d511b', 'SISWA', '7654321', '7654321', '[Bahasa Inggris]. besok berangkat lebih pagi ya...', '2020-07-26 03:09:42', 'false', NULL),
('2938ff27f8d62f49c89aba6e4604a746', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '16b91234e2622effbf76db4c3eff28a1', 'SISWA', '280002', 'Achmad Albar', '[Bahasa Inggris]. besok berangkat lebih pagi ya...', '2020-07-26 03:09:42', 'false', NULL),
('359d1e360c9af66101686b89cce209c6', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'e5cabee927429398b4d2a289166d511b', 'SISWA', '7654321', '7654321', '[Bahasa Inggris]. halo...', '2020-07-28 18:24:31', 'false', NULL),
('317992e1fdd73b5ad71a9017c609f6a0', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '16b91234e2622effbf76db4c3eff28a1', 'SISWA', '280002', 'Achmad Albar', '[Bahasa Inggris]. halo...', '2020-07-28 18:24:31', 'false', NULL),
('6458dd0b39d3bd0bd7625316875ccb98', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '772c45c3a19d620b7cbf864a377eee3f', 'SISWA', '280010', 'Julia Perez', '[Bahasa Inggris]. halo...', '2020-07-28 18:24:31', 'false', NULL),
('12b3cb497d86453533b57f9c4c56979d', '041c7cc5a8fb9320f6f3b538ce538b4c', '2020xgmringx2021', 'X TKJ 1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Orang TeknikNih', '[Bahasa Inggris]. halo...', '2020-07-28 18:24:31', 'false', NULL),
('e3a2ce6e437f36145af29cc208364291', '-', '-', '-', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '799f80d2808aed163f503f6196de9909', 'SISWA', '280001', 'Desi Ratnasari', 'tes saja ya....', '2020-07-29 22:07:29', 'false', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_status`
--

CREATE TABLE `user_blog_status` (
  `kd` varchar(50) NOT NULL,
  `kd_user` varchar(50) DEFAULT NULL,
  `user_tipe` varchar(100) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `onlineya` varchar(100) DEFAULT NULL,
  `ipnya` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_blog_status`
--

INSERT INTO `user_blog_status` (`kd`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `status`, `postdate`, `onlineya`, `ipnya`) VALUES
('6a676aed257ef9f09aa94da1c4a80adc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:42:35', 'YA', '114.79.16.192'),
('9be130264da55680e92e678e2174bfa9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:42:36', 'YA', '114.79.16.192'),
('6f5831ac3119ea1b8957e17b5a964c10', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:43:53', 'YA', '114.79.16.192'),
('af1e222e4c58b060c397c7845e9a8f07', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:27', 'YA', '114.79.16.192'),
('794f3335ed493baaa7ff7e7b4b6a6c19', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:30', 'YA', '114.79.16.192'),
('add82a9b3aa50ee7bd2a84f8b6ff684d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:31', 'YA', '114.79.16.192'),
('b91da96c0527f49fa51d2e3d55727871', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:33', 'YA', '114.79.16.192'),
('817456b92ecfc7cb8e4654e68811c65f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:34', 'YA', '114.79.16.192'),
('e4a096eab8ed650dd695caeb9ee6049f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:36', 'YA', '114.79.16.192'),
('833f69d6b40e22b079a21b355c9dabfc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:37', 'YA', '114.79.16.192'),
('dcfbf902bcbe82c8da1b2338a934e550', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:41', 'YA', '114.79.16.192'),
('bcd671a4aacc910fc7a0fd4f6e2daad5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '', '2020-07-26 07:48:44', 'YA', '114.79.16.192'),
('c3574ca4e6ffed3181c6f700289f1998', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:01:31', 'YA', '114.79.16.192'),
('2eaa496d37ec3edc6273d43be9be149a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:01:33', 'YA', '114.79.16.192'),
('0270ba2b11b6034dbee8d8f7f8791b1e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:01:34', 'YA', '114.79.16.192'),
('fb90a3cab6860948864c0760beeccc97', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:01:35', 'YA', '114.79.16.192'),
('134937165135ab3e177a20c6631e10c0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:01:36', 'YA', '114.79.16.192'),
('6378e94c94950aa46f1bc1ff9ad56293', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:03:44', 'YA', '114.79.16.192'),
('65e1be35308c20b8e30353c5b27abf5a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:03:47', 'YA', '114.79.16.192'),
('bc4aafc4e0a92611bda511817137257a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:03:56', 'YA', '114.79.16.192'),
('6d4b815f88c1e3962240f9849541dd4b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:04:00', 'YA', '114.79.16.192'),
('964b7f20d30f229fad3f9204a4657d8a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:04:22', 'YA', '114.79.16.192'),
('cda5ff6b2e71d27e1e03164b6468cd9d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:04:25', 'YA', '114.79.16.192'),
('3b7c6eee330f6f8b59cdec3883fceb88', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:04:50', 'YA', '114.79.16.192'),
('f02509426aa6538782541877da49266d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:04:53', 'YA', '114.79.16.192'),
('9a628d2ea7f2248dbca575147b111e1a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:05:40', 'YA', '114.79.16.192'),
('38cf8d516e276f9e61ec1ff43b0d27e6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Ganti Profil', '2020-07-26 08:05:44', 'YA', '114.79.16.192'),
('3a71824c89c24073f68dbf0533471b03', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:05:48', 'YA', '114.79.16.192'),
('6d5acf65f8a06c44fd76eeb0d7a3ee37', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:06:01', 'YA', '114.79.16.192'),
('cf7398f27afe2d1b1b03e47af65a1e87', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 08:06:21', 'YA', '114.79.16.192'),
('f08ef7ac08cdb387e54a09ce98964aa4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Ganti Profil', '2020-07-26 08:06:28', 'YA', '114.79.16.192'),
('93cdfd7f39c06036f4b414c7c56d694d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:06:29', 'YA', '114.79.16.192'),
('363d91e2ebd11ec7d8af1e99a31aee7c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:06:32', 'YA', '114.79.16.192'),
('9496a7e33a1cfc7f61cb4c8ec476baa4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:06:45', 'YA', '114.79.16.192'),
('45f4cf8a05e1dc0b318d100df421e22d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-26 08:07:08', 'YA', '114.79.16.192'),
('546a733003a2664ed1aca3b097f21095', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Inbox Pesan', '2020-07-26 08:07:10', 'YA', '114.79.16.192'),
('15ff15e15cf5465cfe627c4a709cf3c7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-26 08:07:11', 'YA', '114.79.16.192'),
('99c39e0b34a97e1d43a1eeaff8569b85', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-26 08:09:06', 'YA', '114.79.16.192'),
('90d9dd7002587d82f28ad44a6d61d5ba', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Ganti Profil', '2020-07-26 08:09:16', 'YA', '114.79.16.192'),
('65f1d847481e16ab9d312c2869848942', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-26 08:09:18', 'YA', '114.79.16.192'),
('fd23d453cc76f3ea4d594d6e6a966949', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Inbox Pesan', '2020-07-26 08:09:21', 'YA', '114.79.16.192'),
('7ef9583b789238b80992cdb38a0be443', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Pesan Terkirim', '2020-07-26 08:09:23', 'YA', '114.79.16.192'),
('5dedac37fcf2c0da23ce8bff9e3125fc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Buat Pesan Baru', '2020-07-26 08:09:25', 'YA', '114.79.16.192'),
('1357eb09f6bb380f2ee6fb37684f3458', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-26 08:09:27', 'YA', '114.79.16.192'),
('4ed6c9b4742f62153352e0e42a1b8696', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', ' [2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:09:30', 'YA', '114.79.16.192'),
('2d30b89f2943a3cef3326ffc45a7e85e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:09:49', 'YA', '114.79.16.192'),
('660cd7e43fbfd7bd5aba054fbf772401', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:09:53', 'YA', '114.79.16.192'),
('222d14ecb035527b00e81771ad99111f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci]. Ujian Selesai', '2020-07-26 08:10:28', 'YA', '114.79.16.192'),
('0574dc1510af619009adcfdc3b229311', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:29:39', 'YA', '114.142.169.22'),
('c36130e5bc998c45685aafb6be69ab08', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:30:01', 'YA', '114.142.169.22'),
('c94ee125476ae21e1da05a6f27ba19c9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:30:13', 'YA', '114.142.169.22'),
('d27e275f1bec0fc63da5a152987f45fd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:30:19', 'YA', '114.142.169.22'),
('2f6fe603565ebe32362fac8ab0fc35e6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:30:30', 'YA', '114.142.169.22'),
('a4c9abd4ee28eac8c1014c819fc617ba', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:30:59', 'YA', '114.142.169.22'),
('3851d7d312516329d2f8c778c58dfaf6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:31:05', 'YA', '114.142.169.22'),
('bd60cddcf03c24df221fa0471988b564', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:31:12', 'YA', '114.142.169.22'),
('81cf7fa6679a9913ec70a3d4b0a23ae3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:31:21', 'YA', '114.142.169.22'),
('99222f6ead0e4d74efeeaf7a9fd6062b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:31:30', 'YA', '114.142.169.22'),
('731aeff44530da7f2ca3739b722508a6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:31:38', 'YA', '114.142.169.22'),
('c6aa6e5e4c1c57816bf5ca505e2d0bbf', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:31:45', 'YA', '114.142.169.22'),
('715d30d174fa67ac2f39ba0f7a648be4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:32:17', 'YA', '114.142.169.22'),
('94839bcd3c268f8ae3e4bcc9cf1d0a53', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:32:20', 'YA', '114.142.169.22'),
('1d1c739682ebf6fec44d8a6367bdacea', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:32:30', 'YA', '114.142.169.22'),
('85b84ed2432efffdfd03bd2c7d6f275a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:32:39', 'YA', '114.142.169.22'),
('28daecd1aa33c2fcb2a7cb36ac5ef29d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-26 08:33:15', 'YA', '114.142.169.22'),
('95603b067590375f2af67eaaaf8e8c62', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', ' [2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:33:18', 'YA', '114.142.169.22'),
('3f0230b71a7d238c8a90fc5a076289d1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:33:26', 'YA', '114.142.169.22'),
('1727ed26725f6275c424eb989a94babc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:33:33', 'YA', '114.142.169.22'),
('6641418504f13a67f7e21f8c17f2919c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:34:28', 'YA', '114.142.169.22'),
('9c1ef99f79e44b72cfd8459b754d5b43', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:34:31', 'YA', '114.142.169.22'),
('cd3c8a481914e5858c33d7b56f7cadd9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:34:36', 'YA', '114.142.169.22'),
('32321f2a1ded040e62741695ff1a2fe7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 08:34:50', 'YA', '114.142.169.22'),
('74c7f3e27abd61b81556c25e116823e0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-26 08:35:04', 'YA', '114.142.169.22'),
('278c310eac5036a5ee9253905b42850d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-26 08:35:12', 'YA', '114.142.169.22'),
('df80c9ba68f11c97c386ac2dfdd42d7c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-26 08:35:42', 'YA', '114.142.169.22'),
('69baf361633b194b96a6f5d416105dbd', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-26 08:35:45', 'YA', '114.142.169.22'),
('466ed056b81e52874fd21df216639686', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-26 08:35:47', 'YA', '114.142.169.22'),
('0abcb93d01e36525ab9167b874ae08e8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:46:20', 'YA', '114.142.169.22'),
('14698c7fd062c15a209448e84435d23a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:46:22', 'YA', '114.142.169.22'),
('caf3dba8f939c00ca73503af02b84d94', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:46:59', 'YA', '114.142.169.22'),
('690b85659fcdb9aefccd57e2ff842dac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:47:06', 'YA', '114.142.169.22'),
('539bdbd6a1e54a3945ff7d081f82e30f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:47:10', 'YA', '114.142.169.22'),
('273b6b127c1befaea13270113cc4d9bd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:47:15', 'YA', '114.142.169.22'),
('7d5a0463746b9633024614e37d561601', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 08:47:20', 'YA', '114.142.169.22'),
('31b631274b98a1b0f8562be752889223', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:47:23', 'YA', '114.142.169.22'),
('790456f5172a1069cdb874c40278f65e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 08:47:27', 'YA', '114.142.169.22'),
('566f9a16371d3853bc84d34773ceb1ff', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:00:47', 'YA', '114.79.20.156'),
('e46412551682eccb902d3c737377563a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:00:53', 'YA', '114.79.20.156'),
('2d6a11a2633f0822b627626ac59f1852', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:00:58', 'YA', '114.79.20.156'),
('45e11ff568eb07d0add3a0b382814301', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:01', 'YA', '114.79.20.156'),
('61a0b3ebcb0487f8a862869485a7dca9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:03', 'YA', '114.79.20.156'),
('0a9192957c54bcc3bdc556b016c27ceb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:07', 'YA', '114.79.20.156'),
('3cbf6a4452738f7159aa7fbf8041085a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'ok...', '2020-07-26 14:01:09', 'YA', '114.79.20.156'),
('c30909e28ca4ca09c9f2bc57a19e27e2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:01:12', 'YA', '114.79.20.156'),
('3ce40bc21c39c0e1838bf0555ecfbefc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:20', 'YA', '114.79.20.156'),
('b9dd100d652b2a9960783cde09d98344', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:23', 'YA', '114.79.20.156'),
('e420748de9ee6e8608a9e08dd659de4f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:31', 'YA', '114.79.20.156'),
('0b71c7bb3acac3bc1f695bf3a26b551c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:33', 'YA', '114.79.20.156'),
('4a4269c86a8fc409ef7382b33dbb53ac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:01:36', 'YA', '114.79.20.156'),
('c4cd8ed1f5538de6ff7a343a4fd5edc5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'ok...', '2020-07-26 14:01:57', 'YA', '114.79.20.156'),
('9278aa9530fdb3c4e8b6d46611d20bf8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:02:04', 'YA', '114.79.20.156'),
('e808acdd51de7e4bf11d6367e0641bf2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Ganti Profil', '2020-07-26 14:02:37', 'YA', '114.79.20.156'),
('452f08ea1c4f264f5cd9d3a9ba15a956', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:02:39', 'YA', '114.79.20.156'),
('6c7892a023e20d1576786036d425dac6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:02:44', 'YA', '114.79.20.156'),
('5963ddfd94ec385503bca8b7a9e61003', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:03:22', 'YA', '114.79.20.156'),
('f2f1e6cd9bdc28fcad5db54bd551ad39', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:03:28', 'YA', '114.79.20.156'),
('0bd1d3b698069da7d90e0fcf892d4ec2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:06:32', 'YA', '114.79.20.156'),
('102c22fea1e79cc7325e49eaf43e2cac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:06:37', 'YA', '114.79.20.156'),
('f9b7a693abe861960ddb515693068daa', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', ' [2020/2021. X TKJ 1]. Bahasa Inggris', '2020-07-26 14:09:24', 'YA', '114.79.20.156'),
('6cd8fd2532c59ebb2648185b409abb8d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:17:25', 'YA', '114.79.20.156'),
('d7db2a65b61c265d4c7ad49aea16e9c2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:17:38', 'YA', '114.79.20.156'),
('ff3e0480d3be92c26bb683db0a079470', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Ganti Profil', '2020-07-26 14:17:43', 'YA', '114.79.20.156'),
('8a57f14cde6935b487fd37b666a69e9f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:17:45', 'YA', '114.79.20.156'),
('ba68feded46acaf09fd2927dde4877ac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:17:50', 'YA', '114.79.20.156'),
('5af9df58c43956d12289c815cf174ab9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:17:56', 'YA', '114.79.20.156'),
('981871268c53ef6382e4bde934064304', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:17:59', 'YA', '114.79.20.156'),
('9778a0cf6691d961a7b6fa46a456fb44', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:18:01', 'YA', '114.79.20.156'),
('2f6876a9776effc8c0e9e6ae46ffe09e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:18:03', 'YA', '114.79.20.156'),
('59380b345b62b20293f8bd0b3d0686ba', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:18:06', 'YA', '114.79.20.156'),
('70ff3363211d0d5252c4953ec5e0f0ab', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:18:08', 'YA', '114.79.20.156'),
('502e22f7e03e4fa7657224868e1a8af4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:18:11', 'YA', '114.79.20.156'),
('1832c3004aa9a96c0fb237251b468e42', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SOAL].', '2020-07-26 14:18:17', 'YA', '114.79.20.156'),
('ee970af0a05f28158ada8596ceb64414', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:18:36', 'YA', '114.79.20.156'),
('ec0a1183fa462542807e39b23dae749a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:18:44', 'YA', '114.79.20.156'),
('4f7ba60b1079db3bd270389a60167a93', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:18:50', 'YA', '114.79.20.156'),
('60b6d5be65bfea98ee0d8ebe99c1c564', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:19:31', 'YA', '114.79.20.156'),
('3047e212f09a739b0af49eb86b3dbc96', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:19:37', 'YA', '114.79.20.156'),
('eb196ff4a23302d5d278087645d66b5a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:21:36', 'YA', '114.79.20.156'),
('f73492390c1fd013d9a81008fb1d08bf', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:23:16', 'YA', '114.79.20.156'),
('46df2d35fd2bcc3dee3c7a500d6603ac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:24:33', 'YA', '114.79.20.156'),
('5b2e8665cfd0a89ba176f24617bfc46c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:25:42', 'YA', '114.79.20.156'),
('6f0280f0db570214d5619afb9fe74069', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:26:29', 'YA', '114.79.20.156'),
('2a86ac6afc1a4ade892946ef0d34b120', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:26:36', 'YA', '114.79.20.156'),
('85f35df16d76b7cfb350a39f0edff72f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-26 14:26:50', 'YA', '114.79.20.156'),
('276ff903bc86060afea89d71e8dae071', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:26:52', 'YA', '114.79.20.156'),
('6e6d13628d4c12e6a12ea963b3a2cc45', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:28:33', 'YA', '114.79.20.156'),
('95da8b62b8f3ecb7a01dd40dcf5be4af', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:28:37', 'YA', '114.79.20.156'),
('0e1558da582c8928468f7f235740d080', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:28:47', 'YA', '114.79.20.156'),
('945f9bdbc69b2694c1329b7546099337', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:28:55', 'YA', '114.79.20.156'),
('90a9cfa5fdd51cd3ff698fe1c8c799da', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-26 14:29:02', 'YA', '114.79.20.156'),
('a1e01745dea4bc45ce4de0f3954e035c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-26 14:29:08', 'YA', '114.79.20.156'),
('6178e42b5c5e9556a4e5779e2264f03b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-26 14:29:19', 'YA', '114.79.20.156'),
('1cee789a75b546c3ad1c116cc6e3dd7f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-26 14:30:26', 'YA', '114.79.20.156'),
('f36e6c69c19615dd9919790e05adbcc6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-26 14:30:29', 'YA', '114.79.20.156'),
('a8dd380765b572174859139c49e2ce5c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-26 14:30:33', 'YA', '114.79.20.156'),
('11317eb6d45b9f2a71723fdc24f8f52c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-26 14:30:38', 'YA', '114.79.20.156'),
('8adb8ff964fdfa0801d48ed77a85b551', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-26 14:31:07', 'YA', '114.79.20.156'),
('4302e951fc1b9f348d5abb4f3c75b5b2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-26 14:31:21', 'YA', '114.79.20.156'),
('50e233ba5449fb964e4375252b2f330e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-26 14:31:27', 'YA', '114.79.20.156'),
('890e5528abfe53cde322f3a021cb1728', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-26 14:31:32', 'YA', '114.79.20.156'),
('5bce23f33fbefcb0528f824f14ef7907', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [VIDEO YOUTUBE].', '2020-07-26 14:31:36', 'YA', '114.79.20.156'),
('99994f8a40ff06eb2d1bcbd1052b87f8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-26 14:31:40', 'YA', '114.79.20.156'),
('854c2fea4e1c7768aad9e63ae8b6c41f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-26 14:31:44', 'YA', '114.79.20.156'),
('df5c5430ec28ec990ae96174b07d8e86', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-26 14:31:47', 'YA', '114.79.20.156'),
('b6a8989d8ffe6cf790930362dd3e6548', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:32:13', 'YA', '114.79.20.156'),
('a0b56ff301263f6192e0faf87f5dfe3b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:32:21', 'YA', '114.79.20.156'),
('07ef3b9d0c88fa27f8a9e7da2585f54b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:32:26', 'YA', '114.79.20.156'),
('f91dea297f95a2aa6b8e5692c03e633e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:32:59', 'YA', '114.79.20.156'),
('506d53dae9ae48de6636eff811123c46', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [POLLING].', '2020-07-26 14:33:10', 'YA', '114.79.20.156'),
('10d4a4dbc821e283d305ad034dd38256', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [POLLING].', '2020-07-26 14:33:47', 'YA', '114.79.20.156'),
('04219748791a7563bb4ed64d14722c6b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SOAL].', '2020-07-26 14:34:00', 'YA', '114.79.20.156'),
('2ae3b175706d60280d2cf36b2c61b010', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BROADCAST PESAN].', '2020-07-26 14:34:13', 'YA', '114.79.20.156'),
('47859fe4465850673f6d12454229510a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BROADCAST PESAN].', '2020-07-26 14:35:18', 'YA', '114.79.20.156'),
('6203c1b4dccdd1489a33a24174490e6a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-26 14:35:35', 'YA', '114.79.20.156'),
('46e3c943c226703f0b82c718902f881c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-26 14:35:59', 'YA', '114.79.20.156'),
('d59ccab73eab71a87858fcde58f7e9f1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-26 14:36:40', 'YA', '114.79.20.156'),
('327c9fcb54e8fff638cf2b096e1bb3ff', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-26 14:36:48', 'YA', '114.79.20.156'),
('8f5254dc56e4c1c32254bc6cec62da98', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Ganti Profil', '2020-07-26 14:36:55', 'YA', '114.79.20.156'),
('c416a4820ed4ebc28a7367194c47a268', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:37:03', 'YA', '114.79.20.156'),
('a61a89b2b3c9ce76a3deccd8883ce993', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-26 14:38:12', 'YA', '114.79.20.156'),
('4928366ecb3de89fcf28a80c9678417b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:38:16', 'YA', '114.79.20.156'),
('2e71ddc43041a5a6989741f948200547', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-26 14:38:19', 'YA', '114.79.20.156'),
('89b0fce2682cdafd21f2da622520fa31', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:38:38', 'YA', '114.79.20.156'),
('7171eef3fa7605921a9d408c585b50ab', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:38:43', 'YA', '114.79.20.156'),
('7c3ee2458d88919125dacb9194ca8b10', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-26 14:38:49', 'YA', '114.79.20.156'),
('0d2762aacb6b16f7819f19dce19e65b8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-26 14:38:59', 'YA', '114.79.20.156'),
('b90e4b7e53a9fd01cb4fe148f1c08f11', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-26 14:39:17', 'YA', '114.79.20.156'),
('19c98113bcef2e1971716d9f5e813861', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', ' [2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 14:39:22', 'YA', '114.79.20.156'),
('9e29e0b0afac2ce75aec5dde0e49ebe9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 14:39:33', 'YA', '114.79.20.156'),
('87d84e4e74a166e9cd85e46a26febe19', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 14:39:45', 'YA', '114.79.20.156'),
('26ed0015374c84605613e774d5489fdc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 14:39:47', 'YA', '114.79.20.156'),
('db2c066b85819e08fedbcc4aa51daba9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 14:39:48', 'YA', '114.79.20.156'),
('021a9b7832cf186ac14e2f86c6390be9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-26 14:46:11', 'YA', '114.79.20.156'),
('41587f59a301b6fb1101892e2c8654c2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-26 14:46:15', 'YA', '114.79.20.156'),
('92f53a6077b5432a1bd3044828e8dc6e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LINK].', '2020-07-26 14:46:17', 'YA', '114.79.20.156'),
('a46a02e83262a7aa9d52598d10adfd9a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-26 14:46:18', 'YA', '114.79.20.156'),
('f106147e8c84e0bbe93af36a8721124f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-26 14:46:19', 'YA', '114.79.20.156'),
('f5c4b86f888ea37ee3e150d684e677f5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Ganti Profil', '2020-07-26 14:49:34', 'YA', '114.79.20.156'),
('abcec221bac5b79a0b3975af4c50e02a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Ganti Password', '2020-07-26 14:49:36', 'YA', '114.79.20.156'),
('d76909b0b565d3a6354114f3844a43ee', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-26 14:49:40', 'YA', '114.79.20.156'),
('2bd74b8c75fb765f2643d13d8195c07c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-26 14:49:42', 'YA', '114.79.20.156'),
('2ac2551a28a8e59c8206b0e77c3e4f73', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-26 14:49:58', 'YA', '114.79.20.156'),
('ebee3bfdebcf2accaaebf4ff5531d4d6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-26 14:50:00', 'YA', '114.79.20.156'),
('6eee0ddaeb0485cde6fa8e4f9078aedc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:50:06', 'YA', '114.79.20.156'),
('f6f3adb914be8ca5ed31bb1149c667a8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:52:43', 'YA', '114.79.20.156'),
('e87cc96884e6df105703f79223c07acf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:52:45', 'YA', '114.79.20.156'),
('00d9cc3dca37aef9d00c6d27eeea64a9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:53:06', 'YA', '114.79.20.156'),
('1beddceb5d2cbe83e70b3601378d5de6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:53:42', 'YA', '114.79.20.156'),
('6363a068b25240bcee130968378512d4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:53:44', 'YA', '114.79.20.156'),
('6001f015a8574efd94be6abadda6c698', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:53:46', 'YA', '114.79.20.156'),
('8a7c72cdd11c8fb840843c0baf94de42', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:54:02', 'YA', '114.79.20.156'),
('7a43b703912be714767836030536a7ff', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:54:03', 'YA', '114.79.20.156'),
('eba09c8285f4a66d4c4c550c762f0ea9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:54:10', 'YA', '114.79.20.156'),
('a5d99df1503f0cc6c9f7e922c36dce90', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-26 14:54:15', 'YA', '114.79.20.156'),
('f589cac4a17db85eb12d63dac0830f6c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:55:13', 'YA', '114.79.20.156'),
('3d9e08bd06990abaab1fe2ece349283f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:55:18', 'YA', '114.79.20.156'),
('d5a788b8066ce330e2530fa473330db4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:55:25', 'YA', '114.79.20.156'),
('d26ee8fe23d2350bb452a758b19f9263', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-26 14:55:26', 'YA', '114.79.20.156'),
('6a4b7bd256d1e438747c7e14479ac864', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:57:26', 'YA', '114.79.20.156'),
('c07515a6ae47aeb7a0b7106d36913f15', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:57:33', 'YA', '114.79.20.156'),
('5cd702b336db3236ec35b4ed7d3c1965', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:57:42', 'YA', '114.79.20.156'),
('a36a580f2dae8356246dbd105e470020', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-26 14:57:43', 'YA', '114.79.20.156'),
('18f39256f95a902b504aa1a36213ba60', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:57:47', 'YA', '114.79.20.156'),
('28d8a360102aba2fc0bb32d0530bab48', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:57:52', 'YA', '114.79.20.156'),
('208ae752cc80e1ceef7aaccb658f932a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-26 14:57:58', 'YA', '114.79.20.156'),
('77247caf8ef50c4b2978984a37395738', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:58:06', 'YA', '114.79.20.156'),
('300e7c0eade5af1d1b839fa57354f18b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:59:04', 'YA', '114.79.20.156'),
('634d33844c8a2ef0bc0645e2d0d8cb8c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-26 14:59:05', 'YA', '114.79.20.156'),
('8c2de5a0973024a7e96d5264b5f75aab', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-26 14:59:10', 'YA', '114.79.20.156'),
('fae06872759f1668025f69def5e43d87', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:59:14', 'YA', '114.79.20.156'),
('44b57debf2288ba6877d115ee9079efc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-26 14:59:27', 'YA', '114.79.20.156'),
('b4c92705af680f49d1d8e52301d3c543', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-26 15:00:29', 'YA', '114.79.20.156'),
('dbbcfc850560499b1c731745591ebd8b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-27 02:16:13', 'YA', '114.79.17.76'),
('fd3b08433aa23a4f6ef3dedcf4559487', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-27 02:16:16', 'YA', '114.79.17.76'),
('0b05955489938d4503b6f98403e24eab', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SOAL].', '2020-07-27 02:16:20', 'YA', '114.79.17.76'),
('a3200a96efaaa833a096fcf89671b618', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-27 09:25:09', 'YA', '115.178.255.81'),
('baf470e092e9df1a18d36b3fde5e9166', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-27 09:25:11', 'YA', '115.178.255.81'),
('def15ba45762e929b4ea393d693c52aa', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-27 09:25:18', 'YA', '115.178.255.81'),
('ea5a254056f0e016d67cd46f4319525f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-27 09:27:23', 'YA', '115.178.255.81'),
('f29a00a799475163c033cbe897dcd9fe', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-27 09:27:29', 'YA', '115.178.255.81'),
('5f714eb6b90f866d1228245fadf3d5ad', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-27 09:28:22', 'YA', '115.178.255.81'),
('d1ae7849205c3239ef725759903dafe3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-27 09:28:26', 'YA', '115.178.255.81'),
('6283b05566c37c5bd418ad22f80f021c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-27 09:28:38', 'YA', '115.178.255.81'),
('f28587799ec499350cfb17c739bfb5c9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-27 09:29:06', 'YA', '115.178.255.81'),
('266c402ba7b35481773a5278881edfb3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-27 09:29:50', 'YA', '115.178.255.81'),
('063d87404825516773a068f2d360a3ed', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-27 09:30:10', 'YA', '115.178.255.81'),
('167371a15e414f3370df10bce18df972', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-27 09:30:16', 'YA', '115.178.255.81'),
('1303fd434a3449eea7a8df80ff8833a3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-27 09:30:51', 'YA', '115.178.255.81'),
('9d650879f602af85f6ca30e5c78ed317', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-27 09:30:53', 'YA', '115.178.255.81'),
('377cc54b93361f273d59b2df093c2adb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-27 09:30:54', 'YA', '115.178.255.81'),
('a1038eb24d31c487df6466e57610f1cb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-27 09:30:55', 'YA', '115.178.255.81'),
('de900d55e805781d6b73fe397e414219', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-27 09:31:14', 'YA', '115.178.255.81'),
('386a010861128ae2aac4721147c2284f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-27 09:31:15', 'YA', '115.178.255.81'),
('53cdd6d75e2c825bc6bb7f935bfffb97', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:31:25', 'YA', '115.178.255.81'),
('c5745e984b1d33af118f94d08f076461', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:32:37', 'YA', '115.178.255.81'),
('cb6ae71d79cdfaed873fcc7abef4c1b2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:32:40', 'YA', '115.178.255.81'),
('20a8d73504b095ca5842e365bcba5058', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:32:42', 'YA', '115.178.255.81'),
('f125934b5a92156f666728eecb1b7063', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:02', 'YA', '115.178.255.81'),
('b91504b4957a3106e2f502fe05096683', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:03', 'YA', '115.178.255.81'),
('914abd10d665d9d01e6f1b9ff6655d2b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:07', 'YA', '115.178.255.81'),
('d437783aa37bc41e144bc36d111b1324', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:09', 'YA', '115.178.255.81'),
('5639b4313f42dd13ecf18b553559ef4d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:27', 'YA', '115.178.255.81'),
('fc1d54de021dae0c4802655900b077b2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:29', 'YA', '115.178.255.81');
INSERT INTO `user_blog_status` (`kd`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `status`, `postdate`, `onlineya`, `ipnya`) VALUES
('fd5b98c8c9e297d5a06e516af6f8871f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:32', 'YA', '115.178.255.81'),
('fa8302150d45051003553ef183ff726a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:34', 'YA', '115.178.255.81'),
('7230f236c09682a8fb6128b71bb724b4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-27 09:33:55', 'YA', '115.178.255.81'),
('289a521662f99a76b823b8a45ba67a88', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-27 09:34:04', 'YA', '115.178.255.81'),
('f9e0d2ee4e6c53c5dbeea05ef8583fe7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-27 09:34:59', 'YA', '115.178.255.81'),
('fd150b7550e6678c1abd0034a48b0954', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-27 09:35:00', 'YA', '115.178.255.81'),
('08d3427a1c134f71117e1591f6db8abf', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-27 09:35:06', 'YA', '115.178.255.81'),
('db3623def5cb2185af22712742050b91', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-27 09:35:42', 'YA', '115.178.255.81'),
('ad0abc347c10afa7a9b0508b0dd98f8a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-27 09:36:30', 'YA', '115.178.255.81'),
('53fb291a8e2c3620407d7a4be98f6d94', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-27 09:36:32', 'YA', '115.178.255.81'),
('3f71315f5e02f304f61d63546532fc25', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-27 09:36:33', 'YA', '115.178.255.81'),
('550d16201c2c48c6ca535af7ab3eea49', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-27 09:37:04', 'YA', '115.178.255.81'),
('83e8f26fe8cc41d73ba8257be2f522ec', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-27 09:37:05', 'YA', '115.178.255.81'),
('0da1cdbb5d5f4b7b61b9ab455d5d1204', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-27 09:37:11', 'YA', '115.178.255.81'),
('730fef00f3b3daf42d6990dd11301113', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [VIDEO YOUTUBE].', '2020-07-27 09:37:19', 'YA', '115.178.255.81'),
('6355fef0ed26fc4bec56541cde313b85', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [VIDEO YOUTUBE].', '2020-07-27 09:37:56', 'YA', '115.178.255.81'),
('1444acbe268c4b54a743bc3431a761d8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [VIDEO YOUTUBE].', '2020-07-27 09:37:57', 'YA', '115.178.255.81'),
('6b4b88d93a9384d0aa6cd093bc6459b0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [VIDEO YOUTUBE].', '2020-07-27 09:38:06', 'YA', '115.178.255.81'),
('5f489a05622258990b0d24b1b1e2196a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:38:17', 'YA', '115.178.255.81'),
('35af77ebe47f4c2de25f9896f91f23ac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:38:21', 'YA', '115.178.255.81'),
('85fbeb8b3aabe4d750de2211b90b7ca1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:38:23', 'YA', '115.178.255.81'),
('f941186b9f56c4308ae41917f22e48f0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:38:53', 'YA', '115.178.255.81'),
('f71f04a508a78f859af5138b3e5b0eb6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:38:54', 'YA', '115.178.255.81'),
('fffe6530131bcf2091bd98d60e78ef15', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:38:58', 'YA', '115.178.255.81'),
('63b2eed066c556c96a28a6d51dfd3cd8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:39:06', 'YA', '115.178.255.81'),
('d32eed2e56c4fe774277ac02fe6e38c4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:39:45', 'YA', '115.178.255.81'),
('960efefb1a4b32da9c93f066426ba318', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:39:46', 'YA', '115.178.255.81'),
('ff46ccd193bace7e8c3b385b1c4c4f17', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:39:51', 'YA', '115.178.255.81'),
('bd2a294a8a2711c07a92d0c51ca001c0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-27 09:39:56', 'YA', '115.178.255.81'),
('7b59bd7c60db5e89af33bece64c44c1a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:40:04', 'YA', '115.178.255.81'),
('40ae0e94051c838a12110bff044d0a82', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:40:57', 'YA', '115.178.255.81'),
('5dd6fc524419a1609f9b36e01e028e87', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:40:58', 'YA', '115.178.255.81'),
('9e846b1ef06f2521422113c79084f259', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:41:04', 'YA', '115.178.255.81'),
('9d64df71d0b8e0ad56c14eefff8addf9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:41:11', 'YA', '115.178.255.81'),
('3f757ffbd72012d56f4fb085b8f520c5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:42:01', 'YA', '115.178.255.81'),
('43ac31842cd55e90074c42d8f4c4cbc5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:42:25', 'YA', '115.178.255.81'),
('88c430f5c0b95cba551e7360225f3e9d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:42:28', 'YA', '115.178.255.81'),
('1ec26e39810a7413e223567e72135d47', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:43:03', 'YA', '115.178.255.81'),
('ca117ac6f5dc3ff8b5e3fcd8a20af4fc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-27 09:43:05', 'YA', '115.178.255.81'),
('d03615c8dd31def28488c65cdf79c86a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [POLLING].', '2020-07-27 09:43:12', 'YA', '115.178.255.81'),
('c84e1b6313254b777b2c91a5047d9f36', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [POLLING].', '2020-07-27 09:43:16', 'YA', '115.178.255.81'),
('92c0e1051a4882152055656e793557f0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [CHATROOM].', '2020-07-27 09:43:25', 'YA', '115.178.255.81'),
('451f9a2818abcc14fc01664ad739c627', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [CHATROOM].', '2020-07-27 09:43:34', 'YA', '115.178.255.81'),
('883682c847d593bd131dbcf1bbb10776', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BROADCAST PESAN].', '2020-07-27 09:43:49', 'YA', '115.178.255.81'),
('7f8d574340d8e0ca28999b29dec295a6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BROADCAST PESAN].', '2020-07-27 09:44:45', 'YA', '115.178.255.81'),
('a439455d672eaddc2deda5a36c084607', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BROADCAST PESAN].', '2020-07-27 09:44:47', 'YA', '115.178.255.81'),
('7753b1fdda123cb543ad430fa193f9c9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:45:01', 'YA', '115.178.255.81'),
('af82ec09aebe3ff02d753959d4655612', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:46:21', 'YA', '115.178.255.81'),
('2a36d536452f9285199996003c1fd7fe', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:46:23', 'YA', '115.178.255.81'),
('e07cb65cdabbd2608bf9f8473f0849b7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:46:29', 'YA', '115.178.255.81'),
('f60c0e0b38d08ec1165ea1855d908fe8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:48:13', 'YA', '115.178.255.81'),
('c3347c5e05def26e859390d2a88339d3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:48:16', 'YA', '115.178.255.81'),
('625249f573e612d1ad3a6e9a64f9a059', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-27 09:49:33', 'YA', '115.178.255.81'),
('575cb5531c1c1608cd72053afd6988c5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'LOG HISTORY', '2020-07-27 09:50:52', 'YA', '115.178.255.81'),
('b8ae2ce144a5dc0abbcea623094d6a83', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-27 09:51:04', 'YA', '115.178.255.81'),
('952a3e6684b568f39a3819e2fc44d4a0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 09:51:06', 'YA', '115.178.255.81'),
('291015bdde1d2a916e6110e67036f7c9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:51:16', 'YA', '115.178.255.81'),
('3f85e86d0e8c8e197d8547d5a5b1007d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:51:22', 'YA', '115.178.255.81'),
('72341630c24dbae795a5a92ba313ce6a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:52:41', 'YA', '115.178.255.81'),
('2d0370afce104de85e03197bf9a2ea75', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:52:49', 'YA', '115.178.255.81'),
('49fe92a1113c3e1327d4404b9c3f26c0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:53:06', 'YA', '115.178.255.81'),
('87bef83f6fbf7afebdcc4f79d1e82437', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:53:16', 'YA', '115.178.255.81'),
('b6690c3eb00a2f12b2c250847cb49fc1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:53:36', 'YA', '115.178.255.81'),
('5c50399a25b4b19b7d2e775b21029032', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:53:38', 'YA', '115.178.255.81'),
('91227c312ec7627f9ca43b1706244dd5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-27 09:53:48', 'YA', '115.178.255.81'),
('43ec96a53f5faf8e0281e778b12efa31', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-27 09:53:55', 'YA', '115.178.255.81'),
('ee6fbcb8cd78f6180023b21e3758d629', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-27 09:53:56', 'YA', '115.178.255.81'),
('76bd2cc2019b9b11c7fe1c3466eb1f84', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:54:03', 'YA', '115.178.255.81'),
('3b05263472b80ec1546114490e540c9c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:54:11', 'YA', '115.178.255.81'),
('05306aea0c44cedb5de0c11045025164', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-27 09:54:18', 'YA', '115.178.255.81'),
('dcc21b620e1660f8934fe32ae6bc817f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-27 10:08:41', 'YA', '115.178.255.81'),
('afbcb60271908d0f2ba94701c04592c7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 10:08:43', 'YA', '115.178.255.81'),
('02ffca6b850ac935336d13424a9eb0d0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-27 10:08:47', 'YA', '115.178.255.81'),
('98547a9b9300baa7273d3f0836d5a584', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-27 10:08:48', 'YA', '115.178.255.81'),
('4350aac3dd33a316a7b6559800147912', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 10:08:52', 'YA', '115.178.255.81'),
('549b8008dd5c5c638bffe38ae06a4e86', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-27 10:11:05', 'YA', '115.178.255.81'),
('845f7332affc60b8d444e3c1b900bb6c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-27 14:08:50', 'YA', '115.178.255.81'),
('71055e6d7730042018dfac82b6b6aae1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 14:08:54', 'YA', '115.178.255.81'),
('f5ed875288a2f5dc43e00d437bafbfcf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-27 14:11:29', 'YA', '115.178.255.81'),
('31cff5a486f2b85ba5df38c62090d172', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 14:13:14', 'YA', '115.178.255.81'),
('f7346d828d68c5843ba9335055b47c89', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 14:13:20', 'YA', '115.178.255.81'),
('e4a0cb1847cf19ed552bfad4a370309d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SOAL].', '2020-07-27 14:13:36', 'YA', '115.178.255.81'),
('98843e78ea7d36b5cf5be84c31762657', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [SELESAI MENGERJAKAN].', '2020-07-27 14:13:37', 'YA', '115.178.255.81'),
('f4565e9e0d1368bfb4fecffdfcb8ed8a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 14:15:23', 'YA', '115.178.255.81'),
('a6e430880e29f10f2414bf071adf4db2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:15:27', 'YA', '115.178.255.81'),
('48aaf8cdbf1668616bf734ae82e82d2b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:22:00', 'YA', '115.178.255.81'),
('9036f40d36440dc81a0894c26599faad', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:22:50', 'YA', '115.178.255.81'),
('7eeaca9324781ca51a449c6254364037', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-27 14:24:17', 'YA', '115.178.255.81'),
('b384196a211e661677c198e58aa744fd', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 14:24:21', 'YA', '115.178.255.81'),
('2fa0e669113142dcbbfbc17a79265aae', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:24:32', 'YA', '115.178.255.81'),
('70c6c567e9aae5c4e07395663d758982', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:25:28', 'YA', '115.178.255.81'),
('5a19273d77cbba84385bbbbe2bb57b71', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:25:58', 'YA', '115.178.255.81'),
('8f5df4f318f203be07527a1d1c120af0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:26:50', 'YA', '115.178.255.81'),
('55eb7705ea4f89525bd4f6ff9144799d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:28:20', 'YA', '115.178.255.81'),
('e50b22c2da0d4ad07b33f34becade604', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:29:18', 'YA', '115.178.255.81'),
('5e70e49f4cfb89b52ca8c9a1b6073498', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:29:39', 'YA', '115.178.255.81'),
('c353697bc2774fef57bcb9fa2ba1b1b9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:29:56', 'YA', '115.178.255.81'),
('237f0b9bd64737bf5820a8db90489af2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 14:31:58', 'YA', '115.178.255.81'),
('e8c33e07d1187cb4c3bedfdeb3b5d3b0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-27 22:58:04', 'YA', '114.79.17.6'),
('49ba57402c913312de403e810c0131c4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-27 22:58:18', 'YA', '114.79.17.6'),
('0a38535d52a72ce753bfc11f9c0db54d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 22:58:38', 'YA', '114.79.17.6'),
('952732988ea2e4347dc15fcbc2254a00', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 22:58:41', 'YA', '114.79.17.6'),
('058b8b7f1bc7b9ec87d5f44b127a70aa', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 22:58:48', 'YA', '114.79.17.6'),
('6116049c81cf3abe4737ac0e64c9ae53', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:03:43', 'YA', '114.79.17.6'),
('da4d455beac9e85ff3a24792e7eb2765', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:03:44', 'YA', '114.79.17.6'),
('f18d041fa7828aee152a0938b7c61692', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:04:38', 'YA', '114.79.17.6'),
('a046656617482c5352a23e5a1e4040c1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:06:53', 'YA', '114.79.17.6'),
('27bf45a45332fd5824e961d94c969d6a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:07:39', 'YA', '114.79.17.6'),
('bd8894a93b69058a0070e10e5a152318', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:09:33', 'YA', '114.79.17.6'),
('449a1d01dc2391a32ba1fc00bd93c918', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:09:36', 'YA', '114.79.17.6'),
('203293ab582b93b6a67cddba952f6a5d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:09:37', 'YA', '114.79.17.6'),
('de3c155ae353062e3bdf20e7636ff813', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:09:38', 'YA', '114.79.17.6'),
('e513ab54915afbdf0c139747af134393', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:09:39', 'YA', '114.79.17.6'),
('0ffa12a837358f013ba8506beaa58840', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:09:53', 'YA', '114.79.17.6'),
('7dc5a0a2a66f25e7b1af1e4d792280cd', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:09:57', 'YA', '114.79.17.6'),
('bf4dc3e5f243aa1f9c46517e8bf73443', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:11:10', 'YA', '114.79.17.6'),
('80ec28bda8d4cc0cf2a3bf22d29dd366', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:11:13', 'YA', '114.79.17.6'),
('459b74f125cb55b1cee90d2f5c2ee2fa', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:11:20', 'YA', '114.79.17.6'),
('3b1e8a8a7fe69f2881b95fc9ff4591e8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:12:43', 'YA', '114.79.17.6'),
('7a682e5bad676a146751930adc337612', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:13:09', 'YA', '114.79.17.6'),
('b374aaaf4fe57fd852b3fa24712d6290', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:13:11', 'YA', '114.79.17.6'),
('3b2acad810106bafc3a0e817388f0bdb', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:13:17', 'YA', '114.79.17.6'),
('1fd09fda21c26f4c5fdc24d476288fa6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:13:18', 'YA', '114.79.17.6'),
('c5826cb4f21a182971a6590a491298fa', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:13:19', 'YA', '114.79.17.6'),
('ac558604afaf193c5113eed77655be38', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:13:38', 'YA', '114.79.17.6'),
('b2cb535e454cb955ec38592811faef65', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:13:39', 'YA', '114.79.17.6'),
('3b16eba237f7d4023a85ba11bda1a26f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:14:51', 'YA', '114.79.17.6'),
('bdbb9926293174898a478fdcd705b6ac', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:14:53', 'YA', '114.79.17.6'),
('85dba2f6a9190812f0b1e0147fac7c38', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:15:07', 'YA', '114.79.17.6'),
('9ed87270fd1223dec15ee5ecfcef7b56', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:15:58', 'YA', '114.79.17.6'),
('a48159ad2009aa19693be8c152f06267', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:16:34', 'YA', '114.79.17.6'),
('fbc9a8483690b2891fa17f8126910161', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:16:37', 'YA', '114.79.17.6'),
('9adb99e29b04ce06aacb58288e8bffcd', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:17:04', 'YA', '114.79.17.6'),
('51914461353c35e6e658678255d19d3a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:17:06', 'YA', '114.79.17.6'),
('e63378c614799c6206a0877d7eb55bf1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:17:38', 'YA', '114.79.17.6'),
('0dd8a0e84b1846603fbbf104cf0b21dc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:18:01', 'YA', '114.79.17.6'),
('6fdc1ef12f2e7cc74db3b98f9457264f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:18:06', 'YA', '114.79.17.6'),
('b78e35cae6c38823a544227ecbb5977f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:26:08', 'YA', '114.79.17.6'),
('614a12e4ef946e560a8f4266bb6b7a03', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:26:20', 'YA', '114.79.17.6'),
('93e52ec031282a6a52c87244215bf4e9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:27:58', 'YA', '114.79.17.6'),
('c17c5c1290a33268cee11d08623bb17e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:28:00', 'YA', '114.79.17.6'),
('6ebe66a18883054422c34543dda95304', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:28:26', 'YA', '114.79.17.6'),
('cbd943d9dc325c1fc1b4068d78d873b4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:28:27', 'YA', '114.79.17.6'),
('f836c22f2f8024042e0a91ea4b96099a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:29:17', 'YA', '114.79.17.6'),
('fd7de1b76a506252417ce8ee586b6e11', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:31:41', 'YA', '114.79.17.6'),
('a359b932ce64fe4978ceb286f0de18ad', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:31:42', 'YA', '114.79.17.6'),
('3b48e370f4d20b9571ddbe2e8325036f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:32:29', 'YA', '114.79.17.6'),
('abd2d70d1981028f7f05b76c78a1e3e9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:32:30', 'YA', '114.79.17.6'),
('a3ee4db194ffdc39408c51af2f3331ae', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:33:07', 'YA', '114.79.17.6'),
('efa16ca9a03f865bf6e5bc4efddd33fa', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:33:08', 'YA', '114.79.17.6'),
('e2f77d5b0531c2782f8fd37c6cdf7b6b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:33:10', 'YA', '114.79.17.6'),
('6e1c849d72b66f699dcdb6c3787fe79f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:34:15', 'YA', '114.79.17.6'),
('ca03aceab33e2fdfdbb2c6cbf6cb666b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:34:16', 'YA', '114.79.17.6'),
('26d17458e8c698961859d09e504ffb12', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:35:04', 'YA', '114.79.17.6'),
('75c2a426b36a1c6221c2395ee2a9e8f6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:35:39', 'YA', '114.79.17.6'),
('f0348b30fadb8532dd7c4cb0567a8d4b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:36:20', 'YA', '114.79.17.6'),
('3edaea2a0a3f2bbf62c9815607f5795f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:36:22', 'YA', '114.79.17.6'),
('dce6c0f9c1b452c461ce710e1dde51f6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:36:28', 'YA', '114.79.17.6'),
('b5e76b38d22aa61702dc357b7c2a3a6b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:36:29', 'YA', '114.79.17.6'),
('391d8de93ef767218deedb8ad2f3855c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:36:53', 'YA', '114.79.17.6'),
('205ef02f33bf466c0081b286cfda1f71', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:36:54', 'YA', '114.79.17.6'),
('621a266c6054e1bdd0434f033feafc0e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:36:55', 'YA', '114.79.17.6'),
('38222e928c3bb9ca61bf9f1de07c89db', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:37:27', 'YA', '114.79.17.6'),
('b2f870df9eb7272640b83ed0abe32be1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:37:28', 'YA', '114.79.17.6'),
('c2518424c3de88f3ad0da9adb5601b5b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:38:26', 'YA', '114.79.17.6'),
('77380dbf539026953c44ab4a4e3a9ad7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:38:27', 'YA', '114.79.17.6'),
('cdc68477b2b7cda16b236a767c5f0bb6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:42:08', 'YA', '114.79.17.6'),
('8299596a8931b8f51cb45c442785987b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:42:10', 'YA', '114.79.17.6'),
('a9657e946885b13183c174f7b1b16ac9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:42:12', 'YA', '114.79.17.6'),
('e2b7186dbda457dbd7268bf594e3e521', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:42:13', 'YA', '114.79.17.6'),
('ba9b573ff25e19da6a21edeac8004404', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:44:23', 'YA', '114.79.17.6'),
('7eb7eee8c05d596af8446bf51181912e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:44:36', 'YA', '114.79.17.6'),
('c0758e7dd39ff7fc67c49f1834cc2bcf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:46:43', 'YA', '114.79.17.6'),
('317aad3dc447574d43d70ffa53aff1f2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:46:45', 'YA', '114.79.17.6'),
('b73bd1430944c19278ac16ae3a4192c1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:46:46', 'YA', '114.79.17.6'),
('874064fc54d367757da5e00dc41e67da', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:47:29', 'YA', '114.79.17.6'),
('872cfba335dbd89609ba386a62f3359c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:53:33', 'YA', '114.79.17.6'),
('f4842696a54e43fca16ca390b0aecc2f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:53:34', 'YA', '114.79.17.6'),
('0a304a8a5e0b6d3ff7512e1066f5d8e0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:55:00', 'YA', '114.79.17.6'),
('17980a197aef4d9ccdb6cd53df1320a1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:55:01', 'YA', '114.79.17.6'),
('fd2a04d99bea6954fb4eebc43afa5224', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:57:19', 'YA', '114.79.17.6'),
('2a0317a7487429d07bb64e613152afd5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-27 23:57:21', 'YA', '114.79.17.6'),
('ce984b7a4c75f3dddc69466624acb370', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:02:22', 'YA', '114.79.17.6'),
('4e54131b79ac1cb5f1162116555231a5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:02:23', 'YA', '114.79.17.6'),
('69e9fca95cc0244c8b36462db98ea50a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:03:08', 'YA', '114.79.17.6'),
('eb53157a754b5d0742378b3270a3b4df', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:11:31', 'YA', '114.79.17.6'),
('ead6086586c71ef85d6ead76849c38a7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:11:32', 'YA', '114.79.17.6'),
('00ffb85ad8cfec92154b1813eeddf467', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:11:35', 'YA', '114.79.17.6'),
('87801668235b3a828750c141b382e2ab', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:11:36', 'YA', '114.79.17.6'),
('6c952fc53c8d854d6f0af3bf65890ac3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:14:52', 'YA', '114.79.17.6'),
('bc2a6b6212e791d8c275770929c3d2ee', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:14:55', 'YA', '114.79.17.6'),
('26e6dbcfe9bc80d125afd7db6d297708', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:14:56', 'YA', '114.79.17.6'),
('eddf8d06aaf9d59317480e15e85fcf97', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:15:20', 'YA', '114.79.17.6'),
('000daf4f5c5bfd32e4b46e8bea3797d8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:16:51', 'YA', '114.79.17.6'),
('e71873cbe1107cf17e8ec1e81a166f61', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:18:38', 'YA', '114.79.17.6'),
('dea25d5b2066dafb4eb85455ba4e2689', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 00:18:44', 'YA', '114.79.17.6'),
('7db7e9184715de08fcaad494d604b0e5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:18:56', 'YA', '114.79.17.6'),
('a84f559494791a8fb3975def9fb941ef', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:18:59', 'YA', '114.79.17.6'),
('cf87ae6ed89bcd369a72a4ccaffc7ee5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:20:20', 'YA', '114.79.17.6'),
('68593f7782bb492b4c1622b6d89730fe', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:20:21', 'YA', '114.79.17.6'),
('318a4353bcf99ee07921b2ef6e278299', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 00:20:28', 'YA', '114.79.17.6'),
('5d63a3400fe8474b1ebe45625ee583ba', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:20:31', 'YA', '114.79.17.6'),
('120347eb1b30e70dc81dd6c8e66e2272', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:22:06', 'YA', '114.79.17.6'),
('c3760602e2788a1c916a0d49071c962e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:22:10', 'YA', '114.79.17.6'),
('7cc296b8eb256c6adc49cc1af3b72fca', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:22:13', 'YA', '114.79.17.6'),
('96e92d25f2e84f30dddb35652c59196e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:22:15', 'YA', '114.79.17.6'),
('5abba9d1fff46219aaf971246d4b8533', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 00:22:23', 'YA', '114.79.17.6'),
('2fffdbc0fa62587cd3702ea012078217', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:22:28', 'YA', '114.79.17.6'),
('38e0aef3bf9b04d7efe548d6e0785cfe', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:22:31', 'YA', '114.79.17.6'),
('456873c177ed148f158066c4f09b2492', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:23:31', 'YA', '114.79.17.6'),
('c856214bd5c663a7d0b786eaa2d49913', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:23:32', 'YA', '114.79.17.6'),
('f50acb77afb29a2c0de77654c83b5753', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:23:34', 'YA', '114.79.17.6'),
('670b455523396c6c0938752ee86ba1ff', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 00:23:42', 'YA', '114.79.17.6'),
('856c801810014d763904b06362fb474b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:23:45', 'YA', '114.79.17.6'),
('bbb0f604254c3494534f0fd4474736f2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:23:47', 'YA', '114.79.17.6'),
('077ccc5f0c9bc713e9240ea43f8eea9d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:24:17', 'YA', '114.79.17.6'),
('fb6060cde65b821a4b9148b4af5befb5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:25:13', 'YA', '114.79.17.6'),
('96441d4ac805cd5d2ee2dc642a816b58', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:25:29', 'YA', '114.79.17.6'),
('d07cf8743daf619e807a988f49d51c5b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:25:44', 'YA', '114.79.17.6'),
('c847f74c29621157832c2b38e8ede6c0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:25:58', 'YA', '114.79.17.6'),
('75291976cfd303a16eb44cfede307c40', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:25:59', 'YA', '114.79.17.6'),
('26bdb68e688389cf1548027e00afe38a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 00:26:09', 'YA', '114.79.17.6'),
('c09d9467abdbcc283f48e90d63630ae4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:26:39', 'YA', '114.79.17.6'),
('81fc49d7de985ffdd20f1a9b89747281', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:26:40', 'YA', '114.79.17.6'),
('32416d6e89a50be5c3bf89ec867d3d8b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:26:42', 'YA', '114.79.17.6');
INSERT INTO `user_blog_status` (`kd`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `status`, `postdate`, `onlineya`, `ipnya`) VALUES
('46be625287ace7c855e4da5aa92b2b29', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:26:47', 'YA', '114.79.17.6'),
('4983920b7c30fff602110db57714b6c6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:26:55', 'YA', '114.79.17.6'),
('8868cf1a1836d013561d14e82626e703', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:28:38', 'YA', '114.79.17.6'),
('5b27b1b103d8067f9a0967dfaf3a862a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 00:28:40', 'YA', '114.79.17.6'),
('68b6c5c20e43ce0148c4d42963ffb733', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 03:00:38', 'YA', '114.79.17.130'),
('dc505046f3c2af11dec3be211434aeba', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-28 03:00:40', 'YA', '114.79.17.130'),
('2c751f8db4b30519e3489cfd86f6b8af', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:00:43', 'YA', '114.79.17.130'),
('996e5544d0acbc450312586b99bbd8ac', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:00:46', 'YA', '114.79.17.130'),
('96f4726b1dc141bb3c9bec54030b9f4d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:01:00', 'YA', '114.79.17.130'),
('f496a8116de42565048cf9cd98941622', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:01:18', 'YA', '114.79.17.130'),
('54ccf783fc4d71f43c9fd00511beb585', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:02:00', 'YA', '114.79.17.130'),
('39f1de0d905d3366239011c11eff84c9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:02:55', 'YA', '114.79.17.130'),
('69845652562c58212355e0f5e274097c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:04:40', 'YA', '114.79.17.130'),
('3dfab69ef7fe4696a0e3fae18c04403e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:04:51', 'YA', '114.79.17.130'),
('13c281850f630b85f439277613946007', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 03:04:59', 'YA', '114.79.17.130'),
('bee02529412aece20c923120223abacd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-28 03:05:00', 'YA', '114.79.17.130'),
('407ae11bc0c8b776549720f4dd863918', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 03:05:13', 'YA', '114.79.17.130'),
('82d1218d2fe313a6707a56a35da4f10a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-28 03:05:14', 'YA', '114.79.17.130'),
('a5cf5d828d8318fd2e8fde6c417ebe87', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 03:07:41', 'YA', '114.79.17.130'),
('5d03d93bfd03939322fd086302cf4114', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 03:07:52', 'YA', '114.79.17.130'),
('a6f3611f89be993647db1842c2d1b0ce', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 03:08:07', 'YA', '114.79.17.130'),
('7f2a8830dcb407ab890ebf58a6a7ac9f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 03:21:15', 'YA', '114.79.17.130'),
('22657e2342d155deee53e7a3856b4455', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-28 03:21:19', 'YA', '114.79.17.130'),
('67da03879accefe6974f568f2441b939', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:21:32', 'YA', '114.79.17.130'),
('e5f7723d551a32305b27d4c5069cc36f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:21:36', 'YA', '114.79.17.130'),
('9e107ec0caa730d114c13b45767cc3ec', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:22:28', 'YA', '114.79.17.130'),
('c0bb119362c9313546970bde48e9844c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:22:38', 'YA', '114.79.17.130'),
('f9bb5dd7b0f519c23158570f5e4d61e5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:22:44', 'YA', '114.79.17.130'),
('e0604eb447ddd831e55ce89a2e578af4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:22:53', 'YA', '114.79.17.130'),
('4f5379c0f16c145d240a9830652578a7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:22:58', 'YA', '114.79.17.130'),
('4ac7a5c4374a3f1e9c5bc0b3aadaadbf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:29:40', 'YA', '114.79.17.130'),
('da4e78a133a744b5db146634fccc9487', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:30:03', 'YA', '114.79.17.130'),
('27383b16115aefa311c5690343ed674b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:30:13', 'YA', '114.79.17.130'),
('68c0246d5592c3e473f6dc85f07a4e77', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:30:15', 'YA', '114.79.17.130'),
('8e041f0ea93fedbd977ad1763ffd17bf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:31:37', 'YA', '114.79.17.130'),
('83b31f9155d38273feed24d92ac51f58', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:31:47', 'YA', '114.79.17.130'),
('d4d524fe1902ccc3c0a9da6fecf0488c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:34:32', 'YA', '114.79.17.130'),
('6d75e66ce397ccd19340498733011f11', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LINK].', '2020-07-28 03:34:38', 'YA', '114.79.17.130'),
('be8aa1534e66ab4ff3b7d6d1617b8181', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [VIDEO YOUTUBE].', '2020-07-28 03:34:43', 'YA', '114.79.17.130'),
('91eb4abc15f72db2be6ddcaa663cc1ef', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 03:34:52', 'YA', '114.79.17.130'),
('d6afd6ca0f8bee6bb378d02fdbb81d6f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 03:34:56', 'YA', '114.79.17.130'),
('fdd7072214355b5012386c9dc3c8bc35', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 03:34:58', 'YA', '114.79.17.130'),
('58dcc9821d983805014640b56d1d4381', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:35:41', 'YA', '114.79.17.130'),
('47deadca47c0ec7dafc70c05a5c613ea', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:35:44', 'YA', '114.79.17.130'),
('949de018dad1fa6d819511238e94a8db', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:37:04', 'YA', '114.79.17.130'),
('a9cc2e2cf690563e1840929593f6f44a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:37:37', 'YA', '114.79.17.130'),
('ca81c9bb5de6fb3ab75342782d721910', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:37:39', 'YA', '114.79.17.130'),
('26844813f2e1a6ca779b1db177ef1f1d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:38:17', 'YA', '114.79.17.130'),
('beeb8f9fbc2d1d5e5eead0baf2e3a88e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:38:23', 'YA', '114.79.17.130'),
('06b32dab7b844df70797ed259c13e368', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:40:42', 'YA', '114.79.17.130'),
('51d7c4448aacdb7bc8fd754bfdae8e93', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:40:49', 'YA', '114.79.17.130'),
('c45573f03c646c8a62f0304ea5ba1f35', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:42:33', 'YA', '114.79.17.130'),
('458c8da2ea855d81a1d12adc8e0a4e8b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:43:40', 'YA', '114.79.17.130'),
('2b784d0ca5d6762ed4252b95a2bef23f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:45:51', 'YA', '114.79.17.130'),
('941f61098b53a8f9035ffd3e0af91290', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:45:57', 'YA', '114.79.17.130'),
('792eb261c84cc7ccd226f30c0d345df2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:49:07', 'YA', '114.79.17.130'),
('5a776fd0a2b134b2b38e271f8047c2f6', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:53:51', 'YA', '114.79.17.130'),
('553b89fe5c9ca6b8f56848dc1a5ff71f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:54:59', 'YA', '114.79.17.130'),
('12fca14dfedd89e2cfd41d152ca7abe7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:55:11', 'YA', '114.79.17.130'),
('5a98442c1d7972cca4830049307a530d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:55:15', 'YA', '114.79.17.130'),
('b7e42b18e65c33606d273779a5edbb25', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:55:21', 'YA', '114.79.17.130'),
('a4b098299a49ff6b6f747ee9ae665e83', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 03:55:34', 'YA', '114.79.17.130'),
('746aa4928f00297a8dea9f9cd18b24d3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-28 03:55:36', 'YA', '114.79.17.130'),
('da409717a7a336bee2e6760b1522aeb5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 03:57:49', 'YA', '114.79.17.130'),
('3e95941cd188e9b0d8d6ad523958e2f0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-28 03:57:51', 'YA', '114.79.17.130'),
('83717797ce535b7cc28e18c5627803fe', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:57:56', 'YA', '114.79.17.130'),
('7dbaa0eeae8dba3968327b7c1b406726', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:58:02', 'YA', '114.79.17.130'),
('4b0c8d144c676c5c13e1367848324143', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:58:22', 'YA', '114.79.17.130'),
('5a4bb9d741bd2e90c20fac3ec75ff7ea', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:58:29', 'YA', '114.79.17.130'),
('b062b8ab8640f6fb602ba045d619365a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:58:32', 'YA', '114.79.17.130'),
('213b193977a1bfde2b0f0e373241463d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:58:46', 'YA', '114.79.17.130'),
('b98bdb8ce9658ddfa2854ab0574eb1af', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:58:51', 'YA', '114.79.17.130'),
('6ce40c7721c40f1679fd9c5dd7abe074', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 03:59:55', 'YA', '114.79.17.130'),
('326c0689770a3cc78840ca58f7d5b0fa', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:02:06', 'YA', '114.79.17.130'),
('cef19f06c9631d2e6222ce01b5d3f1d2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:02:09', 'YA', '114.79.17.130'),
('24dee60448d3c28dac0087b7ad584ed9', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:02:28', 'YA', '114.79.17.130'),
('15efa4ee28d1910377baf2fbcb537762', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:04:02', 'YA', '114.79.17.130'),
('469fa62e087baef3e71cffd0a7557d9c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:04:05', 'YA', '114.79.17.130'),
('ada9d49c5d07cb0a541662c59eb06eb3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:05:12', 'YA', '114.79.17.130'),
('b37ab6a322c2c2db604e6d943e26d7a8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:05:46', 'YA', '114.79.17.130'),
('873f05166cff81c9035275ff7dba49cf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:07:13', 'YA', '114.79.17.130'),
('f200062cfd514da83bd2bcbd01c85c3f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:07:21', 'YA', '114.79.17.130'),
('543241bae86d39ee265bd3c0157a18ad', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:07:27', 'YA', '114.79.17.130'),
('5504ac332fc5f26b950a4784dd5b7aab', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:07:31', 'YA', '114.79.17.130'),
('54ee1d3f320840003258f6f5bdc71f9f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:07:37', 'YA', '114.79.17.130'),
('6d546fecbd0de120a3de2ee12e8f74a4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:07:58', 'YA', '114.79.17.130'),
('5df1179782bebb3fb4710ce8f851f3e3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:08:04', 'YA', '114.79.17.130'),
('d311dce2a524565a2e6f4f03735d2aa8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:08:44', 'YA', '114.79.17.130'),
('366729d95ae4dde30ff23fef33688cf5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:09:27', 'YA', '114.79.17.130'),
('f279d32580e8b77e69acd1d179f6f474', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:09:34', 'YA', '114.79.17.130'),
('45b12519fcfa790c8c22ac15c3a56167', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 12:09:50', 'YA', '114.79.17.130'),
('609350822b1c44ebb834b572ca63fd98', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-28 12:09:51', 'YA', '114.79.17.130'),
('ad7bcda7a45ee888785ca239fabed7e3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 12:31:45', 'YA', '114.79.17.130'),
('6db808513a303da74b4a248f2aeb590a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-28 12:31:47', 'YA', '114.79.17.130'),
('9a93ea7c9747d0c1534f68f1fe4b4d1d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:31:52', 'YA', '114.79.17.130'),
('8e01ca7589c3a78ceb795db37b42251a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:31:56', 'YA', '114.79.17.130'),
('143b24c4c72eebbb6b6ba50e1362457d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:32:00', 'YA', '114.79.17.130'),
('cd7cdb40fa5100e8f7972e1d95b59cac', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:36:27', 'YA', '114.79.17.130'),
('cb8bdea8370096956df4a31248471cd3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:36:30', 'YA', '114.79.17.130'),
('c471f72bb25427a5d147e717cdcf87c7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:36:32', 'YA', '114.79.17.130'),
('b26f31ecae96b1aed2a2ef448a38ccc1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:37:15', 'YA', '114.79.17.130'),
('c83bdefe81135d768af1c3c53fabbec1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:37:17', 'YA', '114.79.17.130'),
('02ffabb2642f3e83e88be7faa12a7aa4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:37:20', 'YA', '114.79.17.130'),
('a32a89f5a62d0390f8a70d75991c12d5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:37:45', 'YA', '114.79.17.130'),
('c40283a94614701a747b103ea9a8dada', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:38:15', 'YA', '114.79.17.130'),
('6f300890055ab1a8e2684de9dda6b0a8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:38:18', 'YA', '114.79.17.130'),
('8a9098a8d1e080802eb88f74a8bc4baf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:38:20', 'YA', '114.79.17.130'),
('5054575f6c15f308cc8a4d15757f5267', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:38:46', 'YA', '114.79.17.130'),
('88f1f663849b763419af8e1e92c62262', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:38:49', 'YA', '114.79.17.130'),
('c5bce68d0716c726f812d5532e361fc4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:39:26', 'YA', '114.79.17.130'),
('cdde010e1949ade5f371ca04bc6c1397', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:39:38', 'YA', '114.79.17.130'),
('f75db07e6941f1e61c708807d42b4ac1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:39:43', 'YA', '114.79.17.130'),
('843f35867d217331d1d7e57a2e69aed3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:39:49', 'YA', '114.79.17.130'),
('53da2e1ff4232ad5ca7a0025fcff35f7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:40:48', 'YA', '114.79.17.130'),
('ef7c8dfc216cc769a3f212e28572688a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:42:13', 'YA', '114.79.17.130'),
('0e54022962249dd3b119a1391b43aa2a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:43:34', 'YA', '114.79.17.130'),
('e42918d32c7d1284051698bcb4e46998', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:43:35', 'YA', '114.79.17.130'),
('3374bd257402174487be70fba33f4bdc', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:46:35', 'YA', '114.79.17.130'),
('8104da41f6c1a679eb22ab13606f8836', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:48:01', 'YA', '114.79.17.130'),
('815c35b74e342399b46eb91c033ac838', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:49:02', 'YA', '114.79.17.130'),
('b8b7d9eb0a49f6df588385807063b65a', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:49:51', 'YA', '114.79.17.130'),
('a679a50bd2e72e10393c141aa84e0569', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:50:12', 'YA', '114.79.17.130'),
('9d5f1ebec9868b2888be3779dcb7f75d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:50:16', 'YA', '114.79.17.130'),
('53a7864277101132c79d673a2d2093c3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:50:57', 'YA', '114.79.17.130'),
('45e82dc48b59edbadbee2cb086157aa7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:51:01', 'YA', '114.79.17.130'),
('e743d551e26030cafd21e35d01e38790', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:51:03', 'YA', '114.79.17.130'),
('5f9d0dfcb9c2863b428393a511560eda', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:51:07', 'YA', '114.79.17.130'),
('f14d9af93e8d1b4989712843ca6bf337', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:51:14', 'YA', '114.79.17.130'),
('307468a8e3706407341593db38c62a97', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:51:16', 'YA', '114.79.17.130'),
('81e3d88d149773b62bb3013ab4a4dd1b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:52:06', 'YA', '114.79.17.130'),
('59d1d6b876396c7c97b4643d9c3f18ef', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:52:15', 'YA', '114.79.17.130'),
('07755f0906d58e2726cf661d717654f1', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 12:53:35', 'YA', '114.79.17.130'),
('896e303b4f2e702ff6055999e2b1c54b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 17:22:14', 'YA', '114.79.23.94'),
('62923511ebed68857eafd3719204cd4f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-28 17:22:24', 'YA', '114.79.23.94'),
('f0571edd31d7113d6b54a96dd5ed2f6b', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:22:39', 'YA', '114.79.23.94'),
('f73897ee17db806291bfc01e20cd1ecd', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:22:44', 'YA', '114.79.23.94'),
('8d301a10f68f3f1a93604298c117747f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:22:46', 'YA', '114.79.23.94'),
('38163fecbd68ff1a5e7421909ff0b99c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:22:50', 'YA', '114.79.23.94'),
('0897b97f52dad7ef3db7f56ab5fc00b7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:22:52', 'YA', '114.79.23.94'),
('1a6db744edf1f9246de5e12988796b2f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:22:55', 'YA', '114.79.23.94'),
('60610101afef1978f3a7a0fc9e447b01', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:22:56', 'YA', '114.79.23.94'),
('99549680e6e27e711c97a68d282f1ea5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:23:00', 'YA', '114.79.23.94'),
('4abd005f6eaaee2d1f86a94c19731f87', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:23:24', 'YA', '114.79.23.94'),
('fcc35167912406e2b2a07cdc36ba1f9c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:23:43', 'YA', '114.79.23.94'),
('d846b32ba3d5d0f4dd192d5846642a87', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:30:24', 'YA', '114.142.168.59'),
('56d2a275aa18b50b4781b8a7a2a44d60', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:31:43', 'YA', '114.142.168.59'),
('7bd3d778d61124c12a4a95aa0eccc769', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:31:46', 'YA', '114.142.168.59'),
('b1a4c99fec502be1121d028cd1bc3185', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:31:47', 'YA', '114.142.168.59'),
('0d86834b69c2c0adb2bc4300603de58c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:31:50', 'YA', '114.142.168.59'),
('3cb56e3d4ace7609ccbcfa0144f731b8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:32:12', 'YA', '114.142.168.59'),
('00135847c478fd8268f5d9e767089b09', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:32:13', 'YA', '114.142.168.59'),
('8da23a949fc4ab345284ffb25c4e654d', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:33:29', 'YA', '114.142.168.59'),
('e74c05e3c6e76da88d5477eb9592ccea', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:34:05', 'YA', '114.142.168.59'),
('03d82a588803da9bd2b915dd86b1f22c', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:34:17', 'YA', '114.142.168.59'),
('77d56f2b7ab55cc44d0f02729bbe29be', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:34:35', 'YA', '114.142.168.59'),
('9b73887e9f20e1f57a96500b370dd547', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:34:36', 'YA', '114.142.168.59'),
('740ba07908246cf9cc1b00e883ccbbcf', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 17:34:38', 'YA', '114.142.168.59'),
('049fc6ce3da958ba7b9564d64bdda586', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-28 17:36:04', 'YA', '114.142.168.59'),
('2df14cd04a472c91d316d07aac027f6b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-28 17:36:06', 'YA', '114.142.168.59'),
('92c230c0f9d8c0c78430c32a77283a1a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-28 18:21:39', 'YA', '114.142.168.59'),
('9eb2ecfd44be07f57c2c9952ae6a179a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-28 18:23:49', 'YA', '114.142.168.59'),
('fe415e2f4954de81093391a73720c5b7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-28 18:23:53', 'YA', '114.142.168.59'),
('746966ef65cbdb4cb7b9222431934ea3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERITA].', '2020-07-28 18:23:54', 'YA', '114.142.168.59'),
('120dfb1c11f55bcb0e9585226f6c95eb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KATEGORI].', '2020-07-28 18:23:56', 'YA', '114.142.168.59'),
('49772cafd14269d7a41eb2357a8d5df3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [ARTIKEL].', '2020-07-28 18:23:57', 'YA', '114.142.168.59'),
('a8455abf04272c41df8a5f796da5f588', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-28 18:23:58', 'YA', '114.142.168.59'),
('382f97e851219356894056a7ccc9ff4e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LINK].', '2020-07-28 18:23:59', 'YA', '114.142.168.59'),
('5a32aed9bf7f1407f5ad3474e3441a74', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [VIDEO YOUTUBE].', '2020-07-28 18:24:00', 'YA', '114.142.168.59'),
('a2b65f2066099c8dcd0246fc52d2b009', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-28 18:24:05', 'YA', '114.142.168.59'),
('0391254279637df23a3b302ab24804b0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-28 18:24:08', 'YA', '114.142.168.59'),
('53e669541cca65237740a1a9ea917b83', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [KALENDER AGENDA].', '2020-07-28 18:24:10', 'YA', '114.142.168.59'),
('40707a98fffe0c19caae39d591654021', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [FORUM].', '2020-07-28 18:24:13', 'YA', '114.142.168.59'),
('d1f85bfb4b41dcab71b1df2f06c8cdcd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [POLLING].', '2020-07-28 18:24:16', 'YA', '114.142.168.59'),
('c1fbe217f59a2d237748427aaf09e270', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [CHATROOM].', '2020-07-28 18:24:20', 'YA', '114.142.168.59'),
('50a55cbb16fc3b69d7c13e165bfc20dc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [CHATROOM].', '2020-07-28 18:24:25', 'YA', '114.142.168.59'),
('ed6292c8fcabc458507ad385c17eb98a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BROADCAST PESAN].', '2020-07-28 18:24:28', 'YA', '114.142.168.59'),
('96014df3c984fb7b9682efa76836d36e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BROADCAST PESAN].', '2020-07-28 18:24:33', 'YA', '114.142.168.59'),
('f5a7cb8d28fc834118c7ac3ffd6e3865', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-28 18:24:35', 'YA', '114.142.168.59'),
('0452ebbebd20abd328e239015ae18138', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-28 18:24:41', 'YA', '114.142.168.59'),
('0fe984e7b939b16dd28fc8c59b0384b8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [TANYA JAWAB].', '2020-07-28 18:24:45', 'YA', '114.142.168.59'),
('d485786aec608b32a8e2751aaf443d28', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-28 18:24:50', 'YA', '114.142.168.59'),
('cdc1f198fe54559677db465dd9a5489f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-28 18:25:02', 'YA', '114.142.168.59'),
('44d3853a7152c191010a156c710b6bf2', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-28 18:25:46', 'YA', '114.142.168.59'),
('c460227e2ca2fd91995514f00822a5ff', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-28 18:25:49', 'YA', '114.142.168.59'),
('ab8542f14e964b05a54bc9b0dbefe417', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-28 18:25:51', 'YA', '114.142.168.59'),
('532c2cd293994bdeb1219930873f3fca', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 18:25:53', 'YA', '114.142.168.59'),
('5ff6b8dbd3d98a3b1e9ed897d83eb429', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LINK].', '2020-07-28 18:25:54', 'YA', '114.142.168.59'),
('8ee628a83a1e8b294de4975693a5391e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [VIDEO YOUTUBE].', '2020-07-28 18:25:56', 'YA', '114.142.168.59'),
('ee178f3cd71eefe3dbd1a4f1c1bd3654', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 18:26:02', 'YA', '114.142.168.59'),
('42df14b8f729007d548c47bb57b80bf4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 18:26:04', 'YA', '114.142.168.59'),
('63fbb62a6bb1805453ed7dbd668211da', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 18:26:06', 'YA', '114.142.168.59'),
('ce83f7d2d8db0e1ba5fd2807d7daeef5', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 18:27:42', 'YA', '114.142.168.59'),
('edd3a18cad2ac3ee757c855a4d1bb4f0', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-28 18:28:09', 'YA', '114.142.168.59'),
('5857c1bbd22c63d09a0dcb7c59a50784', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-28 18:28:15', 'YA', '114.142.168.59'),
('732b99660d7b2968630fd0f5ab28e3c7', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-28 18:28:18', 'YA', '114.142.168.59'),
('3326d7882525a961b1faadb1d09c410e', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [CHATROOM].', '2020-07-28 18:28:22', 'YA', '114.142.168.59'),
('1967039bc680bb9df47e4ed1bc96eec8', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-28 18:28:35', 'YA', '114.142.168.59'),
('3c8184555d4658ab5f3af6ee3bd9fe38', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LOG HISTORY].', '2020-07-28 18:28:40', 'YA', '114.142.168.59'),
('1d9a619e16fd6e14f8e1cfc5a019dd48', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'LOG HISTORY', '2020-07-28 18:29:21', 'YA', '114.142.168.59'),
('7938d53abed7951f1cc5f191feda9352', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Inbox Pesan', '2020-07-28 18:29:22', 'YA', '114.142.168.59'),
('396bdaa7b49647cc62a91b1222c91db3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Buat Pesan Baru', '2020-07-28 18:29:25', 'YA', '114.142.168.59'),
('d27ad1220e04e3eb238775578c5c3a6f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Buat Pesan Baru', '2020-07-28 18:29:31', 'YA', '114.142.168.59'),
('00d04222926572a87d5cc963b1cbc404', '92b88f920c5b58e9aff71a14247c98ce', 'SISWA', '280004', 'Paramitha Rusady', 'Selamat Datang....', '2020-07-29 07:20:24', 'YA', '115.178.225.92'),
('12f816721b31f7d768d0ad32e0cd8c1b', '92b88f920c5b58e9aff71a14247c98ce', 'SISWA', '280004', 'Paramitha Rusady', 'Ganti Profil', '2020-07-29 07:20:31', 'YA', '115.178.225.92'),
('ebc70097fda6fe1d2847dd694d48cb6a', '92b88f920c5b58e9aff71a14247c98ce', 'SISWA', '280004', 'Paramitha Rusady', 'Ganti Profil', '2020-07-29 07:20:44', 'YA', '115.178.225.92'),
('fddada9f4f7d3d0743d04486ef556318', '92b88f920c5b58e9aff71a14247c98ce', 'SISWA', '280004', 'Paramitha Rusady', 'Ganti Password', '2020-07-29 07:20:47', 'YA', '115.178.225.92'),
('a9407713026473795b6e065f65e2bdb6', '92b88f920c5b58e9aff71a14247c98ce', 'SISWA', '280004', 'Paramitha Rusady', 'Inbox Pesan', '2020-07-29 07:20:48', 'YA', '115.178.225.92'),
('c15c783f760fe9822ec0a49191c2d329', '92b88f920c5b58e9aff71a14247c98ce', 'SISWA', '280004', 'Paramitha Rusady', 'LOG HISTORY', '2020-07-29 07:20:50', 'YA', '115.178.225.92'),
('f84bcc4908d98c95b5fa3bc1d8844891', '614bc83b72e3eb7f4ab1a33714f18bf9', 'SISWA', '123456', '123456', 'Selamat Datang....', '2020-07-29 07:32:21', 'YA', '115.178.225.92'),
('95a2ef41d0cd3eb553aaf3459be8e33f', '614bc83b72e3eb7f4ab1a33714f18bf9', 'SISWA', '123456', '123456', 'Inbox Pesan', '2020-07-29 07:32:28', 'YA', '115.178.225.92'),
('7b4d62b6d6c5dac1c9d85af372961eb8', '614bc83b72e3eb7f4ab1a33714f18bf9', 'SISWA', '123456', '123456', 'LOG HISTORY', '2020-07-29 07:32:29', 'YA', '115.178.225.92'),
('9c2bbfa875e8390a6a92dd52312d9f76', '17d0aea3c8d7daf39e8f6d8dccc40a8c', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Selamat Datang....', '2020-07-29 07:41:29', 'YA', '115.178.225.92'),
('8a001d123bd3a6622ed9d307c142033a', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Selamat Datang....', '2020-07-29 07:43:49', 'YA', '115.178.225.92'),
('1781953dd5afb73685fbaa8dd1937e34', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:43:54', 'YA', '115.178.225.92'),
('7fa0f423edfc9385ec83d7a2e0c7b9fc', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:47:39', 'YA', '115.178.225.92'),
('e294ee3328a5b7647a61024a84685752', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:47:43', 'YA', '115.178.225.92'),
('799efcd2c524056299e03391a48c6c1d', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LINK].', '2020-07-29 07:48:00', 'YA', '115.178.225.92'),
('5375e72cf7f94546b4e2d3a526b68e29', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [VIDEO YOUTUBE].', '2020-07-29 07:48:02', 'YA', '115.178.225.92'),
('3fe60b50c73fe6f61d6108cb496dbbd6', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:48:08', 'YA', '115.178.225.92'),
('8d6067d0d7b823f8916db203d7867129', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [CHATROOM].', '2020-07-29 07:48:10', 'YA', '115.178.225.92'),
('66ecc6a05af191681cd95d590ed7308f', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-29 07:48:12', 'YA', '115.178.225.92'),
('09d912754c919e68d79ca01c6384a3ae', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-29 07:48:17', 'YA', '115.178.225.92'),
('3e0d4b4e6566dd4e6415ae80d594aa6f', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Selamat Datang....', '2020-07-29 07:48:23', 'YA', '115.178.225.92'),
('d01e08794a583dc8a2e4eba82dbd789c', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:48:32', 'YA', '115.178.225.92'),
('255af99aca211d795570c927fc6e55b9', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:48:50', 'YA', '115.178.225.92');
INSERT INTO `user_blog_status` (`kd`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `status`, `postdate`, `onlineya`, `ipnya`) VALUES
('8ed143303dafdad7623d3be64a56a9fb', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:48:58', 'YA', '115.178.225.92'),
('37cb5cc290e98e688e41b221a0e432db', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:49:02', 'YA', '115.178.225.92'),
('0d725f99def6d9c943df7708d7f67217', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [CHATROOM].', '2020-07-29 07:49:13', 'YA', '115.178.225.92'),
('51a4776809bba52cfd6f95651c26f3c8', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-29 07:49:25', 'YA', '115.178.225.92'),
('13395861c4599ba352fa48dfc8c15aa5', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-29 07:49:35', 'YA', '115.178.225.92'),
('5657dac432fad40845f835d8052d5974', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Ganti Profil', '2020-07-29 07:50:55', 'YA', '115.178.225.92'),
('061b152fb6784dc25527b1647a11ca6b', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Ganti Profil', '2020-07-29 07:51:20', 'YA', '115.178.225.92'),
('f989006c5357e13d9d5b6362dd51a09b', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Inbox Pesan', '2020-07-29 07:51:24', 'YA', '115.178.225.92'),
('f6c8fd9e6a75f90699c1628dd9173026', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'LOG HISTORY', '2020-07-29 07:51:26', 'YA', '115.178.225.92'),
('792ed2d151852645b9fc769c8dcaa25c', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Inbox Pesan', '2020-07-29 07:51:28', 'YA', '115.178.225.92'),
('de4dad4ca642d06784965bdd8f4d122a', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Buat Pesan Baru', '2020-07-29 07:51:30', 'YA', '115.178.225.92'),
('5ec3aa081589f43248c56ab4440e1952', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Buat Pesan Baru', '2020-07-29 07:51:36', 'YA', '115.178.225.92'),
('5143bc50593ac795bf9c57771d9f2f62', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Pesan Terkirim', '2020-07-29 07:51:47', 'YA', '115.178.225.92'),
('ee29f9388c4b22e0d8617bad80ca4359', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Pesan Terkirim', '2020-07-29 07:51:50', 'YA', '115.178.225.92'),
('dd1aa2e503838ede9efd62f43088c8a3', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'LOG HISTORY', '2020-07-29 07:51:54', 'YA', '115.178.225.92'),
('a0f18db3f97ad431254b162974c31942', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Selamat Datang....', '2020-07-29 07:51:56', 'YA', '115.178.225.92'),
('741f1bd01311dbe84caebcf51a87b780', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:51:59', 'YA', '115.178.225.92'),
('ee8bbed94315861457eeb694149a98f9', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:52:06', 'YA', '115.178.225.92'),
('e867db5b1ef9748a418dbf22521b6e81', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:52:08', 'YA', '115.178.225.92'),
('6a59b46ea2a639737adaa5fd10bd833c', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-29 07:52:09', 'YA', '115.178.225.92'),
('f499e71738e46a841c98d10957bae9aa', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:52:13', 'YA', '115.178.225.92'),
('071a1043a7068abc3629b868dd341495', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LINK].', '2020-07-29 07:52:16', 'YA', '115.178.225.92'),
('2ffe270b3a9cdfaf8f82f0b1352d0aa5', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [VIDEO YOUTUBE].', '2020-07-29 07:52:18', 'YA', '115.178.225.92'),
('d2c397861521d2df9d68c95726723de2', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-29 07:52:20', 'YA', '115.178.225.92'),
('ccfd89e2fe17f564f35fa991d23a0b7b', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:52:23', 'YA', '115.178.225.92'),
('b94c997ef385aceea111bb4091d31caf', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [CHATROOM].', '2020-07-29 07:52:25', 'YA', '115.178.225.92'),
('8510fd6aedcc5c25021b6cec26fcc3e1', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-29 07:52:28', 'YA', '115.178.225.92'),
('3853fbeb4d1896c9a3bf03b63c1c0e93', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:53:39', 'YA', '115.178.225.92'),
('517771c83eadd968728650bc5a53a4fd', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:53:48', 'YA', '115.178.225.92'),
('c02c1066d59db953cad8753da2a855ee', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:53:52', 'YA', '115.178.225.92'),
('925926e04ec753818738eddca4e78152', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:53:55', 'YA', '115.178.225.92'),
('eaac2b1c2fa4a88e23d30cebfa945a24', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:54:00', 'YA', '115.178.225.92'),
('1236f192c8019a0ea80a741f89a6f93e', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:54:06', 'YA', '115.178.225.92'),
('2c6f85ad8dc0e992d81ecf2bd6a851f7', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:54:09', 'YA', '115.178.225.92'),
('9d1731cdde7a5fba091a3985a2dbd5e4', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:54:15', 'YA', '115.178.225.92'),
('8b27634f3855d5b382b18eb205657719', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:54:21', 'YA', '115.178.225.92'),
('391bbf385c6aad72c02ce08c01e380b2', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Selamat Datang....', '2020-07-29 07:54:29', 'YA', '115.178.225.92'),
('5ccceeae5d69520133427aa5b1592faf', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:54:32', 'YA', '115.178.225.92'),
('6aab18b5e59a64430652a69f344a253b', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:54:38', 'YA', '115.178.225.92'),
('50a0b0f44dab397fd473318eb753ac35', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:54:42', 'YA', '115.178.225.92'),
('9999b932cf603bb9ce596c71393f7ef9', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:54:45', 'YA', '115.178.225.92'),
('70c599025ca0494387dede476347d7b7', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Selamat Datang....', '2020-07-29 07:55:11', 'YA', '115.178.225.92'),
('da0d690da41b95855f7588c43825fb58', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-29 07:55:16', 'YA', '115.178.225.92'),
('80ea577642ef8b22f84077a52a3ab90c', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-29 07:55:22', 'YA', '115.178.225.92'),
('8324a72c50bf64842daa2e93cc7d00ea', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-29 07:55:30', 'YA', '115.178.225.92'),
('f940b0bb12719e63bb2737c4bc17cfb8', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:55:33', 'YA', '115.178.225.92'),
('fd9d0e809d0beffa0df5838e4f813bf8', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:56:43', 'YA', '115.178.225.92'),
('16ede1167c5ebbb3a94a27334e6b3c82', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:56:47', 'YA', '115.178.225.92'),
('f23a9bae175307429c325df2e0aa8324', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:56:50', 'YA', '115.178.225.92'),
('85998bf2ccea07bef5666bbedb66e0fc', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:56:55', 'YA', '115.178.225.92'),
('da0da091021b9d7c8c77b2790ef7a10b', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:56:57', 'YA', '115.178.225.92'),
('cc19c61c35974db9073e4ef3606ac7bd', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:57:00', 'YA', '115.178.225.92'),
('0545a507eed0d616f10d2fee9d0f8add', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:57:04', 'YA', '115.178.225.92'),
('33fd6742dd6dd4360a66933c71edfa94', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:57:07', 'YA', '115.178.225.92'),
('618b7df95eaafa72557c292887c064c5', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:57:09', 'YA', '115.178.225.92'),
('9f5aad46662f214193b98ae883c927da', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Monica Belluci].', '2020-07-29 07:57:13', 'YA', '115.178.225.92'),
('1838fc1002ce7703c71fe6f662d5f1db', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:57:16', 'YA', '115.178.225.92'),
('424740a7ca633751f1a6dbf7244a9a25', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LINK].', '2020-07-29 07:57:19', 'YA', '115.178.225.92'),
('51bd1c670e7e2e7047a1b7cfab9c88ca', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [VIDEO YOUTUBE].', '2020-07-29 07:57:24', 'YA', '115.178.225.92'),
('50071117e51d059fc9f26078ab0c61b2', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-29 07:57:28', 'YA', '115.178.225.92'),
('91389bb00ef52dbbdc450760f46ed5a4', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-29 07:57:30', 'YA', '115.178.225.92'),
('4e56e07ef1e21fea8358ee5601c0ba6f', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [KALENDER AGENDA].', '2020-07-29 07:57:31', 'YA', '115.178.225.92'),
('5553d676e0c50f334ffe962d6dfbe422', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-29 07:57:37', 'YA', '115.178.225.92'),
('8127f4dad1432c36035414a16d323ac7', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-29 07:57:40', 'YA', '115.178.225.92'),
('f1db86c01b97be8260b653902d311c80', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FORUM].', '2020-07-29 07:57:45', 'YA', '115.178.225.92'),
('506b91260c1cd5c1546c6541a97e00b5', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [FILE MATERI].', '2020-07-29 07:57:51', 'YA', '115.178.225.92'),
('d803720ff5de88489d75ca71244b34e7', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [CHATROOM].', '2020-07-29 07:57:56', 'YA', '115.178.225.92'),
('57c23a74b0ae8fd78c01b570356f75ee', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [TANYA JAWAB].', '2020-07-29 07:57:58', 'YA', '115.178.225.92'),
('c3ff87c65181215c996a0feb8e14e216', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LOG HISTORY].', '2020-07-29 07:58:00', 'YA', '115.178.225.92'),
('1e7b2511ae272899a32704cd3ae6465c', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:58:02', 'YA', '115.178.225.92'),
('15226d18aaec79834d1bdb0fa8f58951', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:58:07', 'YA', '115.178.225.92'),
('79749fde8e137b14be2f508c8eddeb27', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 07:59:02', 'YA', '115.178.225.92'),
('4f1bb872c7f4969be2eda18ddbc9790c', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'LOG HISTORY', '2020-07-29 07:59:07', 'YA', '115.178.225.92'),
('5435a37f99c949d57ee127cfa5933caa', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Inbox Pesan', '2020-07-29 07:59:21', 'YA', '115.178.225.92'),
('99cbc37055d2dee73fe43311165517cb', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'LOG HISTORY', '2020-07-29 07:59:23', 'YA', '115.178.225.92'),
('c1492701d8e1f50bd8c4a2a31f449584', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'LOG HISTORY', '2020-07-29 08:00:16', 'YA', '115.178.225.92'),
('8cc5e46122d0b900f19e95a485c7846d', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'LOG HISTORY', '2020-07-29 08:00:17', 'YA', '115.178.225.92'),
('04511ca8dca8a8b69a71f95bfed2e921', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'LOG HISTORY', '2020-07-29 08:00:19', 'YA', '115.178.225.92'),
('4728d7c4c45cff411e3cd9e628f7a06b', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', 'Selamat Datang....', '2020-07-29 08:00:47', 'YA', '115.178.225.92'),
('1d1a2fc98f21422a01ce880e6435e2fc', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [BERANDA].', '2020-07-29 08:00:49', 'YA', '115.178.225.92'),
('8be1f893f02daa4756ac9f876744d320', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LOG HISTORY].', '2020-07-29 08:00:53', 'YA', '115.178.225.92'),
('fc11181d8e3d2cf9dd6cb36945406de3', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LOG HISTORY].', '2020-07-29 08:01:00', 'YA', '115.178.225.92'),
('4fd69c180abecbb33620357d9c4209e2', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LOG HISTORY].', '2020-07-29 08:01:05', 'YA', '115.178.225.92'),
('cd55062d626c307ed39aa76bcdb62507', '193718556c9ea38a77468dedf9a57d7e', 'SISWA', '7404', 'MUHAMMAD ADI PRATOMO', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Monica Belluci]. [LOG HISTORY].', '2020-07-29 08:01:08', 'YA', '115.178.225.92'),
('d353a778028bad658854fd01720398ac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', 'Selamat Datang....', '2020-07-29 08:01:55', 'YA', '115.178.225.92'),
('ed4463893306a3514991270edb5a8824', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 08:01:58', 'YA', '115.178.225.92'),
('063b4123b6ee800f7b612c0c9e57f883', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-29 08:02:03', 'YA', '115.178.225.92'),
('3ac2164da644fc0920a7ed55831ad484', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 08:02:20', 'YA', '115.178.225.92'),
('acdfbc7acefee8aefa8d15ec66a2b2be', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [LOG HISTORY].', '2020-07-29 08:02:24', 'YA', '115.178.225.92'),
('0aefd6dbedbafcbc8856eea751031cd9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Monica Belluci', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 08:02:37', 'YA', '115.178.225.92'),
('7f5bafcf487253db84f5293ccf2fe157', 'ba917a5a74d6529f878af6707c361177', 'GURU', '170052', 'MASRIFAH', 'Selamat Datang....', '2020-07-29 08:05:19', 'YA', '115.178.225.92'),
('6e810717d05a34228fca110ed3e713d1', 'ba917a5a74d6529f878af6707c361177', 'GURU', '170052', 'MASRIFAH', '[2020/2021. X TKJ 1]. IPA [BERANDA].', '2020-07-29 08:05:21', 'YA', '115.178.225.92'),
('260a61a35a6db186b0c1cc55d57b4035', 'ba917a5a74d6529f878af6707c361177', 'GURU', '170052', 'MASRIFAH', '[2020/2021. X TKJ 1]. IPA [SISWA].', '2020-07-29 08:05:28', 'YA', '115.178.225.92'),
('0e7729cccaff7f9f7994f227f3d7538f', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-29 08:05:39', 'YA', '115.178.225.92'),
('fa380efe94ffce1eaf99978865c110ea', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-29 08:06:51', 'YA', '115.178.225.92'),
('c8239cf2bacd1166337527fede4c6fd4', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', 'Selamat Datang....', '2020-07-29 08:11:34', 'YA', '115.178.247.50'),
('08f8876ec2b14828ea379f681b976304', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. IPA. [GURU : MASRIFAH]. [BERANDA].', '2020-07-29 08:11:39', 'YA', '115.178.247.50'),
('bf5d195d7dd840b7e0d061bf779972d3', 'c8501a58dde52c15ac3ac56fbe669603', 'SISWA', '280005', 'Luna Maya', '[2020/2021. X TKJ 1]. IPA. [GURU : MASRIFAH]. [BERANDA].', '2020-07-29 08:11:49', 'YA', '115.178.247.50'),
('9ec0cac3823cf97a241d93dbbf7deeb8', '6f3f3d1b960233ebefbf39c15e52ed07', 'SISWA', '7383', 'ACHMAD EKA MAULANA', 'Selamat Datang....', '2020-07-29 21:04:12', 'YA', '127.0.0.1'),
('0eb86c71e1bc9872ef3924ddd3ea3c49', '6f3f3d1b960233ebefbf39c15e52ed07', 'SISWA', '7383', 'ACHMAD EKA MAULANA', 'Selamat Datang....', '2020-07-29 21:05:53', 'YA', '127.0.0.1'),
('e811269b0b87964cc217ef2457e6a4be', '6f3f3d1b960233ebefbf39c15e52ed07', 'SISWA', '7383', 'ACHMAD EKA MAULANA', 'Selamat Datang....', '2020-07-29 21:05:54', 'YA', '127.0.0.1'),
('7ed901860a10bf3759df706063b32678', '6f3f3d1b960233ebefbf39c15e52ed07', 'SISWA', '7383', 'ACHMAD EKA MAULANA', 'Selamat Datang....', '2020-07-29 21:06:02', 'YA', '127.0.0.1'),
('113d4455440227f928118c0aea5d8804', '6f3f3d1b960233ebefbf39c15e52ed07', 'SISWA', '7383', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. IPA. [GURU : MASRIFAH]. [BERANDA].', '2020-07-29 21:06:05', 'YA', '127.0.0.1'),
('c1cbe3c06d7d6e490a238d8363d92fd0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 21:58:26', 'YA', '127.0.0.1'),
('6285a0c8c27e199458e3cb17e11bd393', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 21:58:35', 'YA', '127.0.0.1'),
('4f11a48ba5cce097bcac4f080d4241bd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 21:58:38', 'YA', '127.0.0.1'),
('8140d4e6d265690dfa473c512d8e9a04', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 21:59:20', 'YA', '127.0.0.1'),
('d17e623fc09e831568448a90a829e151', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 21:59:21', 'YA', '127.0.0.1'),
('da4246e31a7bd0cf5ba3a7951380965c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:00:11', 'YA', '127.0.0.1'),
('f1fe04e71d3d0afa5450921b2f2c8873', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:00:12', 'YA', '127.0.0.1'),
('7208ac620e004c889581f2e977fb1432', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:00:13', 'YA', '127.0.0.1'),
('99d088cd4e8c3698da482df790c53db5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:00:14', 'YA', '127.0.0.1'),
('390d05c9c5ebd76cb1e9c556a6045580', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:00:15', 'YA', '127.0.0.1'),
('8dc378416053ac89720bf47522d393e6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 22:00:25', 'YA', '127.0.0.1'),
('5475ad2f309a59ce4dd12a34e9031a17', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:00:28', 'YA', '127.0.0.1'),
('70db4edadc79f81e704550cb93482a34', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 22:00:30', 'YA', '127.0.0.1'),
('792b5f16b19c4ff4293b22f3d35d8c91', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:00:32', 'YA', '127.0.0.1'),
('8ca9f195bb4c196987e6100b6b27ddcc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 22:00:33', 'YA', '127.0.0.1'),
('821aa3fd57ba507ec882abbcadb66619', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:00:35', 'YA', '127.0.0.1'),
('fc8f65e3ff8e0d1abf46a3f4e1813318', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'LOG HISTORY', '2020-07-29 22:00:39', 'YA', '127.0.0.1'),
('3ddb4e948665bbb851d369343435eace', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:00:42', 'YA', '127.0.0.1'),
('0e0909380048aaaffbb7f1ce73701c9f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:00:43', 'YA', '127.0.0.1'),
('e5e8c2b3388c64382d5c1154179d982b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:29', 'YA', '127.0.0.1'),
('af11a2d6cc65ff3b8edbf138885fade7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:30', 'YA', '127.0.0.1'),
('cb524567c4f088ead45d3b1211c60791', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:31', 'YA', '127.0.0.1'),
('3886d03887624e669c5d4f3558626664', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:44', 'YA', '127.0.0.1'),
('75ba432c6b7bf8f7c18becdf70e2545e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:45', 'YA', '127.0.0.1'),
('2bba08aa1a8cf968a097183baf634de3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:46', 'YA', '127.0.0.1'),
('bf44ea40cd4f85f0f76fe63ff487a788', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:56', 'YA', '127.0.0.1'),
('067bdb58580f94ba3bc588ee838c0e7b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:01:57', 'YA', '127.0.0.1'),
('6e5f14df1cb7398851419174e5d8fdcb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:18', 'YA', '127.0.0.1'),
('6d5b47f75594ff1cdfa8d54e11d045b4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:19', 'YA', '127.0.0.1'),
('c19d5cd2198bd3bf3e4e3a4cbe3c2dad', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:20', 'YA', '127.0.0.1'),
('c9ca6be74e350c26490c03fb138d300c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:21', 'YA', '127.0.0.1'),
('d9b870d8472509d97c1359be0bc0d025', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:22', 'YA', '127.0.0.1'),
('910065b7081ae63a839a50915dd7ea09', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:23', 'YA', '127.0.0.1'),
('acb38441289cb848aaa00159f42f7cb2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:25', 'YA', '127.0.0.1'),
('36a72c24557ac66a8a5c2a8c8b7cc58e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:26', 'YA', '127.0.0.1'),
('7f0972e598593b264d4febe3cc48c031', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:02:51', 'YA', '127.0.0.1'),
('142ed30e544d1ac3f262dc40a5bd2c1b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:02:55', 'YA', '127.0.0.1'),
('579a54d2dc77ba4fc160373b13d50a7c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:03:14', 'YA', '127.0.0.1'),
('ece09575b0f340f1501c37b9e50336a9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:03:15', 'YA', '127.0.0.1'),
('ccf5eba16bc79bbe967c404e87846455', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:03:16', 'YA', '127.0.0.1'),
('dddd45ef1e498d4719821ea22113160e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:03:25', 'YA', '127.0.0.1'),
('61c8fa0ab24f7f618a2b3a552a7d72b9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:03:32', 'YA', '127.0.0.1'),
('07fa2447ea6ac134de7801b74fcafe49', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:03:39', 'YA', '127.0.0.1'),
('c025fe9aee5114536469250a184afecc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:03:42', 'YA', '127.0.0.1'),
('fb2f85505629d65c21850c6007a92cd4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Pesan Terkirim', '2020-07-29 22:03:50', 'YA', '127.0.0.1'),
('d2f79237824165e2d71485bd59bca324', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Pesan Terkirim', '2020-07-29 22:05:05', 'YA', '127.0.0.1'),
('bd45609a87bf1853d48565c0af1826a5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:05:12', 'YA', '127.0.0.1'),
('39eb5d61a66124326ba962e9d0c65e4a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:05:47', 'YA', '127.0.0.1'),
('6f43c99278c9355656894383e16364f3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Pesan Terkirim', '2020-07-29 22:05:51', 'YA', '127.0.0.1'),
('b14a2cc1e28ffe5ff59cebe327243995', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Pesan Terkirim', '2020-07-29 22:07:05', 'YA', '127.0.0.1'),
('f40b40449f35d7516b3f8992ffc18e46', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:07:11', 'YA', '127.0.0.1'),
('2e8d6f374b9e97e93ab76202ce8a1d27', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Buat Pesan Baru', '2020-07-29 22:07:13', 'YA', '127.0.0.1'),
('9292d9fc5d2b2ea99871a68cfb851eae', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Buat Pesan Baru', '2020-07-29 22:07:21', 'YA', '127.0.0.1'),
('a8a1f69af20c4d26d00dc0373c8491b7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Pesan Terkirim', '2020-07-29 22:07:30', 'YA', '127.0.0.1'),
('f39f940c22fc43470eb8b5be6ef775fb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Inbox Pesan', '2020-07-29 22:07:32', 'YA', '127.0.0.1'),
('f6c2d497c514095adf7920b5b57aceb4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'LOG HISTORY', '2020-07-29 22:07:36', 'YA', '127.0.0.1'),
('07f53c4376c2d5798d04cf1d7a612917', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'LOG HISTORY', '2020-07-29 22:07:52', 'YA', '127.0.0.1'),
('d73494aaaacebd6f093fa69b07357b16', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'LOG HISTORY', '2020-07-29 22:08:29', 'YA', '127.0.0.1'),
('3c2652974e48a2612e021ecd190a17cb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 22:08:31', 'YA', '127.0.0.1'),
('db03a3312b9e7140c7bf1cf611cabcb7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Profil', '2020-07-29 22:08:32', 'YA', '127.0.0.1'),
('7eb5a6863fbaa08350e60ca0c1decf34', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Ganti Password', '2020-07-29 22:08:34', 'YA', '127.0.0.1'),
('6ac4d7197e9173cea7020ed15bf95895', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'LOG HISTORY', '2020-07-29 22:08:35', 'YA', '127.0.0.1'),
('b7ac2a4ed417575bf7a2c8188fee67e4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 22:08:37', 'YA', '127.0.0.1'),
('ec27922ef6955d673fd4b3d5bb7b989e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 22:08:39', 'YA', '127.0.0.1'),
('a26c28c8bea4705e115569ea8457276a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 22:08:49', 'YA', '127.0.0.1'),
('43469b4a5dd6417c37ea1caa0093f3f3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-29 22:08:50', 'YA', '127.0.0.1'),
('c28a1f59f0d399a047cab0c53e3ed548', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-29 22:08:54', 'YA', '127.0.0.1'),
('c5e7e097bd72e4f7cab6755d47a34ce6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-29 22:08:57', 'YA', '127.0.0.1'),
('faf73d12b5f28fd269da277a8200756c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-29 22:09:01', 'YA', '127.0.0.1'),
('1efade8dc2204c6379f1b5f218bcb8c6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-29 22:09:07', 'YA', '127.0.0.1'),
('674e1933796110261320ba3d50275446', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', 'Selamat Datang....', '2020-07-29 22:09:17', 'YA', '127.0.0.1'),
('135b1fc9e9b2b4ce1f926f25fad01c3c', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-29 22:09:21', 'YA', '127.0.0.1'),
('36806b1cd5b810b74c774758463e6845', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-29 22:09:40', 'YA', '127.0.0.1'),
('c6531a5d7a5817b244e022010c6ff9cb', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. <br>Bahasa Inggris. <br>[GURU : Orang BIASAWAE].', '2020-07-29 22:09:44', 'YA', '127.0.0.1'),
('f34d8d7651937fe4f52a62abeac860ed', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-29 22:09:46', 'YA', '127.0.0.1'),
('919153fca33ee6b742a8f2a698e44fc3', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [LINK].', '2020-07-29 22:09:47', 'YA', '127.0.0.1'),
('e96f7b372f02e19f54f84aad2e1f2b13', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [VIDEO YOUTUBE].', '2020-07-29 22:09:49', 'YA', '127.0.0.1'),
('20a242a63a67e71fcbd71bb1dc31e338', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [KALENDER AGENDA].', '2020-07-29 22:10:03', 'YA', '127.0.0.1'),
('0a8ac50e2fbee94ffcbec9b6d0ea2ab7', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [KALENDER AGENDA].', '2020-07-29 22:10:05', 'YA', '127.0.0.1'),
('0fd8e78cd962dc262ea84cbb32a7e709', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [KALENDER AGENDA].', '2020-07-29 22:10:07', 'YA', '127.0.0.1'),
('ac4ef49a15a352b06c425f30f320d993', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FORUM].', '2020-07-29 22:10:16', 'YA', '127.0.0.1'),
('18e237fc8bec554144663c49eda381bc', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [LINK].', '2020-07-29 22:10:20', 'YA', '127.0.0.1'),
('bbf9d7cf08d07f8627dd7577a44122b3', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [CHATROOM].', '2020-07-29 22:10:22', 'YA', '127.0.0.1'),
('de4f36deac00d36396937e3ae6bd0707', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-29 22:10:25', 'YA', '127.0.0.1'),
('59597fec5424c1b90364660629c63ca8', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [TANYA JAWAB].', '2020-07-29 22:10:27', 'YA', '127.0.0.1'),
('550a9f45666cbb9f84a77905cff23d95', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [LOG HISTORY].', '2020-07-29 22:10:30', 'YA', '127.0.0.1'),
('29a5ddd9cd52a2d11b67bbf782336760', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [LOG HISTORY].', '2020-07-29 22:10:42', 'YA', '127.0.0.1'),
('ca9667c78fc004f01e222227f8506717', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', 'Selamat Datang....', '2020-07-29 22:10:56', 'YA', '127.0.0.1'),
('acfc0716509e2cbb9918fdeb4049d6c1', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', '[2020/2021. X TKJ 1]. IPA. [GURU : MASRIFAH]. [BERANDA].', '2020-07-29 22:11:20', 'YA', '127.0.0.1'),
('50376bf2ceadcedf47e19b0a8b8023fc', '130e36f6ca2e8441c634828e58959afd', 'SISWA', '280011', 'ACHMAD EKA MAULANA', 'Selamat Datang....', '2020-07-29 22:11:25', 'YA', '127.0.0.1'),
('f8f9d8f1a762330affd26b4b09040a19', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:13:17', 'YA', '127.0.0.1'),
('58bee38a341729dcb46fba77e603b896', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TKJ 1]. IPA [BERANDA].', '2020-07-29 22:13:23', 'YA', '127.0.0.1'),
('426cce31c46b681edf8f316cd6dfdd6b', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:13:29', 'YA', '127.0.0.1'),
('be4867684d7c4ddb82978ad768a62cbc', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Ganti Profil', '2020-07-29 22:13:31', 'YA', '127.0.0.1'),
('8e11a9a5bdce00923f4909bbf691e452', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Ganti Password', '2020-07-29 22:13:32', 'YA', '127.0.0.1'),
('333800495ad907fadbbc519253b11709', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Inbox Pesan', '2020-07-29 22:13:33', 'YA', '127.0.0.1'),
('b3d9c310e288d6332951999ebdcff90f', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'LOG HISTORY', '2020-07-29 22:13:35', 'YA', '127.0.0.1'),
('2a74ddec838c22f0d29154130b5db676', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Ganti Profil', '2020-07-29 22:13:36', 'YA', '127.0.0.1'),
('28627358926ab9b70908793eeaa99a5d', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:13:37', 'YA', '127.0.0.1'),
('e3b8fe466ca2fcc01d58e1def918df0f', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TGB 2]. Bahasa Jawa [BERANDA].', '2020-07-29 22:13:41', 'YA', '127.0.0.1'),
('d86ed8de17e6e182ff525b1411968661', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:13:43', 'YA', '127.0.0.1'),
('87738ace2ee5cf1bc6ca9f5226a2a39f', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TKJ 2]. Bahasa Inggris [BERANDA].', '2020-07-29 22:13:44', 'YA', '127.0.0.1'),
('35c6817e75b8eea1245cc0537d96151a', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:13:46', 'YA', '127.0.0.1'),
('46aeef4b52a5a36618ead58a7a222e3a', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TKJ 1]. IPA [BERANDA].', '2020-07-29 22:13:48', 'YA', '127.0.0.1'),
('efa4eca8125e41edc9e64f9d169294d2', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:13:50', 'YA', '127.0.0.1'),
('f1283db1283b36e94c5b2a7878bf0c3b', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TGB 2]. Bahasa Jawa [BERANDA].', '2020-07-29 22:13:51', 'YA', '127.0.0.1'),
('4be7a5bd2870cf3c8d8267d18b53eaf1', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:13:53', 'YA', '127.0.0.1'),
('512fc3f6c97c29d64a38c31d973244cf', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:14:28', 'YA', '127.0.0.1'),
('b0570a15ac19ebc481eb8cc337d9526f', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:14:40', 'YA', '127.0.0.1'),
('513789ad2d92396777738fa19f4e1ac2', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TGB 2]. Bahasa Jawa [BERANDA].', '2020-07-29 22:14:45', 'YA', '127.0.0.1'),
('1dae2b5aad02efeb2c8079da575f885d', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:14:47', 'YA', '127.0.0.1'),
('09db3139956e8c351141f8303a2eaa60', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TKJ 1]. IPA [BERANDA].', '2020-07-29 22:14:49', 'YA', '127.0.0.1'),
('6765676a17192de06cd6d8f6a3fd15d2', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:14:51', 'YA', '127.0.0.1'),
('cefd63b77ceb129c8802ee3522a0a737', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', '[2020/2021. X TKJ 2]. Bahasa Inggris [BERANDA].', '2020-07-29 22:14:52', 'YA', '127.0.0.1'),
('62456ad75cc696ef05b488cf6c009100', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Selamat Datang....', '2020-07-29 22:14:53', 'YA', '127.0.0.1'),
('053ff394eccd89077460cf955caff7cf', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Ganti Profil', '2020-07-29 22:15:00', 'YA', '127.0.0.1'),
('d2575100b7aa53fc8c09d18d645b3ca4', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'Inbox Pesan', '2020-07-29 22:15:01', 'YA', '127.0.0.1'),
('d2d08786e6b06f926606689064c23e03', '9aff0a515e4c5521f71f0f8acc5378d2', 'GURU', '1700011', 'Joker', 'LOG HISTORY', '2020-07-29 22:15:02', 'YA', '127.0.0.1'),
('07b1ee0a3658cfde96adad884a389f52', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 22:46:04', 'YA', '127.0.0.1'),
('34fbd1e5d53de5dd183e80cd58347155', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 22:46:06', 'YA', '127.0.0.1'),
('dd0c6cd6a5a0e017efdf21bcb87d109e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:08:19', 'YA', '127.0.0.1'),
('6ec5c9d217c5a30bd67ac028e945ebfc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:08:51', 'YA', '127.0.0.1'),
('7aec4b45a947081695544ba65302b0f9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:08:53', 'YA', '127.0.0.1'),
('c44d0ea4e6d8ffff3cf3fb87e120db1f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:09:14', 'YA', '127.0.0.1'),
('32a2b9cf217d9c4b46ffcb924c78abc8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:09:16', 'YA', '127.0.0.1'),
('33da028075a00f9d9fb4f42678e5efac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:09:24', 'YA', '127.0.0.1'),
('bd6050290949fced3cc1a02b9206db92', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:09:25', 'YA', '127.0.0.1'),
('96b36c3483d8931427539dd8093920b1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:09:43', 'YA', '127.0.0.1'),
('7201cc52fba55191ac1dc0321015f403', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:10:14', 'YA', '127.0.0.1'),
('06fc001aa66ba1ae7999cb9f15f72bce', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:10:16', 'YA', '127.0.0.1'),
('b5de73bc2449a3eedc4218ac74d4fdb0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:10:17', 'YA', '127.0.0.1'),
('0bc32b52cd7628e520e9479335e2a15d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:10:18', 'YA', '127.0.0.1'),
('d028b008f1132a5d5ba06fc6665f6c36', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:10:29', 'YA', '127.0.0.1'),
('7136f4fa05cd4417b311114f1360b73f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:10:45', 'YA', '127.0.0.1'),
('34f7fc65b7ed4d76b71c406106cbca98', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:10:59', 'YA', '127.0.0.1'),
('d5fc5b2e7c4304453d5665b9198f9f5b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:11:00', 'YA', '127.0.0.1'),
('3d5fdd3d6b5db4eab8259e435e980fc5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:11:30', 'YA', '127.0.0.1'),
('2ceefb83199f21eddfe1ad003fa3add6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:11:43', 'YA', '127.0.0.1'),
('10e4af49f94dd47c05d665950effdfe6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:11:53', 'YA', '127.0.0.1'),
('815830ee8df1c02d0f249d5efed6a497', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:12:00', 'YA', '127.0.0.1'),
('310d7eaa63fb6d40e46c1c2434511d40', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:13:08', 'YA', '127.0.0.1'),
('11281159059176abf7693ebf630b477f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:13:10', 'YA', '127.0.0.1'),
('13bc2f7490c2d82db395335f32ffb53e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:13:21', 'YA', '127.0.0.1'),
('4e669448bbb449df873ee7d291ef59bd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:13:22', 'YA', '127.0.0.1'),
('d1977afb94fbfbcffe26e0c7ef7422b4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:13:24', 'YA', '127.0.0.1'),
('3f78435044238b648a61c63aa070b41a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:13:45', 'YA', '127.0.0.1'),
('c83ac5ce548dc054edcf69f3635abb0e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:13:47', 'YA', '127.0.0.1'),
('53b6903ce2d5ff471d15ac534088ab5d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:14:38', 'YA', '127.0.0.1'),
('db2af6ae4f67a846ca39adc9ad0175c8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 23:14:45', 'YA', '127.0.0.1');
INSERT INTO `user_blog_status` (`kd`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `status`, `postdate`, `onlineya`, `ipnya`) VALUES
('05e0789c67917bdb2c23bd242151cb85', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-29 23:16:13', 'YA', '127.0.0.1'),
('6426cfb115fcef3aa2ef80ce8cf92cb0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 23:16:27', 'YA', '127.0.0.1'),
('fb97b70d5a822753d677a8204f491433', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', 'Selamat Datang....', '2020-07-29 23:20:20', 'YA', '127.0.0.1'),
('c3a805757c44e51a635d3dee7de6f3a9', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', 'Selamat Datang....', '2020-07-29 23:20:22', 'YA', '127.0.0.1'),
('698e069db912c3daa51f3210b8420369', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-29 23:20:27', 'YA', '127.0.0.1'),
('a8152afafd86f76cfe5c38112e26802d', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-29 22:27:53', 'YA', '127.0.0.1'),
('a82b421fd986d6ae16126113aa668f80', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-29 22:40:43', 'YA', '127.0.0.1'),
('691b40fa10987ea94a79673edf4a3d79', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-29 22:40:46', 'YA', '127.0.0.1'),
('c1af5758354bb3d5aff45a153221e5ae', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:40:49', 'YA', '127.0.0.1'),
('a7ac6c8cf2e6606174cba336607842cd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:45:16', 'YA', '127.0.0.1'),
('fe2b3cc780aa55e2339bb286fcca7025', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:45:36', 'YA', '127.0.0.1'),
('7ec4e706399622fbc472c3528f15eb95', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:45:54', 'YA', '127.0.0.1'),
('c53a80f870b1b55f1ebf53648c8c01cf', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:46:12', 'YA', '127.0.0.1'),
('c15d5c058f272b1a279d1054cd7ae70b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:46:35', 'YA', '127.0.0.1'),
('f2ea6aad315258e08562c9c653eec15a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:49:15', 'YA', '127.0.0.1'),
('3ca2d9ec64209d9a5c0d6251f1b94628', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-29 22:49:20', 'YA', '127.0.0.1'),
('43dab50b986b75bcb379d2cca70f28a3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:00:52', 'YA', '127.0.0.1'),
('0da9ed9092a962f0d2846d2a9fdfc78b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:02:33', 'YA', '127.0.0.1'),
('9ac9670f98c07631d3d635a27e57fabc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:02:45', 'YA', '127.0.0.1'),
('438632ff83c0cda83d1a70a198fcf005', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:05:41', 'YA', '127.0.0.1'),
('25d818107e635ccf1482dc9e42dc3f34', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:05:42', 'YA', '127.0.0.1'),
('5d663e61d5c526ec6d8d16b7167c7510', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:05:50', 'YA', '127.0.0.1'),
('b920129ae5d75befb723dd65765b0058', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:06:38', 'YA', '127.0.0.1'),
('636618835135b7389b2b31d173d90253', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:06:40', 'YA', '127.0.0.1'),
('a74f04722b4ffbff3dad6a2359eee269', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:06:48', 'YA', '127.0.0.1'),
('85cdf8d504266b5ef00753ba9b1a7ea0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:08:43', 'YA', '127.0.0.1'),
('8e1aff4af2d0dce8e3bf01d7238f7942', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:08:44', 'YA', '127.0.0.1'),
('4cd8c1874580c453bd56755ffd260460', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:08:47', 'YA', '127.0.0.1'),
('b8a03225512901ccd1355dcfc34c06cf', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:08:57', 'YA', '127.0.0.1'),
('7a8ce7fcd34819c820e3fb229efb65ba', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:10:43', 'YA', '127.0.0.1'),
('ed1b20a9fa4e5942a07a11a00f46c10b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:10:44', 'YA', '127.0.0.1'),
('7c1610cdd690e9795e8a22c358472686', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:10:55', 'YA', '127.0.0.1'),
('3f2f75e61cfb25c0f0b69032d8f998fc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:11:12', 'YA', '127.0.0.1'),
('b559e99c434a2d8a45c741b47bb9128b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:11:20', 'YA', '127.0.0.1'),
('a296a9c62240399090f75b43cdee078b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:11:22', 'YA', '127.0.0.1'),
('59e665ddc16139213c6b465bf2505dec', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:11:27', 'YA', '127.0.0.1'),
('ddba1296bf7798024f472de9df104eb9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:12:13', 'YA', '127.0.0.1'),
('1e395f37887fc8ddddaa5218123e8d15', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:12:24', 'YA', '127.0.0.1'),
('9c96a58c565a84388f352a19b473217b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:12:43', 'YA', '127.0.0.1'),
('7cc1923f99084bc81642706c238aaf75', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:17:54', 'YA', '127.0.0.1'),
('ab09a8d0ef471c5a23dbb8aec9d196c2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:18:14', 'YA', '127.0.0.1'),
('4ae79415105fd3a442f2d81333245b04', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:18:26', 'YA', '127.0.0.1'),
('6b1c28560e9fce14da51eeae44fabd12', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:20:07', 'YA', '127.0.0.1'),
('6f67c4c13005ea1f03217040827acfb9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:21:24', 'YA', '127.0.0.1'),
('b6ee049c0650447c114d6008265936e0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:21:46', 'YA', '127.0.0.1'),
('2ada107b323dfef7236240e106bb60b2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:22:00', 'YA', '127.0.0.1'),
('b88af0c5bdc77a47e1cbbd78fd9cd886', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:22:07', 'YA', '127.0.0.1'),
('2108342f380c7146504654ae7c5707c4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:23:25', 'YA', '127.0.0.1'),
('42117f4399a4cbe31ff0b3d613e28c28', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:23:29', 'YA', '127.0.0.1'),
('4ad2234eff91d4d5db726e6cdb4c1f23', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:23:35', 'YA', '127.0.0.1'),
('a44370d2d1e598e63f00cd8db8d90af4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:25:58', 'YA', '127.0.0.1'),
('b2d02cc1ac94a72525d89bbc06967ba6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:27:16', 'YA', '127.0.0.1'),
('84b9fbc02cca379d0742702792335ec2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:27:18', 'YA', '127.0.0.1'),
('278700819eff1d92890e1e1b85102469', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:27:32', 'YA', '127.0.0.1'),
('644a1b4c82db9246ae8050b33292fce5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:27:44', 'YA', '127.0.0.1'),
('0eb20cc7fa85d8080e5362481586e9ff', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:27:52', 'YA', '127.0.0.1'),
('e93f7ca1eef1b6bfc16576a04ef55fd2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:28:46', 'YA', '127.0.0.1'),
('dd6c7a7fcd942c9e4de2fc26670f4b37', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:28:58', 'YA', '127.0.0.1'),
('a57a796d6742456207568d315abaa0fc', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:29:09', 'YA', '127.0.0.1'),
('f32408ed197adeaea349ba2d514c7362', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:30:04', 'YA', '127.0.0.1'),
('acbd16d44a202c800d43c860e1a15d1d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:30:55', 'YA', '127.0.0.1'),
('bcd09d1d23b8d92bb36b3161d6a67bf2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:30:58', 'YA', '127.0.0.1'),
('1ad5ef8cc76b98d8b6781fa4f8406b0f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:32:02', 'YA', '127.0.0.1'),
('26d04830599ede50d3cadcf7bda605d8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:32:10', 'YA', '127.0.0.1'),
('3d8b42796234b4fb284f27cb4d2d7cc5', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:32:12', 'YA', '127.0.0.1'),
('0959b0584ae7690941831d761da1cd87', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:32:26', 'YA', '127.0.0.1'),
('0b00d05cb49229fffa28f6827e8575c7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:32:34', 'YA', '127.0.0.1'),
('63467e027de92a8f7e4ec080486d60d3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [VIDEO YOUTUBE].', '2020-07-30 09:33:05', 'YA', '127.0.0.1'),
('d774bc4710bc11955157e4d840a4e17d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-30 09:33:13', 'YA', '127.0.0.1'),
('53de34f2170f53d36a37b1a607c5b5b0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:33:30', 'YA', '127.0.0.1'),
('a4404b22caa19f5013dd594ffbb34eb6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:34:13', 'YA', '127.0.0.1'),
('d977d146b1ce11ad0a72f7576ac612c4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:34:19', 'YA', '127.0.0.1'),
('dadaea66a3a4a25957527cb34152386d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:34:27', 'YA', '127.0.0.1'),
('f2e970e9cbfafe7729e8961f09bdd1c2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:02', 'YA', '127.0.0.1'),
('940fbacc65ae14aa274792db8dc42fda', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:07', 'YA', '127.0.0.1'),
('3491f9a696e9b11144a5645c67bc4902', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:14', 'YA', '127.0.0.1'),
('f730de78aa360c1d68be14dd884ba227', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:25', 'YA', '127.0.0.1'),
('f00516f4080cab1e6be18d06306975d7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:29', 'YA', '127.0.0.1'),
('9ed16cf1735cfb9fa23c42f7df04ef8a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:51', 'YA', '127.0.0.1'),
('af896df65f213f64aadb696c8c1f4c5f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:54', 'YA', '127.0.0.1'),
('b38d5000389df0a711fa181ff9c3995d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:36:58', 'YA', '127.0.0.1'),
('4f544ea338f1a74b6f55a839764dc04c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:37:17', 'YA', '127.0.0.1'),
('87e247a7926c898d4d4ad3443816f753', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:37:24', 'YA', '127.0.0.1'),
('06390fbb5a3ae7e001198e09d477c705', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:37:27', 'YA', '127.0.0.1'),
('2278450d95b77c8d0f9e8f1811928190', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:37:34', 'YA', '127.0.0.1'),
('44c34401da722135ac19b0c558c2272a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [FILE MATERI].', '2020-07-30 09:38:11', 'YA', '127.0.0.1'),
('df32c868be9337bb1d1242904f6f8853', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Log Pengerjaan Soal oleh Siswa].', '2020-07-30 09:38:27', 'YA', '127.0.0.1'),
('f578c1094ee3fea2a0150d0125d6df06', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:38:31', 'YA', '127.0.0.1'),
('f57eaf36f3ec4b786ef75ace9a316351', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:38:35', 'YA', '127.0.0.1'),
('76bb947d010cc370862b85126e31d287', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:38:36', 'YA', '127.0.0.1'),
('8766124d5a94d78aa34fe8088a2e9abf', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:38:48', 'YA', '127.0.0.1'),
('84980f3b4157663f5dc2c16231f6355a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:38:51', 'YA', '127.0.0.1'),
('370fba75ac518b40fa9492e0a86226f0', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:39:49', 'YA', '127.0.0.1'),
('e73548c0b72ade6492dc4f682eaa30b7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ANALISIS SOAL].', '2020-07-30 09:39:55', 'YA', '127.0.0.1'),
('bf17475b5146c82be9322a89b6e65ce7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ANALISIS SOAL].', '2020-07-30 09:40:59', 'YA', '127.0.0.1'),
('1efe64153779a81764af84dd0cb999d7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Log Pengerjaan Soal oleh Siswa].', '2020-07-30 09:41:13', 'YA', '127.0.0.1'),
('6c439a76972da50cf8f77aa90c184ce1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:41:17', 'YA', '127.0.0.1'),
('d205b669487e263133ee06d85faaeb50', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:42:06', 'YA', '127.0.0.1'),
('59739a18760758fc887c1cbb84d9659d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ANALISIS SOAL].', '2020-07-30 09:42:12', 'YA', '127.0.0.1'),
('7efc4aa71f38d1f07bf012b1384001f2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [Rekap Nilai Siswa].', '2020-07-30 09:42:16', 'YA', '127.0.0.1'),
('0a8cac91b2e7d87400846ca1aecad7c4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:42:30', 'YA', '127.0.0.1'),
('34e8ac161726a4185a5817d5962119ce', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [SISWA].', '2020-07-30 09:46:25', 'YA', '127.0.0.1'),
('f2f7a64c28719b4a8305d56fc2cf3f74', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:46:30', 'YA', '127.0.0.1'),
('a719a471f9f685d891cdb7451e708637', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:52:55', 'YA', '127.0.0.1'),
('3abde7703364568b6af347bf2b66ead7', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:52:57', 'YA', '127.0.0.1'),
('e587a04a002dc85fe2184193e52e9fa9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:53:39', 'YA', '127.0.0.1'),
('7858749c1ab8cdea316f74ca2ec6772d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:53:41', 'YA', '127.0.0.1'),
('7d7e4dcb06da5d0ca3282aa5b10e0492', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:09', 'YA', '127.0.0.1'),
('a373b115c5678467e5734a9790fad3a3', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:16', 'YA', '127.0.0.1'),
('9bc5613d47f1d7905a25e85af4c2c9f9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:31', 'YA', '127.0.0.1'),
('fc07008cde5062c8ad4cf680360dc45b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:37', 'YA', '127.0.0.1'),
('7920535d3035d4824b5fed828017afae', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:39', 'YA', '127.0.0.1'),
('fe02a49db75693286aeb1850a24b3d06', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:45', 'YA', '127.0.0.1'),
('a4a03d94b27537dc85fb83b01129c59d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:56', 'YA', '127.0.0.1'),
('a10d703e3ae0a789a2b7ad702691fecf', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:54:59', 'YA', '127.0.0.1'),
('46b86c8653b2611eb3d3ca683367fe42', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:55:03', 'YA', '127.0.0.1'),
('7cf167371d0de78cedcb2b11acb5a6ee', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:55:05', 'YA', '127.0.0.1'),
('2c676c44ad870d283611db420d57533d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:55:30', 'YA', '127.0.0.1'),
('94829567c17cb76906233f3101417e44', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:55:34', 'YA', '127.0.0.1'),
('6694ec853324b086acfa4d02f51de698', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:55:39', 'YA', '127.0.0.1'),
('47511af4a013f0c1351369d5378cf29b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 09:55:44', 'YA', '127.0.0.1'),
('6cb41115e9001710651ac15daaacaa50', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', 'Selamat Datang....', '2020-07-30 09:55:54', 'YA', '127.0.0.1'),
('2aa86f821188ae14e42818fbecca66c5', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-30 09:56:00', 'YA', '127.0.0.1'),
('8547b96fe574b0d9352974d94e7d4673', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-30 09:56:08', 'YA', '127.0.0.1'),
('6269b0720753ddbb8ccc3614759e1f91', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-30 09:56:11', 'YA', '127.0.0.1'),
('f24ead0459f28bbde121951fcc213714', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-30 09:56:57', 'YA', '127.0.0.1'),
('bd695ea34f5c190157e86ebf421cb8cf', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [BERANDA].', '2020-07-30 09:56:59', 'YA', '127.0.0.1'),
('520e0fa4514f194d5da8817ac73de2fe', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:57:08', 'YA', '127.0.0.1'),
('2e118f488da136532b231d279c6c9db9', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:57:43', 'YA', '127.0.0.1'),
('1b58842cbc38f78db59ac458e0c14e0b', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:57:47', 'YA', '127.0.0.1'),
('58c4b8d886373b9c8610fc1d1b7f7688', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:57:54', 'YA', '127.0.0.1'),
('752617448f5680ce4f12bd3350afe467', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:58:32', 'YA', '127.0.0.1'),
('46dd149ce3279830e7f2a973b0ac1fb4', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:58:49', 'YA', '127.0.0.1'),
('dd786e2f83814d365c742775cd2fc29e', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:59:05', 'YA', '127.0.0.1'),
('b026353f1bc04b152a12c7c04765809d', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 09:59:17', 'YA', '127.0.0.1'),
('f0dca5dbed35a74a22b4232353b25864', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:06:45', 'YA', '127.0.0.1'),
('804d6035669291fb27436c603508d242', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:06:48', 'YA', '127.0.0.1'),
('75f6f02ba97a7734f8896b4442f7efe2', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:07:50', 'YA', '127.0.0.1'),
('71f2a37ffd930b606b993e39e095bc9d', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:08:21', 'YA', '127.0.0.1'),
('bffdd23c47c1731c57a58e096ef7cdf6', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:09:00', 'YA', '127.0.0.1'),
('af39e083b6517bcfcc0c7bfad132fd25', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:09:04', 'YA', '127.0.0.1'),
('0f0b406d27b74032b17ba32fbc305374', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:19:51', 'YA', '127.0.0.1'),
('f54114c25028cabe5a28873c4a60f1df', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:20:00', 'YA', '127.0.0.1'),
('97f10d30c24497096776dacbe6dbf23d', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:20:28', 'YA', '127.0.0.1'),
('91bc2bb42be01a68e6c6a946bc64c2a4', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:20:33', 'YA', '127.0.0.1'),
('63db7f53a6635b42032f28e58c76b79c', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:21:44', 'YA', '127.0.0.1'),
('30382a62b6f9f4b937ffc8c40b02a73f', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:22:19', 'YA', '127.0.0.1'),
('e3118aaafd25755054a6c689224cf3d5', 'f4f5d296afead37410f18a6ca7bff265', 'SISWA', '280005', 'Orang TeknikNih', '[2020/2021. X TKJ 1]. Bahasa Inggris. [GURU : Orang BIASAWAE]. [FILE MATERI].', '2020-07-30 10:22:25', 'YA', '127.0.0.1'),
('5d7f5146f98cd2c5d424639f97230767', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', 'Selamat Datang....', '2020-07-30 10:22:37', 'YA', '127.0.0.1'),
('53d5b7be253c197d029fb6f1c68403e2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [BERANDA].', '2020-07-30 10:22:38', 'YA', '127.0.0.1'),
('cff1c31d85276b34b7d57dd5376e9d4f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:22:52', 'YA', '127.0.0.1'),
('64986fc53a5f92d403d9748e1bf7abb4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:22:56', 'YA', '127.0.0.1'),
('038b8a78680b9f7a73cb1fbc374dbd03', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:22:59', 'YA', '127.0.0.1'),
('4c0062509b91d61ee3d58dc4648584cb', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:23:01', 'YA', '127.0.0.1'),
('3739c6edf0fba8b9535a97925dc522ae', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:23:04', 'YA', '127.0.0.1'),
('9fe1f1393f5d2fd4918911e407211e5c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:24:12', 'YA', '127.0.0.1'),
('a24ab26df19043ced6e0d15368775eca', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:24:14', 'YA', '127.0.0.1'),
('92f806be0c828202b48f0fcd43682a01', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:24:17', 'YA', '127.0.0.1'),
('f22ee66632caddd3e38600c8e4de37bd', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:24:23', 'YA', '127.0.0.1'),
('5e0f6a10aacecf44de3dc3778df6937d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:24:54', 'YA', '127.0.0.1'),
('150f80c04a361c9a393c7059abb2a066', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:24:57', 'YA', '127.0.0.1'),
('55f394b14f2cbd51919aecb3d92ea67a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:24:59', 'YA', '127.0.0.1'),
('0969e6551c545cde244ed2135926a4af', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:01', 'YA', '127.0.0.1'),
('72a1afb52085faff8e012a66301f3929', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:03', 'YA', '127.0.0.1'),
('e53a661d00fbf096f336a4eb4fe5b4ee', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:19', 'YA', '127.0.0.1'),
('ab83fa37bf0d2018330896be1d1bd314', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:22', 'YA', '127.0.0.1'),
('9336348d7b96cee8eb7ff30e706644f9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:24', 'YA', '127.0.0.1'),
('29be8fcff86b7b8d4fd76137340437ac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:25', 'YA', '127.0.0.1'),
('c86a7ff7d4926e3da09d7263fee51b00', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:28', 'YA', '127.0.0.1'),
('581e6b30eea6948d89187ff7957a5ac2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:25:43', 'YA', '127.0.0.1'),
('fed4272725381e7b5db58b1ebf8a4f64', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:26:14', 'YA', '127.0.0.1'),
('235785adb827bad6b005f9f1befab35d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:26:16', 'YA', '127.0.0.1'),
('9aa5fa2e887da1af88c2203bd9a68ab1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:26:39', 'YA', '127.0.0.1'),
('0cc92dff97663e04aacc309b2c2ae6f8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:26:47', 'YA', '127.0.0.1'),
('86940244cf749af2c38b87efc7799f62', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:27:24', 'YA', '127.0.0.1'),
('97c633a48f971f91a0d89977c2947e7e', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:27:30', 'YA', '127.0.0.1'),
('a46a84ded6ebc957e9bb50a25a949896', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:27:37', 'YA', '127.0.0.1'),
('dcda113d51585c6803506afab3ee3f3c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:27:38', 'YA', '127.0.0.1'),
('30bb7b7750ead40267d3577002018b9d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:28:18', 'YA', '127.0.0.1'),
('b8b49623bee7b816e31a9aa9106ee394', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:28:19', 'YA', '127.0.0.1'),
('537fa2a8c1996e88e132f5e079ef3c98', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:28:24', 'YA', '127.0.0.1'),
('de3fe1636568e392b200677bf72600ec', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:29:13', 'YA', '127.0.0.1'),
('0b48fb676b169e41218fb6e483afdca1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:29:32', 'YA', '127.0.0.1'),
('8eb9d62b18a6dcb9f269320d1f878dbe', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:30:10', 'YA', '127.0.0.1'),
('28bbe760f641ed32fb30ec048455bd2a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:30:25', 'YA', '127.0.0.1'),
('f520b08a8503afaf8ac93a7466d74a1c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:30:46', 'YA', '127.0.0.1'),
('b957cbef505f57dac18075c14228e583', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:30:57', 'YA', '127.0.0.1'),
('60fb1db37abe4cc7707a7b20927ae925', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:31:21', 'YA', '127.0.0.1'),
('48c18097180ca026b27c462b26203c3b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:31:36', 'YA', '127.0.0.1'),
('b129eb4d5a1b7e64d318e2e5a6394d97', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:32:03', 'YA', '127.0.0.1'),
('c6bc594b4bab610de1c386bcd421226b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:32:15', 'YA', '127.0.0.1'),
('d2edfdcc467fdaf342f14ea7fc2e9b2a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:32:28', 'YA', '127.0.0.1'),
('5900234e1355e6642288163d10e1ed08', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:34:58', 'YA', '127.0.0.1'),
('542f464b39097e5450f8ba1eb162b97f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:00', 'YA', '127.0.0.1'),
('897553e42fc292f3ae1a5c462265e09a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:02', 'YA', '127.0.0.1'),
('24f7f91977450672197865c29247f8b2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:10', 'YA', '127.0.0.1'),
('530996c0acc060a11b4d84efc2da5654', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:19', 'YA', '127.0.0.1'),
('2163107bec406fb4019117fa3e63e6c4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:30', 'YA', '127.0.0.1'),
('af054067fa10b69b18965d2e0ce431b1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:42', 'YA', '127.0.0.1'),
('1b25da5fc29619740f2913d7666cc361', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:43', 'YA', '127.0.0.1'),
('45609bfeeeb68669045de1c9f875e7ae', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:35:44', 'YA', '127.0.0.1'),
('5b703d2b362984000233c9ecde795626', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:37:37', 'YA', '127.0.0.1'),
('eb8652d68247c97924572d420c9740a8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:37:39', 'YA', '127.0.0.1'),
('9bfb990c0cc71fb783cb459a898ccd69', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:37:54', 'YA', '127.0.0.1'),
('4665dac38c65a3009ae2ae96dc2f100d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:37:57', 'YA', '127.0.0.1'),
('9605f426da4ec314057ed4ef67326fd9', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:38:02', 'YA', '127.0.0.1'),
('e0b85fd692aefa1a664dd71fdba8ef0b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:38:29', 'YA', '127.0.0.1'),
('b7a78ccd2afdbb74f77169804accec33', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:38:32', 'YA', '127.0.0.1'),
('f4c11f0040ebd7a57df11b2fa6d45f28', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:38:38', 'YA', '127.0.0.1'),
('9ad5b32ffcef137242e6a3a3d61d65f1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:38:40', 'YA', '127.0.0.1'),
('a9911bc5d3801484dc1e8715270c1f75', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:42:16', 'YA', '127.0.0.1'),
('6e2a81b24809a5d6ba73cc2e1c798e92', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:42:19', 'YA', '127.0.0.1'),
('f971531f2531f96b21323b46c45fb19b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:42:47', 'YA', '127.0.0.1'),
('939d29d176d708c179a9896989d31c93', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:43:42', 'YA', '127.0.0.1'),
('5564c2d3a18fb73c58f11ddb3d39c972', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:43:54', 'YA', '127.0.0.1'),
('e814c6bb4d8a850e361f812493f40252', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:46:21', 'YA', '127.0.0.1'),
('2dd74ed250e9cf29e83aa09503a3e2a6', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:46:32', 'YA', '127.0.0.1'),
('fb1ec5d2a98f56fe3d2232888ab28b68', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:46:38', 'YA', '127.0.0.1'),
('5b17e174cc65e3c25b8cb61295dbd229', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:46:41', 'YA', '127.0.0.1'),
('086163aedc558003495ef6ddf6160336', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:46:57', 'YA', '127.0.0.1'),
('1536a0d384c7cf78ceeaf2e66dd971ca', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:47:29', 'YA', '127.0.0.1'),
('23e42a13866b1bf3cade550594844d8d', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:48:15', 'YA', '127.0.0.1'),
('478bfad594e38fe05e014af529aa14a8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:48:43', 'YA', '127.0.0.1'),
('b4793ecf25990cca4000d56cd5e326b8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:48:52', 'YA', '127.0.0.1'),
('17a5b949424448dfde617d2fb1c28886', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:48:58', 'YA', '127.0.0.1'),
('8d230690e169de023ae51b5f4c260b62', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:50:11', 'YA', '127.0.0.1'),
('2cd4a22b644b95610e91ad2cc3c2ec29', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:50:13', 'YA', '127.0.0.1'),
('6e51dc26a05a37f8507d282bd6d0c62a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:50:22', 'YA', '127.0.0.1'),
('1b8868c5159cae5a132546495919257b', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:50:23', 'YA', '127.0.0.1'),
('6fe4db444f093f1f858c50b7ef1c7db8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:51:44', 'YA', '127.0.0.1'),
('d0545a73d62aba18ce529e6b1bf84b75', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:51:48', 'YA', '127.0.0.1'),
('458c96abbfef1b329a78d7584ceba7f1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:51:54', 'YA', '127.0.0.1'),
('41644ed173d89b152f690dedf818cfe1', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:52:03', 'YA', '127.0.0.1'),
('f6d198b2908cb342eff9b6a76a96ad1a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:52:04', 'YA', '127.0.0.1'),
('5a7fb05c62b3aa8f2a8bbdd2eacd4fa2', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:52:58', 'YA', '127.0.0.1'),
('c38c37d8e58909ec36a6a351e488494a', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:52:59', 'YA', '127.0.0.1'),
('cedf938424e17fd64784a5ee265469e4', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:06', 'YA', '127.0.0.1'),
('693874ca82298389da52023f92fa20a8', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:09', 'YA', '127.0.0.1'),
('762a31631204dcf25401041ad5ae3d76', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:14', 'YA', '127.0.0.1'),
('31077427d2331e3844e83b749624354c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:19', 'YA', '127.0.0.1');
INSERT INTO `user_blog_status` (`kd`, `kd_user`, `user_tipe`, `user_kode`, `user_nama`, `status`, `postdate`, `onlineya`, `ipnya`) VALUES
('96cbd0a326e5f9c9766aba263f23601f', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:26', 'YA', '127.0.0.1'),
('c3c40ac5de44f4964a20153f653a4229', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:33', 'YA', '127.0.0.1'),
('8c165e75b519bc725c583d5749190c30', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:46', 'YA', '127.0.0.1'),
('eef081dbe90bc5ebbbe182f5f58cffde', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:53:58', 'YA', '127.0.0.1'),
('bb4a53470470c26f18e487511a5bb923', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:55:11', 'YA', '127.0.0.1'),
('b5b9e690b5a32c9abc97b822ba885a05', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:55:21', 'YA', '127.0.0.1'),
('56bf43b7687dcc698cb7e827208eae0c', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:55:23', 'YA', '127.0.0.1'),
('c538dc2bcb1a821dd6e6c3cfb2f874ac', '4a91033bfe52de0aedecd767ee4075c5', 'GURU', '170001', 'Orang BIASAWAE', '[2020/2021. X TKJ 1]. Bahasa Inggris [ENTRI SOAL].', '2020-07-30 10:55:24', 'YA', '127.0.0.1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_blog_status_msg`
--

CREATE TABLE `user_blog_status_msg` (
  `kd` varchar(50) NOT NULL,
  `kd_user_blog_status` varchar(50) NOT NULL,
  `dari` varchar(50) NOT NULL,
  `user_kode` varchar(100) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_learning`
--

CREATE TABLE `user_learning` (
  `kd` varchar(50) NOT NULL,
  `tapel` varchar(100) DEFAULT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `kd_user` varchar(50) DEFAULT NULL,
  `user_kode` varchar(100) DEFAULT NULL,
  `user_nama` varchar(100) DEFAULT NULL,
  `kd_guru_mapel` varchar(50) DEFAULT NULL,
  `ket` longtext DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `dibaca` enum('true','false') NOT NULL DEFAULT 'false',
  `dibaca_postdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `adminx`
--
ALTER TABLE `adminx`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel`
--
ALTER TABLE `guru_mapel`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_artikel`
--
ALTER TABLE `guru_mapel_artikel`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_artikel_msg`
--
ALTER TABLE `guru_mapel_artikel_msg`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_chatroom`
--
ALTER TABLE `guru_mapel_chatroom`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_file_materi`
--
ALTER TABLE `guru_mapel_file_materi`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_forum`
--
ALTER TABLE `guru_mapel_forum`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_forum_msg`
--
ALTER TABLE `guru_mapel_forum_msg`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_jadwal`
--
ALTER TABLE `guru_mapel_jadwal`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_kalender`
--
ALTER TABLE `guru_mapel_kalender`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_kategori`
--
ALTER TABLE `guru_mapel_kategori`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_link`
--
ALTER TABLE `guru_mapel_link`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_log`
--
ALTER TABLE `guru_mapel_log`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_news`
--
ALTER TABLE `guru_mapel_news`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_news_msg`
--
ALTER TABLE `guru_mapel_news_msg`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_polling`
--
ALTER TABLE `guru_mapel_polling`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_soal`
--
ALTER TABLE `guru_mapel_soal`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_soal_filebox`
--
ALTER TABLE `guru_mapel_soal_filebox`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_tanya`
--
ALTER TABLE `guru_mapel_tanya`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_tugas`
--
ALTER TABLE `guru_mapel_tugas`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `guru_mapel_video`
--
ALTER TABLE `guru_mapel_video`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `m_kelas`
--
ALTER TABLE `m_kelas`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `m_mapel`
--
ALTER TABLE `m_mapel`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `m_tapel`
--
ALTER TABLE `m_tapel`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `siswa_soal`
--
ALTER TABLE `siswa_soal`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `siswa_soal_nilai`
--
ALTER TABLE `siswa_soal_nilai`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `siswa_tugas`
--
ALTER TABLE `siswa_tugas`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog`
--
ALTER TABLE `user_blog`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog_album`
--
ALTER TABLE `user_blog_album`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog_album_filebox`
--
ALTER TABLE `user_blog_album_filebox`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog_artikel`
--
ALTER TABLE `user_blog_artikel`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog_artikel_msg`
--
ALTER TABLE `user_blog_artikel_msg`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog_msg`
--
ALTER TABLE `user_blog_msg`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog_status`
--
ALTER TABLE `user_blog_status`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_blog_status_msg`
--
ALTER TABLE `user_blog_status_msg`
  ADD PRIMARY KEY (`kd`);

--
-- Indeks untuk tabel `user_learning`
--
ALTER TABLE `user_learning`
  ADD PRIMARY KEY (`kd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
