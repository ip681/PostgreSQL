SELECT
    c.last_name,
    CEIL(AVG(bg.rating)) AS average_rating,
    p.name AS publisher_name
FROM
    creators AS c
    JOIN creators_board_games AS cbg
        ON c.id = cbg.creator_id
    JOIN board_games AS bg
        ON cbg.board_game_id = bg.id
    JOIN publishers AS p
        ON bg.publisher_id = p.id
GROUP BY
    c.last_name,
    p.name
HAVING
    p.name = 'Stonemaier Games'
ORDER BY
    average_rating DESC;