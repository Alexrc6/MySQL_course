USE lesson_1;
CREATE TABLE studentMarks (
stud_int INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
total_marks INT,
grade VARCHAR(5));

INSERT INTO studentMarks(total_marks, grade)
VALUES
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380, 'C'),
(250, 'D'),
(200, 'E'),
(100, 'F'),
(150, 'F'),
(220, 'E');





SELECT 
     total_marks, 
     grade,
	 CASE
         WHEN grade = 'A++' THEN 'DISTINCTION'
         WHEN grade = 'A+' THEN 'FIRST CLASS'
         WHEN grade = 'A' THEN 'SECOND CLASS'
         WHEN grade = 'B+' THEN 'SECOND CLASS'
         WHEN grade = 'C+' THEN 'THIRD CLASS'
         ELSE 'FAIL'
	END AS class
   FROM studentMarks;

-- 2

SELECT IF(100<200, 'yes', 'no');

-- 3

SELECT IF(100>200, 'yes', IF(50 > 5, 'y', 'n'));

SELECT 
     total_marks, 
     grade,
     IF(total_marks > 450, 'good', 'normal') AS class
     FROM studentMarks;