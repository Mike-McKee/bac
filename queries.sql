-- Creates the database we'll use for the project

CREATE DATABASE bac_project;

-- Tells MySQL which database we're using

USE bac_project;

-- Creates our table

CREATE TABLE bac (
    weight INT,
    num_of_drinks INT,
    blood_alcohol_concentration float
);

-- SELECT query we'll use when we need to see whole table

SELECT * FROM bac;

-- Creates PROCEDURE for adding values to weight

DELIMITER //
CREATE PROCEDURE insert_weight()
BEGIN
    DECLARE i INT DEFAULT 70;	-- variable tracks weight values
    DECLARE j INT DEFAULT 1;	-- variable tracks number of repetitions per weight values
		
    WHILE i <= 400 DO
        SET j = 1;			-- resets parameter back to 1
	
        WHILE j <= 16 DO
            INSERT INTO bac (weight) VALUES (i);
            SET j = j + 1;				-- increases to the next repetition
        END WHILE;
	
    SET i = i + 1;			-- increases to the next weight value
    END WHILE;
END //

-- Run procedure insert_weight() to insert values into weight column

CALL insert_weight();

-- Creates PROCEDURE for adding values to num_of_drinks



-- Run procedure insert_drinks() to insert values into weight column