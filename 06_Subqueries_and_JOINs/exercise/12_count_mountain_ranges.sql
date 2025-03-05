SELECT
    mc.country_code,
    COUNT(m.mountain_range) AS mountain_range_count
FROM
    mountains AS m
        JOIN mountains_countries AS mc
            ON mc.mountain_id = m.id
WHERE
    mc.country_code IN ('US', 'RU', 'BG')
GROUP BY
    mc.country_code
ORDER BY
    mountain_range_count DESC;