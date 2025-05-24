INSERT INTO
    clients (full_name, phone_number)
SELECT
    CONCAT(first_name, ' ', last_name),
    CONCAT('(088) 9999', id * 2)
FROM drivers
WHERE
    drivers.id BETWEEN 10 AND 20;