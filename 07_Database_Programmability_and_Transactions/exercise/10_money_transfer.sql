CREATE OR REPLACE PROCEDURE sp_transfer_money(
    sender_id INT,
    receiver_id INT,
    amount NUMERIC(4)
)
AS
$$
    DECLARE
        sender_balance NUMERIC;
    BEGIN
        SELECT balance INTO sender_balance FROM accounts AS a WHERE a.id = sender_id;

        IF amount > sender_balance THEN
            ROLLBACK;
        END IF;

        CALL sp_withdraw_money(sender_id, amount);
        CALL sp_deposit_money(receiver_id, amount);
        COMMIT;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- CALL sp_transfer_money(5, 1, 5000.0000);
-- SELECT * FROM accounts WHERE id IN (5, 1);
--
-- CALL sp_transfer_money(10, 2, 1043.9000);
--
-- CALL sp_transfer_money(13, 15, 400.9000);
-- SELECT * FROM accounts WHERE id IN (13, 15);