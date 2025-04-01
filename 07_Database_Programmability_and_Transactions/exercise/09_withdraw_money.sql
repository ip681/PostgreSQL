CREATE OR REPLACE PROCEDURE sp_withdraw_money(
    account_id INT,
    money_amount NUMERIC(4)
)
AS
$$
    DECLARE
        holder_balance NUMERIC;
    BEGIN
        SELECT balance INTO holder_balance FROM accounts AS a WHERE a.id = account_id;

        IF money_amount > holder_balance THEN
            RAISE NOTICE 'Insufficient balance to withdraw: %', holder_balance;
        ELSE
            UPDATE accounts
            SET
                balance = balance - money_amount
            WHERE
                accounts.id = account_id;
        END IF;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- CALL sp_withdraw_money(3, 5050.7500);
-- CALL sp_withdraw_money(6, 5437.0000);
--
-- SELECT * FROM accounts WHERE id IN (3, 6);