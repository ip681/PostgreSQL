CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
    OUT owner_name VARCHAR(30)
)
AS
$$
    BEGIN
        SELECT
            o.name INTO owner_name
        FROM owners AS o
            JOIN animals AS a
            ON o.id = a.owner_id
        WHERE
            a.name = animal_name;
        IF owner_name IS NULL THEN owner_name := 'For adoption';
        END IF;
    END;
$$
LANGUAGE plpgsql;

-- test code
--
-- CALL sp_animals_with_owners_or_not('Pumpkinseed Sunfish');
-- CALL sp_animals_with_owners_or_not('Hippo');
-- CALL sp_animals_with_owners_or_not('Brown bear');