SELECT
    id,
    concat_ws(
    ' ',
    first_name,
    middle_name,
    last_name
    ) AS full_name,
    hire_date
FROM
    employees
ORDER BY
    hire_date
OFFSET 9;