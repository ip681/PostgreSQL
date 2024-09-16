SELECT
    id,
    concat_ws(
    ' ',
    first_name,
    last_name
    ) AS full_name,
    job_title
FROM
    employees
ORDER BY
    first_name
LIMIT 50;
