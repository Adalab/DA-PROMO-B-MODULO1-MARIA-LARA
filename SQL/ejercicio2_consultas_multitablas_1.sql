# EJERCICIO 1:
USE northwind;
SELECT customers.contact_name AS 'nombre empresa', orders.customer_id AS 'empresa', COUNT(customer_id) AS 'número pedidos'
FROM orders NATURAL JOIN customers
WHERE country= 'UK' 
GROUP BY customer_id; 


# EJERCICIO 2:
USE northwind;

SELECT customers.company_name AS 'EMPRESA', YEAR(orders.order_date) AS 'AÑO', SUM(order_details.quantity) AS 'CANTIDAD', customers.country
FROM customers INNER JOIN orders 
ON customers.customer_id = orders.customer_id 
INNER JOIN order_details
ON orders.order_id = order_details.order_id 
WHERE country= 'UK' 
GROUP BY order_details.order_id;

#EJERCICIO 3:
SELECT customers.company_name AS 'EMPRESA', YEAR(orders.order_date) AS 'AÑO', SUM(order_details.quantity) AS 'CANTIDAD',
CASE
	WHEN order_details.discount = 0 THEN (order_details.unit_price * order_details.quantity) 
    WHEN order_details.discount <> 0 THEN (order_details.unit_price * order_details.quantity) * order_details.discount
    END AS total_dinero

FROM order_details INNER JOIN orders 
ON orders.order_id = order_details.order_id 
INNER JOIN customers
ON customers.customer_id = orders.customer_id
GROUP BY order_details.order_id;

# BONUS 4:

SELECT customers.company_name AS 'EMPRESA', orders.order_id, orders.order_date AS 'FECHA'
FROM customers INNER JOIN orders
USING (customer_id);


