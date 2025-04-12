SELECT 
    DISTINCT su.name AS proveïdor,
    su.city AS ciutat,
    su.country AS país
FROM 
    supplier su
JOIN 
    glasses g ON su.id_supplier = g.fk_id_supplier
JOIN 
    sale s ON g.id_glasses = s.fk_id_glasses
JOIN 
    sale_details sd ON s.id_sale = sd.fk_id_sale
WHERE 
    sd.quantity_sale_detaills > 0;