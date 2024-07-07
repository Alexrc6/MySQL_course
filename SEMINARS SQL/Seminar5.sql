

USE new_schema1;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50) NOT NULL,
status VARCHAR(10) NOT NULL);

CREATE TABLE users_profile (
username VARCHAR(50) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE);

INSERT INTO users values
('admin' , '7856', 'Active'),
('staff' , '90802', 'Active'),
('manager' , '35462', 'Inactive');

INSERT INTO users_profile values
('admin', 'Administrator' , 'Dhanmondi', 'admin@test.com' ) ,
('staff', 'Jakir Nayek' , 'Mirpur', 'zakir@test.com' ),
('manager', 'Mehr Afroz' , 'Eskaton', 'mehr@test.com' );

SELECT * FROM users;
SELECT * FROM users_profile;

-- Используя СТЕ, выведите всех пользователей из таблицы users_profile
WITH cte_users AS
(
SELECT * FROM users_profile
)
SELECT * FROM cte_users;

-- 2. Используя СТЕ, подсчитайте количество активных пользователей . Задайте псевдоним результирующему окну. Пример:

WITH count_status AS
(
-- SELECT IF(status = 'Active', COUNT(*), COUNT(*)) AS cnt FROM users
SELECT status, COUNT(*) AS cnt FROM users
GROUP BY status
)
SELECT * FROM count_status
WHERE LOWER(status) = 'active';

WITH RECURSIVE sequence (n) AS
(
SELECT 0
UNION ALL
SELECT n + 1
FROM sequence
WHERE n + 1 <= 10
)
SELECT n
FROM sequence;

-- 3. С помощью СТЕ реализуйте таблицу квадратов чисел от 1 до 10:_x000b_(пример для чисел от 1 до 3)


WITH RECURSIVE cte_rec AS
(
	SELECT 1 AS n, 1 AS res
    UNION ALL
    SELECT n + 1 AS n, POW(n + 1, 2) AS res
    FROM cte_rec
    WHERE n + 1 <= 10
)
SELECT *
FROM cte_rec;



