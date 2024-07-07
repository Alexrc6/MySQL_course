-- Выведите участников, которые также являются членами комитета, используйте INNER JOIN (пересечение 2 таблиц по имени);

CREATE TABLE members
(
member_id INT AUTO_INCREMENT,
name VARCHAR (100) ,
PRIMARY KEY (member_id)
);

CREATE TABLE committees
(
committee_id INT AUTO_INCREMENT,
name VARCHAR (100),
PRIMARY KEY (committee_id)
);

INSERT INTO members (name)
VALUES("John"), ("Jane"), ("Mary"), ("David"), ("Amelia");
INSERT INTO committees (name)
VALUES ("John"), ("Mary"), ("Amelia"), ("Joe");

SELECT * FROM members;
SELECT * FROM committees;
TRUNCATE TABLE members;

-- 1
SELECT * FROM members AS m
JOIN committees AS c
    ON m.name = c.name;
    
    -- 2
SELECT * FROM members AS m
JOIN committees AS c
    USING(name); -- ЛУЧШЕ НЕ ИСПОЛЬЗОВАТЬ
    
  --   Задание:
-- 1. Выведите участников, которые являются членами комитета (Используя LEFT JOIN, выполните соединение двух таблиц по полю “Имя”)
-- 2.* Выведите участников, которые не являются членами комитета

SELECT * 
FROM members AS m
LEFT JOIN committees AS c
	ON m.name = c.name
WHERE 
    c.name IS NULL;    
    ;
    



-- 2. Выполнить RIGHT JOIN между 2 таблицами по полю “Имя”

SELECT * 
FROM members AS m
RIGHT JOIN committees AS c
	ON m.name = c.name
    ;


-- 1. Найти членов комитета, которых нет в members с помощью RIGHT JOIN

SELECT * 
FROM members AS m
RIGHT JOIN committees AS c
	ON m.name = c.name
WHERE 
    m.name IS NULL;
    ;

-- Задание: 1. Выведите перекрестное произведение таблиц members - committees

SELECT * 
FROM members AS m
CROSS JOIN committees AS c;

-- FULL JOIN

SELECT * 
FROM members AS m
LEFT JOIN committees AS c
	ON m.name = c.name
UNION
SELECT * 
FROM members AS m
RIGHT JOIN committees AS c
	ON m.name = c.name


-- Задание:
-- 1. Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей
-- 2. Получить список пользователей и клиентов. Дубликаты удалять не нужно

create table users
(
id int auto_increment primary key,
login varchar(255) null,
pass varchar(255) null,
male tinyint null
);

create table clients
(
id int auto_increment primary key,
login varchar(255) null,
pass varchar(255) null,
male tinyint null
);

INSERT INTO users (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO users (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO users (login, pass, male) VALUES ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO users (login, pass, male) VALUES ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO users (login, pass, male) VALUES ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO users (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

INSERT INTO clients (login, pass, male) VALUES ('alexander', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Dmitry', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Leonid', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Olga', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Masha', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO clients (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);


SELECT * FROM users; 
SELECT * FROM clients;

-- 1. Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей
SELECT login FROM users
UNION SELECT login FROM clients;

-- 2. Получить список пользователей и клиентов. Дубликаты удалять не нужно

SELECT login FROM users
UNION ALL SELECT login FROM clients
ORDER BY login;

-- Оператор IN
-- Проверьте, присутствует ли буква “А” в последовательности 'A', 'B', 'C', 'D'

SELECT 'A' IN ('A', 'B', 'C', 'D');
SELECT 'A' NOT IN ('A', 'B', 'C', 'D');

-- Проверьте, присутствует ли буква “Z” в последовательности 'A', 'B', 'C', 'D'

SELECT 'Z' IN ('A', 'B', 'C', 'D');


-- Получить столбцы из таблицы “clients” , в которых первое имя является набором значений.

SELECT login FROM clients
WHERE login IN ('alex', 'Mikle');
-- WHERE login = 'alex' OR login = 'Mikle'; -- С OR работает быстрее, чем с IN

-- Выберите все логины из таблицы “users”, кроме “Mikle”.
SELECT login FROM clients
WHERE login NOT IN ('Mikle');


-- 1. Получите из таблицы "Сотрудники" только тех сотрудников, которые в данный момент работают над любым из активных проектов.

-- 2. Проверьте, существует ли сотрудник с идентификатором 1004 в таблице сотрудников или нет.

CREATE TABLE Employee (
Id INT PRIMARY KEY,
Name VARCHAR(45) NOT NULL,
Department VARCHAR(45) NOT NULL,
Salary FLOAT NOT NULL,
Gender VARCHAR(45) NOT NULL,
Age INT NOT NULL,
City VARCHAR(45) NOT NULL
);
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');

CREATE TABLE Projects (
ProjectId INT PRIMARY KEY AUTO_INCREMENT,
Title VARCHAR(200) NOT NULL,
ClientId INT,
EmployeeId INT,
StartDate DATETIME,
EndDate DATETIME
);
INSERT INTO Projects ( Title, ClientId, EmployeeId, StartDate, EndDate) VALUES
('Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)), -- NOW() - текущее время; 
('WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)), -- DATE_ADD(NOW(), INTERVAL 45 DAY)) - добавляет 45 дней
('Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));

SELECT * FROM Employee;
SELECT * FROM Projects;
	
-- 2. Проверьте, существует ли сотрудник с идентификатором 1004 в таблице сотрудников или нет.

SELECT * FROM Employee WHERE id = 1004;

SELECT EXISTS (SELECT * FROM Employee WHERE id = 1004);
SELECT EXISTS (SELECT * FROM Employee WHERE id = 1014);
    
-- 1. Получите из таблицы "Сотрудники" только тех сотрудников, которые в данный момент работают над любым из активных проектов.
SELECT * FROM Employee WHERE id IN (SELECT EmployeeId FROM Projects);

SELECT * FROM Employee AS e WHERE EXISTS (SELECT * FROM Projects AS p WHERE e.id = p.EmployeeId);

SELECT e.*
FROM Employee AS e
JOIN Projects AS p      -- самый быстродействующий
	ON p.EmployeeId = e.id;