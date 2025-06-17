CREATE TABLE IF NOT EXISTS accounts (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT NOT NULL,
    job_title VARCHAR(40) NOT NULL,
    ip VARCHAR(30)NOT NULL,

    CONSTRAINT ck_accounts_gender_is_m_or_f
        CHECK(gender IN ('M', 'F'))
);

CREATE TABLE IF NOT EXISTS addresses (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    street VARCHAR(30) NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    account_id INT NOT NULL,

    CONSTRAINT fk_addresses_accounts
        FOREIGN KEY (account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS photos (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    description TEXT,
    capture_date TIMESTAMP NOT NULL,
    views INT DEFAULT 0 NOT NULL,

    CONSTRAINT ck_photos_views_is_positive_or_0
        CHECK(views >= 0)
);

CREATE TABLE IF NOT EXISTS comments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    published_on TIMESTAMP NOT NULL,
    photo_id INT NOT NULL,

    CONSTRAINT fk_comments_photos
        FOREIGN KEY (photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS accounts_photos (
    account_id INT NOT NULL,
    photo_id INT NOT NULL,

    CONSTRAINT pk_accounts_photos
        PRIMARY KEY (account_id, photo_id),

    CONSTRAINT fk_accounts_photos_accounts
        FOREIGN KEY (account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_accounts_photos_photos
        FOREIGN KEY (photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS likes (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    photo_id INT NOT NULL,
    account_id INT NOT NULL,

    CONSTRAINT fk_likes_photos
        FOREIGN KEY (photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    CONSTRAINT fk_likes_accounts
        FOREIGN KEY (account_id) REFERENCES accounts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);