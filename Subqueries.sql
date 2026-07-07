use bankingDB;
select * from accounts;
select * from transactions;
-- Task 1
select * from transactions 
where amount > (select avg(amount) from transactions);

-- Task 2
select AccountId,AccountType,Balance from accounts where Balance>(select avg(Balance) from accounts);

-- Task 3
select AccountID,CustomerID,AccountType from accounts 
where AccountID in (select AccountID from transactions where TransactionType='Deposit');

-- Task 4
select * from accounts where Balance=(select max(Balance)from accounts);

use bankingDB;
show tables;

drop table swiggy_orders;