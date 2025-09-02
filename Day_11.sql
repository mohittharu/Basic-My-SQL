CREATE DATABASE Portfolio;  -- creating database
USE Portfolio;     -- using the database 

-- creating table 
CREATE TABLE MyDetail(
Name_ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100) NOT NULL,
Phone_Number VARCHAR(10) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
Address VARCHAR(100) NOT NULL);



-- inserting detail in the table 
INSERT INTO MyDetail(Name_ID, Name, Phone_Number, Email, Address)
VALUES
('01', 'Mohit', '9748727497', 'mohitchy296@gmail.com', 'Kathmandu');

Select * from MyDetail;

-- updationg the value in the table 
UPDATE MyDetail
set Phone_number ="9800574974"
where Name_ID = 01;
 
select * from MyDetail;


-- droping column from table
ALTER TABLE MyDetail
DROP COLUMN Email;

-- ALTER TABLE table_name
-- DROP COLUMN column_name;


-- 1. Retrieve all students' details
SELECT * FROM MyDetail;

-- deleting the values 
DELETE FROM MyDetail WHERE Name_ID =1;


-- rolling the data back to initial position 
-- way of data rolling back !!
-- Research about the ROLLBACK IN TRANSACTION 

SELECT * FROM MyDetail;