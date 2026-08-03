SELECT * FROM products ;

SELECT name, city FROM customers ;

SELECT product, price FROM products ;

SELECT * FROM orders ;

SELECT DISTINCT city FROM customers ;

SELECT product, price FROM products 
ORDER BY price DESC LIMIT 3 ;

SELECT product, price FROM products 
ORDER BY price ASC LIMIT 2 ;

SELECT product FROM products 
ORDER BY price ASC ;

SELECT product, category, price FROM products
ORDER BY price DESC ;

SELECT name FROM customers
ORDER BY name DESC;