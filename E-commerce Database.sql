SELECT category,
	   COUNT(*) AS total_product
FROM products
GROUP BY category ;

SELECT category,
	   MAX(price) AS max_value
FROM products
GROUP BY category ;

SELECT category,
	   MIN(price) AS min_val
FROM products
GROUP BY category ;

SELECT category,
	   AVG(price) AS avg_price
FROM products
GROUP BY category ;

SELECT category,
	   SUM(price) as total_val
FROM products 
GROUP BY category ;

SELECT city,
	   COUNT(*) AS total_customer
FROM customers
GROUP BY city ;

SELECT city,
	   AVG(age) AS avg_age
FROM customers
GROUP BY city ;

SELECT city,
	   MAX(age) AS max_age
FROM customers
GROUP BY city ;
