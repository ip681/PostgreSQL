SELECT
    id,
    concat(
    number,
    ' ',
    street
    ) AS address,
    city_id
FROM 
    addresses
WHERE 
    id >= 20;