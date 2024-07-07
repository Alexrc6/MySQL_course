USE lesson_2;
CREATE TABLE mobile_phones
(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(45) NOT NULL,
manufacturer VARCHAR(45) NOT NULL,
product_count INT UNSIGNED,
price INT UNSIGNED
);

INSERT INTO mobile_phones(product_name, manufacturer, product_count, price)
 VALUES
 ('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000);

SELECT * FROM mobile_phones;

CREATE TABLE manufacturer
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(45) NOT NULL
);

INSERT INTO manufacturer(name)
VALUES
('Apple'),
('Samsung'),
('Huawei');




SELECT * FROM manufacturer
WHERE name = 'samsunG';



-- ОКОННЫЕ ФУНКЦИИ
-- Собрать дэшборд, в котором содержится информация о максимальной задолженности в каждом банке, 
-- а также средний размер процентной ставки в каждом банке в зависимости от сегмента и количество договоров всего всем банкам


SELECT
	*
    ,MAX(OSZ) OVER(PARTITION BY TB) AS 'максимальной задолженности в каждом банке'
	,AVG(procent_rate) OVER(PARTITION BY TB, SEGNENT) AS 'средний размер процентной ставки в каждом банке в зависимости от сегмента'
    ,COUNT(ID_DOG) OVER() AS 'количество договоров всего всем банкам'
    FROM table1;
    
    
    -- РАНЖИРУЮЩИЕ ФУНКЦИИ
    
    
    CREATE TABLE `bank_table` (
`idbank_table` INT NOT NULL,
`tb` VARCHAR(45) NULL,
`dep` VARCHAR(45) NULL,
`count_revisions` INT NULL,
PRIMARY KEY (`idbank_table`));


INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('1', 'A', 'Corp', 100);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('2', 'A', 'Rozn', 47);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('3', 'A', 'IT', 86);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('4', 'B', 'Corp', 70);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('5', 'B', 'Rozn', 65);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('6', 'B', 'IT', 58);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('7', 'C', 'Corp', 42);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('8', 'C', 'Rozn', 40);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('9', 'C', 'IT', 63);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('10', 'D', 'Corp', 95);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('11', 'D', 'Rozn', 120);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('12', 'D', 'IT', 85);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('13', 'E', 'Corp', 70);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('14', 'E', 'Rozn', 72);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('15', 'E', 'IT', 80);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('16', 'F', 'Corp', 66);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('17', 'F', 'Rozn', 111);
INSERT INTO `bank_table` (`idbank_table`, `tb`, `dep`, `count_revisions`) VALUES ('18', 'F', 'IT', 33);

SELECT * FROM bank_table;
-- Проранжируем таблицу по убыванию количества ревизий


SELECT * FROM bank_table
ORDER BY count_revisions DESC;

SELECT 
	*
    ,ROW_NUMBER() OVER(ORDER BY count_revisions DESC) AS rn
    ,RANK() OVER(ORDER BY count_revisions DESC) r
    ,DENSE_RANK() OVER(ORDER BY count_revisions DESC) AS dr
    ,NTILE(3) OVER(ORDER BY count_revisions DESC) AS n -- ДЕЛИТСЯ НА 3 ГРУППЫ
    FROM bank_table;
    
    
    -- НАЙТИ ВТОРОЙ МАКСИМУМ ПО СЧЕТУ БЕЗ ОКОННЫХ ФУНКЦИЙ
    
SELECT MAX(count_revisions) ms
FROM bank_table
WHERE count_revisions != (SELECT MAX(count_revisions) FROM bank_table);

-- НАЙТИ 2 МАКСИМУМ
WITH bank_num AS
(
	SELECT
		*
        ,DENSE_RANK() OVER(ORDER BY count_revisions DESC) AS dr
	FROM bank_table
)
SELECT * FROM bank_num
WHERE dr = 9;

-- ФУНКЦИИ СМЕЩЕНИЯ

CREATE TABLE tasks (
`id_tasks` INT NOT NULL,
`event` VARCHAR(45) NOT NULL,
`date_event` DATETIME NOT NULL);


INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('1', 'Open', '2020-02-01');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('1', 'To_1_Line', '2020-02-02');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('1', 'To_2_Line', '2020-02-03');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('1', 'Successful', '2020-02-04');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('1', 'Close', '2020-02-05');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('2', 'Open', '2020-03-01');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('2', 'To_1_Line', '2020-03-02');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('2', 'Denied', '2020-03-03');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('3', 'Open', '2020-04-01');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('3', 'To_1_Line', '2020-04-02');
INSERT INTO `tasks` (`id_tasks`, `event`, `date_event`) VALUES ('3', 'To_2_Line', '2020-04-03');


SELECT * FROM tasks;

SELECT 
	*, 
    LEAD(event, 1, 'end') OVER(PARTITION BY id_tasks ORDER BY date_event) AS next_event,
    LEAD(date_event, 1, '2099-01-01') OVER(PARTITION BY id_tasks ORDER BY date_event) AS next_date
FROM tasks;

-- ДЗ5-1
-- Найти количество сообщений, отправленных каждым пользователей.
-- В зависимости от количества отправленных сообщений рассчитать ранг пользователей, 
-- первое место присвоив пользователю(ям) с наибольшим количеством отправленных сообщений.

-- Вывести полученный ранг, имя, фамилия, пользователя и кол-во отправленных сообщений. 
-- Выводимый список необходимо отсортировать в порядке возрастания ранга.


WITH 













