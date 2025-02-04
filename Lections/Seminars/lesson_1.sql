-- comment
# comment
/*
comment
comment
*/
/*
1.	Получить список с информацией обо всех студентах
2. 	Получить список всех студентов с именем “Антон”(или любого существующего студента)
3. 	Вывести имя и название курса из таблички "Студент"
4*.	Выбрать студентов, фамилии которых начинаются с буквы «А».
*/

USE lesson_1;
-- 1
SELECT * FROM lesson_1.student;

-- 2
SELECT * FROM student
WHERE LOWER(name) = 'anton';

-- 3
SELECT name, course FROM student;

-- 4
-- LIKE
-- Galaxy S10, Galaxy S10+, Galaxy S8, Galaxy A8
-- % - любое кол-во символов или ничего -> tel LIKE 'Galaxy S%' => Galaxy S10, Galaxy S10+, Galaxy S8
-- _ - строго один символ -> tel LIKE 'Galaxy S_' => Galaxy S8

SELECT * FROM student
WHERE name LIKE 'M_r%';

/*
1.	Выбрать всех студентов,у которых стипендия  больше 6000
2.	Покажите всех студентов, которые принадлежат к курсу IT.
3. Отобразите  всех студентов, который НЕ принадлежат к курсу IT
*/

-- 1
SELECT * FROM student
WHERE stip >= 6000;

-- 2
SELECT * FROM student
WHERE course = 'IT';

-- 3
SELECT * FROM student
WHERE course != 'IT';

SELECT * FROM student
WHERE NOT course = 'IT';



