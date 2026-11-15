-- PRACTICAL 4: PARAMETERIZED CURSOR

-- 1. CREATE TABLES
CREATE TABLE O_RollCall (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(30)
);

CREATE TABLE N_RollCall (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(30)
);

-- 2. INSERT DATA
INSERT INTO O_RollCall VALUES
(1, 'Rahul'),
(2, 'Amit'),
(3, 'Priya');

INSERT INTO N_RollCall VALUES
(1, 'Rahul');

-- 3. CREATE PROCEDURE
DELIMITER //

CREATE PROCEDURE MergeData(IN p_roll INT)
BEGIN
    DECLARE r INT;
    DECLARE n VARCHAR(30);
    DECLARE done INT DEFAULT 0;

    DECLARE c CURSOR FOR
        SELECT RollNo, Name FROM O_RollCall
        WHERE RollNo >= p_roll;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN c;

    read_loop: LOOP
        FETCH c INTO r, n;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF NOT EXISTS (SELECT 1 FROM N_RollCall WHERE RollNo = r) THEN
            INSERT INTO N_RollCall VALUES (r, n);
        END IF;
    END LOOP;

    CLOSE c;
END //

DELIMITER ;

CALL MergeData(1);

-- 5. DISPLAY FINAL DATA
SELECT * FROM N_RollCall;
