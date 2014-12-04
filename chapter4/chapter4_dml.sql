/**
* INNER JOIN - one to one
* All users with addresses
+-------------+---------------+-------+
| username    | city          | state |
+-------------+---------------+-------+
| John Smith  | San Francisco | CA    |
| Jane Smiley | San Francisco | CA    |
+-------------+---------------+-------+
2 rows in set (0.00 sec)
*/

SELECT username, city, state 
FROM users 
INNER JOIN addresses
ON users.id = addresses.user_id;

/**
* LEFT JOIN - All users, even those with no address
+-------------+---------------+-------+
| username    | city          | state |
+-------------+---------------+-------+
| John Smith  | San Francisco | CA    |
| Jane Smiley | San Francisco | CA    |
| Alice Munro | NULL          | NULL  |
+-------------+---------------+-------+
3 rows in set (0.00 sec)
*/

SELECT username, city, state 
FROM users 
LEFT JOIN addresses
ON users.id = addresses.user_id;

/**
* CROSS JOIN - Cartesian product all rows all tables, repetitions
+---------+-------------+---------+---------+-----------------+---------------+-------+
| user_id | username    | enabled | user_id | street          | city          | state |
+---------+-------------+---------+---------+-----------------+---------------+-------+
|       1 | John Smith  |       1 |       1 | 1 Market Street | San Francisco | CA    |
|       1 | John Smith  |       1 |       2 | 2 Elm Street    | San Francisco | CA    |
|       2 | Jane Smiley |       1 |       1 | 1 Market Street | San Francisco | CA    |
|       2 | Jane Smiley |       1 |       2 | 2 Elm Street    | San Francisco | CA    |
|       3 | Alice Munro |       1 |       1 | 1 Market Street | San Francisco | CA    |
|       3 | Alice Munro |       1 |       2 | 2 Elm Street    | San Francisco | CA    |
+---------+-------------+---------+---------+-----------------+---------------+-------+
6 rows in set (0.00 sec)
*/

SELECT users.*, addresses.* 
FROM users 
JOIN addresses;

/**
* INNER JOIN - one to many (intersection)
* Only users with reviews, Not All Users
+---------+-------------+---------+-----------+---------+---------+----------------------+---------------------+
| user_id | username    | enabled | review_id | user_id | book_id | review_content       | published_date      |
+---------+-------------+---------+-----------+---------+---------+----------------------+---------------------+
|       1 | John Smith  |       1 |         1 |       1 |       1 | My first review      | 2014-11-14 20:49:20 |
|       1 | John Smith  |       1 |         2 |       1 |       2 | My second review     | 2014-11-14 20:49:20 |
|       2 | Jane Smiley |       1 |         3 |       2 |       2 | Jane Smiley's review | 2014-11-14 20:49:20 |
+---------+-------------+---------+-----------+---------+---------+----------------------+---------------------+
3 rows in set (0.00 sec)
*/

SELECT users.*, reviews.* 
FROM users 
INNER JOIN reviews
ON users.id = reviews.user_id;


/**
* LEFT JOIN - All users, All reviews, Some users may not have reviews
+---------+-------------+---------+-----------+---------+---------+----------------------+---------------------+
| user_id | username    | enabled | review_id | user_id | book_id | review_content       | published_date      |
+---------+-------------+---------+-----------+---------+---------+----------------------+---------------------+
|       1 | John Smith  |       1 |         1 |       1 |       1 | My first review      | 2014-11-14 20:49:20 |
|       1 | John Smith  |       1 |         2 |       1 |       2 | My second review     | 2014-11-14 20:49:20 |
|       2 | Jane Smiley |       1 |         3 |       2 |       2 | Jane Smiley's review | 2014-11-14 20:49:20 |
|       3 | Alice Munro |       1 |      NULL |    NULL |    NULL | NULL                 | NULL                |
+---------+-------------+---------+-----------+---------+---------+----------------------+---------------------+
4 rows in set (0.00 sec)
*/

SELECT users.*, reviews.* 
FROM users 
LEFT JOIN reviews
ON users.id = reviews.user_id;

/**
* LEFT JOIN - All user, even those with no books
+-------------+--------------------+
| username    | title              |
+-------------+--------------------+
| John Smith  | My First SQL book  |
| John Smith  | My Second SQL book |
| Jane Smiley | My Second SQL book |
| Alice Munro | NULL               |
+-------------+--------------------+
4 rows in set (0.00 sec)
*/

SELECT u.username, b.title
FROM users u
LEFT JOIN users_books ub ON (ub.user_id = u.id)
LEFT JOIN books b ON (ub.book_id = b.id);


/**
* RIGHT JOIN - All books, even those with no user
+-------------+--------------------+
| username    | title              |
+-------------+--------------------+
| John Smith  | My First SQL book  |
| John Smith  | My Second SQL book |
| Jane Smiley | My Second SQL book |
| NULL        | My Third SQL book  |
+-------------+--------------------+
4 rows in set (0.00 sec)
*/

SELECT u.username, b.title
FROM users u
RIGHT JOIN users_books ub ON (ub.user_id = u.id)
RIGHT JOIN books b ON (ub.book_id = b.id);

/**
*
*/



