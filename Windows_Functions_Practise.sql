-- create database IPL
create database IPL;

-- use database
use IPL;

-- create table and records
CREATE TABLE IPL_Batting (
    match_no  INT,
    player    VARCHAR(50),
    team      VARCHAR(30),
    runs      INT
);

INSERT INTO IPL_Batting VALUES
(1, 'Rohit Sharma',  'Mumbai Indians',    45),
(2, 'Rohit Sharma',  'Mumbai Indians',    12),
(3, 'Rohit Sharma',  'Mumbai Indians',    78),
(1, 'Ishan Kishan',  'Mumbai Indians',    30),
(2, 'Ishan Kishan',  'Mumbai Indians',    55),
(3, 'Ishan Kishan',  'Mumbai Indians',    20),
(1, 'Virat Kohli',   'Royal Challengers', 62),
(2, 'Virat Kohli',   'Royal Challengers', 40),
(3, 'Virat Kohli',   'Royal Challengers', 101),
(1, 'Faf du Plessis','Royal Challengers', 25),
(2, 'Faf du Plessis','Royal Challengers', 33),
(3, 'Faf du Plessis','Royal Challengers', 18);


select * from IPL_Batting;
-- ================================= Windows vs Group By ===========================================================
-- Basic windows function syntax:-
--        function_name(column) OVER (
--           [PARTITION BY column]
--           [ORDER BY column]
--          )

-- GROUP BY: rows collapse ho jaati hain
SELECT team, SUM(runs) AS total_runs
FROM IPL_Batting
GROUP BY team;

-- WINDOW FUNCTION: har row visible rehti hai, extra column add hota hai
SELECT match_no, player, team, runs,
       SUM(runs) OVER (PARTITION BY team) AS team_total_runs
FROM IPL_Batting;

-- ========================================== Ranking Functions :- Row_Number(),Rank(),Dense_Rank() =========================================
SELECT match_no,player, team, runs,
       ROW_NUMBER() OVER (ORDER BY runs DESC) AS row_num
FROM IPL_Batting
WHERE match_no = 3;

-- All functions in one query
SELECT player, team, runs,
       RANK()       OVER (ORDER BY runs DESC) AS rank_position,
       DENSE_RANK() OVER (ORDER BY runs DESC) AS dense_rank_position,
       ROW_NUMBER() OVER (ORDER BY runs DESC) AS row_num
FROM IPL_Batting
WHERE match_no = 3;

-- =================================== Partition By =================================
SELECT player, team, runs,
       RANK() OVER (PARTITION BY team ORDER BY runs DESC) AS team_rank
FROM IPL_Batting
WHERE match_no = 3;


-- ============================= Aggregate Window Functions — Running Totals ====================================
SELECT match_no, player, team, runs,
       SUM(runs) OVER (PARTITION BY player ORDER BY match_no) AS running_total
FROM IPL_Batting;

-- AVG(), COUNT(), MIN(), MAX() sab isi tarah OVER() ke saath use ho sakte hain:
SELECT player, match_no, runs,
       AVG(runs) OVER (PARTITION BY player) AS avg_runs_overall,
       MAX(runs) OVER (PARTITION BY player) AS best_score
FROM IPL_Batting where match_no=2;

-- ================================== Lag() and Lead() ===================================
-- LAG() — pichli row ka value laata hai.
-- LEAD() — aage wali row ka value laata hai.
SELECT player, match_no, runs,
       LAG(runs, 1)  OVER (PARTITION BY player ORDER BY match_no) AS previous_match_runs,
       LEAD(runs, 1) OVER (PARTITION BY player ORDER BY match_no) AS next_match_runs
FROM IPL_Batting
ORDER BY player, match_no;



