-- * Foreign Keys
-- Creating the customers table
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
-- display the customers table schema
DESC customers;
-- Creating the orders table
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);
-- display the orders table schema
DESC orders;
-- Inserting some customers and orders
INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
    ('George', 'Michael', 'gm@gmail.com'),
    ('David', 'Bowie', 'david@gmail.com'),
    ('Blue', 'Steele', 'blue@gmail.com'),
    ('Bette', 'Davis', 'bette@aol.com');
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
    ('2017/11/11', 35.50, 1),
    ('2014/12/12', 800.67, 2),
    ('2015/01/03', 12.50, 2),
    ('1999/04/11', 450.25, 5);
-- This INSERT fails because of our fk constraint.  No user with id: 98
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);
-- * Cross JOIN 
-- ? displays every possible combination of selected tables
-- Finding Orders Placed By George: 2 Step Process
SELECT id
FROM customers
WHERE last_name = 'George';
SELECT *
FROM orders
WHERE customer_id = 1;
-- Finding Orders Placed By George: Using a subquery
SELECT *
FROM orders
WHERE customer_id = (
        SELECT id
        FROM customers
        WHERE last_name = 'George'
    );
-- Cross Join Craziness
SELECT *
FROM customers,
    orders;
-- * Inner JOIN (implicit and explicit)
-- ? implicit joins selected rows from selected tables based on a WHERE match (no JOIN keyword) grabbing only the relevant data that overlaps
-- ? explicit joins selected rows from selected tables based on a ON match (with JOIN keyword)
-- IMPLICIT INNER JOIN
SELECT *
FROM customers,
    orders
WHERE customers.id = orders.customer_id;
-- IMPLICIT INNER JOIN
SELECT first_name,
    last_name,
    order_date,
    amount
FROM customers,
    orders
WHERE customers.id = orders.customer_id;
-- EXPLICIT INNER JOINS
SELECT *
FROM customers
    JOIN orders ON customers.id = orders.customer_id;
SELECT first_name,
    last_name,
    order_date,
    amount
FROM customers
    JOIN orders ON customers.id = orders.customer_id;
SELECT *
FROM orders
    JOIN customers ON customers.id = orders.customer_id;
-- ARBITRARY JOIN - meaningless, but still possible 
SELECT *
FROM customers
    JOIN orders ON customers.id = orders.id;
-- Getting Fancier 
SELECT first_name,
    last_name,
    order_date,
    amount
FROM customers
    JOIN orders ON customers.id = orders.customer_id
ORDER BY order_date;
SELECT first_name,
    last_name,
    SUM(amount) AS total_spent
FROM customers
    JOIN orders ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;
-- * Left JOIN, Right JOIN & IFNULL
-- ? Left JOIN Selects everything from 1st table, along with any matching data in 2nd table (null if no matching data in 2nd table)
-- ? IFNULL checks if a value is null and if so replaces it with something we define
-- ! if you switch the order you check for data LEFT and RIGHT JOINS can be used interchangeably 
-- LEFT JOINS
SELECT *
FROM customers
    LEFT JOIN orders ON customers.id = orders.customer_id;
SELECT first_name,
    last_name,
    order_date,
    amount
FROM customers
    LEFT JOIN orders ON customers.id = orders.customer_id;
SELECT first_name,
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
    LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;
-- ? Right JOIN Selects everything from 2nd table, along with any matching data in 1st table (null if no matching data in 1st table)
--A MORE COMPLEX RIGHT JOIN
SELECT IFNULL(first_name, 'MISSING') AS first,
    IFNULL(last_name, 'USER') as last,
    order_date,
    amount,
    SUM(amount)
FROM customers
    RIGHT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name,
    last_name;
-- * CASCADE
-- ? CASCADE makes sure that if a referenced row is deleted it deletes any corresponding rows from from other tables
-- WORKING WITH ON DELETE CASCADE
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
);