SELECT 
e.id_employee,
e.name_employee AS 'nom',
count(id_order) AS 'numero de comandes'
FROM orders o
JOIN
employee e ON e.id_employee = o.fk_id_employee

WHERE 
o.fk_id_employee = 11
;
 
