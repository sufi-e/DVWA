-- Create the 'dvwa' database (if not already created)
CREATE DATABASE dvwa;

-- Connect to the dvwa database
\c dvwa;

-- Create a new PostgreSQL user 'dvwa' with password '1234'
CREATE USER dvwa WITH PASSWORD '1234';

-- Grant all privileges on the dvwa database to the dvwa user
GRANT ALL PRIVILEGES ON DATABASE dvwa TO dvwa;

-- Create the 'users' table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,           -- Automatically increments
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    "user" VARCHAR(15),                   -- Use double quotes for 'user' (reserved word)
    password VARCHAR(32),
    avatar VARCHAR(70),
    last_login TIMESTAMP,
    failed_login INT
);

-- Insert data into the 'users' table
INSERT INTO users (first_name, last_name, "user", password, avatar, last_login, failed_login)
VALUES
    ('admin', 'admin', 'admin', MD5('password'), 'admin.jpg', CURRENT_TIMESTAMP, 0),
    ('Gordon', 'Brown', 'gordonb', MD5('abc123'), 'gordonb.jpg', CURRENT_TIMESTAMP, 0),
    ('Hack', 'Me', '1337', MD5('charley'), '1337.jpg', CURRENT_TIMESTAMP, 0),
    ('Pablo', 'Picasso', 'pablo', MD5('letmein'), 'pablo.jpg', CURRENT_TIMESTAMP, 0),
    ('Bob', 'Smith', 'smithy', MD5('password'), 'smithy.jpg', CURRENT_TIMESTAMP, 0);

-- (Optional) Create the 'guestbook' table (if you need this too)
CREATE TABLE guestbook (
    comment_id SERIAL PRIMARY KEY,         -- Automatically increments
    comment VARCHAR(300),
    name VARCHAR(100)
);

-- Insert data into the 'guestbook' table
INSERT INTO guestbook (comment, name) 
VALUES ('This is a test comment.', 'test');

