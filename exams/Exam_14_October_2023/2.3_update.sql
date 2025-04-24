UPDATE coaches
SET
    salary = salary * coach_level
WHERE
    first_name LIKE 'C%'
    AND
    (SELECT
        COUNT(*)
    FROM
        players AS p
        JOIN players_coaches AS pc
            ON p.id = pc.player_id
    WHERE
        coaches.id = pc.coach_id) > 0;