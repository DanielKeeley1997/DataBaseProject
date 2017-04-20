CREATE TRIGGER `after_delete_task` AFTER DELETE ON `task`
 FOR EACH ROW INSERT INTO deleted_tasks VALUES (OLD.task_id)

CREATE TRIGGER `remove_banned_user` AFTER INSERT ON `banned_users`
 FOR EACH ROW DELETE FROM verified_user WHERE ul_id = (SELECT banned_id FROM banned_users)
