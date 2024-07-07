-- 1.	Рассчитайте общее количество всех страниц daily_typing_pages

-- 2.	Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)  

-- 3.	Посчитайте количество записей в таблице

-- 4.	Выведите количество имен, которые являются уникальными 

-- 5. 	Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)

USE seminar_3;
DROP TABLE IF EXISTS employee_tbl;
CREATE TABLE employee_tbl (
	id_emp INT AUTO_INCREMENT PRIMARY KEY,
	id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	work_date DATE,
	daily_typing_pages INT
);

-- Наполнение данными
INSERT INTO employee_tbl (id, name, work_date, daily_typing_pages)
VALUES
(1, 'John', '2007-01-24', 250),
(2, 'Ram',  '2007-05-27', 220),
(3, 'Jack', '2007-05-06', 170),
(3, 'Jack', '2007-04-06', 100),
(4, 'Jill', '2007-04-06', 220),
(5, 'Zara', '2007-06-06', 300),
(5, 'Zara', '2007-02-06', 350);

-- 1 Рассчитайте общее количество всех страниц daily_typing_pages
SELECT SUM(daily_typing_pages) AS summ
FROM employee_tbl
GROUP BY name;

-- 2 Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)
SELECT SUM(daily_typing_pages) AS summ
FROM employee_tbl
GROUP BY name;

-- 3 осчитайте количество записей в таблице
SELECT COUNT(*)
FROM employee_tbl;

-- 4.	Выведите количество имен, которые являются уникальными
SELECT COUNT(DISTINCT name)
FROM employee_tbl;

-- 5. сре

SELECT AVG(daily_typing_pages) AS avg   -- можно настроить точность
FROM employee_tbl;

-- 6 from HW

SELECT name 
FROM employee_tbl
GROUP BY name
HAVING AVG(daily_typing_pages) < 300;
