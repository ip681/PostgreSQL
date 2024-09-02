CREATE TABLE employees(
	id serial NOT NULL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(50),
	hiring_date DATE DEFAULT '2023-01-01',
	salary NUMERIC(10, 2),
	devices_number INT
);

CREATE TABLE departments(
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	code CHAR(3),
	description TEXT
);

CREATE TABLE issues(
	id SERIAL UNIQUE PRIMARY KEY,
	description VARCHAR(150),
	date DATE,
	start TIMESTAMP
);
