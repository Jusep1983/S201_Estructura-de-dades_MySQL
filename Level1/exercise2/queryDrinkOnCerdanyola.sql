SELECT 
    c.city_name,  -- Mostramos el nombre de la ciudad
    SUM(od.amount) AS total_sold
FROM 
    order_details od
JOIN 
    orders o ON od.fk_id_order = o.id_order
JOIN 
    product p ON od.fk_id_product = p.id_product
JOIN 
    store s ON o.fk_id_store = s.id_store
JOIN 
    city c ON s.id_city = c.id_city
WHERE 
    p.type = 'drink' AND -- Filtrar por tipo 'drink'
    c.city_name = 'Cerdanyola del Valles' -- Usamos el nombre de la ciudad
GROUP BY 
    c.city_name;