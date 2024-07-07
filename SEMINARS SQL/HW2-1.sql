USE lesson_1;
CREATE TABLE manufacturer
(
id INT AUTO_INCREMENT PRIMARY KEY, -- in PostgreSQL you should use 'SERIAL' instead of 'INT AUTO_INCREMENT'
name VARCHAR(45)
);
INSERT INTO manufacturer (name)
VALUES
('Apple'),
('Samsung'),
('Huawei');

SELECT * FROM manufacturer;

