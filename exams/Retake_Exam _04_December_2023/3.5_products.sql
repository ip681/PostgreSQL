SELECT
    name,
    recipe,
    price
FROM
    products
WHERE
    price BETWEEN 10 AND 20
ORDER BY
    price DESC;