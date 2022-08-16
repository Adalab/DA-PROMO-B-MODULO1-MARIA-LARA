USE northwind;

# Ejercicio 1
SELECT employee_id, COUNT(order_id), MAX(freight) AS maxima_carga
FROM orders
GROUP BY employee_id
;


#Ejercicio 2

SELECT employee_id, COUNT(order_id), MAX(freight) AS maxima_carga
FROM orders
WHERE order_date NOT LIKE "" OR order_date IS NOT NULL
GROUP BY employee_id
ORDER BY employee_id 
;

select order_date FROM orders
limit 100;

#Ejercicio 3
SELECT YEAR(order_date) AS año, MONTH(order_date) AS mes, DAY(order_date) AS dia, COUNT(order_id) AS pedidos_por_fecha
FROM orders
GROUP BY order_date
ORDER BY año, mes, dia;


#Ejercicio 4
SELECT YEAR(order_date) AS año, MONTH(order_date) AS mes, COUNT(order_id) AS pedidos_por_fecha
FROM orders
GROUP BY año, mes
ORDER BY año, mes;

#Ejercicio 5
SELECT city, COUNT(employee_id) AS numero_empleada
FROM employees
GROUP BY city 
HAVING numero_empleada >= 4
;













