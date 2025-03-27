CREATE OR REPLACE FUNCTION fn_cash_in_users_games(
    game_name VARCHAR(50)
)
RETURNS TABLE (
    total_cash NUMERIC
    )
AS
$$
    BEGIN
        RETURN QUERY
        WITH row_ranked_users AS (
            SELECT
                cash,
                ROW_NUMBER() OVER (ORDER BY cash DESC) AS row_num
            FROM
                users_games AS ug
                    JOIN games AS g
                        ON ug.game_id = g.id
            WHERE
                g.name = game_name
        )

        SELECT
            ROUND(SUM(cash), 2) AS total_cash
        FROM
            row_ranked_users AS rru
        WHERE
            rru.row_num % 2 <> 0;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- SELECT fn_cash_in_users_games('Love in a mist');
-- SELECT fn_cash_in_users_games('Delphinium Pacific Giant');