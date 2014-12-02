ALTER TABLE users ADD COLUMN last_login DATETIME NOT NULL DEFAULT NOW();
  
DESC users;

SELECT * FROM users;  

ALTER TABLE users CHANGE COLUMN username full_name VARCHAR(15);

ALTER TABLE users DROP COLUMN enabled;

RENAME TABLE users TO all_users;

DROP TABLE all_users;