USE OnlineEducationManagement_8_10;

-- 1. Retrieve all students' details
SELECT * 
FROM Student;

-- 2. Retrieve all courses in the Physics department
SELECT Course_ID, Course_Name, Credits, Duration 
FROM Course
WHERE Department_ID = 1;
 
-- 3. Retrieve all students enrolled in the course 'Physics101'
SELECT s.Student_ID, s.Name, c.Course_Name, e.Grade 
FROM Enrollment e
JOIN Student s ON e.Student_ID = s.Student_ID
JOIN Course c ON e.Course_ID = c.Course_ID
WHERE c.Course_Name = 'Physics101';

-- 4. Retrieve schedule information for 'Physics101' course
SELECT c.Course_Name, i.Name AS Instructor_Name, cl.Location, sch.Time_Slot, sch.Day_of_Week
FROM Schedule sch
JOIN Course c ON sch.Course_ID = c.Course_ID
JOIN Instructor i ON sch.Instructor_ID = i.Instructor_ID
JOIN Classroom cl ON sch.Classroom_ID = cl.Classroom_ID
WHERE c.Course_Name = 'Physics101';

-- 5. Retrieve payment records for each student
SELECT s.Student_ID, s.Name, p.Payment_Date, p.Amount, p.Payment_Method
FROM Payment p
JOIN Student s ON p.Student_ID = s.Student_ID;

-- 6. Count the number of students grouped by gender
SELECT Gender, COUNT(*) AS Total_Students
FROM Student
GROUP BY Gender;

-- 7. Calculate the average grade for each course
SELECT c.Course_Name, AVG(CASE 
    WHEN e.Grade = 'A' THEN 4
    WHEN e.Grade = 'B' THEN 3
    WHEN e.Grade = 'C' THEN 2
    WHEN e.Grade = 'D' THEN 1
    ELSE 0
END) AS Average_Grade
FROM Enrollment e
JOIN Course c ON e.Course_ID = c.Course_ID
GROUP BY c.Course_Name;

-- 8. Calculate total payments received by each payment method
SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Method;

-- 9. Retrieve dataset for predicting exam performance
SELECT e.Exam_ID, s.Student_ID, s.Name, e.Score, c.Course_Name
FROM Exam_Result e
JOIN Student s ON e.Student_ID = s.Student_ID
JOIN Exam ex ON e.Exam_ID = ex.Exam_ID
JOIN Course c ON ex.Course_ID = c.Course_ID;

-- 10. Retrieve classroom utilization data for optimization
SELECT cl.Classroom_ID, cl.Location, COUNT(sch.Schedule_ID) AS Total_Classes_Scheduled
FROM Classroom cl
LEFT JOIN Schedule sch ON cl.Classroom_ID = sch.Classroom_ID
GROUP BY cl.Classroom_ID, cl.Location;

-- 11. Retrieve enrollment patterns for analysis
SELECT s.Student_ID, s.Name, d.Department_Name, COUNT(e.Course_ID) AS Total_Courses_Enrolled
FROM Student s
JOIN Enrollment e ON s.Student_ID = e.Student_ID
JOIN Course c ON e.Course_ID = c.Course_ID
JOIN Department d ON c.Department_ID = d.Department_ID
GROUP BY s.Student_ID, s.Name, d.Department_Name;

-- 12. Suggest top 5 courses by enrollment count
SELECT c.Course_ID, c.Course_Name, COUNT(e.Enrollment_ID) AS Total_Enrollments
FROM Course c
LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID
GROUP BY c.Course_ID, c.Course_Name
ORDER BY Total_Enrollments DESC
LIMIT 5;

-- 13. Predict students likely to succeed in advanced courses
SELECT s.Student_ID, s.Name, AVG(er.Score) AS Average_Score
FROM Exam_Result er
JOIN Student s ON er.Student_ID = s.Student_ID
GROUP BY s.Student_ID, s.Name
HAVING AVG(er.Score) > 85;


-- 14.Select All Courses in a Specific Department
SELECT Course_ID, Course_Name, Credits, Duration 
FROM Course
WHERE Department_ID = 1;

-- 15. Joining Tables  :Retrieve All Students Enrolled in a Specific Course
SELECT s.Student_ID, s.Name, c.Course_Name, e.Grade 
FROM Enrollment e
JOIN Student s ON e.Student_ID = s.Student_ID
JOIN Course c ON e.Course_ID = c.Course_ID
WHERE c.Course_Name = 'Physics101';

-- 16. Retrieve Schedule Information for a Course
SELECT c.Course_Name, i.Name AS Instructor_Name, cl.Location, sch.Time_Slot, sch.Day_of_Week
FROM Schedule sch
JOIN Course c ON sch.Course_ID = c.Course_ID
JOIN Instructor i ON sch.Instructor_ID = i.Instructor_ID
JOIN Classroom cl ON sch.Classroom_ID = cl.Classroom_ID
WHERE c.Course_Name = 'Physics101';


-- 17. Retrieve Payment Information for Each Student
SELECT s.Student_ID, s.Name, p.Payment_Date, p.Amount, p.Payment_Method
FROM Payment p
JOIN Student s ON p.Student_ID = s.Student_ID;



-- 18.  Retrieve Payment Information for Each Student
SELECT s.Student_ID, s.Name, p.Payment_Date, p.Amount, p.Payment_Method
FROM Payment p
JOIN Student s ON p.Student_ID = s.Student_ID;


-- 19. SELECT s.Student_ID, s.Name, p.Payment_Date, p.Amount, p.Payment_Method
SELECT s.Student_ID, s.Name, p.Payment_Date, p.Amount, p.Payment_Method
FROM Payment p
JOIN Student s ON p.Student_ID = s.Student_ID;


-- 20. c. Retrieve Payment Information for Each Student
SELECT s.Student_ID, s.Name, p.Payment_Date, p.Amount, p.Payment_Method
FROM Payment p
JOIN Student s ON p.Student_ID = s.Student_ID;


-- 21. 3. Aggregation and Grouping
-- a. Count of Students by Gender
SELECT Gender, COUNT(*) AS Total_Students
FROM Student
GROUP BY Gender;

-- b.  Average Grade for Each Course
SELECT c.Course_Name, AVG(CASE 
    WHEN e.Grade = 'A' THEN 4
    WHEN e.Grade = 'B' THEN 3
    WHEN e.Grade = 'C' THEN 2
    WHEN e.Grade = 'D' THEN 1
    ELSE 0
END) AS Average_Grade
FROM Enrollment e
JOIN Course c ON e.Course_ID = c.Course_ID
GROUP BY c.Course_Name;

-- c. Total Payments Received Per Payment Method
SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Method;

-- d. Total Payments Received Per Payment Method
SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Method;