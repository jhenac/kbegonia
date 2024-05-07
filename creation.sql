-- Create database
CREATE DATABASE kbegonia

-- Create student table
CREATE TABLE students (
  student_id int NOT NULL AUTO_INCREMENT,
  first_name varchar(40) DEFAULT NULL,
  last_name varchar(40) DEFAULT NULL,
  sex varchar(1) DEFAULT NULL,
  schedule varchar(40) DEFAULT NULL,
  middle_name varchar(40) DEFAULT NULL,
  PRIMARY KEY (student_id)
  );

-- Create parents table
CREATE TABLE parents (
  parent_id int NOT NULL AUTO_INCREMENT,
  last_name varchar(40) DEFAULT NULL,
  first_name varchar(40) DEFAULT NULL,
  middle_name varchar(40) DEFAULT NULL,
  contact_no1 varchar(40) DEFAULT NULL,
  contact_no2 varchar(40) DEFAULT NULL,
  student_id int DEFAULT NULL,
  PRIMARY KEY (parent_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);

-- Create payments table

CREATE TABLE payments (
  date_recorded`date DEFAULT NULL,
  `mount float DEFAULT NULL,
  particulars varchar(40) DEFAULT NULL,
  student_id int DEFAULT NULL,
  paid_to varchar(40) DEFAULT NULL,
  paid_thru varchar(40) DEFAULT NULL,
  pyt_id int NOT NULL AUTO_INCREMENT,
  date_remitted date DEFAULT NULL,
  remitted_to varchar(40) DEFAULT NULL,
  PRIMARY KEY (pyt_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
