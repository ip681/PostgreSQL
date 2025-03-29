CREATE OR REPLACE PROCEDURE sp_deposit_money(
    account_id INT,
    money_amount NUMERIC(4)
)
AS
$$
    BEGIN
        UPDATE accounts
        SET
            balance = balance + money_amount
        WHERE
            id = account_id;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- CALL sp_deposit_money(1, 200);
-- CALL sp_deposit_money(10, 500);
-- CALL sp_deposit_money(14, 1000);
--
-- SELECT * FROM accounts WHERE id IN (1, 10, 14);