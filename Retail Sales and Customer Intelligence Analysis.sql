CREATE DATABASE retail_analysis;
USE retail_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO customers (customer_name, city, join_date) VALUES
('Harish', 'Coimbatore', '2023-01-10'),
('Anitha', 'Chennai', '2023-02-15'),
('Rahul', 'Bangalore', '2023-03-20'),
('Priya', 'Hyderabad', '2023-04-05'),
('Karthik', 'Mumbai', '2023-05-12');


INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 55000),
('Mobile', 'Electronics', 20000),
('Headphones', 'Accessories', 2000),
('Office Chair', 'Furniture', 7000),
('Backpack', 'Accessories', 1500);


INSERT INTO orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2024-01-10', 1),
(1, 3, '2024-02-05', 2),
(2, 2, '2024-02-15', 1),
(3, 5, '2024-03-10', 3),
(4, 4, '2024-03-18', 1),
(5, 1, '2024-04-01', 1),
(2, 3, '2024-04-12', 1),
(3, 2, '2024-05-20', 2),
(4, 5, '2024-06-05', 2),
(1, 2, '2024-07-01', 1);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

UPDATE customers
SET customer_name = CASE customer_id
    WHEN 1 THEN 'Ajith'
    WHEN 2 THEN 'Vijay'
    WHEN 3 THEN 'Suriya'
    WHEN 4 THEN 'Vikram'
    WHEN 5 THEN 'Dhanush'
END
WHERE customer_id IN (1,2,3,4,5);



SELECT c.customer_name, o.order_date, o.quantity
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;



SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p 
ON o.product_id = p.product_id;


SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(o.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN products p 
ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;


SELECT customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


SELECT c.customer_name,
MAX(o.order_date) AS last_purchase_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

