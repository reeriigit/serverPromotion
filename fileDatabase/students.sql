-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 09:03 AM
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
-- Database: `students`
--

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
(15, 79, 'mulimages-1708854184846-963156567.jpg'),
(16, 80, 'mulimages-1708854271483-100736103.png,mulimages-1708854271484-876551595.jpg,mulimages-1708854271484-587226205.png,mulimages-1708854271486-168060465.png,mulimages-1708854271488-148705197.jpg'),
(17, 81, 'mulimages-1708929709496-807217422.png,mulimages-1708929709496-402027708.png,mulimages-1708929709496-277727477.png,mulimages-1708929709499-899539087.png'),
(22, 86, 'mulimages-1709281150685-416983852.png,mulimages-1709281150685-919998965.jpg,mulimages-1709281150685-283818220.jpg,mulimages-1709281150685-611251980.png,mulimages-1709281150688-996811410.png,mulimages-1709281150689-789940555.jpg'),
(23, 87, 'mulimages-1709282458884-380471577.png,mulimages-1709282458885-574369694.jpg,mulimages-1709282458895-574042365.jpg'),
(24, 88, 'mulimages-1709483792292-765022341.png,mulimages-1709483792292-657695689.png,mulimages-1709483792298-777622780.png,mulimages-1709483792299-957698656.png,mulimages-1709483792306-879889944.png,mulimages-1709483792307-39181604.png,mulimages-1709483792307-344889605.png,mulimages-1709483792308-127436334.png,mulimages-1709483792314-936732601.png,mulimages-1709483792319-727012093.png'),
(25, 88, ''),
(26, 88, ''),
(27, 89, 'mulimages-1709484033750-855615936.png,mulimages-1709484033751-356176294.png,mulimages-1709484033754-98004889.png,mulimages-1709484033754-332432162.jpg'),
(28, 90, 'mulimages-1709533235690-402925561.png,mulimages-1709533235693-528567204.png,mulimages-1709533235694-652319941.png,mulimages-1709533235711-931044079.png,mulimages-1709533235712-888608416.png,mulimages-1709533235715-618829319.png,mulimages-1709533235715-891048383.png,mulimages-1709533235716-904995515.png,mulimages-1709533235717-919684042.png,mulimages-1709533235718-14187343.png'),
(29, 91, 'mulimages-1709533931085-304561179.png,mulimages-1709533931085-531860097.jpg,mulimages-1709533931086-494472352.png,mulimages-1709533931092-800173310.png,mulimages-1709533931112-391071658.jpg');

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
(3, 87, 'awfwfacszc', '1709480898399-1_vPezx00A1u0WAfS8e8wBXQ.png', 'czcddvdvdvdvdvzd'),
(4, 87, 'awfwfacszc', '1709481000598-image final.png', 'czcddvdvdvdvdvzd'),
(6, 85, 'awfwfacszc', '1709482033164-Banana-1.jpg', 'czcddvdvdvdvdvzd'),
(7, 86, 'awfwfacszc', '1709482339856-Banana-1.jpg', 'czcddvdvdvdvdvzd'),
(8, 89, 'เครืองดืม', '1709657043071-Banana-1.jpg', 'เป็นบริการเครืองดืม'),
(11, 89, 'เครืองดืม', '1709657323915-1_vPezx00A1u0WAfS8e8wBXQ.png', 'เป็นบริการเครืองดืมที่ให้บริการ');

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
(49, 84, '1709391812150.jpg', 'กล้วย 10 เเถม 5', 2, 'เป็นโปรโมชั่น เเบบเเถม ซื้อ10 เเถม 5', 50, 5, 1, 10, 1, '1/29/1970', '1/2/1970'),
(52, 84, '1709394669023.png', 'กล้วย 1 เเถม', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 10, 10, 1, 2, 1, '1/1/1970', '1/1/1970'),
(54, 84, '1709460738706.jpg', 'กล้วย 10 เเถม 5', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 1024, 10, 1, 2, 1, '5/12/2024', '5/30/2024'),
(57, 87, '1709460894912.png', 'กล้วย 10 เเถม 2', 2, 'เป็นโvsdvdvdvdปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 155, 1, 1, 12, 1, '1/1/1970', '1/1/1970'),
(58, 87, '1709461710619.png', 'กล้วย 10 เเถม 2', 1, 'เป็นโvsdvdvdvdปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 155, 42222, 1, 22222, 1, '1/30/1970', '1/30/1970'),
(59, 87, '1709461046946.png', 'กล้วย 10 เเถม 2', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 10, 10, 1, 22222, 1, '1/1/1970', '1/1/1970'),
(60, 87, '1709461066407.jpg', 'กล้วย 10 เเถม 2', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 10, 0, 1, 1, 1, '1/23/1970', '1/29/1970'),
(61, 87, '1709461092449.png', 'กล้วย 1 เเถม', 1, 'เป็นโvsdvdvdvdปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 2222, 2, 1, 5, 1, '1/29/1970', '1/31/1970'),
(62, 87, '1709461109730.png', 'กล้วย 10 เเถม 2', 1, 'เป็นโvsdvdvdvdปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 10, 100, 1, 1, 1, '1/1/1970', '1/1/1970'),
(63, 87, '1709461687975.png', 'กล้วย 1 เเถม', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 10, 10, 1, 22222, 1, '1/31/1970', '1/31/1970'),
(64, 87, '1709461459241.jpg', 'กล้วย 1 เเถม', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 10, 10, 1, 1, 1, '1/1/1970', '1/1/1970'),
(65, 87, '1709469145094.png', 'กล้วย 1 เเถม', 1, 'เป็นโvsdvdvdvdปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 100, 10, 1, 2, 1, '1/22/1970', '1/1/1970'),
(66, 87, '1709475731811.png', 'กล้วย 10 เเถม 2', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 2222, 42, 2, 5, 1, '1/1/1970', '1/1/1970'),
(67, 85, '1709478280178.png', 'กล้วย 10 เเถม 2csazczc', 1, 'เป็นโvsdvdvdvdปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 10, 10, 1, 1, 1, '1/1/1970', '1/1/1970'),
(69, 89, '1709519043833.png', 'กล้วย 10 เเถม 2', 2, 'เป็นโปรโมชั่น เเบบเเถม สามารถ ซื้อ 10 เเถม 2', 1000, 2, 1, 10, 1, '1/31/1970', '1/31/1970'),
(70, 89, '1709521331261.png', 'โปรส่วนลดมาเเล้ววันนี้ 50%', 1, 'โปรส่วนลดมาเเล้ววันนี้ 50% สามารถใช้ได้กับทางร้านเรา', 500, 50, 3, 2000, 2, '1/31/1970', '1/29/1970'),
(71, 89, '1709521451564.png', 'โปรซื้อสอนค้าด้วยเเต้ม 500 เเต้ม', 1, 'โปรซื้อสอนค้าด้วยเเต้ม 500 เเต้ม ใช้ทุกสินค้าที่พุกกับร้านค้า', 50, 1, 1, 500, 2, '1/22/1970', '1/30/1970'),
(72, 89, '1709521541216.png', 'php ซื้อ 5 จ่าย 4', 2, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 4 เเถม 1', 100, 1, 1, 4, 1, '1/27/1970', '1/30/1970'),
(73, 89, '1709521662080.png', 'โปรส่วนลด 50 บาท', 1, 'เป็นโปรโมชั่นส่วนลด', 400, 50, 2, 1, 1, '1/1/1970', '1/1/1970'),
(74, 89, '1709521784362.png', 'โปร สะสมเเต้ม ให้ 500 บาท', 3, 'โปร สะสมเเต้ม', 10, 500, 2, 1, 1, '1/30/1970', '1/29/1970');

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
(3, 'แบบสะสมแต้ม', 'ลูกค้าสามารถนำแต้มหรือคะแนนมาแลกของรางวัล เช่น สินค้า, บริการ, หรือส่วนลด.'),
(4, 'ส่วนลด', 'คูปองที่ลูกค้าสามารถใช้เพื่อรับส่วนลดเมื่อซื้อสินค้าหรือบริการ.');

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
(2, 'อนุมัติเเล้ว', 'คุณได้ถูกอนุมัติเป็นร้านค้าใน PATI เเล้ว');

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
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`storeId`, `user_id`, `logo`, `storeName`, `storeType`, `storeDes`, `email`, `pass`, `phone`, `address`, `status`) VALUES
(84, 17, 'logo-1709276300063-867226111.jpg', 'reeriistore', 1, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'muhammadsamrees@gmail.com', '0000000000', '656464660', 'sgevzvdvzdvzdvdvdv', 2),
(85, 18, 'logo-1708967445268-499719975.png', 'samree', 1, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'muhammadsamrees@gmail.com', '0925736324', '55555555555555555555', 'd vxbfbfbxnbdgngtnet', 1),
(86, 19, 'logo-1709281137032-178926933.png', 'reeriitiktok', 1, 'samree', 'muhammadsamrees@gmail.com', '0925736324', '65646466', 'sgsbbxrb', 2),
(87, 20, 'logo-1709461439762-163830084.png', 'saasasasasas', 1, 'sasasasasas', 'sasasasas', 'asasasasas', '11111', 'sasasasasasa', 1),
(88, 25, 'logo-1709483757398-224699943.jpg', 'Nimubing', 1, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'muhammadsamrees@gmail.com', 'sa', 'ฃ555555555', 'zfzegevev', 1),
(89, 26, 'logo-1709484021035-811340642.png', 'wanita', 2, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'wanita@yru.ac.th', 'wanita', '89160650', 'wanitawanitawanitawanitawanitawanita', 2),
(90, 27, 'logo-1709533211216-954856400.png', 'raimee', 2, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', 'raimee', 'raimee', '0925736324', 'yala', 2),
(91, 28, 'logo-1709533902138-98956459.png', 'sulaimaStore', 1, 'เป็นร้านอาหารตามสั่ง ที่สามารถตอบโจทย์ตามความต้องการขอลลูกค้าได้', '4064555559005@yru.ac.th', 'asasasasas', 'ฃ555555555', 'yala', 2);

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
(2, 'ร้านอาหาร', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
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

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `full_name`, `address`, `phone_number`, `user_type`) VALUES
(1, 'reeriidocker', '40645900155@yru.ac.th', '1960200157', 'samree samaae', 'scscsc', '065848512', 1),
(3, 'muhammadsamrees@gmail.com', 'muhammadsamrees@gmail.com', '512125115415', 'samree samaae', 'แหแหแหแ', '05132135153', 1),
(4, 'qua', 'qua12345@gmail.com', '12345679', 'samree samaae', 'scscsc', '156234', 2),
(13, 'weeesaaaa', 'cscsc@gmail.com', '65132065', 'samree samaae', 'scscsc', '05132135153', 1),
(14, 'qrrrr', '40645900155@yru.ac.th', '65123065160', 'samree samaae', 'scscsc', '05132135153', 1),
(15, 'daree', '40645900155@yru.ac.th', '5106162032', 'samree samaae', 'scscsc', '05132135153', 1),
(17, 'reeriidockerss', 'muhammadsamrees@gmail.com', 'dafefefe', 'samree samaaes', '015133212', '05132135150000', 3),
(18, 'rerrrrrr', 'muhammadsamrees@gmail.com', 's;igvuhzkjnv \'lkbnr', 'samree samaae', 'scscsc', '05132135153', 3),
(19, 'reeriisasam', '40645900155@yru.ac.th', '00000000', 'reerii sasa', 'suihg[ihg[oisvO', '651651626', 3),
(20, 'sasasasasa', 'muhammadsamrees@gmail.com', '11111111111', 'sasasasas', 'sasasasas', '11111111', 3),
(23, 'faisaol', 'muhammadsamrees@gmail.com', '1326452689', 'faisol doloh', 'scscsc', '05132135153', 3),
(24, '', '', '', '', '', '', 3),
(25, 'nimubing', '40645900155@yru.ac.th', '75282782728', 'samree samaae', 'แหแหแหแ', '05132135153', 3),
(26, 'wanita', 'wanita@yru.ac.th', '0000000000', 'wanita', 'wanita', '0925736324', 3),
(27, 'nuraimee', 'nuraimee@yru.ac.th', '0000000000', 'nuraimee', 'yala', '0925736324', 3),
(28, 'sulaiman', 'sulaiman@gmail.com', '0000000000', 'sulaiman', 'yala', '05132135153', 3);

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
(2, 'เเต้ม');

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
(3, '%');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mulimagestb`
--
ALTER TABLE `mulimagestb`
  ADD PRIMARY KEY (`mulimagesId`),
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
  ADD KEY `valuecon_id` (`valuecon_id`);

--
-- Indexes for table `promotion_type`
--
ALTER TABLE `promotion_type`
  ADD PRIMARY KEY (`promo_type_id`);

--
-- Indexes for table `statusdetail`
--
ALTER TABLE `statusdetail`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`storeId`),
  ADD KEY `status` (`status`),
  ADD KEY `storeType` (`storeType`);

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
  ADD UNIQUE KEY `username` (`username`);

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
-- AUTO_INCREMENT for table `mulimagestb`
--
ALTER TABLE `mulimagestb`
  MODIFY `mulimagesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_type_tb`
--
ALTER TABLE `product_type_tb`
  MODIFY `product_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `promotions_tb`
--
ALTER TABLE `promotions_tb`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `promotion_type`
--
ALTER TABLE `promotion_type`
  MODIFY `promo_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `statusdetail`
--
ALTER TABLE `statusdetail`
  MODIFY `statusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `storeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `storetypetb`
--
ALTER TABLE `storetypetb`
  MODIFY `storeTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `valuecon_tb`
--
ALTER TABLE `valuecon_tb`
  MODIFY `valuecon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `valuegiven_tb`
--
ALTER TABLE `valuegiven_tb`
  MODIFY `valuegiven_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `promotions_tb`
--
ALTER TABLE `promotions_tb`
  ADD CONSTRAINT `promotions_tb_ibfk_1` FOREIGN KEY (`promo_type`) REFERENCES `promotion_type` (`promo_type_id`),
  ADD CONSTRAINT `promotions_tb_ibfk_2` FOREIGN KEY (`valuegiven_id`) REFERENCES `valuegiven_tb` (`valuegiven_id`),
  ADD CONSTRAINT `promotions_tb_ibfk_3` FOREIGN KEY (`valuecon_id`) REFERENCES `valuecon_tb` (`valuecon_id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`status`) REFERENCES `statusdetail` (`statusId`),
  ADD CONSTRAINT `stores_ibfk_2` FOREIGN KEY (`storeType`) REFERENCES `storetypetb` (`storeTypeId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
