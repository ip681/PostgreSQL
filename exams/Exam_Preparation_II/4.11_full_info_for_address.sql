CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
    address_name VARCHAR(100)
)
AS
$$
    BEGIN
        TRUNCATE TABLE search_results;
        INSERT INTO search_results (
            address_name,
            full_name,
            level_of_bill,
            make,
            condition,
            category_name
        )
        SELECT
            address_name,
            cl.full_name,
            CASE
                WHEN cr.bill <= 20 THEN 'Low'
                WHEN cr.bill <= 30 THEN 'Medium'
                ELSE 'High'
            END,
            c.make,
            c.condition,
            cat.name
        FROM
            addresses AS a
            JOIN courses AS cr
                ON a.id = cr.from_address_id
            JOIN clients AS cl
                ON cr.client_id = cl.id
            JOIN cars AS c
                ON cr.car_id = c.id
            JOIN categories AS cat
                ON c.category_id = cat.id
        WHERE
            a.name = address_name
        ORDER BY
            c.make,
            cl.full_name;
    END;
$$
LANGUAGE plpgsql;