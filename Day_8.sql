CREATE DATABASE sales_db;
USE sales_db;

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each sale
    product_name VARCHAR(100),               -- Name of the product sold
    quantity INT,                             -- Number of items sold
    price DECIMAL(10,2),                      -- Price per item
    sale_date DATE                            -- Date of sale
);


INSERT INTO sales (product_name, quantity, price, sale_date) VALUES
('Laptop', 3, 50000.00, '2024-09-01'),
('Mouse', 10, 500.00, '2024-03-02'),
('Keyboard', 5, 1500.00, '2024-09-02'),
('Monitor', 2, 20000.00, '2024-03-03'),
('Laptop', 1, 52000.00, '2024-09-03'),
('Mouse', 7, 550.00, '2024-03-04'),
('Keyboard', 8, 1600.00, '2024-03-05');

select * from sales;

-- 🔹 SUM() – Total Sales Amount
SELECT SUM(quantity * price) AS total_revenue FROM sales;

--  AVG() – Average Sale Price
SELECT AVG(price) AS average_price FROM sales;


 -- COUNT() – Total Transactions
 SELECT COUNT(*) AS total_sales FROM sales;

--  MIN() & MAX() – Find Cheapest & Most Expensive Product
SELECT MIN(price) AS lowest_price, MAX(price) AS highest_price FROM sales;

-- Grouping Data with GROUP BY
-- 1) Find how much revenue each product generated.
SELECT product_name, SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product_name;


-- 🔹 COUNT() with GROUP BY – Sales per Product
-- 1) Find how many times each product was sold.
SELECT product_name, COUNT(*) AS sale_count
FROM sales
GROUP BY product_name;

-- Finding Monthly Sales – GROUP BY with DATE_FORMAT()
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS sale_month, SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY sale_month;

--  Filtering Data with HAVING
-- 1) Find products with total revenue greater than 20,000.
SELECT product_name, SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product_name
HAVING total_revenue > 20000;


-- Combining Filters with WHERE and HAVING
-- 1)Find products sold after March 2, 2024, with revenue greater than ₹10,000.

-- Find products sold after March 2, 2024, with revenue greater than ₹10,000
SELECT 
    product_name, 
    SUM(quantity * price) AS total_revenue
FROM sales
WHERE sale_date > '2024-03-02'
GROUP BY product_name
HAVING SUM(quantity * price) > 10000;   -- we can't use total_revenue 