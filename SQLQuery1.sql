
----------UC1-create a database-------------
create database payroll_service;

------UC2-CREATE a table Employee_Payroll with id,name,salary and start date columns----------
CREATE TABLE Employee_Payroll
(
    Id INT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Salary money NOT NULL,
    StartDate DATE NOT NULL
);
--------UC3-Inserting Data rows into table--------------
INSERT INTO [Employee_Payroll]([Id],[Name], [Salary], [StartDate])
VALUES(1,'Swapnil',100000,'2018-01-03'),
(2,'Billy', 200000, '2019-11-13'),
(3,'Terisa',300000,'2020-05-21'),
(4,'Bob',150000,'2021-01-03');

-----------UC4-Retrive All Data From Table---------------
Select * from Employee_Payroll;

------------UC5-Select Based On Conditions------------

--Retrieve Salary of a particular employee-------
SELECT salary FROM [Employee_Payroll] WHERE Name = 'Swapnil';

--View Employees Who Joined Between the given Date Range-----
SELECT * FROM Employee_Payroll WHERE StartDate BETWEEN CAST('01-01-2018' as date) and GETDATE();

-----------UC6-Add Gender Column In Table------

--ADD a gender field in the table-----
ALTER TABLE Employee_Payroll ADD Gender CHAR(1);

--Assign Gender to all entries-----
UPDATE Employee_Payroll SET Gender = 'M' WHERE Name <> 'Terisa';

UPDATE Employee_Payroll SET Gender = 'F' WHERE Name = 'Terisa';

-------------UC7-Using Aggregate Functions---------------

--Sum of salary when grouping by gender
SELECT GENDER,SUM(SALARY) AS TOTAL_SALARY FROM Employee_Payroll GROUP BY GENDER;

--Average Salary when grouped by gender
SELECT GENDER,AVG(SALARY) AS AVERAGE_SALARY FROM Employee_Payroll GROUP BY GENDER;

--Maximum salary in each gender
SELECT GENDER,MAX(SALARY) AS MAXIMUM_SALARY FROM Employee_Payroll GROUP BY GENDER;

--Mininum salary in each gender
SELECT GENDER,MIN(SALARY) AS MINIMUM_SALARY FROM Employee_Payroll GROUP BY GENDER;

--Number of male and female employees
SELECT GENDER,COUNT(GENDER) AS TOTAL_COUNT FROM Employee_Payroll GROUP BY GENDER;

------------UC8-Add Columns----------------
alter table employee_payroll add
PhoneNumber varchar(15),
Address varchar(40) DEFAULT 'Indian',
Department varchar(10);

UPDATE Employee_Payroll SET PhoneNumber = 9876543219,Address = 'New York',Department = 'Sales' WHERE Id = '1';
UPDATE Employee_Payroll SET PhoneNumber = 9876543201,Address ='Indian',Department ='Sales' WHERE Id = '2';
UPDATE Employee_Payroll SET PhoneNumber = 9823456789,Address = 'Atlanta',Department = 'Sales' WHERE Id = '3';
UPDATE Employee_Payroll SET PhoneNumber = 9987654321,Address = 'Boston', Department = 'Marketing' WHERE Id = '4';


--------------UC9-Adding Tax Columns---------------
alter table employee_payroll add 
Deduction money,
TaxablePay money,
IncomeTax money,
NetPay money not null default 0;


UPDATE Employee_Payroll SET Deduction = 10000,TaxablePay = 90000,IncomeTax = 1000,NetPay = 89000 WHERE Id = '1';
UPDATE Employee_Payroll SET Deduction = 10000,TaxablePay = 190000,IncomeTax =3000,NetPay =187000 WHERE Id = '2';
UPDATE Employee_Payroll SET Deduction = 20000,TaxablePay = 280000,IncomeTax = 5000,NetPay = 275000 WHERE Id = '3';
UPDATE Employee_Payroll SET Deduction = 15000,TaxablePay = 230000, IncomeTax =3000,NetPay = 239000 WHERE Id = '4';

---------------UC10-Adding Terisa To Sales And Marketing-----------------

-- Adding Terisa to both sales and marketing department
update Employee_Payroll set Department = 'Sales' where Name = 'Terisa';

insert into Employee_Payroll
(Name,Salary,StartDate,Gender,Department)
VALUES(3,'Terisa',60000.00,'2018-01-03','F','Marketing');
select * from Employee_Payroll;
select * from EmployeeDepartment;