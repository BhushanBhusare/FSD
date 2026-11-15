-- PRACTICAL 3: CONTROL STRUCTURE AND EXCEPTION

-- 1. CREATE TABLES
CREATE TABLE Borrower (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(30),
    IssueDate DATE,
    BookName VARCHAR(30),
    Status VARCHAR(20)
);

CREATE TABLE Fine (
    RollNo INT,
    FineDate DATE,
    Amt INT
);

-- 2. CREATE PROCEDURE
DELIMITER //

CREATE PROCEDURE Borrower_Fine()

BEGIN
    DECLARE v_roll INT DEFAULT 101;
    DECLARE v_name VARCHAR(30) DEFAULT 'Rahul';
    DECLARE v_book VARCHAR(30) DEFAULT 'DBMS';
    DECLARE v_status VARCHAR(20) DEFAULT 'Issued';
    DECLARE v_fine INT DEFAULT 50;

    -- EXCEPTION HANDLING
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error Occurred' AS Message;
    END;

    START TRANSACTION;

    -- INSERT BORROWER
    INSERT INTO Borrower
    VALUES (v_roll, v_name, CURDATE(), v_book, v_status);

    -- CONTROL STRUCTURE
    IF v_status = 'Issued' THEN

        SELECT 'Book Issued' AS Message;

    ELSE

        SELECT 'Book Returned' AS Message;

    END IF;

    -- INSERT FINE
    IF v_fine > 0 THEN

        INSERT INTO Fine
        VALUES (v_roll, CURDATE(), v_fine);

        SELECT 'Fine Added' AS Message;

    END IF;

    COMMIT;

END //

DELIMITER ;

-- 3. EXECUTE PROCEDURE
CALL Borrower_Fine();

-- 4. DISPLAY RECORDS
SELECT * FROM Borrower;
SELECT * FROM Fine;
