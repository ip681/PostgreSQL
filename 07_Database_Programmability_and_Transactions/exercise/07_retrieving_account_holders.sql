CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
    searched_balance NUMERIC
)
AS
$$
    DECLARE
        holder_balance_info RECORD;
    BEGIN
        FOR holder_balance_info IN
            SELECT
                CONCAT(ah.first_name, ' ', ah.last_name) AS full_name,
                SUM(a.balance) AS total_balance
            FROM
                account_holders AS ah
                    JOIN accounts AS a
                        ON ah.id = a.account_holder_id
            GROUP BY
                full_name
            HAVING
                SUM(balance) > searched_balance
            ORDER BY
                full_name
        LOOP
            RAISE NOTICE '% - %', holder_balance_info.full_name, holder_balance_info.total_balance;
        END LOOP;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- CALL sp_retrieving_holders_with_balance_higher_than(200000);