SELECT
    a.name AS address,
    CASE
        WHEN EXTRACT(HOURS FROM cr.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    cr.bill,
    cl.full_name,
    c.make,
    c.model,
    cat.name AS category_name
FROM
    addresses AS a
    JOIN courses AS cr
        ON a.id = cr.from_address_id
    JOIN clients AS cl
        ON cr.client_id = cl.id
    JOIN cars AS c
        ON cr.car_id = c.id
    JOIN categories AS cat
        ON c.category_id = cat.id
ORDER BY
    cr.id;