-- Создайте хранимую процедуру hello(), которая будет возвращать приветствие,
-- в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER $$ -- ВМЕСТО $$ МОЖНО СТАВИТЬ //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59'
			THEN SELECT 'GOOD MORNING';
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59'
			THEN SELECT 'GOOD DAY';
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59'
			THEN SELECT 'GOOD EVENING';
		ELSE SELECT 'GOOD NIGHT';
    END CASE;
END $$ -- ВМЕСТО $$ МОЖНО СТАВИТЬ //
DELIMITER ; -- ПЕРЕД ; ОБЯЗАТЕЛЬНО ПРОБЕЛ

SELECT NOW();
SELECT CURTIME(); -- ПОЛУЧЕНИЕ ТЕКУЩЕГО ВРЕМЕНИ


CALL hello();



Выведите первые N чисел Фибоначчи
-- 1 2 3 4 5 6 7 8  9  10
-- 0 1 1 2 3 5 8 13 21 34


DROP FUNCTION IF EXISTS fib;

DELIMITER $$
CREATE FUNCTION fib(num INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE f1 INT DEFAULT 0;
    DECLARE f2 INT DEFAULT 1;
    DECLARE f3 INT DEFAULT 0;
   -- DECLARE res VARCHAR(100) DEFAULT '0 1';
	DECLARE res VARCHAR(100) DEFAULT '';
	IF num < 1 THEN
		RETURN 'Please, enter natural number';
    ELSEIF num = 1 THEN
		RETURN f1;
	ELSEIF num = 2 THEN
 		RETURN CONCAT(f1, ' ', f2);
	ELSE
		WHILE num > 2 DO
			SET f3 = f1 + f2;
			SET f1 = f2;
			SET f2 = f3;
			SET num = num -1;
			SET res = CONCAT(res, ' ',f3); 
		END WHILE;
        RETURN CONCAT(0, ' ', 1, res);
	END IF;
	
    -- RETURN res;
END $$
DELIMITER ;

SELECT fib(1);


-- ТРАНЗАКЦИИ
DROP TABLE IF EXISTS bankaccounts;
CREATE TABLE bankaccounts(
accountno varchar(20) PRIMARY KEY NOT NULL,
funds decimal(8,2));

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);

-- Изменим баланс на аккаунтах
START TRANSACTION;
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1';
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2';
-- COMMIT; 
ROLLBACK;

SELECT * FROM bankaccounts;



-- task
-- Реализуйте процедуру, внутри которой с помощью цикла выведите числа от N до 1:
-- N = 5=>5,4,3,2,1,
DROP PROCEDURE numrow;
DELIMITER $$
CREATE PROCEDURE numrow(num INT)
BEGIN 
DECLARE res VARCHAR(200) DEFAULT CAST(num AS CHAR(200));
REPEAT
	SET num = num -1;
    SET res = CONCAT(res, ' ', num);
    UNTIL num <= 0
END REPEAT;

SELECT res;
END $$
DELIMITER ;

SELECT CAST(45 AS CHAR);
SELECT CAST(1.55 AS NCHAR(50));

CALL numrow(20);

