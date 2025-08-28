CREATE DATABASE newDB;
USE newDB;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE teaches (
    instructor_id INT,
    course_id INT,
    PRIMARY KEY (instructor_id, course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



INSERT INTO students (student_id, name, age, city) VALUES
(1, 'Alice Johnson', 22, 'New York'),
(2, 'Bob Smith', 23, 'Los Angeles'),
(3, 'Charlie Brown', 24, 'Chicago'),
(4, 'David White', 22, 'Houston'),
(5, 'Emma Davis', 21, 'Phoenix'),
(6, 'Frank Wilson', 25, 'Philadelphia'),
(7, 'Grace Hall', 22, 'San Antonio'),
(8, 'Hannah Lee', 23, 'San Diego'),
(9, 'Ian Clark', 24, 'Dallas'),
(10, 'Jack Lewis', 22, 'San Jose');

INSERT INTO courses (course_id, course_name, credits) VALUES
(101, 'Database Systems', 4),
(102, 'Data Structures', 3),
(103, 'Web Development', 3),
(104, 'Machine Learning', 4),
(105, 'Operating Systems', 4);

INSERT INTO enrollments (enrollment_id, student_id, course_id) VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 4, 104),
(5, 5, 105),
(6, 6, 101),
(7, 7, 102),
(8, 8, 103),
(9, 9, 104),
(10, 10, 105);

INSERT INTO instructors (instructor_id, name, department) VALUES
(201, 'Dr. Smith', 'Computer Science'),
(202, 'Dr. Johnson', 'Mathematics'),
(203, 'Dr. Brown', 'Engineering'),
(204, 'Dr. White', 'AI & ML'),
(205, 'Dr. Davis', 'Software Engineering');

INSERT INTO teaches (instructor_id, course_id) VALUES
(201, 101),
(202, 102),
(203, 103),
(204, 104),
(205, 105);


-- . INNER JOIN (Fetching Enrolled Students with Course Details)
SELECT students.student_id ,  students.name,  courses.course_name
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;



-- LEFT JOIN (Students and Their Courses, Including Those Not Enrolled)
SELECT students.student_id, students.name, courses.course_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.course_id;

-- RIGHT JOIN
-- Returns all records from the right table (courses), even if there’s no match in the left table (enrollments).
SELECT  students.student_id,students.name, courses.course_name
FROM students     -- students table ma sabai data aauxa ani arko table ko data aauxa jasma match hunxa
RIGHT JOIN enrollments ON students.student_id = enrollments.student_id
RIGHT JOIN courses ON enrollments.course_id = courses.course_id;        -- afnaii table ko hunxa ani like course_id arko table ko aayo vaney tyo foreign key banxa 