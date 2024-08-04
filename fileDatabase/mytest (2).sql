-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2024 at 04:41 PM
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
(12, 44, 38, 96),
(13, 45, 38, 96),
(14, 45, 38, 96),
(18, 43, 38, 96),
(19, 36, 38, 95),
(20, 42, 38, 96);

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
(11, 'เส้นเกาเหลา', 24),
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
(34, 96, 'mulimages-1721294138288-907160953.jpg,mulimages-1721294138304-136797879.jpg,mulimages-1721294138317-817047847.jpg,mulimages-1721294138342-306615560.jpg,mulimages-1721294138347-712548871.jpg,mulimages-1721294138347-894299401.png,mulimages-1721294138397-195035146.png');

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
  `menu_detail` text NOT NULL,
  `purchasetype_id` int(11) NOT NULL,
  `order_detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oder_tb`
--

INSERT INTO `oder_tb` (`oder_id`, `set_promotion_id`, `totalprice`, `puchaseoder_id`, `order_status_id`, `oder_amount`, `price`, `price_setpro`, `menu_detail`, `purchasetype_id`, `order_detail`) VALUES
(37, 45, 39, 37, 1, 1, 39, 35.1, 'หวานน้อย', 2, ''),
(38, 42, 345, 38, 1, 5, 69, 276, 'เส้นซือดะ, เส้นหมี่', 2, 'ไม่ผัก'),
(39, 42, 345, 39, 1, 5, 69, 276, 'เส้นเกาเหลา, เส้นซือดะ', 2, ''),
(40, 45, 39, 40, 1, 1, 39, 35.1, '', 2, ''),
(41, 45, 39, 41, 1, 1, 39, 35.1, '', 2, ''),
(42, 45, 39, 42, 1, 1, 39, 35.1, '', 2, ''),
(43, 45, 39, 43, 1, 1, 39, 35.1, 'หวานปกติ', 2, ''),
(44, 45, 39, 44, 1, 1, 39, 35.1, '', 2, ''),
(46, 35, 125, 46, 1, 1, 125, 100, '', 2, ''),
(49, 45, 39, 37, 1, 1, 39, 35.1, '', 2, ''),
(50, 45, 39, 47, 1, 1, 39, 35.1, 'หวานปกติ', 2, ''),
(51, 42, 345, 48, 1, 5, 69, 276, 'เส้นหมี่, เส้นซือดะ', 2, ''),
(52, 45, 35.1, 49, 1, 1, 39, 35.1, '', 2, ''),
(53, 45, 39, 50, 1, 1, 39, 35.1, '', 2, ''),
(54, 44, 69, 51, 1, 1, 69, 62.1, '', 2, ''),
(55, 44, 69, 52, 1, 1, 69, 62.1, '', 2, ''),
(56, 43, 30, 53, 1, 1, 30, 27, '', 2, ''),
(57, 43, 30, 54, 1, 1, 30, 27, '', 2, '');

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
  `puchaseoder_ttprice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `puchaseoder`
--

INSERT INTO `puchaseoder` (`puchaseoder_id`, `user_id`, `storeId`, `puchaseoder_date`, `puoder_status_id`, `puchaseoder_ttprice`) VALUES
(37, 38, 96, '2024-08-03 10:38:38', 3, 39.00),
(38, 38, 96, '2024-08-03 11:22:48', 1, 345.00),
(39, 38, 96, '2024-08-04 01:29:08', 3, 345.00),
(40, 38, 96, '2024-08-03 11:30:24', 3, NULL),
(41, 38, 96, '2024-08-03 11:31:00', 2, NULL),
(42, 38, 96, '2024-08-03 11:31:33', 3, 39.00),
(43, 38, 96, '2024-08-03 12:54:09', 3, 39.00),
(44, 34, 96, '2024-08-03 13:34:56', 3, 39.00),
(46, 34, 95, '2024-08-03 14:55:20', 1, 125.00),
(47, 34, 96, '2024-08-03 16:00:11', 1, 39.00),
(48, 34, 96, '2024-08-03 16:10:05', 1, 345.00),
(49, 38, 96, '2024-08-04 02:44:58', 3, 39.00),
(50, 38, 96, '2024-08-04 02:47:41', 3, 35.10),
(51, 38, 96, '2024-08-04 05:08:32', 1, 62.10),
(52, 38, 96, '2024-08-04 08:56:13', 1, 62.10),
(53, 38, 96, '2024-08-04 09:04:11', 1, 27.00),
(54, 38, 96, '2024-08-04 09:31:49', 1, 27.00);

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
(96, 36, 'logo-1722676879654-693054850.png', 'ก๋วยเตียวเนื้อโคขุน', 2, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'รีเลศ', 'ยะลา', '0823017299', 'G8P3+C3C ตำบล สะเตงนอก อำเภอเมืองยะลา ยะลา 95000', 2);

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
(38, '9J3eptwaJn', '', 'imrons', '406459028@yru.ac.th', '0123456789', 'อิมรอน วาเลาะ', '47/3 ถ.เทศบาล9 ต.สะเตง อ.เมืองยะลา จ.ยะลา 95000', '092548626', 2);

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
  ADD KEY `purchasetype_id` (`purchasetype_id`);

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
  MODIFY `basket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menu_detail_tb`
--
ALTER TABLE `menu_detail_tb`
  MODIFY `menu_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `mulimagestb`
--
ALTER TABLE `mulimagestb`
  MODIFY `mulimagesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `oder_tb`
--
ALTER TABLE `oder_tb`
  MODIFY `oder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
  MODIFY `puchaseoder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
  MODIFY `storeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `storetypetb`
--
ALTER TABLE `storetypetb`
  MODIFY `storeTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
