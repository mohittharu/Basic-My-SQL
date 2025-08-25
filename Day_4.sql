USE OnlineEducationManagement_8_10;
-- Delete a student record (Cascades to Enrollment and Payment due to ON DELETE CASCADE)
Select * from student;
DELETE FROM Student
WHERE Student_ID = 3;

-- Delete an outdated course
Select * from Course;
DELETE FROM Course
WHERE Course_ID = 2;

-- Remove an assignment submission
Select * from Assignment_Submission;
DELETE FROM Assignment_Submission
WHERE Submission_ID = 1;

-- Delete a payment record
Select * from Payment;

DELETE FROM Payment
WHERE Payment_ID = 2;