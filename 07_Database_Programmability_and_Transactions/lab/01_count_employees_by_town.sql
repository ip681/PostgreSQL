CREATE OR REPLACE FUNCTION fn_count_employees_by_town(
    town_name VARCHAR(20)
) RETURNS INT
AS
$$
    DECLARE
        employees_count INT;
    BEGIN
        SELECT
            COUNT(*) INTO employees_count
        FROM
            employees AS e
                JOIN addresses AS a
                    USING (address_id)
                    JOIN towns AS t
                        USING (town_id)
        WHERE t.name = town_name;
        RETURN employees_count;
    END;
$$
LANGUAGE plpgsql;