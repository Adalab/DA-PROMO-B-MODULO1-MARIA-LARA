#EJERCICIO 1:
SELECT products.product_id AS id_producto, products.product_name AS nombre_producto, products.category_id AS id_categoria
FROM products
WHERE category_id =
(SELECT category_id
FROM categories where category_name = "Beverages");

#EJERCICIO 2:
SELECT  customers.country
FROM customers
WHERE customers.country NOT IN (
SELECT suppliers.country
FROM suppliers)
GROUP BY customers.country;

#EJERCICIO 3:
SELECT orders.order_id , orders.customer_id 
FROM orders 
WHERE order_id in (
select order_id 
from order_details where product_id = (
SELECT product_id
FROM products where product_name = "Grandma's Boysenberry Spread") and quantity > 20 );

#EJERCICIO 4:
select products.unit_price as precio, products.product_name as nombre_productos_mas_caros
from products
order by unit_price desc limit 10;

#BONUS

-- No consigo sacar el product_name, porque no me hace inner join, ni me deja hacer subconsulta, por el group by, o algo así.

SELECT product_id,sum(quantity)
FROM order_details 
GROUP BY product_id
ORDER BY sum(quantity) DESC
;




SELECT product_name
FROM products
WHERE product_id = 60;
