/*
1.	Выведите все записи, отсортированные по полю "age" по возрастанию

2.	Выведите все записи, отсортированные по полю
 " firstname "

3.	Выведите записи полей " firstname ", "lastname","age",
отсортированные по полю " firstname " в алфавитном порядке по убыванию

4.	Выполните сортировку по полям " firstname " и "age" по убыванию
*/

USE seminar_3;
DROP TABLE IF EXISTS staff; -- IF EXISTS делает предупреждение, если таблицы нет, но запрос работает 
CREATE TABLE IF NOT EXISTS staff (   -- IF NOT EXISTS делает предупреждение, но запрос работает
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

SELECT * FROM staff;

-- 1
SELECT *
FROM staff
-- WHERE 
ORDER BY age;

-- 2

SELECT *
FROM staff
-- WHERE 
ORDER BY firstname;

-- 3

SELECT 
     firstname
     ,lastname
     ,age
FROM staff
-- WHERE 
ORDER BY firstname DESC;

-- 4

SELECT *
FROM staff
-- WHERE 
ORDER BY firstname, age DESC; -- ОБА ПОЛЯ ПО УБЫВАНИЮ. ORDER BY firstname DESC, age - ВТОРОЕ ПОЛЕ ПО ВОЗРАСТАНИЮ

-- +++

SELECT 
     firstname
     ,lastname
     ,age
FROM staff
WHERE 1=1 -- ФИШКА ДЛЯ УДОБСТВА ИЗМЕНЕНИЯ КОДА BEST PRACTICE
    AND firstname = 'Юрий' 
    AND age > 24 
ORDER BY firstname DESC;



-- 1. Выведите уникальные (неповторяющиеся) значения полей "firstname"

SELECT DISTINCT firstname
FROM staff;

SELECT DISTINCT firstname, age
FROM staff;

-- SELECT firstname
-- FROM staff
-- GROUP BY firstname; 

-- 2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые   две записи данной выборки

SELECT * 
FROM staff
ORDER BY id
LIMIT 2;



-- 3. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3

SELECT * 
FROM staff
ORDER BY id
LIMIT 4, 3;


-- 4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките следующие за ними 3 строки

SELECT * 
FROM staff
ORDER BY id DESC
LIMIT 2, 3;


