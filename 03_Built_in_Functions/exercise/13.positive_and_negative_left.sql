SELECT
    peak_name,
    LEFT(peak_name, 4) AS peak_left,
    LEFT(peak_name, -4) AS peak_right
FROM
    peaks;