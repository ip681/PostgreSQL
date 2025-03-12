CREATE VIEW continent_currency_usage
AS
SELECT
    ru.continent_code,
    ru.currency_code,
    ru.currency_usage
FROM
    (
        SELECT
            cu.continent_code,
            cu.currency_code,
            cu.currency_usage,
            DENSE_RANK() OVER (PARTITION BY cu.continent_code ORDER BY cu.currency_usage DESC) AS rank_usage
        FROM
            (
                SELECT
                    continent_code,
                    currency_code,
                    COUNT(currency_code) AS currency_usage
                FROM
                    countries
                GROUP BY
                    continent_code,
                    currency_code
                HAVING
                    COUNT(*) > 1
            ) AS cu
    ) AS ru
WHERE
    ru.rank_usage = 1
ORDER BY
    ru.currency_usage DESC;