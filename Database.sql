-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2018 at 07:24 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Bootstrap'),
(2, 'Javascript'),
(4, 'JAVA'),
(28, 'PHP');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL,
  `comment_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_author`, `comment_email`, `comment_post_id`, `comment_status`, `comment_date`, `comment_content`) VALUES
(5, 'Tanya', 'tanyasingh12@gmail.com', 1, 'unapproved', '0000-00-00', 'until next time till then love love'),
(6, 'Yash', 'bhvgvh@fghbj.com', 7, 'approved', '2017-12-27', 'BeYpuNick'),
(10, 'Charlie', 'sheen@playboy.com', 7, 'approved', '2017-12-28', 'touche. Pay the rent.'),
(14, 'mansi', 'khemka@brain.com', 1, 'unapproved', '2017-12-28', 'Samsung R and D Bitch.'),
(15, 'Donna', 'paulsen@amazing.com', 7, 'approved', '2017-12-28', 'I am never wrong.'),
(16, 'Yash', 'yashbhojgarhia@gmail.com', 10, 'unapproved', '2018-01-05', 'Prarthana, thjs one for you love.');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(225) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(1, 28, 'Edwins CMS PHP course is awesome', 'John doe', '2017-12-28', 'image_2.jpg', 'WOW! I really like this course.                                                                ', 'edwin, php, javascript', 5, 'published', 4),
(7, 1, 'Javascript', 'Edwin Diaz', '2017-12-31', 'image_4.jpg', '<p>are ek baar se dil nahi bharta mudke dekh mujhe dobaara. tang tang tang tan tana tan tan taaara, chalti hai kya 9 se 12 subah ke film ki do tickete hai film tujhe dikhaau aankh maartui hai ladki ajeeb hai.</p>                ', 'edwin, javascript, married', 3, 'published', 1),
(8, 1, 'Stranger Things', 'Eleven', '2017-12-31', 'image_3.jpg', '<p>jhjkkhekhleikewjkhjeee</p>        ', 'stranger, things, eleven', 0, 'published', 0),
(10, 4, 'Tibrewal, You Got me.', 'Bhojgarhia', '2018-01-01', 'image_2.jpg', '<p><strong>DPS, Rourkela.</strong></p>\r\n<p>What up ?</p>', 'bhojgarhia, tibrewal', 0, 'published', 4),
(11, 28, 'January', 'Year', '2018-01-03', 'image_1.jpg', ' 1st Month.', 'jan, january, year', 0, 'published', 0),
(12, 1, 'February', 'Year', '2018-01-03', 'image_2.jpg', '2nd Month.', 'february, year', 0, 'published', 0),
(13, 2, 'March', 'Year', '2018-01-03', 'image_3.jpg', '3rd Month.', 'march, year', 0, 'published', 1),
(14, 4, 'April', 'Month', '2018-01-03', 'image_4.jpg', '        4th Month.', 'april, month', 0, 'published', 1),
(15, 28, 'May', 'Month', '2018-01-03', 'image_5.jpg', '5th Month.\r\n        ', 'may, month', 0, 'published', 0),
(16, 1, 'June', 'Month', '2018-01-03', 'image_1.jpg', '6th Month.        ', 'june, month', 0, 'published', 0),
(17, 2, 'July', 'Week', '2018-01-03', 'image_2.jpg', '        7th Month.', 'july, week', 0, 'published', 0),
(18, 4, 'August', 'Week', '2018-01-03', 'image_3.jpg', '        8th Month', 'august, week', 0, 'published', 1),
(19, 28, 'Spetember', 'Week', '2018-01-03', 'image_4.jpg', '9th Month.        ', 'september, week', 0, 'published', 1),
(20, 1, 'October', 'Day', '2018-01-03', 'image_1.jpg', '10th Month.        ', 'october, day', 0, 'published', 0),
(21, 2, 'November', 'Day', '2018-01-03', 'image_2.jpg', '11th Month.        ', 'november, day', 0, 'published', 0),
(22, 4, 'December', 'Day', '2018-01-03', 'image_3.jpg', '12th Month.        ', 'december, day', 0, 'published', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(8, 'yashbhojgarhia', '$2y$12$l2B/U.B7e/LC/pdJlWAJfuQA9ZbUNQ1CPyahe/BByLe.eDVKEH6Ee', 'Yash', 'Bhojgarhia', 'yashbhojgarhia@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(11, 'mansi', '$2y$10$H/kDTIO1P9vO3gOkqRlD8.34XbR1jz5hDlS21hIpGG6Mxm5dUoFYG', 'Mansi', 'Khemka', 'mansi.khemka@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(1, 'etdt53nb9gfiqppn7ej6hgfats', 1515111648),
(2, 'qobma9vl6iigtqp3chl8q66fkv', 1515127688),
(3, 'cu1gpbolritfffh8igqpibfj6j', 1515122318),
(4, 'hp3aidsobbvpnjduabi5osncv1', 1515123581),
(5, 'efru2nrdg6od6j1456m53oc1vf', 1515189728),
(6, '0db525cvh9jtdd65dnvsri1a9n', 1515211368),
(7, '3rr821350kmuq2mpf8258php0e', 1515211461),
(8, 'le0d9a3c4nqn5npg7dd1em5c7p', 1515280383),
(9, 'trsmm1skkcnn7hdnv7kfkqjr4p', 1515521956),
(10, 'mtnnu6t21le14tn0hso8nfnn1v', 1515565807),
(11, '0rrv5crmsa744lt1qqfpfq0gl0', 1515610747);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
