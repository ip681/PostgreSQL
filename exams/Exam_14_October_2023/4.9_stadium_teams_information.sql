CREATE OR REPLACE FUNCTION fn_stadium_team_name(
    IN stadium_name VARCHAR(30)
)
RETURNS TABLE (teams_name VARCHAR(50))
AS
$$
    BEGIN
        RETURN QUERY
        SELECT
            t.name
        FROM
            teams AS t
            JOIN stadiums AS s
                ON t.stadium_id = s.id
        WHERE
            s.name = stadium_name
        ORDER BY
            t.name;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- SELECT fn_stadium_team_name('BlogXS');
-- SELECT fn_stadium_team_name('Quaxo');
-- SELECT fn_stadium_team_name('Jaxworks');