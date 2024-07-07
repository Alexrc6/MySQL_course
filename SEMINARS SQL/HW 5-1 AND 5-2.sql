-- HW SEMINAR 5. #1
USE schema3;
DROP TABLE IF EXISTS users; 

CREATE TABLE users
(
id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(20),
lastname VARCHAR(20)
);

CREATE TABLE messages
(
id INT AUTO_INCREMENT PRIMARY KEY,
from_user_id INT,
to_user_id INT
);



INSERT INTO users(firstname, lastname)
VALUES
('Sanek', 'II'),
('Lev', 'Gor'),
('Anna', 'Fray'),
('Stepan', 'Leaf'),
('Irena', 'Mur');

ALTER TABLE messages
ADD COLUMN created_at DATE;

ALTER TABLE messages
ADD COLUMN body VARCHAR(100) AFTER to_user_id;

INSERT INTO messages(from_user_id, to_user_id, body, created_at)
VALUES
(1, 2,'TEXT1', '2020-02-02'),
(3, 1,'TEXT1', '2020-03-04'),
(1, 4,'TEXT1', '2020-02-07'),
(3, 1,'TEXT1', '2020-01-11'),
(4, 2,'TEXT1', '2020-02-21'),
(5, 2,'TEXT1', '2020-03-01'),
(3, 5,'TEXT1', '2020-02-02');

SELECT * FROM users;
SELECT * FROM messages;
DROP TABLE messages;

-- Найти количество сообщений, отправленных каждым пользователей.
-- В зависимости от количества отправленных сообщений рассчитать ранг пользователей, 
-- первое место присвоив пользователю(ям) с наибольшим количеством отправленных сообщений.

-- Вывести полученный ранг, имя, фамилия, пользователя и кол-во отправленных сообщений. 
-- Выводимый список необходимо отсортировать в порядке возрастания ранга.

WITH count_send AS
(
SELECT * FROM
(
SELECT 
	from_user_id
    ,COUNT(*) AS cnt
    
FROM messages 
GROUP BY from_user_id
) as temp
RIGHT JOIN users ON users.id = temp.from_user_id
)
SELECT 
	DENSE_RANK() OVER (ORDER BY from_user_id) AS 'rank_msg'
    , firstname
    , lastname
    ,cnt
FROM count_send
ORDER BY rank_msg;


WITH count_send AS
(
SELECT 
	from_user_id
    ,COUNT(*) AS cnt
FROM messages 
GROUP BY from_user_id
)

SELECT 
	DENSE_RANK() OVER (ORDER BY cnt DESC) AS rank_user
    , firstname
    , lastname
    ,IF(cnt>0, cnt, 0) AS count_messages_send_from_user
FROM count_send
RIGHT JOIN users AS u ON u.id = count_send.from_user_id
ORDER BY rank_user;


-- РЕШЕНИЕ ГБ 
SELECT 
DENSE_RANK() OVER(ORDER BY COUNT(m.id) DESC) AS rank_message,
u.firstname, 
u.lastname, 
COUNT(m.id) AS cnt
FROM users u 
LEFT JOIN messages m ON u.id = m.from_user_id
GROUP BY u.id
ORDER BY cnt DESC;


SELECT * FROM messages;
-- Получите список сообщений, отсортированных по возрастанию даты отправки.
-- Вычислите разность между соседними значениями дат отправки. Разности выразите в минутах.
-- Выведите идентификатор сообщения, дату отправки, дату отправки следующего сообщения и разницу даты отправки соседних сообщений.

WITH list_msg AS
(
SELECT 
	*
    , LEAD(created_at, 1, NULL) OVER() AS next_msg
	
FROM messages
ORDER BY created_at
)

SELECT 
	id
    , created_at
    , next_msg
	-- , ROUND(((UNIX_TIMESTAMP(next_msg) - UNIX_TIMESTAMP(created_at)) / 60 ), 0) AS time_diff
    , ROUND(TIMESTAMPDIFF(MINUTE, created_at, next_msg)) AS time_diff
FROM list_msg;

-- РЕШЕНИЕ ГБ 
SELECT 
id, 
created_at,
LEAD(created_at) OVER(ORDER BY created_at) AS lead_time,
TIMESTAMPDIFF (MINUTE, created_at, LEAD(created_at) OVER(ORDER BY created_at)) AS minute_lead_diff
FROM messages;

