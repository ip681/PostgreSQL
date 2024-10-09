CREATE VIEW
    view_initials
AS
SELECT
    substr(first_name, 1, 2) AS initial,
    last_name
FROM
    employees
ORDER BY
    last_name
;