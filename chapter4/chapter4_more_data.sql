DROP DATABASE IF EXISTS `library`;
CREATE DATABASE library;
USE library;
DROP TABLE IF EXISTS `users`;
CREATE TABLE users (
      id INT UNSIGNED NOT NULL AUTO_INCREMENT,
      username CHAR(25) NOT NULL,
      enabled BOOLEAN DEFAULT TRUE, 
      PRIMARY KEY (id)
      );
ALTER TABLE 
      users 
      ADD COLUMN
      (
        book_title     VARCHAR(25),
        review_title   VARCHAR(25),
        review_content VARCHAR(50),
        rating         INT,
        address        VARCHAR(255)
      );      
      
INSERT into users(username, enabled,book_title,review_title,review_content,rating,address) 
VALUES('John Smith', false, "Chaos","Good book", "What is the butterfly effect?", 5, "2 Market Street");

INSERT into users(username, enabled,book_title,review_title,review_content,rating,address) 
VALUES('Jane Smith', true, "Simple Taoism","Great!", "About Living in balance", 5, "3 Market Street");

INSERT into users(username, enabled,book_title,review_title,review_content,rating,address) 
VALUES('Jane Smith', true, "The Storyteller","OK", "Memories of WWII", 4, "3 Market Street");      