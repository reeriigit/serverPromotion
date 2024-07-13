-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 06:22 PM
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
(30, 92, ''),
(31, 93, 'mulimages-1720422929375-189148848.jpg,mulimages-1720422929391-256816787.jpg'),
(32, 94, 'mulimages-1720534373238-843007764.jpg,mulimages-1720534373241-820180088.jpg,mulimages-1720534373242-290905511.jpg');

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
(50, '[\"1720881697404-White and Dark Gray Modern Fashion Designer Resume (1).png\"]', 'ก๋วยเตี่ยเนื้อตุ้น', 18, 'เป็นเนื้อในสวนคอ', 69, 42, 1, 93),
(51, '[\"1720884296718-IMG_1537.jpeg\"]', 'ก๋วยเตี่ยเนื้อสไลด์', 18, 'เป็นบริการเครืองดืมที่ให้บริการ', 79, 50, 1, 93);

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
(13, 92, 'testdee', '1719993985406-figma.jpg', 'wqadsdad'),
(14, 93, 'เครื่องดืม', '1720424294405-thai-gov.png', 'น้ำดืม น้ำผลไม้ เเละ อื่นๆ'),
(16, 93, 'ของกินเล่น', '1720627837576-thai-gov.png', 'ของที่เอาใว้กินเล่นในระหว่างรอจานหลัก'),
(18, 93, 'ก๋วยเตียว', '1720881379652-blackpinkall.jpg', 'ก๋วยเตียว');

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
(85, 94, '1720541552751.jpg', '40 ลด 50%', 1, '', 10000, 50, 3, 50, 1, '7/9/2024', '3/19/1970'),
(92, 94, '1720543715599.png', '', 1, '', 0, 0, 1, 0, 1, '7/25/2024', '8/2/2024'),
(94, 93, '1720841438167.png', 'กล้วย 10 เเถม 2', 2, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 5000, 2, 1, 10, 1, '7/18/2024', '7/26/2024'),
(95, 93, '1720879471649.png', 'ซื้อ 20 ลด 30%', 1, 'เป็นโปรโมชั่น เเบบเเถม สามารถ 1 เเถม 10', 2000, 20, 3, 20, 1, '7/19/2024', '7/31/2024'),
(96, 93, '1720881637221.png', 'ซื้อ มากกว่า 500 บาท ได้เเต้ม 100 เเต้ม', 3, '', 10, 100, 4, 500, 3, '7/13/2024', '12/13/2024');

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
(32, 96, 50, 93),
(33, 95, 50, 93),
(34, 95, 51, 93);

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
(93, 31, 'logo-1720423590110-942134512.png', 'reeriisasam', 1, 'sasassas', 'วิเทจ', 'นรา', '0925736324', 'acscsc', 2),
(94, 32, 'logo-1720534349812-274996812.jpg', 'urPro', 3, 'เป็นร้านค้ารีเลศที่ ทำให่คุณสบายใจ ได้ในคำคืน', 'วิเทจ', 'นราธิวาส', '0925736324', '151/55 นราธิวาส ตากใบ', 2);

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
(31, 'rerwf23', NULL, 'samree', '406459015@yru.ac.th', '1111111111', 'muhammadsamree samaae', 'acscsc', '0925736324', 3),
(32, 'tYJcSVKqqQ', 'rerwf23', 'anwar', '406459015@yru.ac.th', '5555555555', 'muhammadsamree samaae', 'acscsc', '0925736324', 3);

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
-- Indexes for table `mulimagestb`
--
ALTER TABLE `mulimagestb`
  ADD PRIMARY KEY (`mulimagesId`),
  ADD KEY `storeId` (`storeId`);

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
-- AUTO_INCREMENT for table `mulimagestb`
--
ALTER TABLE `mulimagestb`
  MODIFY `mulimagesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product_tb`
--
ALTER TABLE `product_tb`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_type_tb`
--
ALTER TABLE `product_type_tb`
  MODIFY `product_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `promotions_tb`
--
ALTER TABLE `promotions_tb`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `promotion_type`
--
ALTER TABLE `promotion_type`
  MODIFY `promo_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `set_promotion_tb`
--
ALTER TABLE `set_promotion_tb`
  MODIFY `set_promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `storeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `storetypetb`
--
ALTER TABLE `storetypetb`
  MODIFY `storeTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
