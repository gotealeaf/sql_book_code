/**
* To execute 
* mysql> source section4_ddl.sql
*
*/
DROP DATABASE IF EXISTS `library`;
CREATE DATABASE library;
USE library;
DROP TABLE IF EXISTS `users`;
CREATE TABLE users (
      user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
      username CHAR(25) NOT NULL,
      enabled BOOLEAN DEFAULT TRUE, 
      PRIMARY KEY (user_id)
      );
      
      
DROP TABLE IF EXISTS `addresses`;
/*
 one to one: User has one address
*/
CREATE TABLE addresses (
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    street varchar(30) NOT NULL,
    city varchar(30) NOT NULL,
    state varchar(30) NOT NULL,
    PRIMARY KEY (user_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id) 
     );
     
DROP TABLE IF EXISTS `books`;    
CREATE TABLE books (
     book_id INT UNSIGNED AUTO_INCREMENT,
     title VARCHAR(100) NOT NULL,
     author VARCHAR(100) NOT NULL,
     published_date DATETIME NOT NULL,
     isbn INT UNSIGNED,
     PRIMARY KEY (book_id),
     UNIQUE (isbn)
     );    
/*
 many to many: User has many books & Books have many users
*/
DROP TABLE IF EXISTS `user_books`;         
CREATE TABLE users_books (
     user_id INT UNSIGNED NOT NULL ,
     book_id INT UNSIGNED NOT NULL,
     checkout_date DATETIME,
     return_date DATETIME,
     PRIMARY KEY (user_id, book_id),  
     FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE,  
     FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE
    );   
/*
 one to many: Book has many reviews
*/    
DROP TABLE IF EXISTS `reviews`;             
CREATE TABLE reviews (
    review_id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED  NOT NULL,
    book_id INT UNSIGNED  NOT NULL,
    review_content VARCHAR(255),
    published_date  DATETIME DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (review_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
    );          