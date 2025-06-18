INSERT INTO
    addresses(street, town, country, account_id)
SELECT
    username AS street,
    password AS town,
    ip AS country,
    age AS account_id
FROM
    accounts
WHERE
    gender = 'F';