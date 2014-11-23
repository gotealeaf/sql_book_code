/**
* Export into CSV file
*/

SELECT u.username, b.title
FROM users u
INNER JOIN users_books ub ON (ub.user_id = u.user_id)
INNER JOIN books b ON (b.book_id = ub.book_id)
INTO OUTFILE '/tmp/users_books_no_header.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


/**
* Export into CSV file with Headers
*/
SELECT "username", "title"
UNION
SELECT u.username, b.title
FROM users u
INNER JOIN users_books ub ON (ub.user_id = u.user_id)
INNER JOIN books b ON (b.book_id = ub.book_id)
INTO OUTFILE '/tmp/users_books_with_header.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';