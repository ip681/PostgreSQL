CREATE TABLE notification_emails (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recipient_id INT,
    subject VARCHAR(50),
    body VARCHAR(100)
);

CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER
AS
$$
    BEGIN
        INSERT INTO
            notification_emails (recipient_id, subject, body)
        VALUES
            (
             NEW.account_id,
             CONCAT_WS(' ', 'Balance change for account:', NEW.account_id),
             CONCAT(
                'On', ' ', DATE(NOW()), ' ',
                'your balance was changed from', ' ',
                NEW.old_sum, ' ', 'to', ' ', NEW.new_sum, '.')
            );

        RETURN NEW;
    END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW
WHEN (OLD.new_sum <> NEW.new_sum)
EXECUTE PROCEDURE trigger_fn_send_email_on_balance_change();


-- test code
-- 
-- UPDATE logs
-- SET
--     new_sum = new_sum + 100
-- WHERE
--     account_id = 1;
-- 
-- SELECT * FROM logs;
-- SELECT * FROM notification_emails;