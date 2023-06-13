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

SELECT * FROM bac
ORDER BY weight, num_of_drinks;

-- Creates PROCEDURE for adding values to weight and num_of_drinks columns

DELIMITER //
CREATE PROCEDURE insert_values()
BEGIN
    DECLARE n INT DEFAULT 0;
    DECLARE m INT DEFAULT 70;

    WHILE n <= 15 DO
        SET m = 70;

        WHILE m <= 400 DO
			INSERT INTO bac (weight, num_of_drinks) VALUES (m,n);
            SET m = m + 1;
        END WHILE;

	SET n = n + 1;
    END WHILE;
END //

-- Run procedure insert_values() to insert values into weight column

CALL insert_values();