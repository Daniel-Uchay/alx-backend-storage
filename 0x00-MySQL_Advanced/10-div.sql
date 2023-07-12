-- Ceates a function SafeDiv
-- Divides (and returns) the first by the second numer 
-- or returns 0 if the second is == 0

DROP FUNCTION IF EXISTS SafeDiv;
DELIMITER $$
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    IF (b = 0) THEN
        RETURN (0);
    ELSE 
        RETURN (a / b);
    END IF;
END$$
DELIMITER ;

