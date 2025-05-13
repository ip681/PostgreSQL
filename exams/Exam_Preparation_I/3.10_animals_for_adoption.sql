SELECT
    a.name AS animal,
    EXTRACT(YEAR FROM a.birthdate) AS birth_year,
    at.animal_type
FROM animals AS a
    LEFT JOIN animal_types AS at
    ON a.animal_type_id = at.id
        LEFT JOIN owners AS o
        ON a.owner_id = o.id
WHERE
    a.owner_id IS NULL AND
    age('01/01/2022', a.birthdate) < '5 YEARS' AND
    at.animal_type <> 'Birds'
ORDER BY
    animal;