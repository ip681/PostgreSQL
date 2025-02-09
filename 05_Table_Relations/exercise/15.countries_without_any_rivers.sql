SELECT
    COUNT(*)
FROM
    countries AS c
    LEFT JOIN countries_rivers AS cr
        USING (country_code)
WHERE
    river_id IS NULL;