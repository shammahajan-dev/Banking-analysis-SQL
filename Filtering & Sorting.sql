-- Lab 5
use bankingDB;
select * from accounts;

select * from accounts
where AccountType = "Savings"
order by Balance Desc
Limit 3;

-- Customers whose name starts with A
select * from customers where firstName like 'A%';

select * from customers;


SELECT *
FROM Transactions
ORDER BY TransactionDate DESC
limit 3;


select FirstName as name from customers;

select c.FirstName,c.LastName from customers as c;

-- String Functions
-- 1. concatenation
select FirstName,LastName,concat(FirstName," ",LastName) as FullName
from customers;

describe customers;

-- 2.Upper & Lower
select upper(FirstName) as FirstName from customers;
select lower(LastName) as LastName from customers;

-- 3.Sunstrings
select FirstName, substring(FirstName,2,3) from customers;

-- 4.replace
SELECT REPLACE('hello world', 'world', 'SQL') AS replaced_string;


