SELECT
    title
FROM
    books
WHERE
    "left"(title, 3) = 'The'
ORDER BY
    id;