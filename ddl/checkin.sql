CREATE TABLE IF NOT EXISTS checkin
(
    business_id VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT business_id_pk PRIMARY KEY (business_id)
);