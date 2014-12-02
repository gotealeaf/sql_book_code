UPDATE users SET enabled = true WHERE id = 2;
SELECT * FROM users;
UPDATE users SET enabled = false;
SELECT * FROM users;
UPDATE users SET enabled = true WHERE name LIKE '% II';
DELETE from users WHERE id = 1