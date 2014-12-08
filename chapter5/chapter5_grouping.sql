DROP DATABASE IF EXISTS `finance`;
CREATE DATABASE finance;
USE finance;
DROP TABLE IF EXISTS `transactions`;    
CREATE TABLE transactions (
     id INT UNSIGNED AUTO_INCREMENT,
     paid_in DECIMAL(13,2) NOT NULL,
     paid_out DECIMAL(13,2),
     date DATETIME NOT NULL,
     transaction_type CHAR(25) NOT NULL,
     description char(255) NOT NULL, 
     PRIMARY KEY (id)
     ); 
     
DESCRIBE transactions;

/**
* Modify the file path based on your file location
*/

LOAD DATA LOCAL INFILE '/Users/aarti/dev/github/gotealeaf/sql_book_code/chapter5/import/transactions.csv' 
INTO TABLE transactions
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(@col1,@col2,@col3,@col4,@col5) 
set date=STR_TO_DATE(@col1, '%m/%d/%Y'),paid_in=@col2,paid_out=@col3,transaction_type=@col4,description=@col5;

SELECT * FROM transactions LIMIT 1;
      