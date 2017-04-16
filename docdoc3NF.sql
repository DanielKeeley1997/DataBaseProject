-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2017 at 10:34 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2017 at 07:55 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docdoc`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `TaskPagesGreaterThen` (IN `tp` INT(6))  SELECT *
    FROM task
    WHERE task_pages > tp$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerifyUser` (IN `ul_id` INT(8))  NO SQL
INSERT INTO verified_user
SELECT ul_id, password, ul_email, first_name, last_name, field
FROM unverified_user
WHERE unverified_user.ul_id = ul_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `banned_users`
--

CREATE TABLE `banned_users` (
  `banned_id` int(8) NOT NULL,
  `banned_email` varchar(64) NOT NULL,
  `banned_reason` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banned_users`
--

INSERT INTO `banned_users` (`banned_id`, `banned_email`, `banned_reason`) VALUES
(15112345, '15112345@studentmail.ul.ie', 'Spam');

-- --------------------------------------------------------

--
-- Table structure for table `claimed_tasks`
--

CREATE TABLE `claimed_tasks` (
  `task_id` int(4) NOT NULL,
  `claimed_by_ul_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claimed_tasks`
--

INSERT INTO `claimed_tasks` (`task_id`, `claimed_by_ul_id`) VALUES
(2, 15167524);

-- --------------------------------------------------------

--
-- Table structure for table `completed_tasks`
--

CREATE TABLE `completed_tasks` (
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_tasks`
--

CREATE TABLE `deleted_tasks` (
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_tasks`
--

INSERT INTO `deleted_tasks` (`task_id`) VALUES
(3);

-- --------------------------------------------------------

--
-- Table structure for table `failed_tasks`
--

CREATE TABLE `failed_tasks` (
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flagged_tasks`
--

CREATE TABLE `flagged_tasks` (
  `task_id` int(4) NOT NULL,
  `flagged_by_ul_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flagged_tasks`
--

INSERT INTO `flagged_tasks` (`task_id`, `flagged_by_ul_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 15162543),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `is_user_moderator`
--

CREATE TABLE `is_user_moderator` (
  `ul_id` int(8) NOT NULL,
  `is_moderator` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(4) NOT NULL,
  `tag_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1, 'Programming'),
(2, 'Coding'),
(3, 'Computers'),
(4, 'Java'),
(5, 'Cobalt');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(4) NOT NULL,
  `task_title` varchar(64) NOT NULL,
  `task_type` varchar(16) NOT NULL,
  `task_description` varchar(240) NOT NULL,
  `task_pages` int(6) NOT NULL,
  `task_words` int(10) NOT NULL,
  `task_format` varchar(6) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `claimed_by` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `submit_by` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_title`, `task_type`, `task_description`, `task_pages`, `task_words`, `task_format`, `created`, `claimed_by`, `submit_by`) VALUES
(1, 'Java is Fun', 'Paper', 'A paper on why java is fun.', 1000, 330, '.docx', '2017-04-10 13:14:41', '2017-04-26 00:00:00', '2017-04-29 00:00:00'),
(2, 'C++ for beginners.', 'Thesis', 'A paper on why C++ is hard.', 1101, 604, '.txt', '2017-04-10 13:14:45', '2017-04-29 00:00:00', '2017-04-29 00:00:00'),
(3, 'Python is easy.\r\n\r\n', 'Report', 'A report in why python is easy.', 4302, 74877, '.txt', '2017-04-10 13:32:16', '2017-04-19 00:00:00', '2017-04-28 00:00:00'),
(4, 'Python is easy.\r\n\r\n', 'Report', 'A report in why python is easy.', 4302, 74877, '.txt', '2017-04-10 13:32:19', '2017-04-19 00:00:00', '2017-04-28 00:00:00'),
(5, 'Who even uses cobalt anymore?', 'Thesis', 'A thesis on who even uses cobalt anymore.', 450, 1090, '.pdf', '2017-04-10 13:33:37', '2017-04-25 00:00:00', '2017-04-30 00:00:00'),
(6, 'Who even uses cobalt anymore?', 'Thesis', 'A thesis on who even uses cobalt anymore.', 450, 1090, '.pdf', '2017-04-10 13:33:39', '2017-04-25 00:00:00', '2017-04-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `task_tag`
--

CREATE TABLE `task_tag` (
  `tag_id` int(4) NOT NULL,
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task_tag`
--

INSERT INTO `task_tag` (`tag_id`, `task_id`) VALUES
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `unverified_user`
--

CREATE TABLE `unverified_user` (
  `ul_id` int(8) NOT NULL,
  `password` varchar(60) NOT NULL,
  `ul_email` varchar(36) NOT NULL,
  `first_name` varchar(16) NOT NULL,
  `last_name` varchar(26) NOT NULL,
  `field` varchar(26) NOT NULL,
  `verification_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all user information for quicker queries';

--
-- Dumping data for table `unverified_user`
--

INSERT INTO `unverified_user` (`ul_id`, `password`, `ul_email`, `first_name`, `last_name`, `field`, `verification_code`) VALUES
(12345678, 'VerifyMe', '12345678@studentmail.ul.ie', 'Verify', 'Me', 'Science', '561995'),
(15102947, 'CharegerPorts', '15102947@studentmail.ul.ie', 'Mossy', 'Lehi', 'Mathematics', '429045'),
(15128346, 'coMputers420', '15128346@studentmail.ul.ie', 'Lee', 'Carey', 'Sports Science', '138537'),
(15165456, 'ThinsAreTasty', '15165456@studentmail.ul.ie', 'Shane', 'O\'Malley', 'Product Design', '312537'),
(15189456, 'LaptopCharger', '15189456@studentmail.ul.ie', 'Vilius', 'Drumsta', 'Science', '467297'),
(15198767, 'Headphones$', '15198767@studentmail.ul.ie', 'Kyle', 'McKenny', 'Aeronautical', '389056');

-- --------------------------------------------------------

--
-- Table structure for table `user_favourite_tags`
--

CREATE TABLE `user_favourite_tags` (
  `ul_id` int(8) NOT NULL,
  `favourite_tag_1` int(3) NOT NULL,
  `favourite_tag_2` int(3) NOT NULL,
  `favourite_tag_3` int(3) NOT NULL,
  `favourite_tag_4` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_favourite_tags`
--

INSERT INTO `user_favourite_tags` (`ul_id`, `favourite_tag_1`, `favourite_tag_2`, `favourite_tag_3`, `favourite_tag_4`) VALUES
(15134562, 1, 4, 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_most_recent_viewed`
--

CREATE TABLE `user_most_recent_viewed` (
  `ul_id` int(8) NOT NULL,
  `most_recent_viewed_task_1` int(4) NOT NULL,
  `most_recent_viewed_task_2` int(4) NOT NULL,
  `most_recent_viewed_task_3` int(4) NOT NULL,
  `most_recent_viewed_task_4` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_most_recent_viewed`
--

INSERT INTO `user_most_recent_viewed` (`ul_id`, `most_recent_viewed_task_1`, `most_recent_viewed_task_2`, `most_recent_viewed_task_3`, `most_recent_viewed_task_4`) VALUES
(15134562, 1, 4, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_reputation`
--

CREATE TABLE `user_reputation` (
  `ul_id` int(8) NOT NULL,
  `reputation` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_task`
--

CREATE TABLE `user_task` (
  `ul_id` int(8) NOT NULL,
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_task`
--

INSERT INTO `user_task` (`ul_id`, `task_id`) VALUES
(15109214, 1),
(15123492, 2),
(15162307, 3),
(15162307, 5),
(15189082, 6);

-- --------------------------------------------------------

--
-- Table structure for table `verified_user`
--

CREATE TABLE `verified_user` (
  `ul_id` int(8) NOT NULL,
  `password` varchar(60) NOT NULL,
  `ul_email` varchar(36) NOT NULL,
  `first_name` varchar(16) NOT NULL,
  `last_name` varchar(26) NOT NULL,
  `field` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all user information for quicker queries';

--
-- Dumping data for table `verified_user`
--

INSERT INTO `verified_user` (`ul_id`, `password`, `ul_email`, `first_name`, `last_name`, `field`) VALUES
(12345678, 'VerifyMe', '12345678@studentmail.ul.ie', 'Verify', 'Me', 'Science'),
(15109214, 'IcanBench120', '15109214@studentmail.ul.ie', 'Shiofra', 'Keogh', 'Sports Science'),
(15123492, 'IamColourBlind', '15123492@studentmail.ul.ie', 'Matthew', 'Murphy', 'Proffesional Reader'),
(15134562, 'WohLordCopOn', '15134562@studentmail.ul.ie', 'Tim', 'Tim', 'Science'),
(15162307, 'QwERtY', '15162307@studentmail.ul.ie', 'Jack', 'Barett', 'Computer Games'),
(15178345, 'WaterBottle231', '15178345@studentmail.ul.ie', 'Eva', 'Finn', 'Proffesional Bee Keeper'),
(15189082, 'Asdfjbv', '15189082@studentmail.ul.ie', 'Daniel', 'Keeley', 'Computer Science');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banned_users`
--
ALTER TABLE `banned_users`
  ADD PRIMARY KEY (`banned_id`);

--
-- Indexes for table `claimed_tasks`
--
ALTER TABLE `claimed_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `deleted_tasks`
--
ALTER TABLE `deleted_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `failed_tasks`
--
ALTER TABLE `failed_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `flagged_tasks`
--
ALTER TABLE `flagged_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `is_user_moderator`
--
ALTER TABLE `is_user_moderator`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `task_tag`
--
ALTER TABLE `task_tag`
  ADD PRIMARY KEY (`tag_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `unverified_user`
--
ALTER TABLE `unverified_user`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_favourite_tags`
--
ALTER TABLE `user_favourite_tags`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_most_recent_viewed`
--
ALTER TABLE `user_most_recent_viewed`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_reputation`
--
ALTER TABLE `user_reputation`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_task`
--
ALTER TABLE `user_task`
  ADD PRIMARY KEY (`ul_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `verified_user`
--
ALTER TABLE `verified_user`
  ADD PRIMARY KEY (`ul_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `claimed_tasks`
--
ALTER TABLE `claimed_tasks`
  ADD CONSTRAINT `claimed_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  ADD CONSTRAINT `completed_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `failed_tasks`
--
ALTER TABLE `failed_tasks`
  ADD CONSTRAINT `failed_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flagged_tasks`
--
ALTER TABLE `flagged_tasks`
  ADD CONSTRAINT `flagged_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `is_user_moderator`
--
ALTER TABLE `is_user_moderator`
  ADD CONSTRAINT `is_user_moderator_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `user_reputation` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_tag`
--
ALTER TABLE `task_tag`
  ADD CONSTRAINT `task_tag_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_tag_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_favourite_tags`
--
ALTER TABLE `user_favourite_tags`
  ADD CONSTRAINT `user_favourite_tags_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `verified_user` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_most_recent_viewed`
--
ALTER TABLE `user_most_recent_viewed`
  ADD CONSTRAINT `user_most_recent_viewed_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `verified_user` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_task`
--
ALTER TABLE `user_task`
  ADD CONSTRAINT `user_task_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `verified_user` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docdoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `banned_users`
--

CREATE TABLE `banned_users` (
  `banned_id` int(8) NOT NULL,
  `banned_email` varchar(64) NOT NULL,
  `banned_reason` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `claimed_tasks`
--

CREATE TABLE `claimed_tasks` (
  `task_id` int(4) NOT NULL,
  `claimed_by_ul_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `completed_tasks`
--

CREATE TABLE `completed_tasks` (
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_tasks`
--

CREATE TABLE `deleted_tasks` (
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `failed_tasks`
--

CREATE TABLE `failed_tasks` (
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flagged_tasks`
--

CREATE TABLE `flagged_tasks` (
  `task_id` int(4) NOT NULL,
  `flagged_by_ul_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flagged_tasks`
--

INSERT INTO `flagged_tasks` (`task_id`, `flagged_by_ul_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `is_user_moderator`
--

CREATE TABLE `is_user_moderator` (
  `ul_id` int(8) NOT NULL,
  `is_moderator` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(4) NOT NULL,
  `tag_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1, 'Programming'),
(2, 'Coding'),
(3, 'Computers'),
(4, 'Java'),
(5, 'Cobalt');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(4) NOT NULL,
  `task_title` varchar(64) NOT NULL,
  `task_type` varchar(16) NOT NULL,
  `task_description` varchar(240) NOT NULL,
  `task_pages` int(6) NOT NULL,
  `task_words` int(10) NOT NULL,
  `task_format` varchar(6) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `claimed_by` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `submit_by` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_title`, `task_type`, `task_description`, `task_pages`, `task_words`, `task_format`, `created`, `claimed_by`, `submit_by`) VALUES
(1, 'Java is Fun', 'Paper', 'A paper on why java is fun.', 1000, 330, '.docx', '2017-04-10 13:14:41', '2017-04-26 00:00:00', '2017-04-29 00:00:00'),
(2, 'C++ for beginners.', 'Thesis', 'A paper on why C++ is hard.', 1101, 604, '.txt', '2017-04-10 13:14:45', '2017-04-29 00:00:00', '2017-04-29 00:00:00'),
(3, 'Python is easy.\r\n\r\n', 'Report', 'A report in why python is easy.', 4302, 74877, '.txt', '2017-04-10 13:32:16', '2017-04-19 00:00:00', '2017-04-28 00:00:00'),
(4, 'Python is easy.\r\n\r\n', 'Report', 'A report in why python is easy.', 4302, 74877, '.txt', '2017-04-10 13:32:19', '2017-04-19 00:00:00', '2017-04-28 00:00:00'),
(5, 'Who even uses cobalt anymore?', 'Thesis', 'A thesis on who even uses cobalt anymore.', 450, 1090, '.pdf', '2017-04-10 13:33:37', '2017-04-25 00:00:00', '2017-04-30 00:00:00'),
(6, 'Who even uses cobalt anymore?', 'Thesis', 'A thesis on who even uses cobalt anymore.', 450, 1090, '.pdf', '2017-04-10 13:33:39', '2017-04-25 00:00:00', '2017-04-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `task_tag`
--

CREATE TABLE `task_tag` (
  `tag_id` int(4) NOT NULL,
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task_tag`
--

INSERT INTO `task_tag` (`tag_id`, `task_id`) VALUES
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `unverified_user`
--

CREATE TABLE `unverified_user` (
  `ul_id` int(8) NOT NULL,
  `password` varchar(60) NOT NULL,
  `ul_email` varchar(36) NOT NULL,
  `first_name` varchar(16) NOT NULL,
  `last_name` varchar(26) NOT NULL,
  `field` varchar(26) NOT NULL,
  `verification_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all user information for quicker queries';

--
-- Dumping data for table `unverified_user`
--

INSERT INTO `unverified_user` (`ul_id`, `password`, `ul_email`, `first_name`, `last_name`, `field`, `verification_code`) VALUES
(15102947, 'CharegerPorts', '15102947@studentmail.ul.ie', 'Mossy', 'Lehi', 'Mathematics', '429045'),
(15128346, 'coMputers420', '15128346@studentmail.ul.ie', 'Lee', 'Carey', 'Sports Science', '138537'),
(15165456, 'ThinsAreTasty', '15165456@studentmail.ul.ie', 'Shane', 'O\'Malley', 'Product Design', '312537'),
(15189456, 'LaptopCharger', '15189456@studentmail.ul.ie', 'Vilius', 'Drumsta', 'Science', '467297'),
(15198767, 'Headphones$', '15198767@studentmail.ul.ie', 'Kyle', 'McKenny', 'Aeronautical', '389056');

-- --------------------------------------------------------

--
-- Table structure for table `user_favourite_tags`
--

CREATE TABLE `user_favourite_tags` (
  `ul_id` int(8) NOT NULL,
  `favourite_tag_1` int(3) NOT NULL,
  `favourite_tag_2` int(3) NOT NULL,
  `favourite_tag_3` int(3) NOT NULL,
  `favourite_tag_4` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_most_recent_viewed`
--

CREATE TABLE `user_most_recent_viewed` (
  `ul_id` int(8) NOT NULL,
  `most_recent_viewed_task_1` int(4) NOT NULL,
  `most_recent_viewed_task_2` int(4) NOT NULL,
  `most_recent_viewed_task_3` int(4) NOT NULL,
  `most_recent_viewed_task_4` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_reputation`
--

CREATE TABLE `user_reputation` (
  `ul_id` int(8) NOT NULL,
  `reputation` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_task`
--

CREATE TABLE `user_task` (
  `ul_id` int(8) NOT NULL,
  `task_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_task`
--

INSERT INTO `user_task` (`ul_id`, `task_id`) VALUES
(15109214, 1),
(15123492, 2),
(15162307, 3),
(15162307, 5),
(15189082, 6);

-- --------------------------------------------------------

--
-- Table structure for table `verified_user`
--

CREATE TABLE `verified_user` (
  `ul_id` int(8) NOT NULL,
  `password` varchar(60) NOT NULL,
  `ul_email` varchar(36) NOT NULL,
  `first_name` varchar(16) NOT NULL,
  `last_name` varchar(26) NOT NULL,
  `field` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all user information for quicker queries';

--
-- Dumping data for table `verified_user`
--

INSERT INTO `verified_user` (`ul_id`, `password`, `ul_email`, `first_name`, `last_name`, `field`) VALUES
(15109214, 'IcanBench120', '15109214@studentmail.ul.ie', 'Shiofra', 'Keogh', 'Sports Science'),
(15123492, 'IamColourBlind', '15123492@studentmail.ul.ie', 'Matthew', 'Murphy', 'Proffesional Reader'),
(15162307, 'QwERtY', '15162307@studentmail.ul.ie', 'Jack', 'Barett', 'Computer Games'),
(15178345, 'WaterBottle231', '15178345@studentmail.ul.ie', 'Eva', 'Finn', 'Proffesional Bee Keeper'),
(15189082, 'Asdfjbv', '15189082@studentmail.ul.ie', 'Daniel', 'Keeley', 'Computer Science');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banned_users`
--
ALTER TABLE `banned_users`
  ADD PRIMARY KEY (`banned_id`);

--
-- Indexes for table `claimed_tasks`
--
ALTER TABLE `claimed_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `deleted_tasks`
--
ALTER TABLE `deleted_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `failed_tasks`
--
ALTER TABLE `failed_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `flagged_tasks`
--
ALTER TABLE `flagged_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `is_user_moderator`
--
ALTER TABLE `is_user_moderator`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `task_tag`
--
ALTER TABLE `task_tag`
  ADD PRIMARY KEY (`tag_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `unverified_user`
--
ALTER TABLE `unverified_user`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_favourite_tags`
--
ALTER TABLE `user_favourite_tags`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_most_recent_viewed`
--
ALTER TABLE `user_most_recent_viewed`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_reputation`
--
ALTER TABLE `user_reputation`
  ADD PRIMARY KEY (`ul_id`);

--
-- Indexes for table `user_task`
--
ALTER TABLE `user_task`
  ADD PRIMARY KEY (`ul_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `verified_user`
--
ALTER TABLE `verified_user`
  ADD PRIMARY KEY (`ul_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `claimed_tasks`
--
ALTER TABLE `claimed_tasks`
  ADD CONSTRAINT `claimed_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `completed_tasks`
--
ALTER TABLE `completed_tasks`
  ADD CONSTRAINT `completed_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `failed_tasks`
--
ALTER TABLE `failed_tasks`
  ADD CONSTRAINT `failed_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flagged_tasks`
--
ALTER TABLE `flagged_tasks`
  ADD CONSTRAINT `flagged_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `is_user_moderator`
--
ALTER TABLE `is_user_moderator`
  ADD CONSTRAINT `is_user_moderator_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `user_reputation` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_tag`
--
ALTER TABLE `task_tag`
  ADD CONSTRAINT `task_tag_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_tag_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_favourite_tags`
--
ALTER TABLE `user_favourite_tags`
  ADD CONSTRAINT `user_favourite_tags_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `verified_user` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_most_recent_viewed`
--
ALTER TABLE `user_most_recent_viewed`
  ADD CONSTRAINT `user_most_recent_viewed_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `verified_user` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_task`
--
ALTER TABLE `user_task`
  ADD CONSTRAINT `user_task_ibfk_1` FOREIGN KEY (`ul_id`) REFERENCES `verified_user` (`ul_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
