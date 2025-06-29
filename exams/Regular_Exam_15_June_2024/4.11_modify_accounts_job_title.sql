CREATE OR REPLACE PROCEDURE udp_modify_account(
    address_street VARCHAR(30),
    address_town VARCHAR(30)
)
AS
$$
    BEGIN
        UPDATE accounts
        SET
            job_title = CONCAT('(Remote) ', job_title)
        WHERE
            id IN (
                SELECT
                    ac.id
                FROM
                    addresses AS ad
                    JOIN accounts AS ac
                        ON ad.account_id = ac.id
                WHERE
                    ad.street = address_street
                    AND
                    ad.town = address_town
                );
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- CALL udp_modify_account('97 Valley Edge Parkway', 'Nonexistent');
-- SELECT a.username, a.gender, a.job_title FROM accounts AS a
-- WHERE a.job_title ILIKE '(Remote)%';
--
-- CALL udp_modify_account('97 Valley Edge Parkway', 'Divinópolis');
-- SELECT a.username, a.gender, a.job_title FROM accounts AS a
-- WHERE a.job_title ILIKE '(Remote)%';

