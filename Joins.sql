use bankingDB;

show tables;
select * from customers;
select * from transactions;
-- customer :- id,first name,trans_id,type,amount

use bankingDB;
select * from transactions;
select * from customers;


-- Add column CustomerID into transactions
alter table transactions add column CustomerID int;


-- custpomers == transactions
ALTER Table transactions
Add FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID);

update transactions set CustomerID=108
where TransactionID = 308;

-- Inner join (equi join)
select c.CustomerID,c.FirstName,t.TransactionID,t.TransactionType,t.Amount
from customers  c inner join transactions  t 
on c.CustomerID=t.CustomerID;


-- outer join (Left join)
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    t.TransactionID,
    t.TransactionType,
    t.Amount
FROM Customers c
Right JOIN Transactions t
ON c.CustomerID = t.CustomerID;

-- update 310 Transaction_ID with CustomerID= null so it will be displayed in right join.
update transactions set CustomerID=null where TransactionID=310;

-- Task 4: Generate Deposit Transactions Above ₹50,000
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Customers c
INNER JOIN Transactions t
ON c.CustomerID = t.CustomerID
WHERE t.TransactionType = 'Deposit'
AND t.Amount > 50000
ORDER BY t.Amount DESC;