
----------UC1-create a database-------------
create database payroll_service;

------UC2-CREATE a table Employee_Payroll with id,name,salary and start date columns----------
CREATE TABLE Employee_Payroll
(
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name VARCHAR(30) NOT NULL,
    Salary money NOT NULL,
    Start_Date DATE NOT NULL
);