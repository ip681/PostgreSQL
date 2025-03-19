CREATE OR REPLACE FUNCTION fn_full_name (
    first_name VARCHAR(20),
    last_name VARCHAR(20)
)
RETURNS VARCHAR (41)
AS
$$
    BEGIN
        RETURN
            INITCAP(CONCAT(first_name, ' ', last_name));
    END;
$$
LANGUAGE plpgsql;


-- test code
-- 
-- SELECT fn_full_name('fred', 'sanford');
-- SELECT fn_full_name('', 'SIMPSONS');
-- SELECT fn_full_name('JOHN', '');
-- SELECT fn_full_name(NULL, NULL);