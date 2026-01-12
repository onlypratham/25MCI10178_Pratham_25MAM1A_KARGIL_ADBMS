-- Create Department table
CREATE TABLE Department (
    Dept_id INT PRIMARY KEY,
    Dept_name VARCHAR(30) NOT NULL UNIQUE
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(30) NOT NULL,
    Emp_email VARCHAR(40) UNIQUE NOT NULL,
    Emp_phone VARCHAR(15) UNIQUE NOT NULL,
    Dept_id INT,
    FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

-- Create Project table
CREATE TABLE Project (
    Proj_id INT PRIMARY KEY,
    Proj_name VARCHAR(40) NOT NULL,
    Proj_startDate DATE NOT NULL,
    Proj_endDate DATE NOT NULL,
    Proj_Assign_Emp INT,
    FOREIGN KEY (Proj_Assign_Emp) REFERENCES Employee(Emp_id)
);

--------------------------------------------------

-- Insert into Department
INSERT INTO Department VALUES
(101, 'Research'),
(102, 'Operations'),
(103, 'Design'),
(104, 'Customer Support');

-- Insert into Employee
INSERT INTO Employee VALUES
(301, 'Arjun Mehra', 'arjun.m@gmail.com', '8111111111', 101),
(302, 'Pooja Nair', 'pooja.n@gmail.com', '8222222222', 102),
(303, 'Nitin Khanna', 'nitin.k@gmail.com', '8333333333', 101),
(304, 'Ritika Das', 'ritika.d@gmail.com', '8444444444', 103),
(305, 'Saurabh Tiwari', 'saurabh.t@gmail.com', '8555555555', 104);

-- Insert into Project
INSERT INTO Project VALUES
(21, 'Data Analysis Tool', '2026-01-05', '2026-06-05', 301),
(22, 'Process Automation', '2026-02-10', '2026-07-15', 302),
(23, 'UX Redesign', '2026-03-01', '2026-05-30', 304),
(24, 'Helpdesk System', '2026-01-20', '2026-04-25', 305);

--------------------------------------------------

-- Update Employee Department
UPDATE Employee
SET Dept_id = 102
WHERE Emp_id = 303;

--------------------------------------------------

-- Delete project before deleting employee
DELETE FROM Project
WHERE Proj_Assign_Emp = 305;

DELETE FROM Employee
WHERE Emp_id = 305;

--------------------------------------------------

-- View table data
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;

--------------------------------------------------

-- Create user role
CREATE ROLE TeamLead LOGIN PASSWORD 'teamlead@123';

GRANT SELECT ON Department, Employee, Project TO TeamLead;
GRANT CREATE ON SCHEMA public TO TeamLead;

REVOKE SELECT ON Project FROM TeamLead;
REVOKE CREATE ON SCHEMA public FROM TeamLead;

--------------------------------------------------

-- Alter Employee table
ALTER TABLE Employee ADD Address VARCHAR(50);

--------------------------------------------------

-- Drop table (optional)
DROP TABLE Project;
