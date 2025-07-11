-- Initialize the database
-- This script will be executed when the database is first initialized

-- Ensure the wordpress database exists
CREATE DATABASE IF NOT EXISTS wordpress;

-- Grant privileges to the root user
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
