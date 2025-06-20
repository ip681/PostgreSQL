DELETE FROM addresses
WHERE
    id % 2 = 0
    AND
    LOWER(street) LIKE '%r%';