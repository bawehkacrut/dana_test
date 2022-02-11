-- create schema
CREATE SCHEMA IF NOT EXISTS staging;

CREATE SCHEMA IF NOT EXISTS ods;

CREATE SCHEMA IF NOT EXISTS data_warehouse;

CREATE SCHEMA IF NOT EXISTS data_mart;

-- create table for staging schema
CREATE TABLE IF NOT EXISTS staging.checkin
(
    business_id VARCHAR(50) NOT NULL,
    date TEXT NULL
);

CREATE INDEX IF NOT EXISTS business_id_checkin
ON staging.checkin(business_id);

CREATE TABLE IF NOT EXISTS staging.business
(
    business_id VARCHAR(50) NOT NULL,
    name VARCHAR (255) NULL,
    address TEXT NULL,
    city    VARCHAR(100) NULL,
    state   VARCHAR(100) NULL,
    postal_code VARCHAR(50) NULL,
    latitude VARCHAR(100) NULL,
    longitude VARCHAR(100) NULL,
    stars   VARCHAR(100) NULL,
    review_count VARCHAR(100) NULL,
    is_open TEXT NULL,
    attributes TEXT NULL,
    categories TEXT NULL,
    hours TEXT NULL,
    CONSTRAINT business_id_pk PRIMARY KEY (business_id)
);

CREATE TABLE IF NOT EXISTS staging.review
(
    business_id VARCHAR(50) NOT NULL,
    name VARCHAR (255) NULL,
    address TEXT NULL,
    city    VARCHAR(100) NULL,
    state   VARCHAR(100) NULL,
    postal_code VARCHAR(50) NULL,
    latitude VARCHAR(100) NULL,
    longitude VARCHAR(100) NULL,
    stars   VARCHAR(100) NULL,
    review_count VARCHAR(100) NULL,
    is_open TEXT NULL,
    attributes TEXT NULL,
    categories TEXT NULL,
    hours TEXT NULL,
    CONSTRAINT business_id_pk PRIMARY KEY (business_id)
);

REATE TABLE IF NOT EXISTS staging.user
(
    user_id VARCHAR(50) NOT NULL,
    name VARCHAR(50) NULL,
    review_count VARCHAR(50) NULL,
    yelping_since    VARCHAR(50) NULL,
    useful   VARCHAR(50) NULL,
    funny VARCHAR(50) NULL,
    cool VARCHAR(50) NULL,
    elite VARCHAR(50) NULL,
    friends   VARCHAR(50) NULL
    fans VARCHAR(50) NULL,
    average_stars VARCHAR(50) NULL,
    compliment_hot VARCHAR(50) NULL,
    compliment_more VARCHAR(50) NULL,
    compliment_profile VARCHAR(50) NULL,
    compliment_cute VARCHAR(50) NULL,
    compliment_list VARCHAR(50) NULL,
    compliment_note VARCHAR(50) NULL,
    compliment_plain VARCHAR(50) NULL,
    compliment_cool VARCHAR(50) NULL,
    compliment_funny VARCHAR(50) NULL,
    compliment_writer VARCHAR(50) NULL,
    compliment_photos VARCHAR(50) null,
    CONSTRAINT user_id_pk PRIMARY KEY (user_id)
);
