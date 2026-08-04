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

