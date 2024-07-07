-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP FUNCTION IF EXISTS conversSecToDHMS;

DELIMITER $$ 
CREATE FUNCTION conversSecToDHMS(sec INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE d, h, m, s INT DEFAULT 0;
 
	SET d = sec DIV 86400; 
	SET h = (sec - d * 86400) DIV 3600;
	SET s = sec % 60;
	SET m = (sec % 3600 - s) / 60;

	RETURN CONCAT(d, ' days ', h, ' hours ', m, ' minutes ', s, ' seconds');
END $$
DELIMITER ;

SELECT conversSecToDHMS(8654161);


-- 2. Выведите только чётные числа от 1 до 10.
-- Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS evenNum;

DELIMITER $$
CREATE PROCEDURE evenNum(num INT)
BEGIN
DECLARE temp int DEFAULT 2;
DECLARE res VARCHAR(45) DEFAULT '2';
REPEAT
	SET temp = temp + 2;
    SET res = CONCAT(res, ',', temp);
    
	UNTIL temp >= num
END REPEAT;
SELECT res;
END $$
DELIMITER ;

CALL evenNum(10);
