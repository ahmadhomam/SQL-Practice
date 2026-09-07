SELECT o.order_id,
	   c.name,
	   c.city
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id


SELECT o.order_id,
	   p.product,
	   o.quantity
FROM orders AS o
JOIN products AS p
ON o.product_id = p.product_id ;


SELECT o.order_id,
	   c.name,
	   p.product,
	   o.quantity
FROM orders AS o 
JOIN customers AS c
	ON o.customer_id = c.customer_id
JOIN products as p
	ON o.product_id = p.product_id ;


SELECT c.customer_id,
	   c.name,
	   c.city,
	   SUM(p.price*o.quantity) AS amount
FROM orders AS o
JOIN customers AS c
	ON o.customer_id = c.customer_id
JOIN products AS p
	ON o.product_id = p.product_id
GROUP BY 
	c.customer_id,
	c.name,
	c.city ;


SELECT c.name,
	   c.city,
	   SUM(o.quantity * p.price) AS amount
FROM orders AS o
JOIN customers AS c
	ON o.customer_id = c.customer_id
JOIN products AS p
	ON p.product_id = o.product_id
GROUP BY
	c.name,
	c.city
ORDER BY amount DESC LIMIT 3 ;

SELECT * FROM products
SELECT * FROM customers
SELECT * FROM orders



SELECT c.customer_id,
	   c.name,
	   o.order_id
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id  =  o.customer_id ;


SELECT c.customer_id,
	   c.name
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id  =  o.customer_id 
WHERE o.order_id IS NULL ;

INSERT INTO products(product_id,product,category,price)
VALUES(106,'Tablet','Electronics',45000)

SELECT p.product_id,
	   p.product,
	   p.price
FROM products AS p
LEFT JOIN orders AS o
	ON p.product_id = o.product_id
WHERE o.product_id IS NULL ;

SELECT p.product_id,
	   p.product,
	   COUNT(o.order_id) AS order_count
FROM products AS p
LEFT JOIN orders AS o
	ON o.product_id = p.product_id
GROUP BY p.product_id,
		 p.product ; 

SELECT c.name,
	   COUNT(o.order_id) AS total_order
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id,
		 c.name  ;



SELECT category,
	   SUM(price) AS total_value
FROM products
GROUP BY category  
HAVING SUM(price) > 40000 ;

SELECT c.customer_id,
	   c.name,
	   COUNT(o.order_id) AS total_order
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id,
		 c.name 
HAVING COUNT(o.order_id) > 1 ;

SELECT city,
	   COUNT(city) AS customer_count
FROM customers
GROUP BY city 
HAVING COUNT(city) > 1 ;

SELECT p.product_id,
	   p.product,
	   SUM(p.price * o.quantity) AS revenue
FROM products AS p
LEFT JOIN orders AS o
	ON o.product_id  = p.product_id
GROUP BY p.product_id,
		 p.product 
HAVING SUM(p.price * o.quantity) > 10000 ;



SELECT name,
	   age,
	   CASE
	   	   WHEN age<25 THEN 'Young'
		   WHEN age > 30 THEN 'Senior'
		   ELSE  'Mid'
	   END AS age_group
FROM customers ;
		

SELECT product,
	   price,
	   CASE
	   	  WHEN price < 5000 THEN 'Budget'
		  WHEN price <= 30000 AND price >= 5000 THEN 'Mid-range'
		  ELSE 'Premium'
	   END AS price_category 
FROM products ;


SELECT o.order_id,
	   SUM(o.quantity * p.price) AS revenue,
	   CASE 
	   		WHEN SUM(o.quantity * p.price) < 5000 THEN 'Low'
			WHEN SUM(o.quantity * p.price) <=30000 THEN 'Medium'
			ELSE 'High'
	   END AS revenue_category 
FROM products AS p
JOIN orders AS o
	ON o.product_id = p.product_id 
GROUP BY o.order_id ;


SELECT 
	SUM(
		CASE
			WHEN p.price > 30000
			THEN o.quantity * p.price
			ELSE 0
		END
	) AS premium_revenue,
	SUM(
		CASE
			WHEN p.price <= 30000
			THEN o.quantity * p.price
			ELSE 0
		END
	) AS non_premium_revenue
FROM orders AS o
JOIN produc


-- finding the spending of the customers and then grouping them according to their spending
-- this is the query for creating the segment a/q to spent
SELECT c.name,
	   SUM(o.quantity * p.price) AS total_spent,
	   CASE 
	   		WHEN SUM(o.quantity * p.price) < 10000 THEN 'Low'
			WHEN SUM(o.quantity * p.price) <= 50000 THEN 'Medium'
			WHEN SUM(o.quantity * p.price) >50000 THEN 'High'
		END AS segment 
FROM customers AS c
LEFT JOIN orders AS o
	ON o.customer_id = c.customer_id
LEFT JOIN products AS p
	ON o.product_id = p.product_id
GROUP BY c.customer_id,
		 c.name ;


SELECT ...
FROM (
	SELECT c.name,
	   SUM(o.quantity * p.price) AS total_spent,
	   CASE 
	   		WHEN SUM(o.quantity * p.price) < 10000 THEN 'Low'
			WHEN SUM(o.quantity * p.price) <= 50000 THEN 'Medium'
			WHEN SUM(o.quantity * p.price) >50000 THEN 'High'
		END AS segment 
FROM customers AS c
LEFT JOIN orders AS o
	ON o.customer_id = c.customer_id
LEFT JOIN products AS p
	ON o.product_id = p.product_id
GROUP BY c.customer_id,
		 c.name 
) AS customer_segments 



-- subqueries with conditional aggregators
SELECT SUM(
	CASE 
		WHEN p.category = 'Electronics'
		THEN (o.quantity * p.price)
		ELSE 0
	END
) AS electronics_revenue,

SUM (
	CASE 
		WHEN p.category = 'Fashion'
		THEN (o.quantity*p.price)
		ELSE 0
	END
) AS fashion_revenue ,

COUNT(
	CASE
		WHEN p.category = 'Electronics'
		THEN 1
		ELSE 0
	END
) AS total_electronics_order 
FROM orders AS o
JOIN products AS p
	ON o.product_id = p.product_id ;


SELECT c.name,
	   COUNT(o.order_id) AS total_orders,
	   COUNT(
		CASE
			WHEN (o.quantity * p.price) > 30000 
			THEN 1
		END
	   ) AS high_value_orders
FROM customers AS c
LEFT JOIN orders as o
	ON o.customer_id = c.customer_id
LEFT JOIN products as p
	ON o.product_id = p.product_id
GROUP BY c.customer_id,
		 c.name ;
		 

SELECT product,
	   price
FROM products 
WHERE price > (
	SELECT AVG(price)
	FROM products
) ;


SELECT name
FROM customers
WHERE customer_id NOT IN(
	SELECT customer_id
	FROM orders
) ;



SELECT product,
	   price 
FROM products 
WHERE price > (
	SELECT AVG(price)
	FROM products 
	WHERE category = 'Electronics' 
) ;

-- method 1 : using JOIN
SELECT c.customer_id,
	   c.name,
	   COUNT(o.order_id) AS order_count
FROM customers AS c
JOIN orders AS o
	ON o.customer_id = c.customer_id
GROUP BY c.customer_id,
		 c.name
HAVING COUNT(o.order_id) > 0 ;

-- method 2 : using IN subqueries
SELECT c.name
FROM customers AS c
WHERE customer_id IN(
	SELECT customer_id 
	FROM orders
) ;

--method 3 : using EXSIST subqueries 
SELECT c.name
FROM customers AS c
WHERE EXISTS(
	SELECT 1
	FROM orders AS o
	WHERE o.customer_id = c.customer_id
) ;


SELECT product,
	   price
FROM products 
WHERE price > (
	SELECT AVG(price)
	FROM products
)
AND category = 'Electronics' ;


SELECT segment,
	   COUNT(*) AS customer_count
FROM ( 
SELECT
	c.customer_id,
	c.name,
	COALESCE(SUM(p.price*o.quantity),0) AS total_spent,
	CASE
		WHEN COALESCE(SUM(p.price*o.quantity),0) < 10000
		THEN 'Low'
		WHEN COALESCE(SUM(p.price*o.quantity),0) <= 50000
		THEN 'Medium'
		ELSE 'High'
	END AS segment
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id
LEFT JOIN products AS p
	ON p.product_id = o.product_id
GROUP BY c.customer_id,c.name
) AS customer_segment
GROUP BY segment

-- SQL QUERY -1 (KN ACADEMY CODING ASSESMENT)
SELECT d.DEPARTMENT_NAME,
	   AVG(e.SALARY) AS DEPT_AVG
FROM Departments d
LEFT JOIN Employees e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
HAVING AVG(e.SALARY) > (
	SELECT AVG(SALARY)
	FROM Employees
) ;

-- SQL QUERY -2 (KN ACADEMY)
SELECT NAME,
	   DEPARTMENT,
	   SALARY
FROM Employees E1
WHERE SALARY >= (
	SELECT MAX(E2.SALARY)
	FROM Employees E2 
	WHERE E2.DEPARTMENT = E1.DEPARTMENT
) ;


-- SQL QUERY -1(TOP ONE)
-- REMEMBER TO ASK YOURSELF IS THE JOIN CREATED DUPLICATES
-- ALWAYS PAY ATTENTION TO WHAT EXACTLY QUESTION WANTS
--      (ASKING FOR ORDER >1 OR ORDERED ITEM > 1)**
SELECT c.CUSTOMER_NAME,
	   SUM(oi.QUANTITY) AS total_orders,
	   SUM(oi.PRICE * oi.QUANTITY) AS total_spend,
	   COUNT(DISTINCT oi.PRODUCT_NAME) AS dist_item
FROM customers c
JOIN orders o 
	ON c.CUSTOMER_ID = o.CUSTOMER_ID
JOIN order_items oi
	ON oi.ORDER_ID = o.ORDER_ID
WHERE c.CITY = 'NEW YORK' 
GROUP BY c.CUSTOMER_NAME, c.CUSTOMER_ID
HAVING SUM(oi.QUANTITY) > 1   ;


-- New York customers who bought at least 2 different type products, 
-- with distinct products, total units, and total spending.
SELECT c.CUSTOMER_NAME,
	   COUNT(DISTINCT oi.PRODUCT_NAME) AS distinct_products,
	   SUM(oi.quantity) AS total_units,
	   SUM(oi.quantity * oi.PRICE) AS total_spending
FROM customers c
JOIN orders o 
	ON c.CUSTOMER_ID = o.CUSTOMER_ID
JOIN order_items oi
	ON oi.ORDER_ID = o.ORDER_ID
WHERE c.CITY = 'NEW YORK'
GROUP BY c.CUSTOMER_NAME, c.CUSTOMER_ID
HAVING COUNT(DISTINCT oi.PRODUCT_NAME) >= 2 ;


-- Find customers who placed at least 2 different orders, 
-- but purchased fewer than 4 total units.
SELECT c.CUSTOMER_NAME,
	   COUNT(DISTINCT oi.ORDER_ID) AS total_order,
	   SUM(oi.QUANTITY) AS total_units
FROM customers c
JOIN orders o 
	ON c.CUSTOMER_ID = o.CUSTOMER_ID
JOIN order_items oi
	ON oi.ORDER_ID = o.ORDER_ID
GROUP BY c.CUSTOMER_ID, c.CUSTOMER_NAME
HAVING COUNT(DISTINCT oi.ORDER_ID) >= 2 AND
SUM(oi.QUANTITY) < 4 ;


