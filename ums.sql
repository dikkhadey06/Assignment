

CREATE DATABASE ums;


CREATE TABLE department (
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(100) NOT NULL,
head_of_department VARCHAR(100) NOT NULL
);

CREATE TABLE course (
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(100) NOT NULL,
credits DECIMAL(4,2),
department_id INT,
course_description VARCHAR(300) NOT NULL,

FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE faculty (
faculty_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
department_id INT,
joining_date DATE,

FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE classs (
class_id INT PRIMARY KEY AUTO_INCREMENT,
faculty_id INT,
course_id INT,
semester VARCHAR(20) NOT NULL,
yearr VARCHAR(20) NOT NULL,

FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE student (
student_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE,
gender ENUM('male', 'female', 'others'),
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
department_id INT,
enrollment_date DATE,

FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE enrollment (
enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
class_id INT,
grade DECIMAL(4,2),
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (class_id) REFERENCES classs(class_id)
);