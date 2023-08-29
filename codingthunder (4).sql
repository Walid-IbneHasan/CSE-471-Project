-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 05:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambulances`
--

CREATE TABLE `ambulances` (
  `id` int(11) NOT NULL,
  `status` enum('available','on_duty') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_order`
--

CREATE TABLE `ambulance_order` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `ambulance_type` varchar(20) NOT NULL,
  `fare` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambulance_order`
--

INSERT INTO `ambulance_order` (`id`, `name`, `phone`, `address`, `date`, `ambulance_type`, `fare`) VALUES
(1, 'Prince', '0123456789', 'Dhaka', '2023-08-05 00:00:00', 'regular', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `user_name` varchar(120) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `appointment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctor_id`, `user_name`, `user_phone`, `user_address`, `appointment_date`) VALUES
(1, 2, 'Faisal', '012345678', 'Shantinagar', '2023-08-29 08:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT current_timestamp(),
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `booking_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(8, 'Walid Ibne Hasan ', '01746134904', 'Leo Messi is the greatest of all time. ', '2023-07-11 02:45:25', 'walid.ibne.hasan@g.bracu.ac.bd'),
(9, 'Walid Ibne Hasan ', '01746134904', 'aswfdgvsdufiuYSDf', '2023-07-11 02:59:18', 'walid.ibne.hasan@g.bracu.ac.bd'),
(10, 'Walid Ibne Hasan ', '01746134904', 'cvhbfghdfgh', '2023-07-11 03:01:49', 'walid.ibne.hasan@g.bracu.ac.bd'),
(11, 'Walid Ibne Hasan ', '01746134904', 'qsduiohgfiudsfviudsqnfviuqdrsfv', '2023-07-11 03:51:05', 'walid.ibne.hasan@g.bracu.ac.bd'),
(12, 'Walid Ibne Hasan ', '01746134904', 'This is the deadline day msg', '2023-07-11 11:00:55', 'secretgiggle3@gmail.com'),
(13, 'Walid Ibne Hasan ', '01746134904', 'This is the deadline day msg', '2023-07-11 11:06:02', 'secretgiggle3@gmail.com'),
(14, 'Walid Ibne Hasan ', '01746134904', 'This is the deadline day msg', '2023-07-11 11:06:47', 'secretgiggle3@gmail.com'),
(15, 'Walid Ibne Hasan ', '01746134904', 'This is the deadline day msg', '2023-07-11 11:06:54', 'walid.ibne.hasan@g.bracu.ac.bd');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `specialty` varchar(50) NOT NULL,
  `availability` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `specialty`, `availability`) VALUES
(2, 'Shuvo', 'Heart', '12:01PM-06:00PM'),
(3, 'Prince', 'Physio', '12:01AM-06:00AM'),
(4, 'Naveen', 'Surgery', '06:01AM-12:00PM'),
(6, 'Sneha', 'Heart', '12:01PM-06:00PM'),
(7, 'Walid', 'Medicine', '12:01PM-06:00PM');

-- --------------------------------------------------------

--
-- Table structure for table `fare`
--

CREATE TABLE `fare` (
  `id` int(11) NOT NULL,
  `ambulance_type` varchar(20) NOT NULL,
  `fare_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fare`
--

INSERT INTO `fare` (`id`, `ambulance_type`, `fare_amount`) VALUES
(1, 'emergency', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `expired_date` date NOT NULL,
  `origin` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `expired_date`, `origin`, `price`) VALUES
(1, 'Diprocine', '2027-12-15', 'Bangladesh', 90.00),
(3, 'Fexo', '2023-08-31', 'Pakistan', 0.04);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `expired_date` date NOT NULL,
  `origin` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `medicine_id`, `customer_name`, `customer_email`, `quantity`, `order_date`) VALUES
(2, 1, 'Walid', 'walid@gmail.com', 2, '2023-08-08'),
(6, 3, 'Shuvo', 'bot@noob', 6, '2023-08-08'),
(7, 1, 'Walid', 'walid@gmail.com', 2, '2023-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `date`) VALUES
(8, 'this is the 8th post', 'dsfdfs', 'ddddddddd', 'dfghqdfuivghqsdfuihviudsnvioudfshbgfu8yhrsvjkdsnuvybdfuhvbdfsjhvbndru9yhfguvesfw', '2023-07-11 00:00:00'),
(9, 'EDITING', 'EDIT', 'noob', 'XYZ', '2023-07-11 00:00:00'),
(10, 'Module 3', 'testing', 'unique', 'New content posting', '0000-00-00 00:00:00'),
(11, 'wdfghtrfghfdwwg', 'dfggdrfgdfghdfgdfg', 'vtghuiywdfrhiudqhfiukds', 'tgvhquieorhtijouqdrjhikumdhrfmiokfgvjoqdimqe', '2023-07-31 17:30:25'),
(12, 'sdfgfdgdfg', 'gdfgdfgdrfqg', 'dfgdfgsdfg', 'asdfgsdagasdgasdfgsdfag', '2023-07-20 00:00:00'),
(13, 'Murney', 'Cat', 'Cute', 'Sweet', '2023-08-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `available_from` datetime NOT NULL,
  `available_to` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_number`, `image_path`, `available_from`, `available_to`) VALUES
(1, 591, 'istockphoto-1094626640-612x612.jpg', '2023-08-10 02:00:00', '2023-08-26 02:00:00'),
(2, 600, 'depositphotos_50476811-stock-photo-empty-hospital-room.jpg', '2023-08-08 15:12:00', '2023-08-18 05:14:00'),
(3, 525, 'istockphoto-1295780754-612x612.jpg', '2023-08-10 16:52:00', '2023-08-09 02:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `available_from` datetime NOT NULL,
  `available_to` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `password`, `email`, `id`) VALUES
('zaber', 'bot', 'zaber@bot', 1),
('shuvo', 'abcd', 'bot@noob', 2),
('team09', 'noob', 'team9@gmail.com', 3),
('Samara', 'abcdef', 'samara.farhin.ahmed@g.bracu.ac.bd', 4),
('Khalid', 'azmarin', 'khalid-hasan@gmail.com', 5),
('Suma', 'farhana', 'suma@gmail.com', 6),
('azmarin', 'khalid', 'azmarin@gmail.com', 7),
('shorna', 'khalid', 'shorna@gmail.com', 8),
('sneha', 'sneha', 'samara.farhin.ahmed@g.bracu.ac.bd', 9),
('abcd', 'efg', 'abc@gmail.com', 10),
('Walid Ibne Hasan ', 'noob', 'walid.ibne.hasan@g.bracu.ac.bd', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambulances`
--
ALTER TABLE `ambulances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ambulance_order`
--
ALTER TABLE `ambulance_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fare`
--
ALTER TABLE `fare`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ambulance_type` (`ambulance_type`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_room_number` (`room_number`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambulances`
--
ALTER TABLE `ambulances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ambulance_order`
--
ALTER TABLE `ambulance_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fare`
--
ALTER TABLE `fare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
