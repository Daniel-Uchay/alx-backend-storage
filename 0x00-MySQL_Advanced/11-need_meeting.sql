-- Create a view need_meeting that lists all student with score < 80
-- AND no last_meeting OR more than 1 month

CREATE OR REPLACE VIEW need_meeting AS
SELECT name from students 
WHERE score < 80 AND 
      (last_meeting IS NULL
      OR
      last_meeting < ADDDATE(CURDATE(), interval - 1 MONTH));
