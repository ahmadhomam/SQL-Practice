-- 1. CREATE TABLES

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    age INT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);

-- 2. INSERT DATA INTO CUSTOMERS

INSERT INTO Customers (customer_id, name, city, age) VALUES
(1, 'Rahul', 'Delhi', 25),
(2, 'Aman', 'Mumbai', 32),
(3, 'Sara', 'Delhi', 28),
(4, 'John', 'Bangalore', 35),
(5, 'Priya', 'Patna', 24);

-- 3. INSERT DATA INTO PRODUCTS

INSERT INTO Products (product_id, product, category, price) VALUES
(101, 'Laptop', 'Electronics', 65000),
(102, 'Phone', 'Electronics', 35000),
(103, 'Shoes', 'Fashion', 3000),
(104, 'Watch', 'Accessories', 8000),
(105, 'Headphones', 'Electronics', 2500);

-- 4. INSERT DATA INTO ORDERS

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 1, 101, 1, '2026-01-05'),
(2, 1, 103, 2, '2026-01-10'),
(3, 2, 102, 1, '2026-01-11'),
(4, 3, 105, 3, '2026-01-12'),
(5, 4, 104, 2, '2026-01-15'),
(6, 5, 103, 1, '2026-01-20');


SELECT * FROM Custome