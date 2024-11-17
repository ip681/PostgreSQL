SELECT
    peak_name,
    RIGHT(peak_name, 4) AS positive_left,
    RIGHT(peak_name, -4) AS negative_right
FROM
    peaks;