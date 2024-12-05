SELECT
    first_name,
    last_name,
    date_part('year', born)
FROM 
    authors;