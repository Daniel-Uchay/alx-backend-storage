-- Create index on first letter of name and on score

CREATE INDEX idx_name_first_score ON names (name(1), score);
