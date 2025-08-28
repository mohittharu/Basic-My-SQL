USE oct_2025 ;

select * from student ;

UPDATE student
set name ="Mohit Tharu"
where Student_id=1;

UPDATE Student
SET Phone = '‪9748727497‬'
WHERE Student_ID = 1;

select * from schedule;

-- Update the schedule time slot
UPDATE Schedule
SET Time_Slot = '2:00 PM - 4:00 PM'
WHERE Schedule_ID = 2;


select * from Exam_Result;
-- Update the grade of a student's exam
UPDATE Exam_Result
SET Grade = 'A+'
WHERE Student_ID = 1 AND Exam_ID = 1;



select * from Assignment;
-- Update assignment details
UPDATE Assignment
SET Title = 'Physics Practical', Due_Date = '2024-02-22'
WHERE Assignment_ID = 1;

select * from department;

update department
set Department_Name="physics"
where Department_ID=1;

select * A Classroom;
update classroom 
set Location="Building W -Room 101"
where Classroom_ID=1;
-- mohit 
