SELECT * FROM customers 
WHERE city = 'Delhi' ;

SELECT * FROM products
WHERE price > 30000 ;

SELECT * FROM orders 
WHERE quantity > 1 ;

SELECT * FROM products
WHERE category = 'Electronics' AND
price > 20000 ;

SELECT * FROM customers
WHERE city IN('Delhi','Patna') ;

SELECT * FROM customers
WHERE age BETWEEN 25 AND 35 ;

SELECT * FROM products 
WHERE product LIKE 'H%' ;

SELECT * FROM customers
WHERE name LIKE '%a' ;

SELECT * FROM products 
WHERE price BETWEEN 2500 AND 10000 ;

SELECT * FROM customers
WHERE city != 'Delhi' ;