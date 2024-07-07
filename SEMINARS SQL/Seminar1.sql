USE lesson_1;
SELECT * FROM student;
SELECT * FROM student 
WHERE name = 'Anton';
SELECT name, course FROM student;

-- 4

SELECT * FROM student 
WHERE name LIKE 'M%';

SELECT * FROM student 
WHERE name LIKE 'M_r%';

SELECT * FROM student 
WHERE stip >= 6000;

SELECT * FROM student 
WHERE course = 'IT';

SELECT * FROM student 
WHERE course != 'IT';