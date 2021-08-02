
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
--------UC3-Inserting Data rows into table--------------
INSERT INTO [Employee_Payroll]([Name], [Salary], [Start_Date])
VALUES('Swapnil',50000.00,'09-18-2020'),
('Billy', 40000.00, '04-28-2018'),
('Terisa',60000.00,'11-10-2018'),
('Bob',55000.00,'01-01-2017');

-----------UC4-Retrive All Data From Table---------------
Select * from Employee_Payroll;