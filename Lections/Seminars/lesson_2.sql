/*
В таблице имеются следующие атрибуты:
id -- уникальный идентификатор фильма,
title -- название фильма
title_eng -- название фильма на английском языке
year_movie  --  год выхода
count_min -- длительность фильма в минутах
storyline -- сюжетная линия, небольшое описание фильма
Все поля (кроме title_eng, count_min и storyline) обязательны для заполнения. 
Поле id : первичный ключ, который заполняется автоматически.
*/

USE lesson_1;
CREATE TABLE movies
(
	-- id INT PRIMARY KEY AUTO_INCREMENT,
    id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	title VARCHAR(60) NOT NULL,
    title_eng VARCHAR(60),
    year_movie YEAR NOT NULL,
    count_min INT,
    storyline TEXT
);



-- наполнение данными 
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

/*
1 Переименовать сущность movies в cinema.
2 Добавить сущности cinema новый атрибут status_active (тип BOOL) и атрибут genre_id после атрибута title_eng.
3 Удалить атрибут status_active сущности cinema. 
4 Удалить сущность actors из базы данных
5 Добавить внешний ключ на атрибут genre_id сущности cinema и направить его на атрибут id сущности genres.
6 Очистить сущность genres от данных.
*/

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

-- 6 Очистить сущность genres от данных.
TRUNCATE TABLE genres;

ALTER TABLE cinema
DROP FOREIGN KEY cinema_ibfk_1;

TRUNCATE TABLE genres;

ALTER TABLE cinema
ADD FOREIGN KEY(genre_id) REFERENCES genres(id)
ON DELETE SET NULL;
-- ON DELETE CASCADE;



CREATE TABLE studentMarks (
	stud_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    total_marks INT,
    grade VARCHAR(5));

INSERT INTO studentMarks(total_marks, grade)
VALUES
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380,'C'),
(250, 'D'),
(200,'E'),
(100,'F'),
(150,'F'),
(220, 'E');


/*
Задача 3. В зависимости от поля “grade”, установите еще один столбец с именем class в 
зависимости от значений: A++ – DISTINCTION,A+ – FIRST CLASS, A – SECOND CLASS, B+ – SECOND CLASS,
 C+ – THIRD CLASS, ALL OTHERS – FAIL*/
 
 
SELECT 
	total_marks,
    grade AS qwerth,
    CASE 
		WHEN grade = 'A++' THEN 'DISTINCTION'
        WHEN grade = 'A+' THEN 'FIRST CLASS'
        WHEN grade = 'A' THEN 'SECOND CLASS'
        WHEN grade = 'B+' THEN 'SECOND CLASS'
        WHEN grade = 'C+' THEN 'THIRD CLASS'
        ELSE 'FAIL'
	END AS class
FROM studentMarks;


/*


IF( condition, [value_if_true], [value_if_false] )
1. 	 Проверьте истинность выражения, используя оператор "IF"
Если 100<200, то печатаем 'yes'; иначе - 'no'

2.	В зависимости от общего количество баллов, укажите статус ученик в табеле успеваемости: 
если суммарное количество баллов больше 450, то студент закончил на “Отлично”; иначе - “Хорошо”
*/
-- 1
SELECT IF(100 > 200, 'yes', IF(50 > 5, 'y', 'n'));

-- 2
SELECT 
	total_marks,
    grade AS qwerth,
    IF(total_marks > 450, 'Отлично', 'Хорошо') AS class
FROM studentMarks;

	
