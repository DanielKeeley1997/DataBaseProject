SELECT task_id, COUNT(*)
FROM task
WHERE task_pages > 5
GROUP BY task_id
HAVING COUNT(task_id) < 10;



SELECT * 
FROM verified_user 
WHERE field IN(SELECT field 
         		FROM verified_user 
         		WHERE field = 'Sports Science');

SELECT ul_id
FROM user_task, task
WHERE(SELECT COUNT(task_type = 'Thesis') > 2)
UNION
SELECT created 
FROM task
WHERE(created <= '2017-04-10 00:00:00');

//////////////////////////////////////

create view task_summary1 AS 
select task_title, task_description 
from task 
where task_pages < 1000

create view task_summary2 AS 
select task_title, task_description 
from task 
where task_words < 7000;

//////////////////////////////////////

create index idx_student
on verified_user(first_name, last_name); 

create index idx_login_details
on verified_user(ul_id, password);

create index idx_task_type
on task(task_type);

create index idx_task
on task(task_title, task_description);      		
