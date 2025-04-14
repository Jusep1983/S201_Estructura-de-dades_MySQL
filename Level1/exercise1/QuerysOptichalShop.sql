-- Llista les vendes de l'empleat amb id 1 mostrant el seu nom, model d'ulleres, marca i data de la venda
SELECT e.name_empl 'empleat', g.id_glasses 'model ulleres', g.brand  'marca', s.date_sale  'data venda' FROM sale s JOIN employee e ON s.employee_id_employee = e.id_employee JOIN sale_details sd ON s.id_sale = sd.fk_id_sale JOIN glasses g ON sd.fk_sale_glasses = g.id_glasses WHERE YEAR(s.date_sale) = 2023 AND e.id_employee = 1;

-- Llista les vendes realitzades pel client amb name_client = Maria a l'any 2023
SELECT s.id_sale 'venda', s.date_sale 'data de venda', c.name_client 'nom del client' FROM sale s JOIN client c ON s.fk_id_client = c.id_client WHERE c.name_client = 'Maria' AND s.date_sale BETWEEN '2023-01-01' AND '2023-12-31';

-- Llista els proveïdors que hagin tingut vendes amb una quantitat superior a 1 mostrant total d'unitats venudes
SELECT su.name 'proveïdor', su.city  'ciutat', su.country 'pais', SUM(sd.quantity_sale_detaills) 'total unitats venudes' FROM supplier su JOIN glasses g ON su.id_supplier = g.fk_id_supplier JOIN sale_details sd ON g.id_glasses = sd.fk_sale_glasses JOIN sale s ON sd.fk_id_sale = s.id_sale WHERE sd.quantity_sale_detaills > 1 GROUP BY su.name, su.city, su.country;
