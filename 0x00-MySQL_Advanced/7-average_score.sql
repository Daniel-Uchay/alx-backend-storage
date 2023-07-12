-- Create a stored procedure that computes and store 

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE average FLOAT;
    SET average = (SELECT AVG(score) FROM corrections as A WHERE A.user_id = user_id);
    UPDATE users SET average_score = average WHERE users.id = user_id;
END$$
DELIMITER ;
