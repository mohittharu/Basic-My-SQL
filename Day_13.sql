--drop DATABASE tri2;
CREATE DATABASE tri2;  -- creating database
USE tri2;     -- using the database 

-- creating table 
CREATE TABLE Patient(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
Phone_Number VARCHAR(10) NOT NULL,

Address VARCHAR(100) NOT NULL);


CREATE TABLE logs (
  log_id INT AUTO_INCREMENT PRIMARY KEY,    -- A unique log identifier
  action VARCHAR(50),                        -- The action (e.g., 'INSERT')
  Patient_id INT,                           -- The Patient  who was added
  Patient_name VARCHAR(100),-- The name of the patient added
  Patient_Number CHAR(10),
  Patient_Address VARCHAR(100),
  log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- The date and time when the action occurred
);



DELIMITER $$
CREATE TRIGGER log_Patient_insert
AFTER INSERT ON Patient
FOR EACH ROW
BEGIN
 -- INSERT INTO logs (action, Patient_id, Patient_name, Patient_Number, Patient_Address, log_time)
 INSERT INTO logs (action, Patient_id, Patient_name,log_time)
 -- VALUES ('INSERT', NEW.id, NEW.name,NEW.Number,NEW.Address, NOW());-- Adding NOW() for log_time
 VALUES ('INSERT', NEW.id, NEW.name, NOW());-- Adding NOW() for log_time
END$$

DELIMITER ;

-- inserting Patient in the table 1

INSERT INTO Patient(ID, Name,Phone_Number,Address)
VALUES
('1', 'Mohit','9748727497','Kathmandu');


-- Select * from Patient;

Select * from logs;



-- Trigger for UPDATE (log_Patient_update)
DELIMITER $$

CREATE TRIGGER log_Patient_update
AFTER UPDATE ON Patient
FOR EACH ROW
BEGIN

  INSERT INTO logs (action, Patient_id,log_time)
  VALUES ('INSERT', NEW.id, NEW.name,NOW());-- Adding NOW() for log_time
  
END$$

DELIMITER ;-- Logs the NEW values of the updated Patient.

UPDATE Patient SET name = 'Ram' WHERE id = 2;


-- Trigger for DELETE (log_Patient_delete)
DELIMITER $$

CREATE TRIGGER log_Patient_delete
AFTER DELETE ON Patient
FOR EACH ROW
BEGIN
  INSERT INTO logs (action, Patient_id, Patient_name, log_time)
  VALUES ('DELETE', OLD.id, OLD.name,NOW());
END$$

DELIMITER ;

select * from Patient;
DELETE FROM Patient WHERE id = 1;
SELECT * FROM logs;