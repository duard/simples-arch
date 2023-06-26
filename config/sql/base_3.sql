CREATE DATABASE persons;

\c pessoas;

CREATE TABLE "persons" (
    "id" INT NOT NULL,
    "description" VARCHAR(2) NOT NULL,
    CONSTRAINT "pk_persons" PRIMARY KEY ("id")
);

-- CREATE TABLE "persons_data" (
--     "name" CHAR(2) NOT NULL,
--     "second_name" VARCHAR(20) NOT NULL,
--     "person_id" INT NOT NULL,
--     CONSTRAINT "pk_persons" PRIMARY KEY ("SiglaEstado"),
--     CONSTRAINT "fk_persons_persons_data" FOREIGN KEY ("person_id") REFERENCES "persons" ("id")
-- );

-- CREATE TABLE quotes
-- (
--     id     INTEGER PRIMARY KEY,
--     quote  VARCHAR(1024),
--     author VARCHAR(256)
-- );
