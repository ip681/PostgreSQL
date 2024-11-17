UPDATE
    countries
SET
    iso_code = UPPER(SUBSTRING(country_name, 1, 3))
WHERE
    iso_code IS NULL;


/* UPDATE
    countries
SET
    iso_code = UPPER(LEFT(country_name, 3))
WHERE
    iso_code IS NULL */