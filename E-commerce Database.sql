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
	  


