SELECT
    department_id,
    COUNT(*) AS employee_count
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;