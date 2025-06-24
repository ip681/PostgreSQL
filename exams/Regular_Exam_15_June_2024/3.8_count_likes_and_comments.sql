SELECT
    p.id AS photo_id,
    (SELECT COUNT(*) FROM likes AS l WHERE l.photo_id = p.id) AS likes_count,
    (SELECT COUNT(*) FROM comments AS c WHERE c.photo_id = p.id) AS comments_count
FROM
    photos AS p
ORDER BY
    likes_count DESC,
    comments_count DESC,
    photo_id;


-- SELECT
--     p.id AS photo_id,
--     COALESCE(l.count, 0) AS likes_count,
--     COALESCE(c.count, 0) AS comments_count
-- FROM
--     photos AS p
--     LEFT JOIN (
--         SELECT
--             photo_id,
--             COUNT(id)
--         FROM
--             likes
--         GROUP BY
--             photo_id
--     ) AS l
--         ON p.id = l.photo_id
--     LEFT JOIN (
--         SELECT
--             photo_id,
--             COUNT(id)
--         FROM
--             comments
--         GROUP BY
--             photo_id
--     ) AS c
--         ON p.id = c.photo_id
-- ORDER BY
--     likes_count DESC,
--     comments_count DESC,
--     photo_id;