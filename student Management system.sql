-- Create a table for students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    enrollment_date DATE
);

-- Create a table for courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(10),
    instructor VARCHAR(50)
);

-- Create a table for enrollments
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert sample data into Students table
INSERT INTO Students (student_id, first_name, last_name, age, enrollment_date)
VALUES
(1, 'Alice', 'Johnson', 20, '2023-09-01'),
(2, 'Bob', 'Smith', 22, '2023-09-05');

-- Insert sample data into Courses table
INSERT INTO Courses (course_id, course_name, course_code, instructor)
VALUES
(1, 'Database Systems', 'CS101', 'Dr. Miller'),
(2, 'Data Structures', 'CS102', 'Dr. Clark');

-- Insert sample data into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 1, '2023-09-10'),
(2, 2, 2, '2023-09-12');
