-- Lista cuántos productos de categoría 'Bebidas' se han vendido en una determinada localidad.
 SELECT c.city_name, SUM(od.amount) AS total_sold FROM order_details od JOIN orders o ON od.fk_id_order = o.id_order JOIN product p ON od.fk_id_product = p.id_product JOIN store s ON o.fk_id_store = s.id_store JOIN city c ON s.id_city = c.id_city WHERE p.type = 'drink' AND c.city_name = 'Cerdanyola del Valles' GROUP BY c.city_name;

-- Lista cuántos pedidos ha efectuado un determinado empleado/a.
 SELECT e.id_employee, e.name_employee AS 'nom', count(id_order) AS 'numero de comandes' FROM orders o JOIN employee e ON e.id_employee = o.fk_id_employee WHERE o.fk_id_employee = 11;
