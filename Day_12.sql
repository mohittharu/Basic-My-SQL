CREATE DATABASE tri;
USE tri;

CREATE TABLE employees (
  id INT PRIMARY KEY,       -- A unique identifier for each employee
  name VARCHAR(100),        -- The name of the employee
  department VARCHAR(50)    -- The department where the employee works
);

CREATE TABLE logs (
  log_id INT AUTO_INCREMENT PRIMARY KEY,    -- A unique log identifier
  action VARCHAR(50),                        -- The action (e.g., 'INSERT')
  employee_id INT,                           -- The employee who was added
  employee_name VARCHAR(100),                -- The name of the employee added
  log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- The date and time when the action occurred
);

DELIMITER $$

CREATE TRIGGER log_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  INSERT INTO logs (action, employee_id, employee_name, log_time)
  VALUES ('INSERT', NEW.id, NEW.name, NOW());  -- Adding NOW() for log_time
END$$

DELIMITER ;

-- Example 1: Insert an Employee

INSERT INTO employees (id, name, department) VALUES (3, 'Emma Brown', 'IT');

SELECT * FROM logs;


-- Trigger for UPDATE (log_employee_update)
DELIMITER $$

CREATE TRIGGER log_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO logs (action, employee_id, employee_name, log_time)
  VALUES ('UPDATE', NEW.id, NEW.name, NOW());
END$$

DELIMITER ;


-- How it works:
-- This trigger fires AFTER an UPDATE on employees.
-- Logs the NEW values of the updated employee.

UPDATE employees SET name = 'Johnathan Doe' WHERE id = 3;
select * from logs;

-- Trigger for DELETE (log_employee_delete)
DELIMITER $$
CREATE TRIGGER log_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO logs (action, employee_id, employee_name, log_time)
  VALUES ('DELETE', OLD.id, OLD.name, NOW());
END$$

DELIMITER ;

select * from employees;
DELETE FROM employees WHERE id = 3;
SELECT * FROM logs;