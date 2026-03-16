CREATE DATABASE ut;

CREATE TABLE animals (
                         id bigserial,
                         name varchar(20),
                         age integer,
                         kind varchar(20),
                         dob date,
                         location varchar(50)
);

TABLE animals; -- SELECT * FROM animals;

INSERT INTO animals (name, age, kind, dob, location)
VALUES ('Cat', 45, 'Tiger', '2010-10-10', 'Seoul, Korea'),
       ('Sponge', 10, 'Cat', '2024-01-02', 'Oregon, US'),
       ('Wind', 4, 'Dog', '2022-02-24', 'Paris, France'),
       ('Fubao', 5, 'Panda', '2024-02-10', 'Beijing, China');