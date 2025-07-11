SELECT
    d.name AS distributor_name,
    i.name AS ingredient_name,
    p.name AS product_name,
    AVG(f.rate) AS average_rate
FROM
    distributors AS d
    JOIN ingredients AS i
    ON i.distributor_id = d.id
        JOIN products_ingredients AS pi
        ON pi.ingredient_id = i.id
            JOIN products p
            ON p.id = pi.product_id
                JOIN feedbacks AS f
                ON f.product_id = p.id
GROUP BY
    distributor_name,
    ingredient_name,
    product_name
HAVING
    AVG(f.rate) BETWEEN 5 AND 8
ORDER BY
    distributor_name,
    ingredient_name,
    product_name;