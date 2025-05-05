SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS coach_full_name,
    CONCAT(p.first_name, ' ', p.last_name) AS player_full_name,
    t.name AS team_name,
    sd.passing,
    sd.shooting,
    sd.speed
FROM
    players_coaches AS pc
    JOIN coaches AS c
        ON pc.coach_id = c.id
    JOIN players AS p
        ON pc.player_id = p.id
    JOIN teams AS t
        ON p.team_id = t.id
    JOIN skills_data AS sd
        ON p.skills_data_id = sd.id
ORDER BY
    coach_full_name,
    player_full_name DESC;