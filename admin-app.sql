-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2021 at 11:12 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

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
(2, '04-Nov-2021', 'PT Etowa Packaging Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `hadiah_undia`
--

CREATE TABLE `hadiah_undia` (
  `id` int(11) NOT NULL,
  `barang` text DEFAULT NULL,
  `create` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(24, 'selesai', 'master', '2021-11-02 08:54', 'JJSKKSKKKSKKSKS', 'facf afasdf', 'fadsfadf', '1635818135', '1635818166', '02-Nov-2021 08:54:43 AM By ringga', NULL),
(37, 'berjalan', 'ringga septia pribadi', '2021-11-24 11:16', 'sbQeHWxZBtjNvSlodYOr', 'facf afasdf', 'sdsfs adf adf', '1637723785', NULL, '24-Nov-2021 10:16:19 AM By master', NULL),
(38, 'plan', 'dasda', '2021-11-25 00:16', 'iLzxVJFmPnDOukXcMETB', 'adfa', 'fadsfadf', NULL, NULL, '24-Nov-2021 10:16:52 AM By master', NULL),
(39, 'selesai', 'ringga septia pribadi', '2021-11-25 16:00', 'QdHZjeYOglBLaskIJEzc', ' kunjungan', 'on time ', '1637827923', '1637827959', '25-Nov-2021 03:01:56 PM By master', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mas_absen_etowa`
--

CREATE TABLE `mas_absen_etowa` (
  `id` int(11) NOT NULL,
  `id_bet` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mas_absen_etowa`
--

INSERT INTO `mas_absen_etowa` (`id`, `id_bet`, `date`, `time`) VALUES
(20, '21-4617', '26-11-2021 15:00:58', '1637913658'),
(21, '21-4617', '26-11-2021 15:07:21', '1637914041'),
(22, '4531', '26-11-2021 16:13:21', '1637918001'),
(23, '39', '26-11-2021 16:45:05', '1637919905');

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
(5, 'adminUndia', 5),
(6, 'admin', 6);

-- --------------------------------------------------------

--
-- Table structure for table `mas_failed_for_finger`
--

CREATE TABLE `mas_failed_for_finger` (
  `id` int(11) NOT NULL,
  `id_bet` varchar(50) DEFAULT NULL,
  `stts` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mas_failed_for_finger`
--

INSERT INTO `mas_failed_for_finger` (`id`, `id_bet`, `stts`, `keterangan`, `date`) VALUES
(1, '21-4617', 'dfadfadfa', 'keluar', '2021-11-24 16:51:20'),
(2, '21-4617', 'keluar', 'dfadfadfa', '2021-11-24 16:53:53'),
(3, '21-4617', 'masuk', 'dfadfadfa', '2021-11-25 08:41:13'),
(4, '21-4617', 'keluar', 'dfadfadfa', '2021-11-25 08:41:22'),
(5, 'it-2021', 'keluar', 'gdudhdhshhdg', '2021-11-25 08:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `mas_late_user`
--

CREATE TABLE `mas_late_user` (
  `id` int(11) NOT NULL,
  `id_bet` varchar(50) DEFAULT NULL,
  `id_shift` int(11) DEFAULT NULL,
  `stts` int(1) DEFAULT NULL,
  `alasan` text DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mas_late_user`
--

INSERT INTO `mas_late_user` (`id`, `id_bet`, `id_shift`, `stts`, `alasan`, `date`, `time`) VALUES
(41, '21-4617', 2, 1, NULL, '2021-11-10 16:40:54', '1636537254'),
(42, '21-4617', 2, 1, NULL, '2021-11-11 08:33:05', '1636594385'),
(43, '21-4617', 2, 1, NULL, '2021-11-12 08:12:44', '1636679564'),
(45, '21-4617', 2, 1, NULL, '2021-11-22 08:12:49', '1637543569'),
(47, '21-4617', 2, 2, 'gauhssb', '2021-11-22 15:17:07', '1637569027'),
(48, '21-4617', 2, 2, 'gsgsga', '2021-11-23 08:43:39', '1637631819'),
(49, '21-4617', 2, 1, 'fcdx', '2021-11-23 08:47:49', '1637632069'),
(50, '21-4617', 2, 1, 'vsjsv', '2021-11-24 10:53:38', '1637726018');

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
(5, 'undia', 'security', 'fa-random', 'true'),
(6, 'Izin', 'security', 'fa-user-check', 'true');

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
(22, 'QR-001-L7', NULL, '<b>doc</b><p></p>', 'CP1 Keran air area LOT-7', 7, ', ', '01-Nov-2021 11:03:04 AM', '25-Nov-2021 03:01:11 PM By master'),
(23, 'QR-002-L1', NULL, 'doc tes app\r\n\r\nhkasdf\r\n', 'CP2 Motor park area LOT-7', 7, ', ', '01-Nov-2021 11:05:02 AM', '24-Nov-2021 11:10:00 AM By master'),
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
-- Table structure for table `mas_shift`
--

CREATE TABLE `mas_shift` (
  `id` int(11) NOT NULL,
  `shift` varchar(50) DEFAULT NULL,
  `masuk` varchar(50) DEFAULT NULL,
  `keluar` varchar(50) DEFAULT NULL,
  `m_rest` varchar(50) DEFAULT NULL,
  `s_rest` varchar(50) DEFAULT NULL,
  `create` varchar(50) DEFAULT NULL,
  `update` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mas_shift`
--

INSERT INTO `mas_shift` (`id`, `shift`, `masuk`, `keluar`, `m_rest`, `s_rest`, `create`, `update`) VALUES
(2, 'Production VF/GP/QA/Engg (shift 1)', '06:00', '15:00', '11:00', '12:00', '2021-Nov-10 10:30:22 AM master', '2021-Nov-25 02:59:57 PM by master'),
(3, 'Production VF/GP/QA/Engg (shift 2)', '15:00', '00:00', '19:00', '20:00', '2021-Nov-10 10:31:46 AM by master', '2021-Nov-22 02:25:29 PM by master'),
(5, 'Production VF/GP/QA/Engg (shift 3)', '00:00', '08:00', '04:00', '05:00', '2021-Nov-22 10:19:49 AM by master', '2021-Nov-22 02:26:04 PM by master');

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
(11, 5, 'user X hadia', 'home/user_mendapat', 'true'),
(12, 5, 'User Scan', 'home/user_scan', 'true'),
(13, 6, 'Izin User', 'admin/izin', 'true'),
(14, 6, 'Late Users', 'admin/late_user', 'true'),
(15, 1, 'Shift', 'admin/shift', 'true'),
(16, 4, 'failed for finger', 'admin/failed_for_finger', 'true'),
(17, 4, 'Absen User Etowa', 'admin/absen_user_etowa', 'true');

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
(25, 'it-2021', '1637733803', '1637724332', 'lot1', 'lot 6', '2021-11-24'),
(26, '21-4617', '1637724387', '1637724379', 'lot1', 'lot 6', '2021-11-24'),
(27, '21-4617', '1637724842', '1637724740', 'lot 7', 'lot 1', '2021-11-24');

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
  `created_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_app`
--

INSERT INTO `user_app` (`id`, `name`, `id_bet`, `email`, `no_phone`, `devisi`, `password`, `image`, `enable_login`, `created`, `created_by`, `update_by`) VALUES
(5, 'tes', '21-4617', 'tes@gmail.com', '67456747', 'security', '$2y$10$nXT6l7uV8JZKL4ld/SUkt..o1wXFXAopneA06GfF2i0ruYI1Wc7g2', 'user.jpg', 1, '2021-09-01 12:02:14 PM', 'user', NULL),
(16, 'tes 2', 'it-2021', 'tes2@gmail.com', '08228462115221', 'IT', '$2y$10$ZHrA6G/h0YQzIxeBup7WXO1muipZHthThm1udk9vuVlXENQuDCbga', 'user.jpg', 1, '2021-Nov-12 11:28:43 AM', 'master', '2021-Nov-25 02:58:32 PM By master'),
(101, 'ringga septia pribadi', '4531', 'admin@gmail.com', '082284621151', 'PRODUCTION', '$2y$10$0HTUELw972eWI0WLsM0Nn.3n0qHQWfUe6ObpbopNrC4D5NT2uGIF2', 'user.jpg', 1, '2021-Nov-26 04:09:45 PM', 'master', NULL),
(102, 'Siff Siang', '39', 'ringgamungo97@gmail.com', '08228462115789789', 'PLANNER', '$2y$10$dNB8fCOoSpb6z5pYFcOuX.FW8ZpsJ6aSo.yN/hO04n52SUdsiM7dG', 'user.jpg', 1, '2021-Nov-26 04:44:49 PM', 'master', NULL);

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
('5', '2y10HbDmvj3QVOaRzlUHipueKu4obP2hjfO5qfNCBqqjOpPZoyC8Hu1S', '1637901491', NULL),
('15', '2y10dYtoTWeKyq40UzcwkfINNOJTTQt6aO2brAr7AoLC2X6eJl7fFWYRO', '1637901491', NULL),
('16', '2y10jGp0xhmxaiDcFLT9vvjAu8ufRtgh1LXACfJ0tT2DynHkeWKubxi', '1637901491', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_undian`
--

CREATE TABLE `user_undian` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `bet_id` varchar(50) DEFAULT NULL,
  `hadiah` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `create` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_undian`
--

INSERT INTO `user_undian` (`id`, `name`, `bet_id`, `hadiah`, `is_active`, `create`) VALUES
(1, 'ringga2', 'it-2021', 0, 0, '1637806426'),
(2, 'ringga septia pribadi', '21-21121', 0, 1, '25-Nov-2021 03:05:59 PM by admin'),
(3, 'tes', '21-4617', 0, 1, '1637910081'),
(4, 'ringga septia pribadi', '4531', 0, 1, '1637917798');

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
-- Indexes for table `mas_absen_etowa`
--
ALTER TABLE `mas_absen_etowa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bet` (`id_bet`);

--
-- Indexes for table `mas_aksesmenu`
--
ALTER TABLE `mas_aksesmenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `mas_failed_for_finger`
--
ALTER TABLE `mas_failed_for_finger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mas_late_user`
--
ALTER TABLE `mas_late_user`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `mas_shift`
--
ALTER TABLE `mas_shift`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hadiah_undia`
--
ALTER TABLE `hadiah_undia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `list_patrol`
--
ALTER TABLE `list_patrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `list_visitor`
--
ALTER TABLE `list_visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `mas_absen_etowa`
--
ALTER TABLE `mas_absen_etowa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mas_aksesmenu`
--
ALTER TABLE `mas_aksesmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mas_failed_for_finger`
--
ALTER TABLE `mas_failed_for_finger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mas_late_user`
--
ALTER TABLE `mas_late_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

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
-- AUTO_INCREMENT for table `mas_shift`
--
ALTER TABLE `mas_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mas_submenu`
--
ALTER TABLE `mas_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mas_user_location`
--
ALTER TABLE `mas_user_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2456;

--
-- AUTO_INCREMENT for table `mas_user_scan`
--
ALTER TABLE `mas_user_scan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblweb_privilege`
--
ALTER TABLE `tblweb_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_app`
--
ALTER TABLE `user_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `user_undian`
--
ALTER TABLE `user_undian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
