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