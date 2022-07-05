/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals
ADD COLUMN species TEXT;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name TEXT,
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name TEXT
);

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);
