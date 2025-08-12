-- Create the database
CREATE DATABASE dvwa;

-- Use the database
USE dvwa;

-- Create the 'users' table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    `user` VARCHAR(15), -- Backticks around 'user' to avoid keyword conflict
    password VARCHAR(32),
    avatar VARCHAR(70),
    last_login DATETIME,
    failed_login INT
);

-- Insert data into 'users' table with MD5 hashing and UTC_TIMESTAMP()
INSERT INTO users (user_id, first_name, last_name, `user`, password, avatar, last_login, failed_login)
VALUES
    (1, 'admin', 'admin', 'admin', MD5('password'), 'admin.jpg', UTC_TIMESTAMP(), 0),
    (2, 'Gordon', 'Brown', 'gordonb', MD5('abc123'), 'gordonb.jpg', UTC_TIMESTAMP(), 0),
    (3, 'Hack', 'Me', '1337', MD5('charley'), '1337.jpg', UTC_TIMESTAMP(), 0),
    (4, 'Pablo', 'Picasso', 'pablo', MD5('letmein'), 'pablo.jpg', UTC_TIMESTAMP(), 0),
    (5, 'Bob', 'Smith', 'smithy', MD5('password'), 'smithy.jpg', UTC_TIMESTAMP(), 0);

-- Create the 'guestbook' table
CREATE TABLE guestbook (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(300),
    name VARCHAR(100)
);

-- Insert data into 'guestbook' table
INSERT INTO guestbook (comment, name) VALUES ('This is a test comment.', 'test');

-- Create a new user 'dvwa' with password '1234'
CREATE USER 'dvwa'@'localhost' IDENTIFIED BY '1234';

-- Grant necessary privileges to 'dvwa' on the 'dvwa' database
GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'localhost';

-- Apply the changes (flush privileges)
FLUSH PRIVILEGES;

