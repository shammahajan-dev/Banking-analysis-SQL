show databases;
use dummy_db;

show tables;
describe employees;

insert into employees(emp_id,first_name,last_name,age,salary,city,contact)
values (1,'Rahul','Sharma',22,45000,'Mumbai',9849549559);

insert into employees(emp_id,first_name,last_name,age,salary,city,contact)
values (3,'Ashok','Chavan',42,46000,'Nagpur','9867899548'),
(4,'Virat','Kohli',36,120000,'Banglore','89489498494');

Alter table employees modify column contact varchar(20);

select * from employees;

SET SQL_SAFE_UPDATES = 0;   -- turn off safe mode

update employees 
set city = "Bangluru"
where first_name="Virat" ; -- Updating the rows

delete from employees where emp_id = 4;

use bankingDB;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(101, 'Rahul', 'Sharma', 'rahul@gmail.com', '9988776655', '2025-05-03', '2000-09-20');

select * from customers;
select * from Accounts;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000);




