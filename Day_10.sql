Drop Database CompanyDB;

CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE
);


INSERT INTO Employees (Name, Department, Salary, JoiningDate) VALUES
('Alice Johnson', 'HR', 50000, '2022-01-15'),
('Bob Smith', 'IT', 70000, '2021-07-10'),
('Charlie Brown', 'Finance', 65000, '2020-05-20'),
('David Williams', 'IT', 80000, '2023-03-10'),
('Emma Davis', 'HR', 55000, '2022-06-25');

-- Data herna  ko lagi 
SELECT * FROM  Employees;

-- creating the view in database 
CREATE VIEW EmployeeView AS
SELECT EmployeeID, Name, Department FROM Employees;

-- empoyeeview ma kk data xa vanerw herna ko lagi use garinxa 
SELECT * FROM EmployeeView;