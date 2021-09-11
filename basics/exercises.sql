-- * WHERE challenges
-- TODO select all cats but only return their id
SELECT cat_id
FROM cats;
-- TODO select all cats but only return their name and breed
SELECT name,
    breed
from cats;
-- TODO select only tabby cats and return name and age
SELECT name,
    age
FROM cats
WHERE breed = 'Tabby';
-- TODO select only cats that id and age are the same and only return id and age
SELECT cat_id,
    age
FROM cats
WHERE cat_id = age;
-- * UPDATE challenges
-- TODO change Jacksons name to Jack
UPDATE cats
SET name = 'Jack'
WHERE name = 'Jackson';
-- TODO change Ringos breed to 'British Shorthair'
UPDATE cats
SET breed = 'British Shorthair'
WHERE name = 'Ringo';
-- TODO change all Main coon cats to be age 12
UPDATE cats
SET age = 12
WHERE breed = 'Maine Coon';
-- * DELETE challenges
-- TODO delete all 4 year old cats
DELETE FROM cats
WHERE age = 4;
-- TODO delete cats whose age is the same as their cat_id
DELETE FROM cats
WHERE age = cat_id;
-- TODO delete all cats
DELETE FROM cats;
-- * CREATE challenges
-- TODO create a shirts_db
CREATE DATABASE shirts_db -- TODO create shirts table
CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR (100) NOT NULL,
    color VARCHAR (100) NOT NULL,
    shirt_size VARCHAR (10) NOT NULL,
    last_worn INT NOT NULL,
    PRIMARY KEY (shirt_id)
);
-- TODO insert data into shirts table
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);
-- TODO insert a purple polo shirt, size M last worn 50 days ago
INSERT INTO shirts (color, article, shirt_size, last_worn)
VALUES ('purple', 'polo shirt', 'M', 50);
-- * SELECT challenges
-- TODO return article and color only of all shirts
SELECT article,
    color
FROM shirts;
-- TODO return everything but shirt_id of all medium shirts
SELECT article,
    color,
    shirt_size,
    last_worn
FROM shirts
WHERE shirt_size = 'M';
-- * UPDATE challenges
-- TODO change all polo shirt sizes to L
UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';
-- TODO change the shirt last worn 15 days ago to be 0 days ago
UPDATE shirts
SET last_worn = 0
WHERE last_worn = 15;
-- TODO change all white shirts shirt size to xs and color to off white
UPDATE shirts
SET shirt_size = 'XS',
    color = 'off white'
WHERE color = 'white';
-- * DELETE challenges
-- TODO delete all shirts worn 200 days ago
DELETE FROM shirts
WHERE last_worn = 200;
-- TODO delete all tank tops
DELETE FROM shirts
WHERE article = 'tank top';
-- TODO delete all shirts
DELETE FROM shirts;
-- * DROP challenges
-- TODO drop entire shirts table
DROP TABLE shirts;