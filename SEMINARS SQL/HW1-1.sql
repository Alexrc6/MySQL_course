USE lesson_1;
CREATE TABLE mobile_phones
(
id INT AUTO_INCREMENT PRIMARY KEY, 
product_name VARCHAR(45) NOT NULL,  
manufacturer VARCHAR(45) NOT NULL,
product_count INT UNSIGNED,
price INT UNSIGNED
);

INSERT INTO mobile_phones (product_name, manufacturer, product_count, price)
VALUES 
('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000);


SELECT * FROM mobile_phones;

-- 2

SELECT product_name, manufacturer, price FROM mobile_phones
WHERE product_count > 2;

-- 3
/*
Необходимо вывести идентификатор, название, производителя, 
количество и цену для мобильных телефонов, у которых производитель «Samsung».
*/

SELECT id, product_name, manufacturer, product_count, price FROM mobile_phones
WHERE manufacturer = 'Samsung';


-- HW 2-2

SELECT product_name, manufacturer,
IF(product_count < 100, 'little', IF(product_count >= 100 AND product_count < 300, 'many', 'lots')) AS status
 FROM mobile_phones;
 
SELECT product_name, manufacturer,
CASE 
WHEN product_count < 100 THEN 'little'
WHEN product_count >= 100 AND product_count < 300 THEN 'many'
ELSE 'lots'
END AS status
 FROM mobile_phones;