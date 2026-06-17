use bankingDB;

show tables;
select * from accounts;

-- Sum of balance
select sum(Balance) as Total_Balance from accounts;

-- Minimun Balance
select min(Balance) as Min_Balance from accounts;

-- Maximum Balance
select max(Balance) as Max_Balance from accounts;

-- Average Balance
select avg(Balance) as Avg_Balance from accounts;

-- count
select * from accounts;
select count(*) as Total_accounts from accounts; 

-- Group BY 

show tables;
select * from transactions;

select * from accounts;
select AccountType,sum(Balance) as Total_balance from accounts
group by AccountType;

select AccountType,sum(Balance) as Total_balance from accounts
group by AccountType having AccountType in ('Savings','Current') ;

select AccountType,sum(Balance) as Total_balance from accounts
group by AccountType having AccountType = "Savings" or AccountType = "Current";

select AccountType,sum(Balance) as Total_balance from accounts
group by AccountType limit 2 ;



select * from transactions;

-- Group by + having
SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;
