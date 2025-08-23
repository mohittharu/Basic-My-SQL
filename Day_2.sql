CREATE DATABASE OnlineEducationManagement_8_10;
USE OnlineEducationManagement_8_10;

-- 1. Student Table
CREATE TABLE Student(
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    Date_of_Birth DATE NOT NULL,
    Enrollment_Date DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL);

-- 2. Department Table
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(100) UNIQUE NOT NULL,
    Head_of_Department VARCHAR(100) NOT NULL
);

-- 3. Course Table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Credits INT NOT NULL,
    Duration INT NOT NULL,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
);

-- 4. Instructor Table
CREATE TABLE Instructor (
    Instructor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Specialization VARCHAR(100),
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE CASCADE
);

-- 5. Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Enrollment_Date DATE NOT NULL,
    Grade VARCHAR(2),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);

-- 6. Classroom Table
CREATE TABLE Classroom (
    Classroom_ID INT PRIMARY KEY AUTO_INCREMENT,
    Location VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
);

-- 7. Schedule Table
CREATE TABLE Schedule (
    Schedule_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Instructor_ID INT NOT NULL,
    Classroom_ID INT NOT NULL,
    Time_Slot VARCHAR(50) NOT NULL,
    Day_of_Week VARCHAR(20) NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID) ON DELETE CASCADE,
    FOREIGN KEY (Classroom_ID) REFERENCES Classroom(Classroom_ID) ON DELETE CASCADE
);

-- 8. Payment Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_Method ENUM('Credit Card', 'Cash', 'Online') NOT NULL,
    Transaction_ID VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

-- 9. Exam Table
CREATE TABLE Exam (
    Exam_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Exam_Date DATE NOT NULL,
    Duration INT NOT NULL,
    Exam_Type ENUM('Final', 'Midterm') NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);

-- 10. Exam_Result Table
CREATE TABLE Exam_Result (
    Result_ID INT PRIMARY KEY AUTO_INCREMENT,
    Exam_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Score DECIMAL(5, 2) NOT NULL,
    Grade VARCHAR(2),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID) ON DELETE CASCADE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

-- 11. Assignment Table
CREATE TABLE Assignment (
    Assignment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Due_Date DATE NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);

-- 12. Assignment_Submission Table
CREATE TABLE Assignment_Submission (
    Submission_ID INT PRIMARY KEY AUTO_INCREMENT,
    Assignment_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Submission_Date DATE NOT NULL,
    File_Link VARCHAR(255),
    Grade VARCHAR(2),
    FOREIGN KEY (Assignment_ID) REFERENCES Assignment(Assignment_ID) ON DELETE CASCADE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

