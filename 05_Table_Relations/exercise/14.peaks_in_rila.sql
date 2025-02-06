SELECT
    mountain_range,
    peak_name,
    elevation
FROM
    mountains AS m
    JOIN peaks AS p
        ON m.id = p.mountain_id
WHERE
    m.mountain_range = 'Rila'
ORDER BY
    p.elevation DESC;