
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

/**
* Import from CSV file
* Change the filepath to the location where you want to import the file from
*/ 

LOAD DATA INFILE '/gotealeaf/sql_book_code/chapter5/import/gutenberg-2014.csv' 
INTO TABLE books
FIELDS TERMINATED BY ','
(@col1,@col2) set title=@col1,author=@col2,published_date=NOW() ; 
