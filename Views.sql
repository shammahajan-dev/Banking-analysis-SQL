-- create swiggy db
create database swiggy_db;
use swiggy_db;
show tables;

-- create table Swiggy_Orders
CREATE TABLE Swiggy_Orders (
    order_id      INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city          VARCHAR(30),
    restaurant    VARCHAR(50),
    item_ordered  VARCHAR(50),
    price         DECIMAL(8,2),
    delivery_status VARCHAR(20)
);

INSERT INTO Swiggy_Orders VALUES
(1, 'Rohan Mehta',  'Mumbai',    'Bikanervala',     'Chole Bhature',  180.00, 'Delivered'),
(2, 'Priya Nair',   'Bangalore', 'Truffles',        'Cheese Burger',  220.00, 'Delivered'),
(3, 'Aman Gupta',   'Delhi',     'Haldiram',        'Raj Kachori',    150.00, 'Cancelled'),
(4, 'Sneha Reddy',  'Hyderabad', 'Paradise Biryani', 'Chicken Biryani', 320.00, 'Delivered'),
(5, 'Karan Malhotra','Mumbai',   'Domino''s',       'Farmhouse Pizza', 399.00, 'Pending');

select * from swiggy_orders;


-- create view
CREATE VIEW Delivered_Orders AS
SELECT order_id, customer_name, city, restaurant, item_ordered, price
FROM Swiggy_Orders
WHERE delivery_status = 'Delivered';

-- Ab isko normal table jaise query karo:
SELECT * FROM Delivered_Orders;

-- =============================================  create or replace view =========================================
CREATE OR REPLACE VIEW Delivered_Orders AS
SELECT order_id, customer_name, city, restaurant, item_ordered, price, delivery_status
FROM Swiggy_Orders
WHERE delivery_status IN ('Delivered', 'Pending');

SELECT * FROM Delivered_Orders;


-- ============================================= Update Views ======================================
-- Delivered_Orders view ke through price update karte hain
UPDATE Delivered_Orders
SET price = 200.00
WHERE order_id = 1;

-- Ab check karo VIEW mein:
SELECT * FROM Delivered_Orders WHERE order_id = 2;
select * from swiggy_orders;

update swiggy_orders set price=250 where order_id=2;


-- Aur ab check karo ASLI BASE TABLE mein:
SELECT * FROM Swiggy_Orders WHERE order_id = 1;
-- Result: Yahan bhi price 200.00 hi dikhega!


-- =================================== No updated views ============================
CREATE VIEW City_Revenue AS
SELECT city, SUM(price) AS total_revenue, COUNT(*) AS total_orders
FROM Swiggy_Orders
GROUP BY city;

-- Yeh chalega (SELECT ke liye view sahi hai):
SELECT * FROM City_Revenue;

-- Yeh FAIL hoga (aggregate view update nahi ho sakti):
UPDATE City_Revenue SET total_revenue = 5000 WHERE city = 'Mumbai';
-- ERROR: view is not updatable

-- ======================================== Drop View ==============================================
-- syntax
DROP VIEW view_name; 

-- Example:
DROP VIEW Delivered_Orders;

-- Safe version (error nahi aayega agar view exist nahi karta):
DROP VIEW IF EXISTS Delivered_Orders;


-- ======================================= Tasks =======================================================
-- Swiggy_Orders table use karke students yeh tasks complete karke laayein:
-- ●	Task 1: Ek view 'Mumbai_Orders' banao jisme sirf Mumbai city ke orders ho.
-- ●	Task 2: CREATE OR REPLACE use karke Mumbai_Orders view mein 'Bangalore' city bhi add karo.
-- ●	Task 3: Mumbai_Orders view ke through kisi ek order ka price update karo, aur phir Swiggy_Orders base table check karke likho ki wahan bhi change dikha ya nahi.
-- ●	Task 4: Ek view 'Restaurant_Revenue' banao jo restaurant-wise total revenue SUM se dikhaye. Try karo is view ko UPDATE karna — jo error milega usko screenshot lekar submit karo.
-- ●	Task 5: Mumbai_Orders view ko DROP karo aur confirm karo ki Swiggy_Orders table ka data safe hai.




