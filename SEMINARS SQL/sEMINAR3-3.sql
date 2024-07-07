-- Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Для каждой группы  найдите суммарную зарплату 
-- Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите максимальную заработную плату внутри группы
-- Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите минимальную заработную плату внутри группы


CREATE TABLE employee_salary (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	age INT,
	salary INT
);

-- Наполнение данными
INSERT INTO employee_salary (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),

('Коля', 24, 1000),
('Иван', 24, 2000),

('Паша', 25, 700);


SELECT
   age,
   SUM(salary) AS summ,
   MAX(salary) AS maxx,
   MIN(salary) AS minn
   FROM employee_salary
   GROUP BY age;
   
   
   -- Задания:
-- 1.	Выведите  только те строки, в которых суммарная зарплата больше или равна 1000

SELECT age,
       SUM(salary)
FROM employee_salary
GROUP BY age
HAVING SUM(salary) > 1000;

-- 2. 	Выведите только те группы, в которых количество строк меньше или равно двум
SELECT age, COUNT(*)
FROM employee_salary
GROUP BY age
HAVING COUNT(*) >=2;

-- 3.	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “BETWEEN”
SELECT age, COUNT(*)
FROM employee_salary
GROUP BY age
HAVING COUNT(*) BETWEEN 1 AND 2;


-- 4.*	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “IN”
SELECT age, COUNT(*)
FROM employee_salary
GROUP BY age
HAVING COUNT(*) IN (1, 2);


