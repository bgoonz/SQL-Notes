-- * CREATE database
CREATE DATABASE employees_db --USE employees_db
-- * CREATE table
CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    -- ? Another way of defining a primary key:
    -- id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employeed',
    PRIMARY KEY (id)
);
-- * view table schema
-- DESC employees;
INSERT INTO employees (first_name, last_name, age)
VALUES ('Dora', 'Smith', 58);
SELECT *
FROM employees;
-- * delete a database
DROP DATABASE employees_db;
-- * show all dbs
-- show databases;
-- * use a db
- - USE < db name > CREATE DATABASE cats_app -- * use a db
-- USE cats_app
CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
INSERT INTO cats (name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
    ('Cindy', 'Maine Coon', 10),
    ('Dumbledore', 'Maine Coon', 11),
    ('Egg', 'Persian', 4),
    ('Misty', 'Tabby', 13),
    ('George Michael', 'Ragdoll', 9),
    ('Jackson', 'Sphynx', 7);
-- * SELECT
SELECT *
FROM cats;
SELECT name
FROM cats;
SELECT age
FROM cats;
SELECT cat_id
FROM cats;
SELECT name,
    age
FROM cats;
SELECT cat_id,
    name,
    age
FROM cats;
SELECT age,
    breed,
    name,
    cat_id
FROM cats;
SELECT cat_id,
    name,
    age,
    breed
FROM cats;
-- * WHERE
-- Select by age:
SELECT *
FROM cats
WHERE age = 4;
-- Select by name:
SELECT *
FROM cats
WHERE name = 'Egg';
-- Notice how it deals with case:
SELECT *
FROM cats
WHERE name = 'egG';
-- * Aliases
SELECT cat_id AS id,
    name
FROM cats;
SELECT name AS 'cat name',
    breed AS 'kitty breed'
FROM cats;
-- * UPDATE
-- ? a good rule of thumb is to run SELECT WHERE query before UPDATE to make sure you don't update the wrong data
UPDATE cats
SET breed = 'Shorthair'
WHERE breed = 'Tabby';
UPDATE cats
SET age = 14
WHERE name = 'Misty';
-- * DELETE
-- ! running DELETE FROM cats will delete all entries in a table
DELETE FROM cats
WHERE name = 'Egg';
DELETE FROM cats
WHERE name = 'egg';
DELETE FROM cats;