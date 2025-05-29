SELECT
    c.id AS car_id,
    c.make,
    c.mileage,
    COUNT(cr.id) AS count_of_courses,
    ROUND(AVG(cr.bill), 2) AS average_bill
FROM
    cars AS c
    LEFT JOIN courses AS cr
        ON c.id = cr.car_id
GROUP BY
    c.id,
    c.make,
    c.mileage
HAVING
    COUNT(cr.id) <> 2
ORDER BY
    count_of_courses DESC,
    car_id;