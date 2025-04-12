-- Lista las ventas de un empleado en concreto mostrando su nombre, modelo de gafas, marca y fecha de la venta
 SELECT e.name_empl AS empleado, g.id_glasses AS model_ulleres, g.brand AS marca, s.date_sale AS data_venda FROM sale s JOIN employee e ON s.employee_id_employee = e.id_employee JOIN glasses g ON s.fk_id_glasses = g.id_glasses WHERE YEAR(s.date_sale) = 2023 AND e.id_employee = 1;

-- Lista entas realizadas por el cliente con name_client = Maria en 2023
 SELECT s.id_sale, s.date_sale, c.name_client FROM sale s JOIN client c ON s.fk_id_client = c.id_client WHERE c.name_client = 'Maria'AND s.date_sale BETWEEN '2023-01-01' AND '2023-12-31';

-- Lista los proveedores que hayan tenido ventas con una cantidad superior a 1
 SELECT DISTINCT su.name AS proveïdor, su.city AS ciutat, su.country AS país, sd.quantity_sale_detaills FROM supplier su JOIN glasses g ON su.id_supplier = g.fk_id_supplier JOIN sale s ON g.id_glasses = s.fk_id_glasses JOIN sale_details sd ON s.id_sale = sd.fk_id_sale WHERE sd.quantity_sale_detaills >1;



