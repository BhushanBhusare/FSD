-- PRACTICAL 1: DDL COMMANDS

-- 1. CREATE TABLE
CREATE TABLE Student (
    RollNo INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(30),
    Marks INT
);

-- 2. CREATE VIEW
CREATE VIEW Student_View AS
SELECT RollNo, Name, Marks
FROM Student;

-- 3. CREATE INDEX
CREATE INDEX idx_name
ON Student(Name);

-- 4. SEQUENCE ALTERNATIVE IN MYSQL
-- AUTO_INCREMENT generates automatic numbers

-- 5. INSERT RECORDS
INSERT INTO Student(Name, Marks)
VALUES
('Rahul', 85),
('Amit', 90),
('Priya', 95);

-- 6. DISPLAY TABLE
SELECT * FROM Student;

-- 7. DISPLAY VIEW
SELECT * FROM Student_View;

-- 8. DISPLAY INDEX
SHOW INDEX FROM Student;
