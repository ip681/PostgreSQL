SELECT
    substring("River Information", '[0-9]{1,4}') AS river_length
FROM
    view_river_info;


/* SELECT
	(REGEXP_MATCHES("River Information", '[0-9]{1,4}'))[1] AS river_length
FROM
	view_river_info; */