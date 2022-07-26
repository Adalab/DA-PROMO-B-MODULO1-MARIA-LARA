USE northwind;

-- Ejercicio 1:
/*
Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. 
Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). 
Pero importante! No debe haber duplicados en nuestra respuesta.
*/
-- Nos falta añadir el campo temporal relacion(donde ponemos si es cliente o proveedor) pero es que no me acuerdo de cómo crear ese campo.
SELECT city, country, company_name, contact_name, "customers" AS Relacion
FROM customers
UNION 
SELECT city, country, company_name, contact_name, "suppliers" AS Relacion
FROM suppliers;

-- Ejericicio 2:
/*
En este caso, nuestro jefe quiere saber cuantos pedidos ha gestionado "Nancy Davolio", 
una de nuestras empleadas. Nos pide todos los detalles tramitados por ella.
*/

-- Esta consulta nos devuelve todos los detalles de los pedidos tramitados por Nancy
SELECT *
FROM orders
WHERE employee_id IN (
	SELECT employee_id
	FROM employees
	WHERE first_name = 'Nancy' AND last_name = 'Davolio');

-- Esta consulta nos devuelve el número de pedidos tramitados por Nancy
SELECT COUNT(order_id)
FROM orders
WHERE employee_id IN (
	SELECT employee_id
	FROM employees
	WHERE first_name = 'Nancy' AND last_name = 'Davolio');



-- Ejercicio 3:
/*
En este caso, nuestro jefe quiere saber cuántas empresas no han comprado en el año 1997.
*/

-- en la primera consulta me devuelve el numero de empresas que no han comprado en 1997
SELECT COUNT(customer_id)
FROM orders
WHERE YEAR(order_date) <> "1997";

-- en la segunda consulta puedo ver las empresas que han comprado en otros años pero no en 1997
SELECT customers.company_name, customers.country
FROM orders, customers
WHERE YEAR(order_date) <> "1997";

-- en esta consulta podemos ver el número de empresas que han comprado en 1997
SELECT COUNT(customer_id)
FROM orders
WHERE YEAR(order_date) ="1997";

-- en esta consulta podemos ver el nombre de las empresas que compraron en 1997. el campo year(order_date) no me lo piden, pero es para comprobar que funciona, lo pongo y luego lo quito
SELECT YEAR(order_date), customers.company_name, customers.country
FROM orders, customers
WHERE YEAR(order_date) = "1997";

-- en esta consulta podemos ver el nombre de las empresas que compraron en 1997, sin repetidos. 
SELECT DISTINCT customers.company_name, customers.country
FROM orders, customers
WHERE YEAR(order_date) = "1997"
ORDER BY company_name;

-- Ejercicio 4:
/*
todos los pedidos que tengan "Konbu"
*/


-- Primero pruebo por separado a buscar los productos que sean Konbu, y hayarme el product_id
SELECT product_id
FROM products
WHERE product_name = "Konbu"
;

-- Luego busco en order details los order_id que tienen como product_id el que corresponde a Konbu
SELECT COUNT(DISTINCT order_id)
FROM order_details
WHERE product_id = 13;

-- Ahora intento reproducir las anteriores bśquedas, pero en una sola consulta, pero no me funciona, el resultado debería ser el mismo que en la query anterior, y ni se le parece. 
SELECT COUNT(DISTINCT(order_id))
FROM order_details INNER JOIN products
WHERE products.product_name = "Konbu";

-- EL resultado final lo hago uniendo las dos consultas en una subconsulta con IN
SELECT order_id
FROM order_details
WHERE product_id IN
(SELECT product_id
FROM products
WHERE product_name = "Konbu")


