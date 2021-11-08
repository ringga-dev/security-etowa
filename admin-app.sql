-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2021 at 07:34 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_web`
--

CREATE TABLE `admin_web` (
  `nik` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `enable_login` varchar(50) NOT NULL,
  `create` varchar(255) NOT NULL,
  `update` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_web`
--

INSERT INTO `admin_web` (`nik`, `username`, `password`, `fullname`, `position`, `enable_login`, `create`, `update`) VALUES
('1111', 'master', '$2y$10$nXT6l7uV8JZKL4ld/SUkt..o1wXFXAopneA06GfF2i0ruYI1Wc7g2', 'master', 'admin', '1', '', ''),
('2222', 'admin', '$2y$10$HSHAVqy8kfBDQ4ZmlbZkdeiigGMvvL3/mMaKvLc0aZnoFKTrFoijy', 'admin', 'adminUndia', '1', '03-Nov-2021 02:17:49 PM', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_company`
--

CREATE TABLE `app_company` (
  `id` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_company`
--

INSERT INTO `app_company` (`id`, `date`, `company`) VALUES
(2, '04-Nov-2021', 'PT Etowa Packaging Indonesia'),
(3, '05-Nov-2021', 'PT Etowa Packaging Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `hadiah_undia`
--

CREATE TABLE `hadiah_undia` (
  `id` int(11) NOT NULL,
  `barang` text DEFAULT NULL,
  `create` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hadiah_undia`
--

INSERT INTO `hadiah_undia` (`id`, `barang`, `create`) VALUES
(5, 'voucher indomaret 100k', '03-Nov-2021 01:46:38 PM by ringga'),
(6, 'redmi not 8\r\n', '03-Nov-2021 01:46:48 PM by ringga'),
(7, 'kipas', '04-Nov-2021 03:28:13 PM by admin'),
(8, 'gorengan', '04-Nov-2021 03:28:23 PM by admin'),
(9, 'tv', '04-Nov-2021 03:28:32 PM by admin'),
(10, 'laptop\r\n', '04-Nov-2021 03:28:41 PM by admin'),
(11, 'hp\r\n', '04-Nov-2021 03:29:40 PM by admin'),
(12, 'mobil', '04-Nov-2021 03:30:57 PM by admin'),
(13, 'motor\r\n', '04-Nov-2021 03:31:05 PM by admin'),
(14, 'sepeda\r\n', '04-Nov-2021 03:31:17 PM by admin');

-- --------------------------------------------------------

--
-- Table structure for table `list_patrol`
--

CREATE TABLE `list_patrol` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `patrol_ke` int(11) NOT NULL DEFAULT 0,
  `qr_code` varchar(50) NOT NULL DEFAULT '0',
  `tgl` varchar(50) NOT NULL DEFAULT '0',
  `create` varchar(50) NOT NULL DEFAULT '0',
  `update` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `list_visitor`
--

CREATE TABLE `list_visitor` (
  `id` int(11) NOT NULL,
  `id_user` varchar(50) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jadwal` varchar(100) DEFAULT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `keperluan` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `masuk` varchar(50) DEFAULT NULL,
  `keluar` varchar(50) DEFAULT NULL,
  `create` varchar(50) DEFAULT NULL,
  `update` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `list_visitor`
--

INSERT INTO `list_visitor` (`id`, `id_user`, `nama`, `jadwal`, `qr_code`, `keperluan`, `description`, `masuk`, `keluar`, `create`, `update`) VALUES
(24, 'selesai', 'master', '2021-11-02 08:54', 'JJSKKSKKKSKKSKS', 'facf afasdf', 'fadsfadf', '1635818135', '1635818166', '02-Nov-2021 08:54:43 AM By ringga', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mas_aksesmenu`
--

CREATE TABLE `mas_aksesmenu` (
  `id` int(11) NOT NULL,
  `posisi` varchar(50) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mas_aksesmenu`
--

INSERT INTO `mas_aksesmenu` (`id`, `posisi`, `menu_id`) VALUES
(1, 'admin', 1),
(2, 'admin', 2),
(3, 'admin', 3),
(4, 'admin', 4),
(5, 'adminUndia', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mas_menu`
--

CREATE TABLE `mas_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(255) DEFAULT NULL,
  `app` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `stts` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mas_menu`
--

INSERT INTO `mas_menu` (`id`, `menu`, `app`, `icon`, `stts`) VALUES
(1, 'Admin', 'security', ' fa-cogs', 'true'),
(2, 'patrol', 'security', 'fa-user-shield', 'true'),
(3, 'Visitor', 'security', 'fa-address-book', 'true'),
(4, 'User', 'security', 'fa-users', 'true'),
(5, 'undia', 'security', 'fa-random', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `mas_qr_location`
--

CREATE TABLE `mas_qr_location` (
  `id` int(11) NOT NULL,
  `qr` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `dec` text DEFAULT NULL,
  `stts` varchar(50) DEFAULT NULL,
  `lot` int(11) DEFAULT NULL,
  `log` text DEFAULT NULL,
  `create` varchar(50) DEFAULT NULL,
  `update` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mas_qr_location`
--

INSERT INTO `mas_qr_location` (`id`, `qr`, `image`, `dec`, `stts`, `lot`, `log`, `create`, `update`) VALUES
(22, 'QR-001-L7', NULL, '- Pastikan keran air dalam keadaan tertutup.', 'CP1 Keran air area LOT-7', 7, ', ', '01-Nov-2021 11:03:04 AM', '02-Nov-2021 03:03:50 PM By ringga'),
(23, 'QR-002-L1', NULL, 'doc tes app\r\n', 'CP2 Motor park area LOT-7', 7, ', ', '01-Nov-2021 11:05:02 AM', '02-Nov-2021 08:37:07 AM By ringga'),
(24, 'QR-003-L6', NULL, 'doc', 'CP3 Smoking area LOT-6', 6, ', ', '01-Nov-2021 11:06:55 AM', NULL),
(25, 'QR-004-L6', NULL, 'doc', 'CP4 Pintu reception & Kolam LOT-6', 6, ', ', '01-Nov-2021 11:07:33 AM', NULL),
(26, 'QR-005-L6', NULL, 'doc', 'CP5 Toilet Cewek LOT-6', 6, ', ', '01-Nov-2021 11:08:11 AM', NULL),
(28, 'QR-007-L7', NULL, 'doc', 'CP7 Locker area LOT-7', 7, ', ', '01-Nov-2021 11:10:21 AM', NULL),
(29, 'QR-006-L7', NULL, 'doc', 'CP6 Toilet Cowok & Dispenser area LOT-7', 7, ', ', '01-Nov-2021 11:11:39 AM', NULL),
(30, 'QR-008-L7', NULL, 'doc', 'CP8 Kantin area LOT-7', 7, ', ', '01-Nov-2021 11:12:19 AM', NULL),
(31, 'QR-009-L6', NULL, 'doc', 'CP9 Pintu office LOT-6', 6, ', ', '01-Nov-2021 11:13:25 AM', NULL),
(32, 'QR-010-L6', NULL, 'doc', 'CP10 EPS-GP area LOT-6 Lt.2', 6, ', ', '01-Nov-2021 11:14:16 AM', NULL),
(33, 'QR-011-L6', NULL, 'doc', 'CP11 Store area & panel LOT-6', 6, ', ', '01-Nov-2021 11:15:30 AM', NULL),
(34, 'QR-012-L6', NULL, 'doc', 'CP12 Carrier tape & gangway LOT-6', 6, ', ', '01-Nov-2021 11:16:07 AM', NULL),
(35, 'QR-013-L6', NULL, 'doc', 'CP13 EPS Bawah LOT-6', 6, ', ', '01-Nov-2021 11:16:39 AM', NULL),
(37, 'QR-014-L6', NULL, 'doc', 'CP14 Cut sheet area LOT-6', 6, ', ', '01-Nov-2021 11:18:32 AM', NULL),
(38, 'QR-015-L6', NULL, 'doc', 'CP15 Laser Room & Block LOT-6', 6, ', ', '01-Nov-2021 11:19:16 AM', NULL),
(39, 'QR-016-L1', NULL, 'doc', 'CP16 Boiler & Compressor', 6, ', ', '01-Nov-2021 11:20:01 AM', NULL),
(40, 'QR-017-L6', NULL, 'doc', 'CP17 Expander Area LOT-6 ', 6, ', ', '01-Nov-2021 11:20:38 AM', NULL),
(41, 'QR-018-L7', NULL, 'doc', 'CP18 Store Material LOT-7', 7, ', ', '01-Nov-2021 11:21:29 AM', NULL),
(42, 'QR-019-L7', NULL, 'doc', 'CP19 Scrap & B3 Area LOT-7', 7, ', ', '01-Nov-2021 11:22:07 AM', NULL),
(43, 'QR-020-L7', NULL, 'doc', 'CP20 Cutting area LOT-7', 7, ', ', '01-Nov-2021 11:22:36 AM', NULL),
(44, 'QR-021-L7', NULL, 'doc', 'CP21 VF Room & Tooling LOT-7', 7, ', ', '01-Nov-2021 11:23:18 AM', NULL),
(45, 'QR-022-L7', NULL, 'doc', 'CP22 Platform VF Lt. 2', 7, ', ', '01-Nov-2021 11:24:45 AM', NULL),
(46, 'QR-023-L7', NULL, 'doc', 'CP23 Panel Listrik area LOT-7', 7, ', ', '01-Nov-2021 11:25:19 AM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mas_submenu`
--

CREATE TABLE `mas_submenu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `sub_menu` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `stts` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mas_submenu`
--

INSERT INTO `mas_submenu` (`id`, `menu_id`, `sub_menu`, `url`, `stts`) VALUES
(1, 1, 'Menu', 'admin/menu', 'false'),
(2, 1, 'User Managemen', 'admin/user', 'true'),
(3, 1, 'User Managemen App', 'admin/user_app', 'true'),
(4, 2, 'QR location', 'admin/qr_location', 'true'),
(5, 3, 'Daftar Visitor', 'admin/visitor', 'true'),
(6, 2, 'History Patrol', 'admin/history_patrol', 'true'),
(7, 4, 'All user', 'admin/all_users', 'true'),
(8, 4, 'User Location', 'admin/user_location', 'false'),
(9, 5, 'User', 'home/user_undia', 'true'),
(10, 5, 'Hadia', 'home/user_hadia', 'true'),
(11, 5, 'user X hadia', 'home/user_mendapat', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `mas_user_location`
--

CREATE TABLE `mas_user_location` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `long` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mas_user_scan`
--

CREATE TABLE `mas_user_scan` (
  `id` int(11) NOT NULL,
  `id_bet` varchar(50) DEFAULT NULL,
  `w_masuk` varchar(100) DEFAULT NULL,
  `w_keluar` varchar(100) DEFAULT NULL,
  `dari` varchar(100) DEFAULT NULL,
  `menuju` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mas_user_scan`
--

INSERT INTO `mas_user_scan` (`id`, `id_bet`, `w_masuk`, `w_keluar`, `dari`, `menuju`, `date`) VALUES
(18, 'it-2021', '1635818414', '1635818357', 'lot1', 'lot 6', '2021-11-02'),
(19, 'it-2021', NULL, '1635818868', 'lot 7', 'lot 1', '2021-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `tblweb_privilege`
--

CREATE TABLE `tblweb_privilege` (
  `id` int(11) NOT NULL,
  `privilege_name` varchar(126) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblweb_privilege`
--

INSERT INTO `tblweb_privilege` (`id`, `privilege_name`) VALUES
(1, 'IT'),
(2, 'PRODUCTION'),
(3, 'PLANNER'),
(4, 'CS'),
(5, 'QA'),
(6, 'TECHNICAL'),
(7, 'STORE'),
(8, 'VF'),
(9, 'GP'),
(10, 'EPS'),
(11, 'QC'),
(12, 'TOOLING'),
(13, 'ENG'),
(14, 'ACC'),
(15, 'MTK'),
(16, 'DESIGN'),
(17, 'PG & PE'),
(18, 'HR');

-- --------------------------------------------------------

--
-- Table structure for table `user_app`
--

CREATE TABLE `user_app` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_bet` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_phone` varchar(255) DEFAULT NULL,
  `devisi` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `enable_login` int(11) DEFAULT NULL,
  `created` varchar(100) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_app`
--

INSERT INTO `user_app` (`id`, `name`, `id_bet`, `email`, `no_phone`, `devisi`, `password`, `image`, `enable_login`, `created`, `created_by`) VALUES
(5, 'ringga septia pribadi', '21-4617', 'ringga@gmail.com', '082284621151', 'security', '$2y$10$nXT6l7uV8JZKL4ld/SUkt..o1wXFXAopneA06GfF2i0ruYI1Wc7g2', 'user.jpg', 1, '2021-09-01 12:02:14 PM', 'user'),
(14, 'Siff Siang', 'it-2021', 'ringgadev@gmail.com', '098777755', 'IT', '$2y$10$NT5gtCMu03r1gLUSNi5Woe6iQvU8XBEnhg5PHVhAkjW/ExX66rdSq', 'user.jpg', 1, '2021-Oct-27 10:18:39 AM', 'ringga'),
(15, 'ringga septia pribadi', 'et-001', 'ringgaseptia62@gmail.com', '08456454348454', 'security', '$2y$10$04KUNIIyQbuRr9PnlbwRzO.6yZJoNu33VDJivtpwzumBVozY7y5am', 'user.jpg', 1, '2021-Oct-27 02:48:00 PM', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `bet_id` varchar(50) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `exp` varchar(50) DEFAULT NULL,
  `firebase` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`bet_id`, `token`, `exp`, `firebase`) VALUES
('5', '2y10HbDmvj3QVOaRzlUHipueKu4obP2hjfO5qfNCBqqjOpPZoyC8Hu1S', '1636081903', NULL),
('15', '2y10dYtoTWeKyq40UzcwkfINNOJTTQt6aO2brAr7AoLC2X6eJl7fFWYRO', '1636081903', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_undian`
--

CREATE TABLE `user_undian` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `bet_id` varchar(50) DEFAULT NULL,
  `hadiah` int(11) DEFAULT NULL,
  `create` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_undian`
--

INSERT INTO `user_undian` (`id`, `name`, `bet_id`, `hadiah`, `create`) VALUES
(17, 'Dedi Situmorang ', '19-4342', 0, '02-Nov-2021 03:59:17 PM by ringga'),
(18, 'Kembar Martua Sitompul', '19-4362', 0, '02-Nov-2021 03:59:44 PM by ringga'),
(19, 'Cadra Waldi ', '19-4432', 0, '02-Nov-2021 04:00:03 PM by ringga'),
(20, 'Nelfa Usni', '19-4541', 0, '02-Nov-2021 04:00:24 PM by ringga'),
(21, 'Perina Pajar Wati Sipayung', '20-4648', 0, '02-Nov-2021 04:01:13 PM by ringga'),
(22, 'Syaiful', '20-4699', 0, '02-Nov-2021 04:01:35 PM by ringga'),
(23, 'Tauristina', '20-4707', 0, '02-Nov-2021 04:02:01 PM by ringga'),
(24, 'Khairul Anwar Siregar', '20-4718', 0, '02-Nov-2021 04:02:18 PM by ringga'),
(25, 'Chairil Anwar', '20-4755', 0, '02-Nov-2021 04:02:35 PM by ringga'),
(26, 'Asep Taufik Rahman', '20-4769', 0, '02-Nov-2021 04:02:57 PM by ringga'),
(28, 'Nur hayati Suksin', '20-4775', 0, '02-Nov-2021 04:03:56 PM by ringga'),
(29, 'Henni Delia Hutauruk', '20-4776', 0, '02-Nov-2021 04:04:09 PM by ringga'),
(30, 'Deny Susyanti', '20-4777', 0, '02-Nov-2021 04:04:35 PM by ringga'),
(31, 'Asnidawati', '20-4778', 0, '02-Nov-2021 04:04:53 PM by ringga'),
(32, 'Lukkas Tampubolon', '20-4780', 0, '02-Nov-2021 04:05:21 PM by ringga'),
(33, 'Sakir', '21-4804', 0, '02-Nov-2021 04:06:13 PM by ringga'),
(34, 'Akbar Ramadhan', '21-4813', 0, '02-Nov-2021 04:06:46 PM by ringga'),
(35, 'Rahmad Hidayat', '21-4814', 0, '02-Nov-2021 04:07:06 PM by ringga'),
(36, 'Pebri Desni Rianti', '21-4818', 0, '02-Nov-2021 04:07:20 PM by ringga'),
(37, 'Budimansyah', '21-4825', 0, '02-Nov-2021 04:07:35 PM by ringga'),
(39, 'Evida Juanti', '21-4844', 0, '02-Nov-2021 04:08:06 PM by ringga'),
(41, 'Ade Irawan', '21-4849', 0, '02-Nov-2021 04:08:48 PM by ringga'),
(43, 'Andrianto Sitompul', '21-4868', 0, '02-Nov-2021 04:09:22 PM by ringga'),
(44, 'Riki Riwandi ', '21-4870', 0, '02-Nov-2021 04:09:35 PM by ringga'),
(45, 'Tetty Ade Sihotang ', '21-4871', 0, '02-Nov-2021 04:09:49 PM by ringga'),
(46, 'Dina Mariana Naiborhu ', '21-4872', 0, '02-Nov-2021 04:10:20 PM by ringga'),
(47, 'Meri Lestari ', '21-4878', 0, '02-Nov-2021 04:10:37 PM by ringga'),
(48, 'Novi Yerni ', '21-4879', 0, '02-Nov-2021 04:10:47 PM by ringga'),
(50, 'Sahruzi Siagian ', '21-4899', 0, '02-Nov-2021 04:11:37 PM by ringga'),
(51, 'Chris donovan Putra Harahap', '21-4904', 0, '02-Nov-2021 04:11:52 PM by ringga'),
(52, 'Desi Muhlisyaningsih ', '21-4905', 0, '02-Nov-2021 04:12:06 PM by ringga'),
(53, 'Yogi Junaidi ', '21-4907', 0, '02-Nov-2021 04:12:25 PM by ringga'),
(54, 'Tengku Rafli Akhila ', '21-4908', 0, '02-Nov-2021 04:12:37 PM by ringga'),
(55, 'Yurlinda ', '21-4933', 0, '02-Nov-2021 04:12:59 PM by ringga'),
(56, 'Helmaliza ', '21-4934', 0, '02-Nov-2021 04:13:14 PM by ringga'),
(59, 'Rika Ayu ', '21-4937', 0, '02-Nov-2021 04:14:01 PM by ringga'),
(60, 'Nico Manullang ', '21-4938', 0, '02-Nov-2021 04:14:21 PM by ringga'),
(61, 'Rifani Napitupulu', '21-4939', 0, '02-Nov-2021 04:14:41 PM by ringga'),
(64, 'Khairil Anwar', '21-4942', 0, '02-Nov-2021 04:15:40 PM by ringga'),
(65, 'Farizal Akbar', '21-4946', 0, '02-Nov-2021 04:15:53 PM by ringga'),
(66, 'M. Yunus Pulungan', '21-4947', 0, '02-Nov-2021 04:16:09 PM by ringga'),
(67, 'Edi Zulkarnain', '21-4948', 0, '02-Nov-2021 04:16:30 PM by ringga'),
(68, 'Rosni Agustina Sinurat', '21-4949', 0, '02-Nov-2021 04:16:47 PM by ringga'),
(69, 'Muhammad Ikhsan', '20-4670', 0, '02-Nov-2021 04:18:00 PM by ringga'),
(70, 'Andika Saputra', '20-4703', 0, '02-Nov-2021 04:18:13 PM by ringga'),
(71, 'Nurmailis Yanti', '20-4709', 0, '02-Nov-2021 04:18:32 PM by ringga'),
(72, 'Andri Dimi Pasunda', '20-4750', 0, '02-Nov-2021 04:18:42 PM by ringga'),
(73, 'Rido Adi Putra', '20-4787', 0, '02-Nov-2021 04:19:01 PM by ringga'),
(74, 'Nelfa Yetmi', '21-4827', 0, '02-Nov-2021 04:19:13 PM by ringga'),
(75, 'Sartika', '21-4828', 0, '02-Nov-2021 04:19:26 PM by ringga'),
(76, 'Jama\'udin', '21-4842', 0, '02-Nov-2021 04:19:39 PM by ringga'),
(77, 'Refni ', '21-4857', 0, '02-Nov-2021 04:19:51 PM by ringga'),
(78, 'Gita Mardiana', '21-4858', 0, '02-Nov-2021 04:20:06 PM by ringga'),
(79, 'Aysah Maryam Making ', '21-4860', 0, '02-Nov-2021 04:20:19 PM by ringga'),
(80, 'Safril Sarif', '21-4861', 0, '02-Nov-2021 04:20:32 PM by ringga'),
(81, 'Tri Swandi Lumban Tobing ', '21-4862', 0, '02-Nov-2021 04:20:49 PM by ringga'),
(82, 'Daniel Manalu ', '21-4863', 0, '02-Nov-2021 04:21:03 PM by ringga'),
(83, 'Kandar ', '21-4865', 0, '02-Nov-2021 04:21:17 PM by ringga'),
(84, 'Ferdinata Ginting ', '21-4881', 0, '02-Nov-2021 04:21:32 PM by ringga'),
(85, 'Linen Siburian ', '21-4882', 0, '02-Nov-2021 04:21:46 PM by ringga'),
(86, 'Mardiana Siregar ', '21-4883', 0, '02-Nov-2021 04:22:00 PM by ringga'),
(87, 'Aldi Hendra ', '21-4884', 0, '02-Nov-2021 04:22:15 PM by ringga'),
(88, 'Anggun Chairunnisa', '21-4892', 0, '02-Nov-2021 04:22:27 PM by ringga'),
(89, 'Hidayatullah ', '21-4893', 0, '02-Nov-2021 04:22:40 PM by ringga'),
(90, 'Asnul Sitompul ', '21-4894', 0, '02-Nov-2021 04:22:55 PM by ringga'),
(91, 'David Valentin Putra ', '21-4910', 0, '02-Nov-2021 04:23:08 PM by ringga'),
(92, 'Surya Darma ', '21-4930', 0, '02-Nov-2021 04:23:20 PM by ringga'),
(93, 'Rhido Abdul Rachman Gajah ', '21-4931', 0, '02-Nov-2021 04:23:33 PM by ringga'),
(94, 'Rovida Rahmi ', '21-4932', 0, '02-Nov-2021 04:23:49 PM by ringga'),
(96, 'Jumakruf', '97-0009', 0, '02-Nov-2021 04:24:54 PM by ringga'),
(97, 'Arpiandi', '20-4564', 0, '02-Nov-2021 04:25:06 PM by ringga'),
(98, 'Syamsio Manurung', '20-4717', 0, '02-Nov-2021 04:25:24 PM by ringga'),
(100, 'Jontar Hutagaol', '21-4806', 0, '02-Nov-2021 04:25:54 PM by ringga'),
(101, 'Gufron Muhajjalin', '21-4807', 0, '02-Nov-2021 04:26:08 PM by ringga'),
(102, 'Fuji Arista Putra', '21-4829', 0, '02-Nov-2021 04:26:27 PM by ringga'),
(103, 'Tanti Novia Sugiyanti', '21-4831', 0, '02-Nov-2021 04:26:38 PM by ringga'),
(104, 'Muhammad Nurman Azhari', '21-4837', 0, '02-Nov-2021 04:26:54 PM by ringga'),
(105, 'Syafri Adi Putra ', '21-4854', 0, '02-Nov-2021 04:27:09 PM by ringga'),
(106, 'Indrawati', '21-4855', 0, '02-Nov-2021 04:27:23 PM by ringga'),
(107, 'Rita Hidayanti Ambarita', '21-4856', 0, '02-Nov-2021 04:27:37 PM by ringga'),
(108, 'Apriansyah ', '21-4911', 0, '02-Nov-2021 04:27:49 PM by ringga'),
(109, 'Annisa Aprilia ', '21-4914', 0, '02-Nov-2021 04:28:04 PM by ringga'),
(110, 'Gabriella Angela Saputra ', '21-4915', 0, '02-Nov-2021 04:28:24 PM by ringga'),
(111, 'Yan pauzal ', '21-4927', 0, '02-Nov-2021 04:28:38 PM by ringga'),
(112, 'Febrin Yurindo ', '21-4928', 0, '02-Nov-2021 04:28:51 PM by ringga'),
(113, 'Nurul Hasna ', '21-4929', 0, '02-Nov-2021 04:29:05 PM by ringga'),
(114, 'Esther Indrayani Lumban Gaol', '21-4944', 0, '02-Nov-2021 04:29:18 PM by ringga'),
(115, 'Asri Rahayu Suyanti', '97-0046', 0, '02-Nov-2021 04:30:03 PM by ringga'),
(116, 'Julita Sitinjak', '01-0370', 0, '02-Nov-2021 04:30:14 PM by ringga'),
(117, 'Eka Yulia ', '19-4435', 0, '02-Nov-2021 04:30:31 PM by ringga'),
(118, 'Yolanda Herawati', '20-4605', 0, '02-Nov-2021 04:30:41 PM by ringga'),
(119, 'Sa\'ban Kurniadi', '20-4680', 0, '02-Nov-2021 04:30:53 PM by ringga'),
(120, 'Charli Pahotan Alamsyah Siahaan', '20-4726', 0, '02-Nov-2021 04:31:06 PM by ringga'),
(121, 'Tasya Imanda', '21-4838', 0, '02-Nov-2021 04:31:23 PM by ringga'),
(122, 'Sudarwati', '21-4841', 0, '02-Nov-2021 04:31:35 PM by ringga'),
(123, 'Murah Rejeki ', '21-4902', 0, '02-Nov-2021 04:31:46 PM by ringga'),
(124, 'Dany Catur Arianto', '21-4924', 0, '02-Nov-2021 04:32:00 PM by ringga'),
(125, 'Ilham Handani Saputra', '21-4925', 0, '02-Nov-2021 04:32:13 PM by ringga'),
(127, 'Agus Mugiono ', '18-4321', 0, '02-Nov-2021 04:32:54 PM by ringga'),
(128, 'Mahlil Tarore ', '19-4516', 0, '02-Nov-2021 04:33:07 PM by ringga'),
(129, 'Ikhsannul Fikri', '20-4701', 0, '02-Nov-2021 04:33:21 PM by ringga'),
(130, 'Gopi Yuantoni Putra ', '20-4752', 0, '02-Nov-2021 04:33:36 PM by ringga'),
(131, 'Ismadi ', '20-4753', 0, '02-Nov-2021 04:33:48 PM by ringga'),
(132, 'Chechy Ronal Donata', '20-4794', 0, '02-Nov-2021 04:34:00 PM by ringga'),
(133, 'Moh. Mambaul Huda', '20-4795', 0, '02-Nov-2021 04:34:13 PM by ringga'),
(134, 'Noviyanto', '20-4796', 0, '02-Nov-2021 04:34:26 PM by ringga'),
(135, 'Dani Kardani', '21-4835', 0, '02-Nov-2021 04:34:43 PM by ringga'),
(136, 'Hengky Widodo', '21-4840', 0, '02-Nov-2021 04:34:52 PM by ringga'),
(137, 'Yudi Iskandi ', '21-4875', 0, '02-Nov-2021 04:35:04 PM by ringga'),
(138, 'Sutikno ', '21-4885', 0, '02-Nov-2021 04:35:16 PM by ringga'),
(140, 'Jatmo Widodo', '18-4239', 0, '02-Nov-2021 04:35:52 PM by ringga'),
(141, 'Rizki Mulya Ritonga', '20-4768', 0, '02-Nov-2021 04:36:06 PM by ringga'),
(142, 'Hotman Fernando Simanjuntak', '21-4805', 0, '02-Nov-2021 04:36:19 PM by ringga'),
(143, 'Catur Irawan', '21-4833', 0, '02-Nov-2021 04:36:32 PM by ringga'),
(144, 'Kriston Simanjuntak', '21-4853', 0, '02-Nov-2021 04:36:44 PM by ringga'),
(145, 'Sepriadi ', '21-4873', 0, '02-Nov-2021 04:36:56 PM by ringga'),
(146, 'Selamet Rahman ', '21-4895', 0, '02-Nov-2021 04:37:06 PM by ringga'),
(147, 'Heri Irawan ', '21-4918', 0, '02-Nov-2021 04:37:18 PM by ringga'),
(148, 'Candra Denny Moris Sinaga', '00-0330', 0, '02-Nov-2021 04:38:06 PM by ringga'),
(149, 'Donny Perdana', '19-4531', 0, '02-Nov-2021 04:38:18 PM by ringga'),
(151, 'Akhir Muda Hasibuan', '20-4549', 0, '02-Nov-2021 04:38:43 PM by ringga'),
(153, 'A. Sadudin', '20-4607', 0, '02-Nov-2021 04:39:08 PM by ringga'),
(154, 'Frenky Simaremare', '20-4657', 0, '02-Nov-2021 04:39:19 PM by ringga'),
(155, 'Arif Abdurrohman', '20-4729', 0, '02-Nov-2021 04:39:31 PM by ringga'),
(156, 'Dafrizal', '20-4793', 0, '02-Nov-2021 04:39:42 PM by ringga'),
(157, 'Jekson Parulian Manullang ', '21-4876', 0, '02-Nov-2021 04:39:55 PM by ringga'),
(158, 'Wegi Bayu Perdana ', '21-4877', 0, '02-Nov-2021 04:40:07 PM by ringga'),
(159, 'Taupik ', '21-4896', 0, '02-Nov-2021 04:40:18 PM by ringga'),
(160, 'Eferi Doni ', '21-4897', 6, '02-Nov-2021 04:40:30 PM by ringga'),
(161, 'Riska Asmayanti ', '21-4898', 0, '02-Nov-2021 04:40:40 PM by ringga'),
(162, 'Itsnain Ibnu Asri Vionanda', '21-4900', 0, '02-Nov-2021 04:40:52 PM by ringga'),
(163, 'Paulus Ba\'un ', '21-4906', 0, '02-Nov-2021 04:41:02 PM by ringga'),
(164, 'Juliaman Hutabarat ', '21-4922', 0, '02-Nov-2021 04:41:14 PM by ringga'),
(165, 'Thara Feby Angela ', '21-4923', 0, '02-Nov-2021 04:41:26 PM by ringga'),
(166, 'Yudik Eko Sunaryo ', '21-4945', 0, '02-Nov-2021 04:41:37 PM by ringga'),
(167, 'Sarina ', '19-4351', 0, '02-Nov-2021 04:42:04 PM by ringga'),
(168, 'Maya Sari', '19-4540', 0, '02-Nov-2021 04:42:14 PM by ringga'),
(169, 'Tri Devi T.H Hutabarat ', '21-4919', 0, '02-Nov-2021 04:42:26 PM by ringga'),
(171, 'Ria Gunawati', '99-0218', 0, '02-Nov-2021 04:43:14 PM by ringga'),
(172, 'Hasna Haznur', '20-4658', 0, '02-Nov-2021 04:43:25 PM by ringga'),
(173, 'Nabila Dea Alifia', '21-4950', 0, '02-Nov-2021 04:43:36 PM by ringga'),
(174, 'Andi Suseno', '01-0433', 0, '02-Nov-2021 04:43:48 PM by ringga'),
(175, 'Muhammad Ridho', '21-4836', 0, '02-Nov-2021 04:44:00 PM by ringga'),
(176, 'Ringga Septia Pribadi', '21-4917', 0, '02-Nov-2021 04:44:12 PM by ringga'),
(177, 'Wijeh Prastiyo', '18-4311', 0, '02-Nov-2021 04:44:35 PM by ringga'),
(178, 'Hidayat', '21-4800', 0, '02-Nov-2021 04:44:45 PM by ringga'),
(180, 'Jumadil Ilham ', '21-4909', 0, '02-Nov-2021 04:45:09 PM by ringga'),
(181, 'Lastri Sri Untari', '00-0296', 0, '02-Nov-2021 04:45:59 PM by ringga'),
(182, 'Kurnia wati ', '19-4378', 0, '02-Nov-2021 04:46:14 PM by ringga'),
(183, 'Yunita Sahari', '20-4571', 0, '02-Nov-2021 04:46:24 PM by ringga'),
(184, 'Ronika Tamba', '20-4754', 0, '02-Nov-2021 04:46:37 PM by ringga'),
(185, 'Ajeng Puspa Sari', '20-4716', 0, '02-Nov-2021 04:47:01 PM by ringga'),
(186, 'Dewi Arista Ulfa', '21-4798', 0, '02-Nov-2021 04:47:13 PM by ringga'),
(187, 'Asmauliddiah Nur Hamzah', '21-4799', 0, '02-Nov-2021 04:47:28 PM by ringga'),
(188, 'Limiati Novtiana', '21-4901', 0, '02-Nov-2021 04:47:39 PM by ringga'),
(189, 'Romaden Tamba ', '18-4322', 0, '02-Nov-2021 04:48:11 PM by ringga'),
(190, 'Kepin', '20-4566', 0, '02-Nov-2021 04:48:22 PM by ringga'),
(191, 'Trimiyati', '20-4704', 5, '02-Nov-2021 04:48:33 PM by ringga'),
(192, 'Robert Simanjuntak', '20-4727', 0, '02-Nov-2021 04:48:45 PM by ringga'),
(193, 'Kharis Nasukha', '21-4803', 0, '02-Nov-2021 04:48:57 PM by ringga'),
(194, 'Yanto', '99-0172', 0, '02-Nov-2021 04:49:27 PM by ringga'),
(195, 'Restu Fajar Pamungkas', '19-4523', 0, '02-Nov-2021 04:49:41 PM by ringga'),
(196, 'Rexi Subagja', '20-4656', 0, '02-Nov-2021 04:49:54 PM by ringga'),
(197, 'Novebri Tri Vani', '20-4771', 0, '02-Nov-2021 04:50:06 PM by ringga'),
(198, 'Dimas Ferri Setiawan', '21-4802', 0, '02-Nov-2021 04:50:19 PM by ringga'),
(199, 'Mujiono', '21-4815', 0, '02-Nov-2021 04:50:32 PM by ringga'),
(200, 'Ruth Winarti Saragih', '21-4839', 0, '02-Nov-2021 04:50:46 PM by ringga'),
(201, 'Dewi Sartika', '21-4921', 0, '02-Nov-2021 04:50:56 PM by ringga'),
(202, 'Mishari', '4238', 0, '02-Nov-2021 04:51:06 PM by ringga'),
(203, 'Hermanto', '4357', 0, '02-Nov-2021 04:51:18 PM by ringga'),
(204, 'Jimmy P.', '13', 0, '02-Nov-2021 04:51:30 PM by ringga'),
(205, 'Eka Sulastono', '37', 0, '02-Nov-2021 04:51:42 PM by ringga'),
(206, 'Adi Susri', '39', 0, '02-Nov-2021 04:51:54 PM by ringga'),
(207, 'Sentosa', '50', 0, '02-Nov-2021 04:52:05 PM by ringga');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_web`
--
ALTER TABLE `admin_web`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `app_company`
--
ALTER TABLE `app_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hadiah_undia`
--
ALTER TABLE `hadiah_undia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list_patrol`
--
ALTER TABLE `list_patrol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `list_visitor`
--
ALTER TABLE `list_visitor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qr_code` (`qr_code`);

--
-- Indexes for table `mas_aksesmenu`
--
ALTER TABLE `mas_aksesmenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `mas_menu`
--
ALTER TABLE `mas_menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mas_qr_location`
--
ALTER TABLE `mas_qr_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mas_submenu`
--
ALTER TABLE `mas_submenu`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `menu_id` (`menu_id`) USING BTREE;

--
-- Indexes for table `mas_user_location`
--
ALTER TABLE `mas_user_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mas_user_scan`
--
ALTER TABLE `mas_user_scan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblweb_privilege`
--
ALTER TABLE `tblweb_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_app`
--
ALTER TABLE `user_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD KEY `id_user` (`bet_id`) USING BTREE;

--
-- Indexes for table `user_undian`
--
ALTER TABLE `user_undian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bet_id` (`bet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_company`
--
ALTER TABLE `app_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hadiah_undia`
--
ALTER TABLE `hadiah_undia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `list_patrol`
--
ALTER TABLE `list_patrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `list_visitor`
--
ALTER TABLE `list_visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `mas_aksesmenu`
--
ALTER TABLE `mas_aksesmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mas_menu`
--
ALTER TABLE `mas_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mas_qr_location`
--
ALTER TABLE `mas_qr_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `mas_submenu`
--
ALTER TABLE `mas_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mas_user_location`
--
ALTER TABLE `mas_user_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2456;

--
-- AUTO_INCREMENT for table `mas_user_scan`
--
ALTER TABLE `mas_user_scan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblweb_privilege`
--
ALTER TABLE `tblweb_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_app`
--
ALTER TABLE `user_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_undian`
--
ALTER TABLE `user_undian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
