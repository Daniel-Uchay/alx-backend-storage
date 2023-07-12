-- Creates a table users with `id`, `email` and `name` fields
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)) 
