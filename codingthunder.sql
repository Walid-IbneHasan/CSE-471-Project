-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2023 at 09:19 PM
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
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(5) NOT NULL,
  `doctor_id` int(50) NOT NULL,
  `timeslot` datetime NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `doctor_id`, `timeslot`, `available`) VALUES
(0, 1, '2023-07-12 12:45:15', 1),
(1, 1, '2023-07-12 12:45:15', 1);

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
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `specialization` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `specialization`) VALUES
(1, 'walid', 'medicine');

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
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(7, 'New EDIT', 'asdfsdfsda', 'new-post', 'gsdfgsdafsadf', '', '2023-07-11 00:00:00'),
(8, 'this is the 8th post', 'dsfdfs', 'ddddddddd', 'dfghqdfuivghqsdfuihviudsnvioudfshbgfu8yhrsvjkdsnuvybdfuhvbdfsjhvbndru9yhfguvesfw', 'fd', '2023-07-11 00:00:00'),
(9, 'New add', 'zaber the bot', 'noob', 'abcd', 'a', '2023-07-11 00:00:00');

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
('abcd', 'efg', 'abc@gmail.com', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
