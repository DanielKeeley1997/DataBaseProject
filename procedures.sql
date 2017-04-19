DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `TaskPagesGreaterThen` (IN `tp` INT(6))
	SELECT *
    FROM task
    WHERE task_pages > tp$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerifyUser` (IN `ul_id` INT(8))  NO SQL
	INSERT INTO verified_user
	SELECT ul_id, password, ul_email, first_name, last_name, field
	FROM unverified_user
	WHERE unverified_user.ul_id = ul_id$$