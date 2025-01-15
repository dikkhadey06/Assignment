


CREATE DATABASE hrm;



CREATE TABLE project(
id INT PRIMARY KEY AUTO_INCREMENT,
CREATE TABLE project(
id INT PRIMARY KEY AUTO_INCREMENT,, 
description VARCHAR(300) NOT NULL
);


CREATE TABLE manager (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL
);                       



CREATE TABLE department (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
contact_number VARCHAR(20) NOT NULL,
location VARCHAR(100) NOT NULL,
manager_id INT,

FOREIGN KEY (manager_id) REFERENCES manager(id)
);



CREATE TABLE employee (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
emaill VARCHAR(100) NOT NULL,
dob DATE,
gender ENUM('male', 'female', 'others'),
designation ENUM('manager', 'senior developer', 'junior developer'),
salary DECIMAL(10,2),
joining_date DATE,
dept_id INT,

FOREIGN KEY (dept_id) REFERENCES department(id)
);



CREATE TABLE address (
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id INT,
post_code VARCHAR(10) NOT NULL,
upazilla VARCHAR(30) NOT NULL,
district VARCHAR(30) NOT NULL,
division VARCHAR(30) NOT NULL,

FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE work_on (
id INT PRIMARY KEY AUTO_INCREMENT,
project_id INT,
employee_id INT,
hours INT,

FOREIGN KEY (project_id) REFERENCES project(id),
FOREIGN KEY (employee_id) REFERENCES employee(id)
);