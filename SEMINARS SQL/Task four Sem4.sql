USE probe1;



CREATE TABLE users
(
id INT auto_increment primary key,
firstname VARCHAR(20)

);

CREATE TABLE messages
(
id INT auto_increment primary key,
from_user_id INT
);

INSERT INTO users (firstname)
VALUES ("John"), ("Jane"), ("Mary"), ("David"), ("Amelia");
INSERT INTO messages (from_user_id)
VALUES (1), (5), (2), (7), (8);

SELECT u.id FROM users AS u
LEFT JOIN messages AS m 
ON u.id = m.from_user_id
WHERE m.id IS NULL;


-- новая 4

CREATE TABLE friend_requests
(
initiator_user_id INT,
target_user_id INT,
status VARCHAR(20)
);

CREATE TABLE users
(
id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(20),
lastname VARCHAR(20)
);


INSERT INTO friend_requests(initiator_user_id, target_user_id, status)
VALUES 
(1, 2, 'approved'),
(2, 5, 'approved'),
(3, 1, 'NOT approved'),
(5, 1, 'NOT approved'),
(6, 7, 'NOT approved'),
(7, 6, 'NOT approved'),
(1, 3, 'approved');

INSERT INTO users(firstname, lastname)
VALUES
('SANEK', 'A'), -- 2
('MISHA', 'B'), -- 2
('LEV', 'PRO'), -- 1
('IGOR', 'NN'), -- 0
('ANTON', 'PP'), -- 1
('PETR', 'PA'), -- 0
('INNA', 'IN'); -- 0

SELECT * FROM friend_requests;
SELECT * FROM users;
TRUNCATE friend_requests; 
TRUNCATE users;

SELECT * FROM friend_requests AS fr
LEFT JOIN users AS u ON u.id = fr.initiator_user_id OR u.id = fr.target_user_id
WHERE fr.status = 'approved';

SELECT u.id, u.firstname, u.lastname, IF(fr.status = 'approved', COUNT(*), 0) AS cnt , fr.status
-- SELECT DISTINCT u.id, IF(fr.status = 'approved', COUNT(*), 0) AS cnt -- , fr.status
FROM users AS u
LEFT JOIN friend_requests AS fr
ON u.id = fr.initiator_user_id OR u.id = fr.target_user_id  
-- RIGHT JOIN users USING (id)
GROUP BY u.id , fr.status
-- HAVING (cnt > 0 AND fr.status = 'approved') OR cnt
ORDER BY u.id;



SELECT *
FROM users AS u
LEFT JOIN friend_requests AS fr
ON (u.id = fr.initiator_user_id OR u.id = fr.target_user_id)  AND fr.status = 'approved'  ;

-- GROUP BY u.id , fr.status  

-- ORDER BY u.id;


SELECT u.id, 
MAX(u.firstname) AS firstname,
MAX(u.lastname) AS lastname, 
MAX(cnt) AS cnt  
FROM users AS u
LEFT JOIN (
SELECT u.id, IF(fr.status = 'approved', COUNT(*), 0) AS cnt FROM friend_requests AS fr
LEFT JOIN users AS u
ON u.id = fr.initiator_user_id OR u.id = fr.target_user_id  
GROUP BY u.id, fr.status
) UandFR
USING (id)
GROUP BY u.id
ORDER BY u.id;

SELECT 
u.id, 
u.firstname, 
u.lastname, 
COUNT(fr.status) AS cnt 
FROM users u
LEFT JOIN friend_requests fr ON (u.id = fr.initiator_user_id or u.id = fr.target_user_id) AND fr.status = 'approved'
GROUP BY u.id
ORDER BY u.id;



