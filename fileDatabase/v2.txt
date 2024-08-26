-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2024 at 05:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mytest`
--

-- --------------------------------------------------------

--
-- Table structure for table `basket_tb`
--

CREATE TABLE `basket_tb` (
  `basket_id` int(11) NOT NULL,
  `set_promotion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `storeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `basket_tb`
--

INSERT INTO `basket_tb` (`basket_id`, `set_promotion_id`, `user_id`, `storeId`) VALUES
(21, 43, 38, 96),
(22, 35, 38, 95),
(23, 35, 34, 95),
(24, 43, 34, 96),
(25, 44, 38, 96),
(26, 41, 38, 96),
(27, 45, 38, 96);

-- --------------------------------------------------------

--
-- Table structure for table `compostore_tb`
--

CREATE TABLE `compostore_tb` (
  `compostore_id` int(11) NOT NULL,
  `compostore_name` varchar(20) NOT NULL,
  `compo_status_id` int(11) NOT NULL,
  `storeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `compostore_tb`
--

INSERT INTO `compostore_tb` (`compostore_id`, `compostore_name`, `compo_status_id`, `storeId`) VALUES
(12, 'A1', 1, 96),
(13, 'A2', 1, 96),
(14, 'A3', 1, 96),
(15, 'A4', 1, 96),
(16, 'A5', 1, 96),
(17, 'A6', 2, 96),
(20, 'A7', 1, 96),
(26, '101', 2, 95),
(27, '102', 1, 95);

-- --------------------------------------------------------

--
-- Table structure for table `compo_status_tb`
--

CREATE TABLE `compo_status_tb` (
  `compo_status_id` int(11) NOT NULL,
  `compo_status_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `compo_status_tb`
--

INSERT INTO `compo_status_tb` (`compo_status_id`, `compo_status_name`) VALUES
(1, 'ว่าง'),
(2, 'ไม่ว่าง');

-- --------------------------------------------------------

--
-- Table structure for table `menu_data_tb`
--

CREATE TABLE `menu_data_tb` (
  `menu_data_id` int(11) NOT NULL,
  `menu_detail_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_data_tb`
--

INSERT INTO `menu_data_tb` (`menu_data_id`, `menu_detail_data`) VALUES
(28, 'หวานน้อย'),
(29, 'ไม่มี'),
(30, 'ไม่มี, เส้นหมี่, เส้นเหลือง'),
(31, 'ไม่มี'),
(32, 'ไม่มี'),
(33, 'ไม่มี'),
(34, 'ไม่มี'),
(35, 'ไม่มี'),
(36, 'ไม่มี'),
(37, 'ไม่มี'),
(38, 'ไม่มี'),
(39, 'ไม่มี'),
(40, 'ไม่มี'),
(41, 'ไม่มี, หวานน้อย'),
(42, 'ไม่มี'),
(43, 'ไม่มี'),
(44, 'ไม่มี'),
(45, 'ไม่มี'),
(46, 'ไม่มี'),
(47, 'ไม่มี'),
(48, 'ไม่มี'),
(49, 'ไม่มี, หวานน้อย'),
(50, 'ไม่มี'),
(51, 'ไม่มี'),
(52, 'ไม่มี'),
(53, 'ไม่มี'),
(54, 'ไม่มี'),
(55, 'ไม่มี'),
(56, 'ไม่มี'),
(57, 'ไม่มี'),
(58, 'ไม่มี'),
(59, 'ไม่มี'),
(60, 'ไม่มี, เส้นซือดะ, เส้นหมี่'),
(61, 'ไม่มี'),
(62, 'ไม่มี'),
(63, 'ไม่มี, หวานน้อย'),
(64, 'ไม่มี, เส้นเหลือง, เส้นหมี่'),
(65, 'ไม่มี'),
(66, 'ไม่มี'),
(67, 'ไม่มี'),
(68, 'ไม่มี'),
(69, 'ไม่มี'),
(70, 'ไม่มี'),
(71, 'ไม่มี, หวานน้อย'),
(72, 'ไม่มี, หวานน้อย'),
(73, 'ไม่มี, เส้นซือดะ, เส้นหมี่, เส้นเหลือง'),
(74, 'ไม่มี'),
(75, 'ไม่มี'),
(76, 'ไม่มี, เส้นซือดะ, เส้นหมี่'),
(77, 'ไม่มี, หวานน้อย'),
(78, 'ไม่มี, เส้นซือดะ, เส้นหมี่'),
(79, 'ไม่มี, เส้นซือดะ, เส้นหมี่'),
(80, 'ไม่มี'),
(81, 'ไม่มี'),
(82, 'ไม่มี'),
(83, 'ไม่มี'),
(84, 'ไม่มี'),
(85, 'ไม่มี, หวานน้อย'),
(86, 'ไม่มี'),
(87, 'ไม่มี'),
(88, 'ไม่มี'),
(89, 'ไม่มี'),
(90, 'ไม่มี'),
(91, 'ไม่มี'),
(92, 'ไม่มี, เส้นหมี่, เส้นซือดะ'),
(93, 'ไม่มี'),
(94, 'ไม่มี, เส้นซือดะ, เส้นหมี่'),
(95, 'ไม่มี'),
(96, 'ไม่มี'),
(97, 'ไม่มี'),
(98, 'ไม่มี'),
(99, 'ไม่มี'),
(100, 'ไม่มี'),
(101, 'ไม่มี'),
(102, 'ไม่มี'),
(103, 'ไม่มี'),
(104, 'ไม่มี, เส้นซือดะ, เส้นหมี่'),
(105, 'ไม่มี'),
(106, 'ไม่มี'),
(107, 'ไม่มี'),
(108, 'ไม่มี'),
(109, 'ไม่มี'),
(110, 'ไม่มี'),
(111, 'ไม่มี'),
(112, 'ไม่มี'),
(113, 'ไม่มี'),
(114, 'ไม่มี'),
(115, 'ไม่มี'),
(116, 'ไม่มี'),
(117, 'ไม่มี'),
(118, 'ไม่มี'),
(119, 'ไม่มี'),
(120, 'ไม่มี'),
(121, 'ไม่มี'),
(122, 'ไม่มี'),
(123, 'ไม่มี'),
(124, 'ไม่มี'),
(125, 'ไม่มี'),
(126, 'ไม่มี'),
(127, 'ไม่มี'),
(128, 'ไม่มี, หวานน้อย'),
(129, 'ไม่มี'),
(130, 'ไม่มี, หวานน้อย'),
(131, 'ไม่มี'),
(132, 'ไม่มี, หวานน้อย'),
(133, 'ไม่มี, เส้นซือดะ, เส้นหมี่'),
(134, 'ไม่มี'),
(135, 'ไม่มี'),
(136, 'ไม่มี'),
(137, 'ไม่มี'),
(138, 'ไม่มี'),
(139, 'ไม่มี'),
(140, 'ไม่มี'),
(141, 'ไม่มี'),
(142, 'ไม่มี'),
(143, 'ไม่มี'),
(144, 'ไม่มี'),
(145, 'ไม่มี'),
(146, 'ไม่มี'),
(147, 'ไม่มี'),
(148, 'ไม่มี'),
(149, 'ไม่มี'),
(150, 'ไม่มี'),
(151, 'ไม่มี'),
(152, 'ไม่มี'),
(153, 'ไม่มี'),
(154, 'ไม่มี'),
(155, 'ไม่มี');

-- --------------------------------------------------------

--
-- Table structure for table `menu_detail_tb`
--

CREATE TABLE `menu_detail_tb` (
  `menu_detail_id` int(11) NOT NULL,
  `menu_detail_name` varchar(50) NOT NULL,
  `product_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_detail_tb`
--

INSERT INTO `menu_detail_tb` (`menu_detail_id`, `menu_detail_name`, `product_type_id`) VALUES
(5, 'เส้นใหญ่', 24),
(6, 'เส้นเล็ก', 24),
(7, 'เส้นหยก', 24),
(8, 'เส้นเหลือง', 24),
(9, 'เส้นหมี่', 24),
(10, 'เส้นซือดะ', 24),
(16, 'หวานปกติ', 25),
(17, 'หวานน้อย', 25),
(18, 'หวานปกติ', 26),
(19, 'หวานน้อย', 26);

-- --------------------------------------------------------

--
-- Table structure for table `mulimagestb`
--

CREATE TABLE `mulimagestb` (
  `mulimagesId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `mulimages` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mulimagestb`
--

INSERT INTO `mulimagestb` (`mulimagesId`, `storeId`, `mulimages`) VALUES
(33, 95, 'mulimages-1720928558158-409528001.jpg,mulimages-1720928558162-287524989.jpg,mulimages-1720928558164-762364135.jpg,mulimages-1720928558166-339106186.jpg,mulimages-1720928558168-774510661.jpg,mulimages-1720928558169-805687114.jpg,mulimages-1720928558170-589540675.jpg,mulimages-1720928558172-584689355.jpg,mulimages-1720928558173-384427116.jpg'),
(34, 96, 'mulimages-1721294138288-907160953.jpg,mulimages-1721294138304-136797879.jpg,mulimages-1721294138317-817047847.jpg,mulimages-1721294138342-306615560.jpg,mulimages-1721294138347-712548871.jpg,mulimages-1721294138347-894299401.png,mulimages-1721294138397-195035146.png'),
(35, 97, 'mulimages-1723389671799-295990075.jpg,mulimages-1723389671809-708085094.jpg,mulimages-1723389671817-36737081.jpg,mulimages-1723389671822-243488969.jpg,mulimages-1723389671827-39033204.jpg,mulimages-1723389671831-279875569.jpg,mulimages-1723389671843-780021613.jpg,mulimages-1723389671846-8365930.jpg,mulimages-1723389671851-586007276.jpg,mulimages-1723389671853-999755314.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oder_tb`
--

CREATE TABLE `oder_tb` (
  `oder_id` int(11) NOT NULL,
  `set_promotion_id` int(11) NOT NULL,
  `totalprice` double NOT NULL,
  `puchaseoder_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `oder_amount` int(11) NOT NULL,
  `price` double NOT NULL,
  `price_setpro` double NOT NULL,
  `menu_data_id` int(11) NOT NULL,
  `purchasetype_id` int(11) NOT NULL,
  `order_detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oder_tb`
--

INSERT INTO `oder_tb` (`oder_id`, `set_promotion_id`, `totalprice`, `puchaseoder_id`, `order_status_id`, `oder_amount`, `price`, `price_setpro`, `menu_data_id`, `purchasetype_id`, `order_detail`) VALUES
(152, 44, 69, 157, 1, 1, 69, 62.1, 102, 2, ''),
(153, 45, 39, 157, 1, 1, 39, 35.1, 103, 2, ''),
(154, 44, 69, 158, 1, 1, 69, 62.1, 104, 2, ''),
(155, 45, 39, 157, 1, 1, 39, 35.1, 105, 2, ''),
(156, 35, 125, 159, 1, 1, 125, 100, 106, 2, ''),
(157, 44, 69, 160, 1, 1, 69, 62.1, 107, 2, ''),
(158, 43, 30, 161, 1, 1, 30, 27, 108, 2, ''),
(159, 43, 30, 162, 1, 1, 30, 27, 109, 2, ''),
(160, 41, 150, 162, 1, 5, 30, 120, 110, 2, ''),
(161, 45, 39, 162, 1, 1, 39, 35.1, 111, 2, ''),
(162, 43, 30, 163, 1, 1, 30, 27, 112, 1, ''),
(163, 42, 345, 163, 1, 5, 69, 276, 113, 2, ''),
(164, 45, 39, 163, 1, 1, 39, 35.1, 114, 2, ''),
(165, 42, 345, 163, 1, 5, 69, 276, 115, 2, ''),
(166, 35, 125, 159, 1, 1, 125, 100, 116, 2, ''),
(167, 42, 345, 163, 1, 5, 69, 276, 117, 2, ''),
(168, 42, 345, 164, 1, 5, 69, 276, 118, 2, ''),
(169, 42, 345, 164, 1, 5, 69, 276, 119, 2, ''),
(170, 45, 39, 164, 1, 1, 39, 35.1, 120, 2, ''),
(171, 43, 30, 165, 1, 1, 30, 27, 121, 2, ''),
(172, 43, 30, 165, 1, 1, 30, 27, 122, 1, ''),
(173, 44, 69, 165, 1, 1, 69, 62.1, 123, 2, ''),
(174, 45, 39, 165, 1, 1, 39, 35.1, 124, 2, ''),
(175, 41, 150, 165, 1, 5, 30, 120, 125, 2, ''),
(176, 35, 125, 159, 1, 1, 125, 100, 126, 2, ''),
(177, 45, 39, 165, 1, 1, 39, 35.1, 127, 2, ''),
(178, 45, 39, 166, 1, 1, 39, 35.1, 128, 2, ''),
(179, 42, 345, 166, 1, 5, 69, 276, 129, 2, ''),
(180, 45, 39, 167, 1, 1, 39, 35.1, 130, 1, ''),
(181, 44, 69, 167, 1, 1, 69, 62.1, 131, 2, ''),
(182, 45, 39, 168, 1, 1, 39, 35.1, 132, 2, ''),
(183, 44, 69, 168, 1, 1, 69, 62.1, 133, 2, ''),
(184, 45, 39, 167, 1, 1, 39, 35.1, 134, 2, ''),
(185, 42, 345, 169, 1, 5, 69, 276, 135, 2, ''),
(186, 44, 69, 169, 1, 1, 69, 62.1, 136, 2, ''),
(187, 45, 39, 169, 1, 1, 39, 35.1, 137, 2, ''),
(188, 45, 39, 169, 1, 1, 39, 35.1, 138, 2, ''),
(189, 42, 345, 169, 1, 5, 69, 276, 139, 2, ''),
(190, 42, 345, 169, 1, 5, 69, 276, 140, 2, ''),
(191, 41, 150, 169, 1, 5, 30, 120, 141, 2, ''),
(192, 35, 125, 159, 1, 1, 125, 100, 142, 2, ''),
(193, 35, 125, 159, 1, 1, 125, 100, 143, 2, ''),
(194, 45, 39, 169, 1, 1, 39, 35.1, 144, 2, ''),
(195, 44, 69, 168, 1, 1, 69, 62.1, 145, 2, ''),
(196, 45, 39, 169, 1, 1, 39, 35.1, 146, 2, ''),
(197, 44, 69, 169, 1, 1, 69, 62.1, 147, 2, ''),
(198, 43, 30, 169, 1, 1, 30, 27, 148, 2, ''),
(199, 42, 345, 169, 1, 5, 69, 276, 149, 2, ''),
(200, 42, 345, 169, 1, 5, 69, 276, 150, 2, ''),
(201, 43, 30, 169, 1, 1, 30, 27, 151, 2, ''),
(202, 44, 69, 169, 1, 1, 69, 62.1, 152, 2, ''),
(203, 41, 150, 169, 1, 5, 30, 120, 153, 2, ''),
(204, 44, 69, 170, 1, 1, 69, 62.1, 154, 2, ''),
(205, 44, 69, 170, 1, 1, 69, 62.1, 155, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `order_status_tb`
--

CREATE TABLE `order_status_tb` (
  `order_status_id` int(11) NOT NULL,
  `order_status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status_tb`
--

INSERT INTO `order_status_tb` (`order_status_id`, `order_status_name`) VALUES
(1, 'รอดำเนินการ'),
(2, 'กำลังทำการ'),
(3, 'เสร็จสิน'),
(4, 'ยกเลิก');

-- --------------------------------------------------------

--
-- Table structure for table `product_tb`
--

CREATE TABLE `product_tb` (
  `product_id` int(11) NOT NULL,
  `images` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `cost_price` double NOT NULL,
  `status_id` int(11) NOT NULL,
  `storeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_tb`
--

INSERT INTO `product_tb` (`product_id`, `images`, `name`, `product_type_id`, `description`, `price`, `cost_price`, `status_id`, `storeId`) VALUES
(52, '[\"1721377454490-448801346_122126630420295119_1243002090067292197_n.jpg\",\"1721377454508-448862081_122126630630295119_7796248809294704641_n.jpg\",\"1721377454517-448969810_122126630480295119_5081463528659479626_n.jpg\",\"1721377454521-449205166_122126630372295119_568937457661706315_n.jpg\",\"1721377454524-450143097_122130497102295119_2765937707034636185_n.jpg\"]', 'ก๋วยเตี๋ยวเรือ', 19, 'เป็นชบาก๋วยเตี๋ยวเรือโคขุน ที่เป็นจานเริ้มต้น', 69, 45, 1, 95),
(53, '[\"1720929519240-449134258_122126630144295119_3838002069213322239_n.jpg\"]', 'ก๋วยเตี๋ยวเรือหม้อไฟ', 19, 'ก๋วยเตี๋ยวเรือหม้อไฟ ผสมความเร้าร้อน', 125, 70, 1, 95),
(54, '[\"1720929642153-448801346_122126630420295119_1243002090067292197_n.jpg\"]', 'ก๋วยเตี๋ยวเรือเนื้อตุ่น', 19, 'ก๋วยเตี๋ยวเรือเนื้อตุ่น ใช้เนื้อวัวที่ทำให้เป็นเนื้อตุ่นละหมุนสุดๆๆ', 79, 60, 1, 95),
(55, '[\"1720929705769-448923189_122126630912295119_2861264922586437175_n.jpg\"]', 'ลูกชิ้นเนื้อ', 21, 'ลูกชิ้น', 39, 26, 1, 95),
(60, '[\"1721835291387-448801346_122126630420295119_1243002090067292197_n.jpg\",\"1721835291388-448969810_122126630480295119_5081463528659479626_n.jpg\",\"1721835291400-449205166_122126630372295119_568937457661706315_n.jpg\"]', 'ก๋วยเตี๋ยวเรือเนื้อตุ่น', 24, '-', 69, 45, 1, 96),
(61, '[\"1721835345220-448839715_122126630702295119_8937907371728746422_n.jpg\",\"1721835345222-448840487_122126631122295119_1947131496344411691_n.jpg\",\"1721835345224-448971279_122126630768295119_5497336802048359524_n.jpg\"]', 'ทับทิมกรอบ', 23, '-', 30, 15, 1, 96),
(62, '[\"1722675445377-images.jpg\"]', 'น้ำโกโก้', 26, '-', 39, 15, 1, 96);

-- --------------------------------------------------------

--
-- Table structure for table `product_type_tb`
--

CREATE TABLE `product_type_tb` (
  `product_type_id` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `product_type_name` varchar(255) NOT NULL,
  `product_type_image` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_type_tb`
--

INSERT INTO `product_type_tb` (`product_type_id`, `storeId`, `product_type_name`, `product_type_image`, `description`) VALUES
(19, 95, 'ก๋วยเตี๋ยวเรือ', '1720928906441-450143097_122130497102295119_2765937707034636185_n.jpg', 'ก๋วยเตี๋ยวเรือเป็นอาหารไทยที่มีต้นกำเนิดจากการขายบนเรือ เป็นก๋วยเตี๋ยวที่มีน้ำซุปเข้มข้น ปรุงด้วยเลือดหมูหรือวัว และเครื่องเทศหลากหลาย'),
(20, 95, 'ของทานเล่น', '1720929084274-449142817_122126630810295119_8160619072358601747_n.jpg', 'เป็นของเอาใว้ทานเล่น เช่น ลูกชิ้น ของกินเล่น'),
(21, 95, 'ท็อปปิ้ง', '1720929159972-448923189_122126630912295119_2861264922586437175_n.jpg', 'ส่วนประกอบเพิ่มเติมที่ใส่หรือโรยบนอาหารเพื่อเพิ่มรสชาติ เนื้อสัมผัส หรือความน่าสนใจให้กับอาหารนั้นๆ '),
(22, 95, 'ของหวาน', '1720929794558-448839715_122126630702295119_8937907371728746422_n.jpg', 'เป็นของที่ทำให้สดชืน'),
(23, 96, 'ของหวาน', '1721294328107-448839715_122126630702295119_8937907371728746422_n.jpg', ''),
(24, 96, 'ก๋วยเตี๋ยวเรือ', '1721295033262-448801346_122126630420295119_1243002090067292197_n.jpg', '-'),
(25, 96, 'เครืองดืม(เย็น)', '1722674744888-photo5_0.webp', '-'),
(26, 96, 'เครืองดืม(ร้อน)', '1722674823575-à¸à¸²à¸§à¸à¹à¹à¸«à¸¥à¸.jpg', '-');

-- --------------------------------------------------------

--
-- Table structure for table `promotions_tb`
--

CREATE TABLE `promotions_tb` (
  `promo_id` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `proimage` text NOT NULL,
  `promo_name` varchar(255) NOT NULL,
  `promo_type` int(11) NOT NULL,
  `promo_dec` text NOT NULL,
  `amountuse` int(11) NOT NULL,
  `amountgiven` int(11) NOT NULL,
  `valuegiven_id` int(11) NOT NULL,
  `amountcon` int(11) NOT NULL,
  `valuecon_id` int(11) NOT NULL,
  `startdate` varchar(255) NOT NULL,
  `enddate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions_tb`
--

INSERT INTO `promotions_tb` (`promo_id`, `storeId`, `proimage`, `promo_name`, `promo_type`, `promo_dec`, `amountuse`, `amountgiven`, `valuegiven_id`, `amountcon`, `valuecon_id`, `startdate`, `enddate`) VALUES
(97, 95, '1720930390603.png', 'ลด 20 % ถ้าเป็นสมาชิกของ charba', 1, 'เป็นสวนลดสำหรับลูกค้า charbar', 1000, 20, 3, 1, 1, '7/14/2024', '11/30/2024'),
(98, 95, '1720931386735.png', 'ซื้อ 4 เเถม 1', 2, 'เป็นโปรโมชั่น เเบบเเถม', -1, 1, 1, 4, 1, '7/14/2024', '4/5/2025'),
(99, 96, '1721294800204.png', 'ลด 10 %', 1, '-', 1000, 10, 3, 1, 1, '7/1/2024', '6/1/2024'),
(100, 96, '1721295499122.png', '4 เเถม 1', 2, '-', 5000, 1, 1, 4, 1, '7/18/2024', '8/3/2024');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_type`
--

CREATE TABLE `promotion_type` (
  `promo_type_id` int(11) NOT NULL,
  `promo_type_name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion_type`
--

INSERT INTO `promotion_type` (`promo_type_id`, `promo_type_name`, `description`) VALUES
(1, 'ส่วนลด', 'คูปองที่ลูกค้าสามารถใช้เพื่อรับส่วนลดเมื่อซื้อสินค้าหรือบริการ.'),
(2, 'เเบบเเถม', 'ลูกค้าสามารถได้รับสินค้าหนึ่งเมื่อซื้อสินค้าหนึ่ง เป็นต้นอย่างไรก็ตาม, โปรโมชั่นนี้สามารถมีหลายรูปแบบ เช่น ซื้อชิ้นที่ 1 แถม 1, ซื้อ 2 แถม 1 เป็นต้น.'),
(3, 'แบบสะสมแต้ม', 'ลูกค้าสามารถนำแต้มหรือคะแนนมาแลกของรางวัล เช่น สินค้า, บริการ, หรือส่วนลด.');

-- --------------------------------------------------------

--
-- Table structure for table `puchaseoder`
--

CREATE TABLE `puchaseoder` (
  `puchaseoder_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `puchaseoder_date` varchar(20) NOT NULL,
  `puoder_status_id` int(11) NOT NULL,
  `puchaseoder_ttprice` decimal(10,2) DEFAULT NULL,
  `compostore_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `puchaseoder`
--

INSERT INTO `puchaseoder` (`puchaseoder_id`, `user_id`, `storeId`, `puchaseoder_date`, `puoder_status_id`, `puchaseoder_ttprice`, `compostore_id`) VALUES
(157, 38, 96, '2024-08-11 15:51:46', 2, 62.10, 0),
(158, 34, 96, '2024-08-11 15:53:37', 3, 62.10, 14),
(159, 38, 95, '2024-08-12 07:23:31', 1, 500.00, 0),
(160, 38, 96, '2024-08-11 16:03:10', 2, 62.10, 13),
(161, 38, 96, '2024-08-11 16:08:33', 2, 27.00, 20),
(162, 38, 96, '2024-08-11 16:11:56', 3, 27.00, 14),
(163, 38, 96, '2024-08-11 16:42:28', 3, 27.00, 0),
(164, 38, 96, '2024-08-11 16:48:07', 2, 276.00, 20),
(165, 38, 96, '2024-08-11 16:51:05', 3, 27.00, 0),
(166, 38, 96, '2024-08-11 17:13:40', 3, 35.10, 14),
(167, 38, 96, '2024-08-11 17:20:55', 2, 35.10, 0),
(168, 34, 96, '2024-08-12 07:25:10', 2, 159.30, 0),
(169, 38, 96, '2024-08-12 07:59:34', 3, 2000.70, 16),
(170, 38, 96, '2024-08-12 08:06:15', 1, 124.20, 17);

-- --------------------------------------------------------

--
-- Table structure for table `puchaseoder_status_tb`
--

CREATE TABLE `puchaseoder_status_tb` (
  `puoder_status_id` int(11) NOT NULL,
  `puoder_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `puchaseoder_status_tb`
--

INSERT INTO `puchaseoder_status_tb` (`puoder_status_id`, `puoder_status_name`) VALUES
(1, 'รอการชำระ'),
(2, 'ยกเลิก'),
(3, 'ชำระเเล้ว');

-- --------------------------------------------------------

--
-- Table structure for table `purchasetype`
--

CREATE TABLE `purchasetype` (
  `purchasetype_id` int(11) NOT NULL,
  `purchasetype_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchasetype`
--

INSERT INTO `purchasetype` (`purchasetype_id`, `purchasetype_name`) VALUES
(1, 'กลับบ้าน'),
(2, 'ที่ร้าน');

-- --------------------------------------------------------

--
-- Table structure for table `set_promotion_tb`
--

CREATE TABLE `set_promotion_tb` (
  `set_promotion_id` int(11) NOT NULL,
  `promo_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `storeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `set_promotion_tb`
--

INSERT INTO `set_promotion_tb` (`set_promotion_id`, `promo_id`, `product_id`, `storeId`) VALUES
(35, 97, 53, 95),
(36, 98, 52, 95),
(41, 100, 61, 96),
(42, 100, 60, 96),
(43, 99, 61, 96),
(44, 99, 60, 96),
(45, 99, 62, 96);

-- --------------------------------------------------------

--
-- Table structure for table `statusdetail`
--

CREATE TABLE `statusdetail` (
  `statusId` int(11) NOT NULL,
  `statusName` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statusdetail`
--

INSERT INTO `statusdetail` (`statusId`, `statusName`, `description`) VALUES
(1, 'กำลังรออนุมัติ', 'อยู่ในระหว่างกระบวนการตรวจสอบร้าน'),
(2, 'อนุมัติเเล้ว', 'คุณได้ถูกอนุมัติเป็นร้านค้าใน UProเเล้ว');

-- --------------------------------------------------------

--
-- Table structure for table `status_pd_tb`
--

CREATE TABLE `status_pd_tb` (
  `status_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status_pd_tb`
--

INSERT INTO `status_pd_tb` (`status_id`, `name`) VALUES
(1, 'สินค้ามีอยู่'),
(2, 'สินค้าหมด');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `storeId` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `logo` text NOT NULL,
  `storeName` varchar(255) NOT NULL,
  `storeType` int(11) NOT NULL DEFAULT 1,
  `storeDes` text NOT NULL,
  `style` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`storeId`, `user_id`, `logo`, `storeName`, `storeType`, `storeDes`, `style`, `province`, `phone`, `address`, `status`) VALUES
(95, 33, 'logo-1720928717049-57959911.jpg', 'ชบาก๋วยเตี๋ยวเรือโคขุน', 2, 'เป็นร้านขายก๋วยเตียว โดยใช้เนื้อวัวที่มีคุณภาพที่สุด', 'รีเลศ', 'ยะลา', '0823017299', 'ร้าน เเถว ซอย ตือเบาะ', 2),
(96, 36, 'logo-1722676879654-693054850.png', 'ก๋วยเตียวเนื้อโคขุน', 2, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'รีเลศ', 'ยะลา', '0823017299', 'G8P3+C3C ตำบล สะเตงนอก อำเภอเมืองยะลา ยะลา 95000', 2),
(97, 39, 'logo-1723389659901-715925953.webp', 'hanafee', 1, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'รีเลศ', 'ยะลา', '0823017299', '47/3 yala 95000\r\n-', 2);

-- --------------------------------------------------------

--
-- Table structure for table `storetypetb`
--

CREATE TABLE `storetypetb` (
  `storeTypeId` int(11) NOT NULL,
  `storeTypeName` varchar(200) NOT NULL,
  `desType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storetypetb`
--

INSERT INTO `storetypetb` (`storeTypeId`, `storeTypeName`, `desType`) VALUES
(1, 'ร้านบริการ', ''),
(2, 'ร้านอาหาร', ''),
(3, 'ร้านคาเฟ่', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `referral_code` varchar(255) NOT NULL,
  `referred_by` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `referral_code`, `referred_by`, `username`, `email`, `password`, `full_name`, `address`, `phone_number`, `user_type`) VALUES
(33, 'as1Nii3FJM', '', 'muhammadsamrees', '4064590015@yru.ac.th', '0123456789', 'มูฮัมหมัดซัมรี สะมะแอ', '47/3 yala 95000', '0823017299', 3),
(34, 'K4ByGc4zw8', '', 'nima', '406459004@yru.ac.th', '0123456789', 'นิมะ มะยิ', '47/3 yala 95000', '0823017299', 2),
(36, 'g7SzNZs6W0', 'as1Nii3FJM', 'imron', '40645900155@yru.ac.th', '0123456789', 'อิมรอน เเว', '47/3 yala 95000', '0823017299', 3),
(38, '9J3eptwaJn', '', 'imrons', '406459028@yru.ac.th', '0123456789', 'อิมรอน วาเลาะ', '47/3 ถ.เทศบาล9 ต.สะเตง อ.เมืองยะลา จ.ยะลา 95000', '092548626', 2),
(39, 'VjA4dx7aDp', 'as1Nii3FJM', 'hanafee', 'hanafee@gmail.com', '0123456789', 'มูฮัมหมัดซัมรี สะมะแอ', '47/3 yala 95000', '0823017299', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `user_type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`user_type_id`, `type_name`) VALUES
(1, 'admin'),
(2, 'buyer'),
(3, 'store');

-- --------------------------------------------------------

--
-- Table structure for table `valuecon_tb`
--

CREATE TABLE `valuecon_tb` (
  `valuecon_id` int(11) NOT NULL,
  `valuecon_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `valuecon_tb`
--

INSERT INTO `valuecon_tb` (`valuecon_id`, `valuecon_name`) VALUES
(1, 'ชิ้น'),
(2, 'เเต้ม'),
(3, 'บาท');

-- --------------------------------------------------------

--
-- Table structure for table `valuegiven_tb`
--

CREATE TABLE `valuegiven_tb` (
  `valuegiven_id` int(11) NOT NULL,
  `valuegiven_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `valuegiven_tb`
--

INSERT INTO `valuegiven_tb` (`valuegiven_id`, `valuegiven_name`) VALUES
(1, 'ชิ้น'),
(2, 'บาท'),
(3, '%'),
(4, 'เเต้ม');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basket_tb`
--
ALTER TABLE `basket_tb`
  ADD PRIMARY KEY (`basket_id`),
  ADD KEY `set_promotion_id` (`set_promotion_id`),
  ADD KEY `storeId` (`storeId`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `compostore_tb`
--
ALTER TABLE `compostore_tb`
  ADD PRIMARY KEY (`compostore_id`),
  ADD KEY `compo_status_id` (`compo_status_id`),
  ADD KEY `storeId` (`storeId`);

--
-- Indexes for table `compo_status_tb`
--
ALTER TABLE `compo_status_tb`
  ADD PRIMARY KEY (`compo_status_id`);

--
-- Indexes for table `menu_data_tb`
--
ALTER TABLE `menu_data_tb`
  ADD PRIMARY KEY (`menu_data_id`);

--
-- Indexes for table `menu_detail_tb`
--
ALTER TABLE `menu_detail_tb`
  ADD PRIMARY KEY (`menu_detail_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `mulimagestb`
--
ALTER TABLE `mulimagestb`
  ADD PRIMARY KEY (`mulimagesId`),
  ADD KEY `storeId` (`storeId`);

--
-- Indexes for table `oder_tb`
--
ALTER TABLE `oder_tb`
  ADD PRIMARY KEY (`oder_id`),
  ADD KEY `set_promotion_id` (`set_promotion_id`),
  ADD KEY `puchaseoder_id` (`puchaseoder_id`),
  ADD KEY `purchasetype_id` (`purchasetype_id`),
  ADD KEY `menu_data_id` (`menu_data_id`);

--
-- Indexes for table `order_status_tb`
--
ALTER TABLE `order_status_tb`
  ADD PRIMARY KEY (`order_status_id`);

--
-- Indexes for table `product_tb`
--
ALTER TABLE `product_tb`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_type_id` (`product_type_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `storeId` (`storeId`);

--
-- Indexes for table `product_type_tb`
--
ALTER TABLE `product_type_tb`
  ADD PRIMARY KEY (`product_type_id`);

--
-- Indexes for table `promotions_tb`
--
ALTER TABLE `promotions_tb`
  ADD PRIMARY KEY (`promo_id`),
  ADD KEY `promo_type` (`promo_type`),
  ADD KEY `valuegiven_id` (`valuegiven_id`),
  ADD KEY `valuecon_id` (`valuecon_id`),
  ADD KEY `storeId` (`storeId`);

--
-- Indexes for table `promotion_type`
--
ALTER TABLE `promotion_type`
  ADD PRIMARY KEY (`promo_type_id`);

--
-- Indexes for table `puchaseoder`
--
ALTER TABLE `puchaseoder`
  ADD PRIMARY KEY (`puchaseoder_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `storeId` (`storeId`),
  ADD KEY `puoder_status_id` (`puoder_status_id`);

--
-- Indexes for table `puchaseoder_status_tb`
--
ALTER TABLE `puchaseoder_status_tb`
  ADD PRIMARY KEY (`puoder_status_id`);

--
-- Indexes for table `purchasetype`
--
ALTER TABLE `purchasetype`
  ADD PRIMARY KEY (`purchasetype_id`);

--
-- Indexes for table `set_promotion_tb`
--
ALTER TABLE `set_promotion_tb`
  ADD PRIMARY KEY (`set_promotion_id`),
  ADD KEY `promo_id` (`promo_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `storeId` (`storeId`);

--
-- Indexes for table `statusdetail`
--
ALTER TABLE `statusdetail`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `status_pd_tb`
--
ALTER TABLE `status_pd_tb`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`storeId`),
  ADD KEY `status` (`status`),
  ADD KEY `storeType` (`storeType`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `storetypetb`
--
ALTER TABLE `storetypetb`
  ADD PRIMARY KEY (`storeTypeId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD KEY `user_type` (`user_type`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`user_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `valuecon_tb`
--
ALTER TABLE `valuecon_tb`
  ADD PRIMARY KEY (`valuecon_id`);

--
-- Indexes for table `valuegiven_tb`
--
ALTER TABLE `valuegiven_tb`
  ADD PRIMARY KEY (`valuegiven_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basket_tb`
--
ALTER TABLE `basket_tb`
  MODIFY `basket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `compostore_tb`
--
ALTER TABLE `compostore_tb`
  MODIFY `compostore_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `compo_status_tb`
--
ALTER TABLE `compo_status_tb`
  MODIFY `compo_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_data_tb`
--
ALTER TABLE `menu_data_tb`
  MODIFY `menu_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `menu_detail_tb`
--
ALTER TABLE `menu_detail_tb`
  MODIFY `menu_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mulimagestb`
--
ALTER TABLE `mulimagestb`
  MODIFY `mulimagesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `oder_tb`
--
ALTER TABLE `oder_tb`
  MODIFY `oder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `order_status_tb`
--
ALTER TABLE `order_status_tb`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_tb`
--
ALTER TABLE `product_tb`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `product_type_tb`
--
ALTER TABLE `product_type_tb`
  MODIFY `product_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `promotions_tb`
--
ALTER TABLE `promotions_tb`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `promotion_type`
--
ALTER TABLE `promotion_type`
  MODIFY `promo_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `puchaseoder`
--
ALTER TABLE `puchaseoder`
  MODIFY `puchaseoder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `puchaseoder_status_tb`
--
ALTER TABLE `puchaseoder_status_tb`
  MODIFY `puoder_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchasetype`
--
ALTER TABLE `purchasetype`
  MODIFY `purchasetype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `set_promotion_tb`
--
ALTER TABLE `set_promotion_tb`
  MODIFY `set_promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `statusdetail`
--
ALTER TABLE `statusdetail`
  MODIFY `statusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_pd_tb`
--
ALTER TABLE `status_pd_tb`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `storeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `storetypetb`
--
ALTER TABLE `storetypetb`
  MODIFY `storeTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `valuecon_tb`
--
ALTER TABLE `valuecon_tb`
  MODIFY `valuecon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `valuegiven_tb`
--
ALTER TABLE `valuegiven_tb`
  MODIFY `valuegiven_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basket_tb`
--
ALTER TABLE `basket_tb`
  ADD CONSTRAINT `basket_tb_ibfk_1` FOREIGN KEY (`set_promotion_id`) REFERENCES `set_promotion_tb` (`set_promotion_id`),
  ADD CONSTRAINT `basket_tb_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `stores` (`storeId`),
  ADD CONSTRAINT `basket_tb_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `compostore_tb`
--
ALTER TABLE `compostore_tb`
  ADD CONSTRAINT `compostore_tb_ibfk_1` FOREIGN KEY (`compo_status_id`) REFERENCES `compo_status_tb` (`compo_status_id`),
  ADD CONSTRAINT `compostore_tb_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `stores` (`storeId`);

--
-- Constraints for table `menu_detail_tb`
--
ALTER TABLE `menu_detail_tb`
  ADD CONSTRAINT `menu_detail_tb_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_tb` (`product_type_id`);

--
-- Constraints for table `oder_tb`
--
ALTER TABLE `oder_tb`
  ADD CONSTRAINT `oder_tb_ibfk_1` FOREIGN KEY (`set_promotion_id`) REFERENCES `set_promotion_tb` (`set_promotion_id`),
  ADD CONSTRAINT `oder_tb_ibfk_2` FOREIGN KEY (`puchaseoder_id`) REFERENCES `puchaseoder` (`puchaseoder_id`),
  ADD CONSTRAINT `oder_tb_ibfk_3` FOREIGN KEY (`purchasetype_id`) REFERENCES `purchasetype` (`purchasetype_id`);

--
-- Constraints for table `product_tb`
--
ALTER TABLE `product_tb`
  ADD CONSTRAINT `product_tb_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_tb` (`product_type_id`),
  ADD CONSTRAINT `product_tb_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status_pd_tb` (`status_id`),
  ADD CONSTRAINT `product_tb_ibfk_3` FOREIGN KEY (`storeId`) REFERENCES `stores` (`storeId`);

--
-- Constraints for table `promotions_tb`
--
ALTER TABLE `promotions_tb`
  ADD CONSTRAINT `promotions_tb_ibfk_1` FOREIGN KEY (`promo_type`) REFERENCES `promotion_type` (`promo_type_id`),
  ADD CONSTRAINT `promotions_tb_ibfk_2` FOREIGN KEY (`valuegiven_id`) REFERENCES `valuegiven_tb` (`valuegiven_id`),
  ADD CONSTRAINT `promotions_tb_ibfk_3` FOREIGN KEY (`valuecon_id`) REFERENCES `valuecon_tb` (`valuecon_id`),
  ADD CONSTRAINT `promotions_tb_ibfk_4` FOREIGN KEY (`storeId`) REFERENCES `stores` (`storeId`);

--
-- Constraints for table `puchaseoder`
--
ALTER TABLE `puchaseoder`
  ADD CONSTRAINT `puchaseoder_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `puchaseoder_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `stores` (`storeId`),
  ADD CONSTRAINT `puchaseoder_ibfk_3` FOREIGN KEY (`puoder_status_id`) REFERENCES `puchaseoder_status_tb` (`puoder_status_id`);

--
-- Constraints for table `set_promotion_tb`
--
ALTER TABLE `set_promotion_tb`
  ADD CONSTRAINT `set_promotion_tb_ibfk_1` FOREIGN KEY (`promo_id`) REFERENCES `promotions_tb` (`promo_id`),
  ADD CONSTRAINT `set_promotion_tb_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_tb` (`product_id`),
  ADD CONSTRAINT `set_promotion_tb_ibfk_3` FOREIGN KEY (`storeId`) REFERENCES `stores` (`storeId`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`status`) REFERENCES `statusdetail` (`statusId`),
  ADD CONSTRAINT `stores_ibfk_2` FOREIGN KEY (`storeType`) REFERENCES `storetypetb` (`storeTypeId`),
  ADD CONSTRAINT `stores_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type`) REFERENCES `user_types` (`user_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
