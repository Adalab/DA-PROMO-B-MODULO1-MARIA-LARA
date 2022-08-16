USE northwind;
# EJERCICIO 1:
WITH cia_clientes
AS (
      SELECT company_name, customer_id
      FROM customers
      )
SELECT e.company_name,
        e.customer_id
FROM cia_clientes AS e
; 

#EJERCICIO 2:
WITH cia_clientes
AS (
      SELECT company_name, customer_id, country
      FROM customers
      )
SELECT e.company_name,
        e.customer_id,
        e.country
FROM customers AS e
WHERE country = 'Germany'
; 

#EJERCICIO 3:
WITH cia_clientes
AS (
      SELECT order_date, order_id, customer_id
      FROM orders
      )
SELECT e.customer_id,
        e.company_name,
        o.order_date,
        o.order_id
        
FROM customers AS e
JOIN orders AS o
ON e.customer_id=o.customer_id 
; 

#EJERCICIO 4:
WITH cia_clientes AS (
      SELECT order_date, order_id, customer_id
      FROM orders
      
      SELECT e.customer_id,
        e.company_name,
        o.order_date,
        o.order_id) 
        
FROM customers AS e
JOIN orders AS o
ON e.customer_id=o.customer_id )
SELECT count(order_id) AS pedidos
FROM cia_clientes

; 
