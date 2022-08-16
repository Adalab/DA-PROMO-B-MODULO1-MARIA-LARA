# EJERCICIO 1:
USE northwind;
SELECT customers.contact_name AS 'nombre empresa', orders.customer_id AS 'empresa', COUNT(customer_id) AS 'número pedidos'
FROM orders NATURAL JOIN customers
WHERE country= 'UK' 
GROUP BY customer_id; 


# EJERCICIO 2:
USE northwind;
SELECT YEAR(orders.order_date),customers.contact_name AS 'nombre empresa', COUNT(order_details.quantity)
FROM orders JOIN order_details JOIN customers
WHERE country= 'UK'
GROUP BY customers.contact_name;

customers- customer_id
orders - customer_id
contact_name (nombre de empresa)
country(para fiktrar por el pais)




orders- order_id
orders_detail - order_id
quantity
order_date(agrupado por año)

