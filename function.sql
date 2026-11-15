-- PRACTICAL 5: PROCEDURE AND FUNCTION

-- 1. CREATE TABLES
CREATE TABLE Stud_Marks (
    RollNo INT,
    Name VARCHAR(30),
    Marks INT
);

CREATE TABLE Result (
    RollNo INT,
    Name VARCHAR(30),
    Class VARCHAR(30)
);

-- 2. INSERT STUDENT RECORDS
INSERT INTO Stud_Marks VALUES
(1, 'Rahul', 1200),
(2, 'Amit', 950),
(3, 'Priya', 850),
(4, 'Neha', 700);

-- 3. CREATE FUNCTION
DELIMITER //

CREATE FUNCTION fn_Grade(m INT)
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN

    IF m >= 990 AND m <= 1500 THEN
        RETURN 'Distinction';

    ELSEIF m >= 900 AND m <= 989 THEN
        RETURN 'First Class';

    ELSEIF m >= 825 AND m <= 899 THEN
        RETURN 'Higher Second Class';

    ELSE
        RETURN 'Fail';

    END IF;

END //

-- 4. CREATE STORED PROCEDURE
CREATE PROCEDURE proc_Grade()

BEGIN

    DELETE FROM Result;

    INSERT INTO Result
    SELECT RollNo, Name, fn_Grade(Marks)
    FROM Stud_Marks;

END //

DELIMITER ;

-- 5. EXECUTE PROCEDURE
CALL proc_Grade();

-- 6. DISPLAY RESULT
SELECT * FROM Result;
