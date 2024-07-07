USE probe1;
CREATE TABLE mobile_phones222
(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(45) NOT NULL,
manufacturer VARCHAR(45) NOT NULL,
product_count INT UNSIGNED,
price INT UNSIGNED
);

INSERT INTO mobile_phones222(product_name, manufacturer, product_count, price)
 VALUES
 ('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('iPHONE X1', 'Apple', 1, 76000),
('iPhone x1', 'Apple', 0, 5100),
('Galaxy S99', 'Samsung', 21, 6000),
('Galaxy S88', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000);

SELECT * FROM mobile_phones222
WHERE manufacturer LIKE 's______';

DELETE FROM mobile_phones222 WHERE manufacturer = 'Samsa1';
UPDATE mobile_phones222 SET manufacturer = 'Samsa1' WHERE NOT manufacturer = 'Samsung';
ALTER TABLE mobile_phones222 
ADD description2 VARCHAR(45) DEFAULT 'some words about';
SELECT * FROM mobile_phones222;

ALTER TABLE mobile_phones222
ADD FOREIGN KEY (price) REFERENCES manufacturer222(id)
ON DELETE SET NULL; 

SHOW DATABASES;

SELECT *, LOWER(product_name) AS nameP FROM mobile_phones222;

CREATE TABLE manufacturer222
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(45) NOT NULL
);

INSERT INTO manufacturer222(name)
VALUES
('Apple'),
('Samsung'),
('Huawei');

INSERT INTO manufacturer222(name)
SELECT manufacturer FROM mobile_phones222;

ALTER TABLE manufacturer222 
ADD FOREIGN KEY (name) REFERENCES mobile_phones222(manufacturer)
;

UPDATE manufacturer222 SET name = 'Samsa1' WHERE NOT name = 'Samsung';

SELECT * FROM manufacturer222;

-- NEW TEST

CREATE TABLE mobile_phones123
(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(45) NOT NULL,
manufacturer VARCHAR(45) NOT NULL,
product_count INT UNSIGNED,
price INT UNSIGNED
);

INSERT INTO mobile_phones123(product_name, manufacturer, product_count, price)
 VALUES
 ('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000);

CREATE TABLE manufacturer123
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(45) NOT NULL
);

INSERT INTO manufacturer123(name)
VALUES
('Apple'),
('Samsung'),
('Huawei');

SELECT * FROM mobile_phones123;
SELECT * FROM manufacturer123;

ALTER TABLE mobile_phones123
ADD COLUMN manufacturer_id INT DEFAULT NULL;

ALTER TABLE mobile_phones123
ADD FOREIGN KEY(manufacturer_id)
REFERENCES manufacturer123(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

SHOW CREATE TABLE mobile_phones123;

UPDATE mobile_phones123 AS t1
JOIN manufacturer123 AS t2 ON t1.manufacturer = t2.name
SET t1.manufacturer_id = t2.id;

ALTER TABLE mobile_phones123
DROP COLUMN manufacturer;

SELECT id, product_name, manufacturer_id FROM mobile_phones123;


-- version for auto-checks system

CREATE TABLE itresume10415620.mobile_phones
(
id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(45) NOT NULL,
manufacturer VARCHAR(45) NOT NULL,
product_count INT UNSIGNED,
price INT UNSIGNED
);

INSERT INTO itresume10415620.mobile_phones(product_name, manufacturer, product_count, price)
 VALUES
 ('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000);

CREATE TABLE itresume10415620.manufacturer
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(45) NOT NULL
);

INSERT INTO itresume10415620.manufacturer(name)
VALUES
('Apple'),
('Samsung'),
('Huawei');

ALTER TABLE itresume10415620.mobile_phones
ADD COLUMN manufacturer_id INT DEFAULT NULL;

ALTER TABLE itresume10415620.mobile_phones
ADD FOREIGN KEY(manufacturer_id)
REFERENCES itresume10415620.manufacturer(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

UPDATE itresume10415620.mobile_phones AS t1
JOIN itresume10415620.manufacturer AS t2 ON t1.manufacturer = t2.name
SET t1.manufacturer_id = t2.id;

ALTER TABLE itresume10415620.mobile_phones
DROP COLUMN manufacturer;

SELECT id, product_name, manufacturer_id FROM itresume10415620.mobile_phones;


-- in PostgreSQL
ALTER TABLE mobile_phones
ADD COLUMN manufacturer_id INT DEFAULT NULL;


ALTER TABLE mobile_phones
ADD FOREIGN KEY (manufacturer_id)
REFERENCES manufacturer(id)
ON UPDATE CASCADE
ON DELETE SET NULL;


UPDATE mobile_phones AS t1
SET manufacturer_id = t2.id
FROM manufacturer AS t2
WHERE t1.manufacturer = t2.name;


ALTER TABLE mobile_phones
DROP COLUMN manufacturer;


SELECT id, product_name, manufacturer_id FROM mobile_phones;
