-- drop database acc;
CREATE DATABASE acc;
use acc;


CREATE TABLE accounts (
  account_id INT PRIMARY KEY,
  holder_name VARCHAR(100),
  balance DECIMAL(10,2)
);


select * from accounts;

INSERT INTO accounts VALUES (1, 'Alice', 1000.00), (2, 'Bob', 500.00);

Select * from accounts;


-- Transaction for transfer 

START TRANSACTION;

-- sub  from Alice
UPDATE accounts 
SET balance = balance - 200 
WHERE account_id = 1;

-- Add to Bob
UPDATE accounts 
SET balance = balance + 200 
WHERE account_id = 2;

-- If all fine:
COMMIT;



select * from accounts;


-- If any error occur;(transaction fail )   
ROLLBACK;
select * from accounts;