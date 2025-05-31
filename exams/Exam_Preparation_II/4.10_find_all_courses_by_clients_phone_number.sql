CREATE OR REPLACE FUNCTION fn_courses_by_client(
    phone_num VARCHAR(20)
)
RETURNS INT
AS
$$
    BEGIN
        RETURN
            (SELECT
                COUNT(*)
            FROM
                courses AS cr
                JOIN clients AS cl
                    ON cr.client_id = cl.id
            WHERE
                cl.phone_number = phone_num);
    END;
$$
LANGUAGE plpgsql;