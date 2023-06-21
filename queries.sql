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

-- Testing formula that converts weight and num_of_drinks into blood_alcohol_concentration

SELECT weight, num_of_drinks, 
( (600*num_of_drinks) / ( weight * ( (0.6 * num_of_drinks) + 169) ) ) AS your_bac,
CASE
    WHEN ( (600*num_of_drinks) / ( weight * ( (0.6 * num_of_drinks) + 169) ) ) > 0.08 THEN 'illegal'
    WHEN ( (600*num_of_drinks) / ( weight * ( (0.6 * num_of_drinks) + 169) ) ) < 0.08 THEN 'legal'
    ELSE 'illegal'
END AS legal_or_not
FROM bac
GROUP BY 1,2
ORDER BY 1,2;

-- Add values into blood_alcohol_concentration using formula above

UPDATE bac
SET blood_alcohol_concentration = ( (600*num_of_drinks) / ( weight * ( (0.6 * num_of_drinks) + 169) ) );

-- Create column that determines if someone can legally drive or not (based on US law of 0.08)

ALTER TABLE bac
ADD can_you_drive VARCHAR(10);

UPDATE bac
SET can_you_drive =
    CASE
        WHEN blood_alcohol_concentration > 0.08 THEN 'NO'
        ELSE 'YES'
    END;
