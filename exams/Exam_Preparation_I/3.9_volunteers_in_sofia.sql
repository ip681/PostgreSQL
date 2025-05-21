SELECT
    v.name AS volunteers,
    v.phone_number,
    TRIM(v.address, 'Sofia, ') AS address
FROM volunteers AS v
    JOIN volunteers_departments AS vd
    ON vd.id = v.department_id
WHERE
    vd.department_name = 'Education program assistant' AND
    address LIKE '%Sofia%'
ORDER BY
    volunteers;