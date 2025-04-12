SELECT 
    s.id_sale,
    s.date_sale,
    c.name_client
FROM 
    sale s
JOIN 
    client c ON s.fk_id_client = c.id_client
WHERE 
    c.name_client = 'Maria'
    AND s.date_sale BETWEEN '2023-01-01' AND '2023-12-31';