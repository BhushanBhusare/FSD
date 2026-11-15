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

-- 2. INSERT RECORDS
INSERT INTO O_RollCall VALUES
(1, 'Rahul'),
(2, 'Amit'),
(3, 'Priya');

INSERT INTO N_RollCall VALUES
(1, 'Rahul');

-- 3. CREATE PROCEDURE WITH PARAMETERIZED CURSOR
DELIMITER //

CREATE PROCEDURE Merge_RollCall(IN p_start INT)

BEGIN
    DECLARE v_roll INT;
    DECLARE v_name VARCHAR(30);
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;

    -- PARAMETERIZED CURSOR
    DECLARE cur CURSOR FOR
        SELECT RollNo, Name
        FROM O_RollCall
        WHERE RollNo >= p_start;

    -- CURSOR EXCEPTION HANDLER
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_done = 1;

    OPEN cur;

    read_loop: LOOP

        FETCH cur INTO v_roll, v_name;

        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- CHECK DUPLICATE RECORD
        SELECT COUNT(*) INTO v_count
        FROM N_RollCall
        WHERE RollNo = v_roll;

        -- INSERT ONLY IF NOT EXISTS
        IF v_count = 0 THEN

            INSERT INTO N_RollCall
            VALUES (v_roll, v_name);

        END IF;

    END LOOP;

    CLOSE cur;

END //

DELIMITER ;

-- 4. EXECUTE PROCEDURE
CALL Merge_RollCall(1);

-- 5. DISPLAY FINAL TABLE
SELECT * FROM N_RollCall;
