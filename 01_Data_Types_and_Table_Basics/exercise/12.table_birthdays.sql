CREATE TABLE IF NOT EXISTS minions_birthdays(
    id SERIAL UNIQUE NOT NULL,
    name VARCHAR(50),
    date_of_birth DATE,
    age INTEGER,
    present VARCHAR(100),
    party TIMESTAMPTZ
);