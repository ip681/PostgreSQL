CREATE OR REPLACE FUNCTION fn_is_word_comprised (
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
)
RETURNS BOOLEAN
AS
$$
    BEGIN
            IF TRIM(LOWER(word), LOWER(set_of_letters)) = ''
                THEN
                    RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
    END;
$$
LANGUAGE plpgsql;


-- test code
--
-- SELECT fn_is_word_comprised('ois tmiah%f', 'halves');
-- SELECT fn_is_word_comprised('ois tmiah%f', 'Sofia');
-- SELECT fn_is_word_comprised('bobr', 'Rob');
-- SELECT fn_is_word_comprised('papopep', 'toe');
-- SELECT fn_is_word_comprised('R@o!B$B', 'Bob');