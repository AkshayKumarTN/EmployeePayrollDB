---------------UC11-Creating Tables According To ER-Diagram--------------------
create table EmployeeDepartment
(
id int not null,
department varchar(20) not null
);
--insert enteries into the department table
insert into EmployeeDepartment values
(1, 'Sales'),
(2, 'Sales'),
(3, 'Sales'),
(2,'Marketing');

--creating employee table
create table Employee
(
Id int not null,
Name varchar(25) not null,
Gender char(1) not null,
PhoneNumber varchar(13) not null,
Address varchar(250) not null default 'India',
);
-- insert data into employee table
insert into Employee values
(1,'Swapnil', 'M', '9876543219', 'New York'),
(2,'Billy', 'M', '9876543201', 'Indian'),
(3,'Terisa', 'F', '9823456789', 'Atlanta'),
(4,'Bob', 'M', '9987654321', 'Boston');

create table Payroll
(
Id int not null,
Start date not null,
Salary money not null,
Deduction money,
TaxablePay money,
IncomeTax money,
NetPay money not null 
);
--insert data in payroll
insert into Payroll values
(1, '2018-01-03', 100000, 10000, 90000, 1000, 89000),
(2, '2019-11-13', 200000, 10000, 190000,3000,187000),
(3, '2020-05-21', 300000, 20000, 280000, 5000, 275000),
(4, '2021-01-03', 150000, 15000, 230000, 3000, 239000);

---------------UC12- Aggregate Functions After Table Splitting----------------------------

--Aggregate operationsby gender

--Total of basic pay by gender
select emp.gender, Sum(payroll.Basic_pay) AS Total_Pay
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
group by gender;

--Average of basic pay by gender
select emp.gender, AVG(payroll.Basic_pay) AS Average_Pay 
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
group by gender;

--Count number of employees by gender
select gender, Count(Name) as Total_Count
from employee 
group by gender;

--Minimum salary grouped by gender
select gender,MIN(payroll.Basic_pay) as Min_Pay
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
group by gender;

--Maximum salary grouped by gender
select gender,MAX(payroll.Basic_pay) as Max_Pay
from Payroll payroll inner join employee emp
on payroll.Id = emp.Id
group by gender;

---------------------------------------------------------------

ALTER TABLE Employee Add PRIMARY KEY (Id);

ALTER TABLE Employee_Payroll ADD FOREIGN KEY (Id) REFERENCES Employee(Id);

ALTER TABLE EmployeeDepartment ADD FOREIGN KEY (Id) REFERENCES Employee(Id);

ALTER TABLE Payroll ADD FOREIGN KEY (Id) REFERENCES Employee(Id);

--------------------------------------------------------------------------------------
SELECT Employee.Id,Employee.Name,Employee.Gender,Employee.PhoneNumber,Employee.Address,
Employee_Payroll.Department,Employee_Payroll.Deduction,Employee_Payroll.Salary, Employee_Payroll.IncomeTax,
Employee_Payroll.TaxablePay,Employee_Payroll.NetPay FROM Employee_Payroll JOIN Employee ON Employee_Payroll.Id=Employee.Id;