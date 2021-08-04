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
create table employee
(
Id int identity(1,1) not null,
Name varchar(25) not null,
Gender char(1) not null,
Phone_Number varchar(13) not null,
Address varchar(250) not null default 'India',
);
-- insert data into employee table
insert into employee values
('Bill', 'M', '9424787443', 'New York'),
('Terissa', 'F', '8109322276', 'Atlanta'),
('Charlie', 'M', '9926707344', 'Boston');

create table Payroll
(
Id int not null,
Start date not null,
Basic_pay money not null,
Deduction money,
Taxable_pay money,
Income_tax money,
Net_pay money not null
);
--insert data in payroll
insert into Payroll values
(1, '2018-01-03', 100000, 10000, 90000, 1000, 89000),
(2, '2019-11-13', 200000, 10000, 190000,3000,187000),
(3, '2020-05-21', 300000, 20000, 280000, 5000, 275000);