


-- iNSERT ADDITION DEPARTMENTS 

USE oct_2025 ;
-- Insert additional Students
INSERT INTO Student (Name, Email, Phone, Address, Date_of_Birth, Enrollment_Date, Gender)
VALUES
('David Brown', 'david.brown@example.com', '1122334455', '123 Elm St', '1999-08-15', '2024-01-11', 'Male'),
('Emma Green', 'emma.green@example.com', '2233445566', '456 Birch Ln', '2002-04-18', '2024-01-12', 'Female'),
('Frank Black', 'frank.black@example.com', '3344556677', '789 Maple Ave', '1997-11-03', '2024-01-13', 'Male'),
('Grace Hill', 'grace.hill@example.com', '4455667788', '654 Pine St', '2003-06-27', '2024-01-14', 'Female'),
('Hannah Lee', 'hannah.lee@example.com', '5566778899', '321 Oak Rd', '2001-09-09', '2024-01-15', 'Female'),
('Ian White', 'ian.white@example.com', '6677889900', '987 Willow Dr', '2000-12-21', '2024-01-16', 'Male'),
('Jane Miller', 'jane.miller@example.com', '7788990011', '159 Cedar Ct', '1998-05-04', '2024-01-17', 'Female'),
('Kyle Adams', 'kyle.adams@example.com', '8899001122', '753 Sycamore Blvd', '2002-07-14', '2024-01-18', 'Male'),
('Laura Scott', 'laura.scott@example.com', '9900112233', '357 Ash Ln', '1999-10-25', '2024-01-19', 'Female'); 

-- Insert additional Departments
INSERT INTO Department (Department_Name, Head_of_Department)
VALUES
('Mathematics', 'Dr. Carl Gauss'),
('Computer Science', 'Dr. Alan Turing'),
('Chemistry', 'Dr. Marie Curie'),
('History', 'Dr. Howard Zinn'),
('Economics', 'Dr. Amartya Sen'),
('Philosophy', 'Dr. Ludwig Wittgenstein'),
('Psychology', 'Dr. Sigmund Freud'),
('Literature', 'Dr. William Shakespeare'),
('Music', 'Dr. Ludwig Beethoven'),
('Art', 'Dr. Vincent Van Gogh');

-- Insert additional Courses
 

-- Insert additional Instructors
INSERT INTO Instructor (Name, Email, Phone, Specialization, Department_ID)
VALUES
('Dr. Carl Gauss', 'carl.gauss@example.com', '1112233445', 'Number Theory', 1),
('Dr. Alan Turing', 'alan.turing@example.com', '1223344556', 'Machine Learning', 2),
('Dr. Marie Curie', 'marie.curie@example.com', '1334455667', 'Radiation Chemistry', 5),
('Dr. Howard Zinn', 'howard.zinn@example.com', '1445566778', 'Civil History', 6),
('Dr. Amartya Sen', 'amartya.sen@example.com', '1556677889', 'Development Economics', 7),
('Dr. Ludwig Wittgenstein', 'ludwig.witt@example.com', '1667788990', 'Philosophical Logic', 8),
('Dr. Sigmund Freud', 'sigmund.freud@example.com', '1778899001', 'Psychoanalysis', 9),
('Dr. William Shakespeare', 'william.shake@example.com', '1889900112', 'Shakespearean Drama', 10),
('Dr. Ludwig Beethoven', 'ludwig.beethoven@example.com', '1990011223', 'Composition', 1),
('Dr. Vincent Van Gogh', 'vincent.gogh@example.com', '2001122334', 'Painting', 2);

-- Insert additional Classrooms
INSERT INTO Classroom (Location, Capacity)
VALUES
('Building C - Room 101', 40),
('Building D - Room 202', 60),
('Building E - Room 303', 30),
('Building F - Room 404', 50),
('Building G - Room 505', 25),
('Building H - Room 606', 35),
('Building I - Room 707', 45),
('Building J - Room 808', 55),
('Building K - Room 909', 20),
('Building L - Room 1010', 30);

-- Add similar patterns for other tables such as Schedule, Enrollment, Payment, Exam, Exam_Result, Assignment, and Assignment_Submission.

-- Ensure we are using the correct database
USE OEMS_SQA_2025;

-- Insert data into Enrollment Table
-- Assuming Student IDs 1-9 are for David Brown to Laura Scott
-- Assuming Course IDs 1-9 are for Math101 to Music303
INSERT INTO Enrollment (Student_ID, Course_ID, Enrollment_Date, Grade)
VALUES
-- David Brown (ID 1) enrolls in Math101 (ID 1)
(1, 1, '2024-01-11', 'A-'),
-- Emma Green (ID 2) enrolls in CS102 (ID 2)
(2, 2, '2024-01-12', 'B+'),
-- Frank Black (ID 3) enrolls in Chem201 (ID 3)
(3, 3, '2024-01-13', 'A'),
-- Grace Hill (ID 4) enrolls in History101 (ID 4)
(4, 4, '2024-01-14', 'B'),
-- Hannah Lee (ID 5) enrolls in Eco202 (ID 5)
(5, 5, '2024-01-15', 'A-'),
-- Ian White (ID 6) enrolls in Phil103 (ID 6)
(6, 6, '2024-01-16', 'C+'),
-- Jane Miller (ID 7) enrolls in Psych101 (ID 7)
(7, 7, '2024-01-17', 'B+'),
-- Kyle Adams (ID 8) enrolls in Lit202 (ID 8)
(8, 8, '2024-01-18', 'A'),
-- Laura Scott (ID 9) enrolls in Music303 (ID 9)
(9, 9, '2024-01-19', 'B');

-- Insert data into Schedule Table
-- Assuming Course IDs 1-9, Instructor IDs 1-10, Classroom IDs 1-10
-- Mapping instructors to courses somewhat based on their departments from user's inserts
-- Course 1 (Math101, Dept 1) by Instructor 1 (Gauss, Dept 1)
-- Course 2 (CS102, Dept 2) by Instructor 2 (Turing, Dept 2)
-- Course 3 (Chem201, Dept 5) by Instructor 3 (Curie, Dept 5)
-- Course 4 (History101, Dept 6) by Instructor 4 (Zinn, Dept 6)
-- Course 5 (Eco202, Dept 7) by Instructor 5 (Sen, Dept 7)
-- Course 6 (Phil103, Dept 8) by Instructor 6 (Wittgenstein, Dept 8)
-- Course 7 (Psych101, Dept 9) by Instructor 7 (Freud, Dept 9)
-- Course 8 (Lit202, Dept 10) by Instructor 8 (Shakespeare, Dept 10)
-- Course 9 (Music303, Dept 10) also by Instructor 8 (Shakespeare, Dept 10) or could use another. Let's use Inst 9 (Beethoven, Dept 1, but spec is Composition) for variety
INSERT INTO Schedule (Course_ID, Instructor_ID, Classroom_ID, Time_Slot, Day_of_Week)
VALUES
(1, 1, 1, '09:00-10:30', 'Monday'),
(2, 2, 2, '10:30-12:00', 'Monday'),
(3, 3, 3, '13:00-14:30', 'Tuesday');

-- Insert data into Payment Table
-- Assuming Student IDs 1-9
INSERT INTO Payment (Student_ID, Payment_Date, Amount, Payment_Method, Transaction_ID)
VALUES
(1, '2024-01-12', 500.00, 'Credit Card', 'TXN0012024A'),
(2, '2024-01-13', 650.00, 'Online', 'TXN0022024B'),
(3, '2024-01-14', 550.00, 'Cash', 'TXN0032024C'),
(4, '2024-01-15', 500.00, 'Credit Card', 'TXN0042024D'),
(5, '2024-01-16', 600.00, 'Online', 'TXN0052024E'),
(6, '2024-01-17', 450.00, 'Cash', 'TXN0062024F'),
(7, '2024-01-18', 525.00, 'Credit Card', 'TXN0072024G'),
(8, '2024-01-19', 675.00, 'Online', 'TXN0082024H'),
(9, '2024-01-20', 475.00, 'Cash', 'TXN0092024I');

-- Insert data into Exam Table
-- Assuming Course IDs 1-9
INSERT INTO Exam (Course_ID, Exam_Date, Duration, Exam_Type)
VALUES
(1, '2024-03-01', 90, 'Midterm'),  -- Math101 Midterm
(1, '2024-05-15', 120, 'Final'),    -- Math101 Final
(2, '2024-03-05', 90, 'Midterm'),  -- CS102 Midterm
(2, '2024-05-20', 120, 'Final'),    -- CS102 Final
(3, '2024-03-10', 75, 'Midterm'),  -- Chem201 Midterm
(4, '2024-05-25', 100, 'Final'),   -- History101 Final
(5, '2024-03-15', 90, 'Midterm'),  -- Eco202 Midterm
(6, '2024-05-30', 120, 'Final'),   -- Phil103 Final
(7, '2024-03-20', 80, 'Midterm');  -- Psych101 Midterm

-- Insert data into Exam_Result Table
-- Linking to Exams created above (Exam_IDs will be 1-9) and Students enrolled in those courses
-- Exam 1 (Math101 Midterm) for Student 1
INSERT INTO Exam_Result (Exam_ID, Student_ID, Score, Grade)
VALUES
(1, 1, 85.00, 'A-'), -- David Brown for Math101 Midterm
-- Exam 2 (Math101 Final) for Student 1
(2, 1, 90.50, 'A'),  -- David Brown for Math101 Final
-- Exam 3 (CS102 Midterm) for Student 2
(3, 2, 78.00, 'B+'), -- Emma Green for CS102 Midterm
-- Exam 4 (CS102 Final) for Student 2
(4, 2, 82.00, 'A-'), -- Emma Green for CS102 Final
-- Exam 5 (Chem201 Midterm) for Student 3
(5, 3, 92.00, 'A'),  -- Frank Black for Chem201 Midterm
-- Exam 6 (History101 Final) for Student 4
(6, 4, 75.00, 'B'),  -- Grace Hill for History101 Final
-- Exam 7 (Eco202 Midterm) for Student 5
(7, 5, 88.50, 'A-'), -- Hannah Lee for Eco202 Midterm
-- Exam 8 (Phil103 Final) for Student 6
(8, 6, 68.00, 'C+'), -- Ian White for Phil103 Final
-- Exam 9 (Psych101 Midterm) for Student 7
(9, 7, 80.00, 'B+'); -- Jane Miller for Psych101 Midterm

-- Insert data into Assignment Table
-- Assuming Course IDs 1-9
INSERT INTO Assignment (Course_ID, Title, Description, Due_Date)
VALUES
(1, 'Algebra Problems Set 1', 'Solve chapter 1-3 problems.', '2024-02-15'),
(2, 'Basic Python Script', 'Write a script to sort a list.', '2024-02-20'),
(3, 'Lab Report 1', 'Report on hydrocarbon reactions.', '2024-02-25'),
(4, 'Essay on Ancient Civilizations', 'Compare two ancient civilizations.', '2024-03-01'),
(5, 'Market Analysis Paper', 'Analyze supply and demand for a product.', '2024-03-05'),
(6, 'Ethical Dilemma Essay', 'Discuss a modern ethical dilemma.', '2024-03-10'),
(7, 'Case Study: Cognitive Bias', 'Analyze a case study on cognitive bias.', '2024-03-15'),
(8, 'Book Review: Modern Novel', 'Review of a selected modern novel.', '2024-03-20'),
(9, 'Composition Analysis', 'Analyze a piece of classical music.', '2024-03-25');

-- Insert data into Assignment_Submission Table
-- Linking to Assignments created above (Assignment_IDs will be 1-9) and Students enrolled
INSERT INTO Assignment_Submission (Assignment_ID, Student_ID, Submission_Date, File_Link, Grade)
VALUES
-- Student 1 (David Brown) for Assignment 1 (Algebra Problems)
(1, 1, '2024-02-14', 'http://example.com/uploads/david_algebra.pdf', 'A'),
-- Student 2 (Emma Green) for Assignment 2 (Python Script)
(2, 2, '2024-02-19', 'http://example.com/uploads/emma_python.zip', 'A-'),
-- Student 3 (Frank Black) for Assignment 3 (Lab Report)
(3, 3, '2024-02-25', 'http://example.com/uploads/frank_labreport.docx', 'A'),
-- Student 4 (Grace Hill) for Assignment 4 (Essay Ancient Civ)
(4, 4, '2024-02-29', 'http://example.com/uploads/grace_essay.pdf', 'B+'),
-- Student 5 (Hannah Lee) for Assignment 5 (Market Analysis)
(5, 5, '2024-03-04', 'http://example.com/uploads/hannah_analysis.pdf', 'A-'),
-- Student 6 (Ian White) for Assignment 6 (Ethical Dilemma)
(6, 6, '2024-03-10', 'http://example.com/uploads/ian_ethics.docx', 'B'),
-- Student 7 (Jane Miller) for Assignment 7 (Cognitive Bias)
(7, 7, '2024-03-14', 'http://example.com/uploads/jane_casestudy.pdf', 'B+'),
-- Student 8 (Kyle Adams) for Assignment 8 (Book Review)
(8, 8, '2024-03-19', 'http://example.com/uploads/kyle_review.pdf', 'A');

-- Hello3
