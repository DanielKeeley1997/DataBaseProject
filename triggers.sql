delimiter //
CREATE TRIGGER deleted_tasks_update
BEFORE UPDATE OF `task`
FOR EACH ROW BEGIN
WHEN (CURRENT_TIME > `submit_by`)
INSERT INTO `deleted_task` (`task_id`) VALUE (new.task_id)
END;
//

delimiter //
CREATE TRIGGER remove_banned_user
AFTER UPDATE ON `banned_users`
FOR EACH ROW BEGIN
DELETE FROM `user`
WHERE `user`.`ul_id` = `banned_users`.`banned_id`
END
//

​delimiter //
CREATE TRIGGER deleted_tasks_update
BEFORE UPDATE ON `task`
FOR EACH ROW WHEN (CURRENT_TIME > `submit_by`)
INSERT INTO `deleted_task` (`task_id`) VALUE (new.task_id)
END //

delimiter //
CREATE TRIGGER deleted_tasks_update
BEFORE UPDATE 
ON `task` FOR EACH ROW 
WHEN (CURRENT_TIME > `submit_by`)
INSERT INTO `deleted_task` (`task_id`) VALUE (new.task_id)
END //