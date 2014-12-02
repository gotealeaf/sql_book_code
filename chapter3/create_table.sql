/*
* Use the database named library
*/
USE library;
/*
* Create table users 
*/
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT,
  username CHAR(25) NOT NULL,
  enabled BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (id);
/*
* Show table is created
*/
SHOW TABLES;  
/*
* Describe the table users
*/
DESCRIBE users;