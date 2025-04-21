CREATE TABLE IF NOT EXISTS towns (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS stadiums (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    capacity INT NOT NULL,
    town_id INT NOT NULL,

    CONSTRAINT ck_stadiums_capacity_is_positive
        CHECK (capacity > 0),

    CONSTRAINT fk_stadiums_towns
        FOREIGN KEY (town_id) REFERENCES towns(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS teams (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base INT DEFAULT 0 NOT NULL,
    stadium_id INT NOT NULL,

    CONSTRAINT ck_teams_fan_base_is_positive_or_0
        CHECK(fan_base >= 0),

    CONSTRAINT fk_teams_stadiums
        FOREIGN KEY (stadium_id) REFERENCES stadiums(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS coaches (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 NOT NULL,
    coach_level INT DEFAULT 0 NOT NULL,

    CONSTRAINT ck_coaches_salary_is_positive_or_0
        CHECK(salary >= 0),

    CONSTRAINT ck_coaches_coach_level_is_positive_or_0
        CHECK(coach_level >= 0)
);

CREATE TABLE IF NOT EXISTS skills_data (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dribbling INT DEFAULT 0,
    pace INT DEFAULT 0,
    passing INT DEFAULT 0,
    shooting INT DEFAULT 0,
    speed INT DEFAULT 0,
    strength INT DEFAULT 0,

    CONSTRAINT ck_skills_data_dribbling_is_positive_or_0
        CHECK(dribbling >= 0),

    CONSTRAINT ck_skills_data_pace_is_positive_or_0
        CHECK(pace >= 0),

    CONSTRAINT ck_skills_data_passing_is_positive_or_0
        CHECK(passing >= 0),

    CONSTRAINT ck_skills_data_shooting_is_positive_or_0
        CHECK(shooting >= 0),

    CONSTRAINT ck_skills_data_speed_is_positive_or_0
        CHECK(speed >= 0),

    CONSTRAINT ck_skills_data_strength_is_positive_or_0
        CHECK(strength >= 0)
);

CREATE TABLE IF NOT EXISTS players (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT DEFAULT 0 NOT NULL,
    position CHAR(1) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 NOT NULL,
    hire_date TIMESTAMP,
    skills_data_id INT NOT NULL,
    team_id INT,

    CONSTRAINT ck_players_age_is_positive_or_0
        CHECK(age >= 0),

    CONSTRAINT ck_players_salary_is_positive_or_0
        CHECK(salary >= 0),

    CONSTRAINT fk_players_skills_data
        FOREIGN KEY (skills_data_id) REFERENCES skills_data(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    CONSTRAINT fk_players_teams
        FOREIGN KEY (team_id) REFERENCES teams(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS players_coaches (
    player_id INT,
    coach_id INT,

    CONSTRAINT fk_players_coaches_players
        FOREIGN KEY (player_id) REFERENCES players(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_players_coaches_coaches
        FOREIGN KEY (coach_id) REFERENCES coaches(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);