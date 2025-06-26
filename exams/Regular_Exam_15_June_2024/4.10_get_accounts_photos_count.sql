CREATE OR REPLACE FUNCTION udf_accounts_photos_count(
    IN account_username VARCHAR(30)
)
RETURNS INT
AS
$$
    BEGIN
        RETURN
            (SELECT
                COUNT(p.id)
            FROM
                photos AS p
                JOIN accounts_photos AS ap
                    ON p.id = ap.photo_id
                JOIN accounts AS a
                    ON ap.account_id = a.id
            WHERE
                a.username = account_username);
    END;
$$
LANGUAGE plpgsql;

-- test code
--
-- SELECT udf_accounts_photos_count('ssantryd') AS photos_count;