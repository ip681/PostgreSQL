CREATE OR REPLACE FUNCTION fn_difficulty_level(
    level INT
)
RETURNS VARCHAR(50)
AS
$$
    DECLARE
        difficulty_level VARCHAR(50);
    BEGIN
        IF level > 60 THEN
            difficulty_level := 'Hell Difficulty';
        ELSEIF level > 40 THEN
            difficulty_level := 'Nightmare Difficulty';
        ELSE
            difficulty_level := 'Normal Difficulty';
        END IF;

        RETURN difficulty_level;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- SELECT
--     user_id,
--     level,
--     cash,
--     fn_difficulty_level(level) AS difficulty_level
-- FROM
--     users_games
-- ORDER BY
--     user_id;