USE OnlineEducationManagement_8_10;

DELIMITER //

CREATE PROCEDURE GetAllStudentts()
BEGIN
    SELECT * FROM Student;
    select * from course;

END //

DELIMITER ;


CALL GetAllStudentts();


select * from Course;

DELIMITER //

CREATE PROCEDURE GetStudentsByCourse(IN Course_ID INT)    -- input leko 
BEGIN
    SELECT s.name, c.Course_Name
    FROM Student s
    JOIN Enrollment e ON s.Student_ID = e. Student_ID
    JOIN Course c ON e.Course_ID = c.Course_ID
    WHERE c.Course_ID = Course_ID;
END //

-- select * from enrollment;


DELIMITER ;

select * from course;

CALL GetStudentsByCourse(5);


INSERT INTO Enrollment (Student_ID, Course_ID, Enrollment_Date, Grade)
VALUES 
(1, 10, '2025-06-01', 'A'),
(1, 12, '2025-06-02', 'B'),
(2, 11, '2025-06-03', 'A'),
(2, 13, '2025-06-04', 'B');





DELIMITER //

CREATE PROCEDURE GetStudentCountByCourse(IN Course_ID INT, OUT studentCount INT)
BEGIN
    SELECT COUNT(*) INTO studentCount
    FROM Enrollment
    WHERE Course_ID = Course_ID;
END //

DELIMITER ;


CALL GetStudentCountByCourse(1, @count);
SELECT @count AS StudentCount;