create database dummy_db; -- creating dummy database

show databases;  -- showing databases in server

use dummy_db;

CREATE TABLE employees (
  emp_id      INT           PRIMARY KEY,
  first_name  VARCHAR(50)   NOT NULL,
  last_name   VARCHAR(50)   NOT NULL,
  age         INT           CHECK (age >= 18),
  salary      DECIMAL(10,2) NOT NULL,
  city        VARCHAR(50)   DEFAULT 'Mumbai'
);

describe employees;  -- to describe the table structure

-- Renaming the table
Alter table employees rename to staff;
Alter table staff rename to employees;

-- Add column
Alter table employees add column phone int;
Alter table employees add column email varchar(40);

-- Change column phone to contact
Alter table employees 
change phone contact int not null;

-- modify column email to add constraints
Alter table employees
modify email varchar(60) unique;

-- Drop column contact
Alter table employees drop column email;

-- Shifting Db to banking_db
use  bankingDB;

ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);


