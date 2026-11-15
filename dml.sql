-- PRACTICAL 2: DML COMMANDS

-- 1. CREATE TABLES
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

CREATE TABLE Student (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(30),
    Marks INT,
    DeptID INT,
    ManagerID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (ManagerID) REFERENCES Student(RollNo)
);

-- 2. INSERT RECORDS
INSERT INTO Department VALUES
(1, 'Computer'),
(2, 'Mechanical'),
(3, 'Civil');

INSERT INTO Student VALUES
(1, 'Rahul', 85, 1, NULL),
(2, 'Amit', 75, 2, 1),
(3, 'Priya', 95, 1, 1),
(4, 'Neha', 60, 2, 2);

-- 3. SELECT
SELECT * FROM Student;

-- 4. WHERE WITH OPERATORS
SELECT * FROM Student
WHERE Marks >= 75 AND DeptID = 1;

-- 5. UPDATE
UPDATE Student
SET Marks = 90
WHERE RollNo = 1;

-- 6. DELETE
DELETE FROM Student
WHERE RollNo = 4;

-- 7. FUNCTIONS
SELECT MAX(Marks), MIN(Marks), AVG(Marks),
       SUM(Marks), COUNT(*)
FROM Student;

-- 8. INNER JOIN
SELECT Name, DeptName
FROM Student
INNER JOIN Department
ON Student.DeptID = Department.DeptID;

-- 9. LEFT JOIN
SELECT Name, DeptName
FROM Student
LEFT JOIN Department
ON Student.DeptID = Department.DeptID;

-- 10. RIGHT JOIN
SELECT Name, DeptName
FROM Student
RIGHT JOIN Department
ON Student.DeptID = Department.DeptID;

-- 11. FULL OUTER JOIN (MYSQL ALTERNATIVE)
SELECT Name, DeptName
FROM Student
LEFT JOIN Department
ON Student.DeptID = Department.DeptID

UNION

SELECT Name, DeptName
FROM Student
RIGHT JOIN Department
ON Student.DeptID = Department.DeptID;

-- 12. CROSS JOIN
SELECT Name, DeptName
FROM Student
CROSS JOIN Department;

-- 13. SELF JOIN
SELECT A.Name AS Student, B.Name AS Manager
FROM Student A
JOIN Student B
ON A.ManagerID = B.RollNo;

-- 14. SUBQUERY
SELECT * FROM Student
WHERE Marks > (SELECT AVG(Marks) FROM Student);

-- 15. SET OPERATORS (UNION)
SELECT Name FROM Student WHERE Marks > 80
UNION
SELECT Name FROM Student WHERE DeptID = 2;

-- 16. UNION ALL
SELECT Name FROM Student WHERE Marks > 80
UNION ALL
SELECT Name FROM Student WHERE DeptID = 2;

-- 17. CREATE VIEW
CREATE VIEW TopStudents AS
SELECT * FROM Student
WHERE Marks >= 80;

-- 18. DISPLAY VIEW
SELECT * FROM TopStudents;
