-- HOSPITAL MANAGEMENT SYSTEM --

-- 1.CREATE DATABASE
Drop database Hospital_Management_System;
CREATE DATABASE Hospital_Management_System;
USE Hospital_Management_System;

-- 2.CREATE TABLE
-- Table: Patient
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender ENUM('Male','Female','Other'),
    Age INT,
    Address VARCHAR(100),
    Contact_No VARCHAR(15)
);

-- Table: Doctor
CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Specialization VARCHAR(100),
    Contact_No VARCHAR(15),
    Salary DECIMAL(10,2)
);

-- Table: Room
CREATE TABLE Room (
    Room_ID INT PRIMARY KEY AUTO_INCREMENT,
    Room_Type VARCHAR(50),
    Room_Charge DECIMAL(10,2),
    Availability ENUM('Available','Occupied') DEFAULT 'Available'
);

-- Table: Appointment
CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

-- Table: Treatment
CREATE TABLE Treatment (
    Treatment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Diagnosis VARCHAR(100),
    Prescription TEXT,
    Treatment_Cost DECIMAL(10,2),
    Treatment_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

-- Table: Billing
CREATE TABLE Billing (
    Bill_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Total_Amount DECIMAL(10,2),
    Paid_Amount DECIMAL(10,2),
    Payment_Status ENUM('Paid','Pending') DEFAULT 'Pending',
    Bill_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

-- Table: Nurse
CREATE TABLE Nurse (
    Nurse_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Assigned_Room_ID INT,
    Shift ENUM('Day','Night'),
    FOREIGN KEY (Assigned_Room_ID) REFERENCES Room(Room_ID)
);

-- Table: Medical_Test
CREATE TABLE Medical_Test (
    Test_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Test_Name VARCHAR(100),
    Test_Date DATE,
    Result VARCHAR(100),
    Cost DECIMAL(10,2),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);



-- 3.INSERT SAMPLE DATA IN DATABASE 

-- Insert Patients
INSERT INTO Patient (First_Name, Last_Name, Gender, Age, Address, Contact_No)
VALUES 
('Ramesh','Thapa','Male',45,'Kathmandu','9800000001'),
('Sita','Koirala','Female',32,'Pokhara','9800000002'),
('Mina','Shah','Female',28,'Lalitpur','9800000003');

-- Insert Doctors
INSERT INTO Doctor (First_Name, Last_Name, Specialization, Contact_No, Salary)
VALUES
('Amit','Joshi','Cardiologist','9801001001',120000),
('Puja','Rana','Neurologist','9801001002',110000),
('Deepak','Shrestha','Pediatrician','9801001003',95000);

-- Insert Rooms
INSERT INTO Room (Room_Type, Room_Charge, Availability)
VALUES 
('General',1500,'Available'),
('Private',3000,'Available'),
('ICU',10000,'Available');

-- Insert Appointments
INSERT INTO Appointment (Patient_ID, Doctor_ID, Appointment_Date)
VALUES 
(1,1,'2025-10-15'),
(2,2,'2025-10-16'),
(3,3,'2025-10-17');

-- Insert Treatments
INSERT INTO Treatment (Patient_ID, Doctor_ID, Diagnosis, Prescription, Treatment_Cost, Treatment_Date)
VALUES
(1,1,'Heart Checkup','Medicine A, Rest',5000,'2025-10-15'),
(2,2,'Headache','Pain Relief Tablet',1500,'2025-10-16'),
(3,3,'Fever','Paracetamol 500mg',1000,'2025-10-17');

-- Insert Billing Info
INSERT INTO Billing (Patient_ID, Total_Amount, Paid_Amount, Payment_Status, Bill_Date)
VALUES
(1,5000,3000,'Pending','2025-10-16'),
(2,1500,1500,'Paid','2025-10-17');

-- Insert Nurses
INSERT INTO Nurse (First_Name, Last_Name, Assigned_Room_ID, Shift)
VALUES 
('Gita','Karki',1,'Day'),
('Bikash','Rai',2,'Night');

-- Insert Medical Tests
INSERT INTO Medical_Test (Patient_ID, Test_Name, Test_Date, Result, Cost)
VALUES 
(1,'ECG','2025-10-15','Normal',800),
(2,'MRI','2025-10-16','Mild Issue',5000);



-- 4.CRUD (INSERT , UPDATE , DELETE , AND WHERE )

-- INSERT: Add a new patient
INSERT INTO Patient (First_Name, Last_Name, Gender, Age, Address, Contact_No)
VALUES 
('Rajesh','Chaudhary','Male',22,'Bardiya','9800000001');


-- to show the data inside the table 
SELECT * FROM Patient;

-- Update Patient Address
UPDATE Patient
SET Address = 'Bhaktapur'
WHERE Patient_ID = 3;

SELECT * FROM patient;

-- Delete Appointment of a Cancelled Patient
DELETE FROM Appointment
WHERE Status = 'Cancelled' AND Appointment_ID > 0;

-- Select Patients older than 30
SELECT * FROM Patient
WHERE Age > 30;


-- 5.INNER JOIN 
-- Show Appointment Details with Doctor and Patient Names
SELECT a.Appointment_ID, p.First_Name AS Patient, d.First_Name AS Doctor, a.Appointment_Date, a.Status
FROM Appointment a
INNER JOIN Patient p ON a.Patient_ID = p.Patient_ID
INNER JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID;



-- 6.AGGREGATE FUNCTIONS(SUM, AVG)
-- Calculate Total and Average Treatment Cost
SELECT 
    SUM(Treatment_Cost) AS Total_Treatment_Cost,
    AVG(Treatment_Cost) AS Average_Treatment_Cost
FROM Treatment;

-- Calculate Total Billing Amount for Each Patient
SELECT p.First_Name, SUM(b.Total_Amount) AS Total_Billed
FROM Billing b
INNER JOIN Patient p ON b.Patient_ID = p.Patient_ID
GROUP BY p.First_Name;


-- 7.CREATE VIEW
-- Create a view to show pending bills
CREATE VIEW Pending_Bills AS
SELECT p.First_Name, b.Total_Amount, b.Paid_Amount, (b.Total_Amount - b.Paid_Amount) AS Due_Amount
FROM Billing b
INNER JOIN Patient p ON b.Patient_ID = p.Patient_ID
WHERE b.Payment_Status = 'Pending';

-- Retrieve from view
SELECT * FROM Pending_Bills;


-- 8. STORED PROCEDURE
DELIMITER //
CREATE PROCEDURE Generate_Patient_Bill(IN p_PatientID INT)
BEGIN
    DECLARE treatmentCost DECIMAL(10,2);
    DECLARE testCost DECIMAL(10,2);

    -- Get total treatment cost of patient
    SELECT IFNULL(SUM(Treatment_Cost),0) INTO treatmentCost
    FROM Treatment
    WHERE Patient_ID = p_PatientID;

    -- Get total medical test cost of patient
    SELECT IFNULL(SUM(Cost),0) INTO testCost
    FROM Medical_Test
    WHERE Patient_ID = p_PatientID;

    -- Insert into billing table
    INSERT INTO Billing (Patient_ID, Total_Amount, Paid_Amount, Payment_Status, Bill_Date)
    VALUES (p_PatientID, (treatmentCost + testCost), 0, 'Pending', CURRENT_DATE());
END //
DELIMITER ;

-- call the procedure
CALL Generate_Patient_Bill(3);

-- show the stored procedure in the treatment 
SELECT * FROM Treatment;

-- 9. TRIGGERING 
-- Create a trigger to update room availability when a new patient is admitted
DELIMITER //
CREATE TRIGGER after_patient_treatment
AFTER INSERT ON Treatment
FOR EACH ROW
BEGIN
    UPDATE Room
    SET Availability = 'Occupied'
    WHERE Room_ID = (SELECT Room_ID FROM Room ORDER BY RAND() LIMIT 1);
END;
//
DELIMITER ;

SELECT * FROM Treatment;

-- 10.TRANSACTION WITH COMMIT AND ROLLBACK 

-- Example of Transaction
START TRANSACTION;

INSERT INTO Billing (Patient_ID, Total_Amount, Paid_Amount, Payment_Status, Bill_Date)
VALUES (3, 8000, 4000, 'Pending', '2025-10-18');

-- Suppose something goes wrong, we rollback
ROLLBACK;

-- Then perform correct transaction
START TRANSACTION;
INSERT INTO Billing (Patient_ID, Total_Amount, Paid_Amount, Payment_Status, Bill_Date)
VALUES (3, 8000, 8000, 'Paid', '2025-10-18');
COMMIT;


-- 11. GRANT PRIVILEGES (for new database user)

DROP USER IF EXISTS 'hospital_user'@'localhost'; -- if user already exist then drop and flush 
FLUSH PRIVILEGES;
-- Create a new user and give limited access to HospitalDB
CREATE USER 'hospital_user'@'localhost' IDENTIFIED BY 'Hospital@123';

-- Grant specific privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON Hospital_Management_System.* TO 'hospital_user'@'localhost';

-- Apply the changes immediately
FLUSH PRIVILEGES;






















