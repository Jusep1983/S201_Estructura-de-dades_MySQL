SELECT 
    e.name_empl AS empleado,
    g.id_glasses AS model_ulleres,
    g.brand AS marca,
    s.date_sale AS data_venda
FROM 
    sale s
JOIN 
    employee e ON s.employee_id_employee = e.id_employee
JOIN 
    glasses g ON s.fk_id_glasses = g.id_glasses
WHERE 
    YEAR(s.date_sale) = 2023  -- Cambia el año según necesites
    AND e.id_employee = 1  