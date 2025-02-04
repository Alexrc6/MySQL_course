USE schema3;
CREATE TABLE movies
(
-- id INT PRIMARY KEY AUTO-INCREMENT,
id SERIAL PRIMARY KEY, -- SERIAL = B16INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
title VARCHAR(60) NOT NULL,
title_eng VARCHAR(60),
year_movie YEAR NOT NULL,
count_min INT,
storyline TEXT
);

INSERT INTO movies (title, title_eng, year_movie, count_min, storyline)
VALUES 
('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 'Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
('Иван Васильевич меняет профессию', NULL, 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
('Назад в будущее', 'Back to the Future', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
('Криминальное чтиво', 'Pulp Fiction', 1994, 154, NULL);


SELECT * FROM movies;

CREATE TABLE genres (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	name VARCHAR(100) NOT NULL
);

CREATE TABLE actors (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	firstname VARCHAR(100) NOT NULL ,
	lastname VARCHAR(100)
);

-- 1
RENAME TABLE movies TO cinema;

-- 2
ALTER TABLE cinema
ADD COLUMN status_active BOOL DEFAULT True;

ALTER TABLE cinema
ADD COLUMN genre_id BIGINT UNSIGNED AFTER title_eng;

-- 3 
ALTER TABLE cinema
DROP COLUMN status_active;

-- 4 
DROP TABLE actors;

-- 5
ALTER TABLE cinema
ADD FOREIGN KEY(genre_id) REFERENCES genres(id);

SHOW CREATE TABLE cinema;

SELECT * FROM cinema;

-- 6 
TRUNCATE TABLE genres;

ALTER TABLE cinema
DROP FOREIGN KEY cinema_ibfk_1;

TRUNCATE TABLE genres;

ALTER TABLE cinema
ADD FOREIGN KEY(genre_id) REFERENCES genres(id)
ON DELETE SET NULL;

DELETE FROM genres
WHERE 1 = 1;





