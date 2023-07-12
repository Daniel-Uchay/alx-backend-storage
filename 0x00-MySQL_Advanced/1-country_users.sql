-- Creates a table users with `id`, `email`, `name`, `country` fileds
-- `country` can only be one of US,CO, TN

CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country ENUM('US', 'CO', 'TN') DEFAULT 'US')
