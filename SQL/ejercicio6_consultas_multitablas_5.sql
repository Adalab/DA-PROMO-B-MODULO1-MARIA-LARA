USE northwind;

#EJERCICIO 1:

SELECT e.order_id, e.customer_id, e.employee_id, e.order_date AS 'Fecha', e.required_date AS 'Fecha requerida'
FROM orders AS e
WHERE order_date >=
	(SELECT MAX(order_date) as maximo_pedido
	FROM orders AS o
	WHERE e.employee_id = o.employee_id);
    
    
#EJERCICIO 2:

SELECT product_id, unit_price AS 'PRECIO'
FROM products
WHERE product_id IN (
	SELECT product_id
	FROM order_details
	GROUP BY product_id
	HAVING SUM(quantity) > 0); 
    
#EJERCICIO 3:

SELECT company_name AS nombre_compañia, contact_name AS nombre_contacto, city AS ciudad
FROM customers
WHERE city LIKE 'B%' OR city LIKE 'A%';   

#EJERCICIO 4:

SELECT company_name AS nombre_compañia, contact_name AS persona_contacto, city AS ciudad 
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.order_id
WHERE city LIKE 'L%'
;

#EJERCICIO 5:

SELECT contact_name AS persona_contacto, contact_title AS 'PUESTO', company_name AS nombre_compañia
FROM customers
WHERE contact_title NOT LIKE '%Sales%';

#EJERCICIO 6:

SELECT contact_name AS persona_contacto
FROM customers
WHERE contact_name NOT LIKE '_A%';
 