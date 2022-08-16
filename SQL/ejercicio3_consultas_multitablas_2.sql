USE northwind;

-- Ejercicio 1:

SELECT  orders.order_id AS "ID_Pedidos", customers.company_name AS "nombre_empresa", orders.order_date AS "Fecha_pedidos"
FROM orders NATURAL JOIN customers
ORDER BY customers.company_name;

-- Ejercicio 2:

SELECT COUNT(orders.order_id) AS "numero_pedidos", customers.company_name AS "nombre_empresa"
FROM orders NATURAL JOIN customers
WHERE country  = 'UK'
GROUP BY customers.company_name;



-- Ejercicio 3:

SELECT  orders.order_id AS "ID_Pedidos", customers.company_name AS "nombre_empresa", orders.order_date AS "Fecha_pedidos"
FROM orders LEFT JOIN customers
ON country  = 'UK' 
ORDER BY customers.company_name;

-- queriamos comprobar si nos estaba devolviendo las empresas sin pedidos, así que hicimos esta quqry aparte.
SELECT customers.company_name, orders.order_id
FROM customers LEFT JOIN orders
ON country  = 'UK' AND orders.order_id = "";


-- Ejercicio 4:

SELECT A.city AS "ciudad_empleada", A.first_name AS "nombre_empleada", A.last_name AS "apellido_empleada", B.city AS "ciudad_jefa", B.first_name AS "nombre_jefa", B.last_name AS "apellido_jefa" 
FROM employees AS A,  employees AS B
WHERE A.title <> B.title;


-- nos falta saber quien es el director, estamos con nuestras pesquisas en lo que sigue... :)

SELECT COUNT(employee_id), title
FROM employees
GROUP BY title;


SELECT A.city AS "ciudad_empleada", A.first_name AS "nombre_empleada", A.last_name AS "apellido_empleada", B.city AS "ciudad_jefa", B.first_name AS "nombre_jefa", B.last_name AS "apellido_jefa" 
FROM employees AS A,  employees AS B
WHERE A.title <> B.title;


SELECT DISTINCT(title)
FROM employees;

 

 
 
