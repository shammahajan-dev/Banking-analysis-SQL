use bankingDB;
select * from transactions 
where amount > (select avg(amount) from transactions);