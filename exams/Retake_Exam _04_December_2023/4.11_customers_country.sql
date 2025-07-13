CREATE OR REPLACE PROCEDURE sp_customer_country_name(
    IN customer_full_name VARCHAR(50),
    OUT country_name VARCHAR(50)
)
AS
$$
    BEGIN
        SELECT
            cou.name INTO country_name
        FROM
            customers AS cus
            JOIN countries AS cou
            ON cou.id = cus.country_id
        WHERE
            CONCAT(cus.first_name, ' ', cus.last_name) = customer_full_name;
    END;
$$
LANGUAGE plpgsql;

-- test code
--
-- CALL sp_customer_country_name('Betty Wallace', '');
-- CALL sp_customer_country_name('Rachel Bishop', '');
-- CALL sp_customer_country_name('Jerry Andrews', '');