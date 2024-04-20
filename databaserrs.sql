-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 05:21 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaserrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `roombooking`
--

CREATE TABLE `roombooking` (
  `BookingID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `BookingDate` varchar(60) NOT NULL,
  `TimeSlot` varchar(60) NOT NULL,
  `Status` varchar(60) NOT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roombooking`
--

INSERT INTO `roombooking` (`BookingID`, `RoomID`, `BookingDate`, `TimeSlot`, `Status`, `UserID`) VALUES
(1, 1, '8 April 2024', '8-10', 'Pending', 3),
(2, 1, '8 April 2024', '10-12', 'Free', 8),
(4, 1, '8 April 2024', '13-15', 'Pending', 3),
(5, 1, '8 April 2024', '15-17', 'Pending', 1),
(6, 2, '8 April 2024', '8-10', 'Disabled', 2),
(7, 2, '8 April 2024', '10-12', 'Free', 4),
(8, 2, '8 April 2024', '13-15', 'Free', 5),
(9, 2, '8 April 2024', '15-17', 'Free', 6),
(10, 3, '8 April 2024', '8-10', 'Disabled', 8),
(11, 3, '8 April 2024', '10-12', 'Free', 7),
(12, 3, '8 April 2024', '13-15', 'Free', NULL),
(13, 3, '8 April 2024', '15-17', 'Free', 5),
(14, 4, '8 April 2024', '8-10', 'Disabled', NULL),
(15, 4, '8 April 2024', '10-12', 'Free', 2),
(16, 4, '8 April 2024', '13-15', 'Free', 5),
(17, 4, '8 April 2024', '15-17', 'Free', NULL),
(18, 5, '8 April 2024', '8-10', 'Free', NULL),
(19, 5, '8 April 2024', '10-12', 'Free', 6),
(20, 5, '8 April 2024', '13-15', 'Free', NULL),
(21, 5, '8 April 2024', '15-17', 'Free', NULL),
(22, 6, '8 April 2024', '8-10', 'Free', NULL),
(23, 6, '8 April 2024', '10-12', 'Free', NULL),
(24, 6, '8 April 2024', '13-15', 'Free', NULL),
(25, 6, '8 April 2024', '15-17', 'Free', NULL),
(26, 7, '8 April 2024', '8-10', 'Reserved', 1),
(27, 7, '8 April 2024', '10-12', 'Free', NULL),
(28, 7, '8 April 2024', '13-15', 'Free', NULL),
(29, 7, '8 April 2024', '15-17', 'Free', NULL),
(30, 8, '8 April 2024', '8-10', 'Free', NULL),
(31, 8, '8 April 2024', '10-12', 'Free', NULL),
(32, 8, '8 April 2024', '13-15', 'Free', NULL),
(33, 8, '8 April 2024', '15-17', 'Free', NULL),
(34, 9, '8 April 2024', '8-10', 'Free', NULL),
(35, 9, '8 April 2024', '10-12', 'Free', NULL),
(36, 9, '8 April 2024', '13-15', 'Free', NULL),
(37, 9, '8 April 2024', '15-17', 'Free', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `RoomID` int(11) NOT NULL,
  `RoomNumber` varchar(60) NOT NULL,
  `RoomSize` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`RoomID`, `RoomNumber`, `RoomSize`) VALUES
(1, 'LR-101', 'Medium'),
(2, 'LR-102', 'Large'),
(3, 'LR-103', 'Large'),
(4, 'MR-101', 'Medium'),
(5, 'MR-102', 'Medium'),
(6, 'MR-103', 'Medium'),
(7, 'SR-101', 'Small'),
(8, 'SR-102', 'Small'),
(9, 'SR-103', 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(60) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `RoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Name`, `Email`, `Password`, `RoleID`) VALUES
(1, 'John', 'John Smith', 'johnsmith@gmail.com', '$2b$10$Wvc4OeCm6TBtuz.fkose6eociE1i9n4gtdIZEgEYexsWZMrQKkqRm', 1),
(2, 'Nathan', 'Nathan Anderson', 'nathan@gmail.com', '$2b$10$Wvc4OeCm6TBtuz.fkose6eociE1i9n4gtdIZEgEYexsWZMrQKkqRm', 1),
(3, 'Jon', 'Jon Snow', 'jonsnow@gmail.com', '$2b$10$Wvc4OeCm6TBtuz.fkose6eociE1i9n4gtdIZEgEYexsWZMrQKkqRm', 1),
(4, 'Jesse', 'Jesse Pinkman', 'jessepinkman@gmail.com', '$2b$10$Wvc4OeCm6TBtuz.fkose6eociE1i9n4gtdIZEgEYexsWZMrQKkqRm', 1),
(5, 'Alex', 'Alex White', 'Alexwhite@gmail.com', '$2b$10$qfc43YRra/fvTRltvL2US.LMqOoFKaVk1SQmyTMp/ZZZayPm.zsay', 2),
(6, 'Walt', 'Walter White', 'walterwhite@gmail.com', '$2b$10$qfc43YRra/fvTRltvL2US.LMqOoFKaVk1SQmyTMp/ZZZayPm.zsay', 2),
(7, 'Elena', 'Elena Castillo', 'elena@gmail.com', '$2b$10$tS8XzoFwtgOaNKdqBy9evukHNFZfbPokvwrSKQI6OPmFahdCaTAQG', 3),
(8, 'a', 'a', 'a@gmail.com', '$2b$10$fizB3W5CG08yIIGJL1D57uq.p4iKWej6SeIkKiOYbtYkOUbucoR3y', 1),
(9, 'b', 'b', 'b@gmail.com', '$2b$10$T9No1H2Ct4B7BJhGwPRxEOg8c3H.BWXJjC7KosABq9VtHLDUkfIiK', 1),
(10, 'c', 'c', 'c@gmail.com', '$2b$10$JRq0yfNRvaWBkNwzIwMDx.WPu.C4fXps/ZyOYFT8R76EIWnxj/co6', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roombooking`
--
ALTER TABLE `roombooking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `RoomID` (`RoomID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roombooking`
--
ALTER TABLE `roombooking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roombooking`
--
ALTER TABLE `roombooking`
  ADD CONSTRAINT `roombooking_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `rooms` (`RoomID`),
  ADD CONSTRAINT `roombooking_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
