CREATE DATABASE IF NOT EXISTS feedback;
USE feedback;

CREATE TABLE IF NOT EXISTS feedback (
  sname VARCHAR(255),
  department VARCHAR(255),
  faculty VARCHAR(255),
  q1 VARCHAR(10),
  q2 VARCHAR(10),
  q3 VARCHAR(10),
  q4 VARCHAR(10),
  comments TEXT
);

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
