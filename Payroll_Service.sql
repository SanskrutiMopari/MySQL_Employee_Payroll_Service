-- UC1
create database payroll_service;
show databases;
Use payroll_service;

-- UC2
create table employee_payroll
(
Id int not null auto_increment,
Name varchar(20) not null,
Salary int NOT NULL,
Start date not null,
primary key(Id)
);
desc employee_payroll;

-- UC3
insert into employee_payroll (Name, Salary, Start) values
('Bharat', 80000, '2022-09-29'),
('Yash', 80000, '2022-09-28'),
('Mohit', 90000, '2022-07-05');

-- UC4
select * from employee_payroll;

-- UC5
select Salary from employee_payroll where Name='Mohit';
select Salary from employee_payroll where Start between CAST('2022-07-05' AS DATE) AND DATE(NOW());

-- UC6
insert into employee_payroll (Name, Salary, Start) values
('Aachal', 80000, '2022-05-10'),
('Sonal', 80000, '2022-07-24');
select * from employee_payroll;
alter table employee_payroll add Gender char(1);
update employee_payroll set Gender='F' where Name = 'Sonal' or Name='Aachal';
update employee_payroll set Gender='M' where Name = 'Bharat' or Name='Yash' or Name='Mohit';
select * from employee_payroll;

-- UC7
select SUM(Salary) as TotalSalary from employee_payroll where Gender='F' group by Gender;
select AVG(Salary) from employee_payroll where Gender='F' group by Gender;
select MAX(Salary) from employee_payroll where Gender='F' group by Gender;
select MIN(Salary) from employee_payroll where Gender='F' group by Gender;
select COUNT(Id) from employee_payroll where Gender='F' group by Gender;

select SUM(Salary) as TotalSalary from employee_payroll where Gender='M' group by Gender;
select AVG(Salary) from employee_payroll where Gender='M' group by Gender;
select MAX(Salary) from employee_payroll where Gender='M' group by Gender;
select MIN(Salary) from employee_payroll where Gender='M' group by Gender;
select COUNT(Id) from employee_payroll where Gender='M' group by Gender;

-- UC8
alter table employee_payroll add PhoneNumber varchar(10);
alter table employee_payroll add Address varchar(20) NOT NULL default 'Tumsar';
alter table employee_payroll add Department varchar(20) NOT NULL default '';

update employee_payroll set PhoneNumber='7559205894' where Name = 'Bharat';
update employee_payroll set PhoneNumber='9158924884' where Name = 'Yash';
update employee_payroll set PhoneNumber='9975481258' where Name='Mohit';
update employee_payroll set PhoneNumber='7775892458' where Name='Sonal';
update employee_payroll set PhoneNumber='7484464458' where Name='Aachal';

update employee_payroll set Department='HR' where Name = 'Bharat' or Name='Yash';
update employee_payroll set Department='Designing' where Name = 'Aachal' or Name = 'Sonal';
update employee_payroll set Department='Marketing' where Name = 'Mohit';
select * from employee_payroll;

-- UC9
alter table employee_payroll add BasicPay decimal(10, 2) NOT NULL default 0;
alter table employee_payroll add Deductions decimal(10, 2) NOT NULL default 0;
alter table employee_payroll add TaxablePay decimal(10, 2) NOT NULL default 0;
alter table employee_payroll add IncomeTax decimal(10, 2) NOT NULL default 0;
alter table employee_payroll add NetPay decimal(10, 2) NOT NULL default 0;
select * from employee_payroll;