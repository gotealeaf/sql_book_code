UPDATE users SET enabled = true WHERE username = 'John Smith II';
/**
*+----+----------------+---------+
| id | username       | enabled |
+----+----------------+---------+
| 40 | John Smith     |       0 |
| 41 | John Smith II  |       1 |
| 42 | John Smith III |       0 |
| 43 | John Smith III |       1 |
| 44 | Jack Smith III |       1 |
| 45 | Jack Smith II  |       1 |
| 46 | Jack Smith I   |       1 |
+----+----------------+---------+
*
*/
SELECT * FROM users;

UPDATE users SET enabled = false;
SELECT * FROM users;


UPDATE users SET enabled = true WHERE username LIKE '% II';
DELETE from users WHERE username = 'John Smith';