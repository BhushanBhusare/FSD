-- PRACTICAL 6: DATABASE TRIGGERS

-- 1. CREATE TABLES
CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(30),
    Status VARCHAR(20)
);

CREATE TABLE Library_Audit (
    AuditID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    OldName VARCHAR(30),
    OldStatus VARCHAR(20),
    Action VARCHAR(30),
    AuditDate DATETIME
);

-- 2. INSERT RECORDS
INSERT INTO Library VALUES
(1, 'DBMS', 'Available'),
(2, 'Python', 'Issued'),
(3, 'Java', 'Available');

-- 3. BEFORE UPDATE TRIGGER (ROW LEVEL)
DELIMITER //

CREATE TRIGGER after_update AFTER UPDATE ON library for each row
BEGIN 
	INSERT INTO library_Audit values(NEW.book_id,NEW.book_name,NOW(),'UPDATE');
END //

CREATE TRIGGER before_update BEFORE UPDATE ON library for each row
BEGIN 
	INSERT INTO library_Audit values(OLD.book_id,OLD.book_name,NOW(),'UPDATE');
END //

CREATE TRIGGER before_insert BEFORE INSERT ON library for each row
BEGIN 
	INSERT INTO library_Audit values(NEW.book_id,NEW.book_name,NOW(),'BEfore Insert');
END //

CREATE TRIGGER after_insert After INSERT ON library for each row
BEGIN 
	INSERT INTO library_Audit values(NEW.book_id,NEW.book_name,NOW(),'After Insert');
END //
DELIMITER ;

-- 9. TEST UPDATE
CALL sp_update_library(1, 'Issued');

-- 10. TEST DELETE
CALL sp_delete_library(2);

-- 11. DISPLAY LIBRARY
SELECT * FROM Library;

-- 12. DISPLAY AUDIT TABLE
SELECT * FROM Library_Audit;
