SELECT
    i.name AS ingredient_name,
    p.name AS product_name,
    d.name AS distributor_name
FROM
    distributors AS d
    JOIN ingredients AS i
    ON i.distributor_id = d.id
        JOIN products_ingredients AS pi
        ON pi.ingredient_id = i.id
            JOIN products p
            ON p.id = pi.product_id
WHERE
    LOWER(i.name) = 'mustard' AND
    d.country_id = 16
ORDER BY
    product_name;