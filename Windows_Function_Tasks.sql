-- Task 1 :-

use bankingDB;
select * from loans;

-- Inserting records into loans

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

-- Task 2,3,4 :- Loan according to amount 
select LoanID,LoanAmount,InterestRate,rank() over 
    (order by LoanAmount) as rank_loan
from loans ;   

select LoanID,LoanAmount,InterestRate,dense_rank() over 
    (order by LoanAmount) as dense_rank_loan
from loans ;

select LoanID,LoanAmount,InterestRate,row_number() over 
    (order by LoanAmount) as ranking
from loans;

-- Partition by 
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerID
        ORDER BY LoanAmount DESC
    ) AS RowNum
FROM Loans;

update loans set CustomerID=101 where LoanID=304;

select * from loans;


-- Sum() using windows fuction
SELECT
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS RunningTotal
FROM Loans;


-- Lag() and Lead()
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;


SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;


