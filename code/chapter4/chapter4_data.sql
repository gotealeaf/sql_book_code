/**
* To execute 
* mysql> source section4_data.sql
*
*/

-- A User
SET @username = 'John Smith';
SET @street = '1 Market Street';
SET @city = 'San Francisco';
SET @state = 'CA';

-- A book
SET @title = 'My First SQL book';
SET @author = 'Mary Parker';
SET @review_content = 'My first review';

INSERT INTO users (username) VALUES (@username);
SET @user_id= LAST_INSERT_ID();
INSERT INTO addresses (user_id, street, city, state) VALUES (@user_id, @street, @city, @state );

INSERT INTO books (title, author, published_date) VALUES(@title,@author, NOW());
SET @book_id= LAST_INSERT_ID();
INSERT INTO users_books (user_id, book_id, checkout_date) VALUES( @user_id, @book_id , NOW());
INSERT INTO reviews ( book_id, user_id, review_content ) VALUES (@book_id, @user_id, @review_content );

-- A Second book
SET @title = 'My Second SQL book';
SET @author = 'John Mayer';
SET @review_content = 'My second review';

INSERT INTO books (title, author, published_date) VALUES(@title,@author, NOW());
SET @book_id= LAST_INSERT_ID();
INSERT INTO users_books (user_id, book_id, checkout_date) VALUES( @user_id, @book_id , NOW());
INSERT INTO reviews ( book_id, user_id, review_content ) VALUES (@book_id, @user_id, @review_content );

-- A Second User
SET @username = 'Jane Smiley';
SET @street = '2 Elm Street';
SET @city = 'San Francisco';
SET @state = 'CA';
SET @review_content = "Jane Smiley's review";

INSERT INTO users (username) VALUES (@username);
SET @user_id= LAST_INSERT_ID();
INSERT INTO addresses (user_id, street, city, state) VALUES (@user_id, @street, @city, @state );
INSERT INTO users_books (user_id, book_id, checkout_date) VALUES( @user_id, @book_id , NOW());
INSERT INTO reviews ( book_id, user_id, review_content ) VALUES (@book_id, @user_id, @review_content );

-- A Third User
SET @username = 'Alice Munro';
INSERT INTO users (username) VALUES (@username);

-- A Third book
SET @title = 'My Third SQL book';
INSERT INTO books (title, author, published_date) VALUES(@title,@author, NOW());


