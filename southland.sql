-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2024 at 07:57 PM
-- Server version: 10.11.3-MariaDB
-- PHP Version: 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `southland`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(20) NOT NULL COMMENT 'รหัสที่อยู่',
  `customer_id` int(20) NOT NULL COMMENT 'รหัสลูกค้า',
  `address_type` enum('home','office','other') NOT NULL COMMENT 'ประเภทที่อยู่',
  `place` varchar(100) NOT NULL COMMENT 'สถานที่ เช่น บ้าน เลขที่ ถนน',
  `subdistrict` varchar(100) NOT NULL COMMENT 'ตำบล',
  `district` varchar(100) NOT NULL COMMENT 'อำเภอ',
  `province` varchar(100) NOT NULL COMMENT 'จังหวัด',
  `postal_code` varchar(10) NOT NULL COMMENT 'รหัสไปรษณีย์',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `address_type`, `place`, `subdistrict`, `district`, `province`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'home', '123 หมู่ 5 ถนนสันติสุข', 'ในเมือง', 'เมือง', 'กรุงเทพมหานคร', '10300', '2024-12-11 00:26:18', '2024-12-11 00:26:18'),
(2, 1, 'office', 'สำนักงานใหญ่ 456 ถนนรัชดา', 'ห้วยขวาง', 'ห้วยขวาง', 'กรุงเทพมหานคร', '10310', '2024-12-11 00:26:18', '2024-12-11 00:26:18'),
(3, 2, 'home', '456 หมู่ 2 ถนนเพชรบุรี', 'บ้านใหม่', 'เมือง', 'เชียงใหม่', '50000', '2024-12-11 00:26:18', '2024-12-11 00:26:18'),
(4, 3, 'home', '789 หมู่ 8 ถนนราชดำเนิน', 'ท่าช้าง', 'ท่าม่วง', 'กาญจนบุรี', '71000', '2024-12-11 00:26:18', '2024-12-11 00:26:18'),
(5, 3, 'other', 'ที่พักชั่วคราว 123 ซอยสันติสุข', 'ในเมือง', 'เมือง', 'กรุงเทพมหานคร', '10200', '2024-12-11 00:26:18', '2024-12-11 00:26:18'),
(6, 4, 'home', '101 หมู่ 3 ถนนพหลโยธิน', 'ท่าเสา', 'เมือง', 'สมุทรปราการ', '10270', '2024-12-11 00:26:18', '2024-12-11 00:26:18'),
(7, 5, 'office', 'สำนักงานกรุงเทพฯ 202 ถนนพระราม 4', 'สวนหลวง', 'สวนหลวง', 'กรุงเทพมหานคร', '10320', '2024-12-11 00:26:18', '2024-12-11 00:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `classification`
--

CREATE TABLE `classification` (
  `classification_id` int(20) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `size` enum('S','M','B') NOT NULL,
  `grade` enum('A','B','C','D') NOT NULL COMMENT 'ระดับเกรด',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classification`
--

INSERT INTO `classification` (`classification_id`, `customer_id`, `size`, `grade`, `created_at`, `updated_at`) VALUES
(1, 1, 'S', 'A', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(2, 2, 'M', 'B', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(3, 3, 'B', 'C', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(4, 4, 'S', 'A', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(5, 5, 'M', 'D', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(6, 6, 'B', 'B', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(7, 7, 'S', 'C', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(8, 8, 'M', 'A', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(9, 9, 'B', 'D', '2024-12-11 02:40:29', '2024-12-11 02:40:29'),
(10, 10, 'S', 'B', '2024-12-11 02:40:29', '2024-12-11 02:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `client_hierarchy`
--

CREATE TABLE `client_hierarchy` (
  `parent_client_id` int(20) NOT NULL,
  `sub_client_id` int(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_hierarchy`
--

INSERT INTO `client_hierarchy` (`parent_client_id`, `sub_client_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(1, 3, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(2, 4, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(3, 5, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(5, 6, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(6, 7, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(7, 8, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(8, 9, '2024-12-11 00:21:11', '2024-12-11 00:21:11'),
(9, 10, '2024-12-11 00:21:11', '2024-12-11 00:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(20) NOT NULL COMMENT 'รหัสลูกค้า',
  `title` enum('นาย','นางสาว','นาง') NOT NULL COMMENT 'คำนำหน้าชื่อ',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Unknown') NOT NULL,
  `birth_date` date NOT NULL,
  `citizen_id` char(13) NOT NULL COMMENT 'เลขบัตรประชาชน',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `title`, `first_name`, `last_name`, `gender`, `birth_date`, `citizen_id`, `created_at`, `updated_at`) VALUES
(1, 'นาย', 'สมชาย', 'ใจดี', 'Male', '1970-02-17', '1234567890123', '2024-12-11 00:19:57', '2024-12-11 02:10:27'),
(2, 'นางสาว', 'สมพร', 'มีสุข', 'Female', '2010-03-18', '2345678901234', '2024-12-11 00:19:57', '2024-12-11 02:10:07'),
(3, 'นาย', 'ณัฐพล', 'แสงจันทร์', 'Male', '2000-12-26', '3456789012345', '2024-12-11 00:19:57', '2024-12-11 02:09:55'),
(4, 'นางสาว', 'อารยา', 'สายทอง', 'Female', '1992-09-23', '4567890123456', '2024-12-11 00:19:57', '2024-12-11 02:09:49'),
(5, 'นาย', 'กิตติ', 'เพชรดี', 'Male', '1998-12-26', '5678901234567', '2024-12-11 00:19:57', '2024-12-11 02:08:19'),
(6, 'นางสาว', 'สุภาพร', 'เกษมสุข', 'Female', '1998-01-26', '6789012345678', '2024-12-11 00:19:57', '2024-12-11 02:08:36'),
(7, 'นาย', 'ประยุทธ', 'วงศ์ทอง', 'Male', '1981-12-26', '7890123456789', '2024-12-11 00:19:57', '2024-12-11 02:08:45'),
(8, 'นางสาว', 'อรวรรณ', 'สายสุนีย์', 'Female', '1977-04-02', '8901234567890', '2024-12-11 00:19:57', '2024-12-11 02:09:04'),
(9, 'นาย', 'สมบัติ', 'ทองดี', 'Male', '1996-08-06', '9012345678901', '2024-12-11 00:19:57', '2024-12-11 02:09:16'),
(10, 'นางสาว', 'จารุวรรณ', 'นวลจันทร์', 'Female', '1975-03-02', '0123456789012', '2024-12-11 00:19:57', '2024-12-11 02:09:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`classification_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `client_hierarchy`
--
ALTER TABLE `client_hierarchy`
  ADD KEY `parent_client_id` (`parent_client_id`),
  ADD KEY `sub_client_id` (`sub_client_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `citizen_id` (`citizen_id`),
  ADD UNIQUE KEY `citizen_id_2` (`citizen_id`),
  ADD UNIQUE KEY `citizen_id_3` (`citizen_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'รหัสที่อยู่', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `classification`
--
ALTER TABLE `classification`
  MODIFY `classification_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'รหัสลูกค้า', AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classification`
--
ALTER TABLE `classification`
  ADD CONSTRAINT `classification_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `client_hierarchy`
--
ALTER TABLE `client_hierarchy`
  ADD CONSTRAINT `client_hierarchy_ibfk_1` FOREIGN KEY (`parent_client_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_hierarchy_ibfk_2` FOREIGN KEY (`sub_client_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
