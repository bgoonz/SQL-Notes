-- * CHAR & VARCHAR ( 0 - 255)
-- ? Char has a fixed length that you declare when creating the table and will add stored with spaces to the right if not enough characters provided though spaces are removed when retrieving the data
-- ? values will be truncated if too many provided 
-- ? VARCHAR length can vary from originally declared length though not exceed it
-- ? CHAR is faster for fix lengths such as State Abbreviations CA, NY
-- ! otherwise use VARCHAR
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
INSERT INTO dogs (name, breed)
VALUES ('bob', 'beagle');
INSERT INTO dogs (name, breed)
VALUES ('robby', 'corgi');
INSERT INTO dogs (name, breed)
VALUES ('Princess Jane', 'Retriever');
SELECT *
FROM dogs;
INSERT INTO dogs (name, breed)
VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
SELECT *
FROM dogs;
-- * DECIMAL
-- ? Takes 2 arguments DECIMAL(13,2) (max number of digits (range 0-65), how many digits come after (range 0-30)) 
-- ? ie. 999.99 is (5,2) 5 digits long, 2 trailing digits
-- ! if you create a number that is too large it will just enter the largest possible number 
-- ! ie. DECIMAL(5, 2) declared, inserting SOMEVALUE(89768976987) will insert (999.99)
CREATE TABLE items(price DECIMAL(5, 2));
INSERT INTO items(price)
VALUES(7);
INSERT INTO items(price)
VALUES(7987654);
INSERT INTO items(price)
VALUES(34.88);
INSERT INTO items(price)
VALUES(298.9999);
INSERT INTO items(price)
VALUES(1.9999);
SELECT *
FROM items;
-- * FLOAT & DOUBLE
-- ? Where DECIMAL calculations are exact, FLOAT & DOUBLE are approximate
-- ? FLOAT & DOUBLE will store larger numbers using less space than DECIMAL but comes at the cost of precision after about 7 digits for FLOAT and 15 digits for DOUBLE
-- ! always try to use DECIMAL unless precision doesn't really matter
CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price)
VALUES (88.45);
SELECT *
FROM thingies;
INSERT INTO thingies(price)
VALUES (8877.45);
SELECT *
FROM thingies;
INSERT INTO thingies(price)
VALUES (8877665544.45);
SELECT *
FROM thingies;
-- * DATE, TIME & DATETIME
-- ? DATE just stores the date without the time the format is (YYYY-MM-DD)
-- ? TIME just stores teh time without the date the format is (HH:MM:SS)
-- ? DATETIME stores the date and the time the format is (YYYY-MM-DD HH:MM:SS)
CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES(
        'Padma',
        '1983-11-11',
        '10:07:35',
        '1983-11-11 10:07:35'
    );
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES(
        'Larry',
        '1943-12-25',
        '04:10:42',
        '1943-12-25 04:10:42'
    );
SELECT *
FROM people;
-- * CURDATE, CURTIME & NOW
-- ? CURDATE() gives current date
-- ? CURTIME() gives current time
-- ? NOW() gives current date & time
-- ? useful for inserting time data as well as for comparing times and dates to the current time and date
-- * Formatting dates
-- ? There are day & time helper functions for extracting formatted times 
-- find functions here: https://docs.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver15
SELECT name,
    birthdate
FROM people;
SELECT name,
    DAY(birthdate)
FROM people;
SELECT name,
    birthdate,
    DAY(birthdate)
FROM people;
SELECT name,
    birthdate,
    DAYNAME(birthdate)
FROM people;
SELECT name,
    birthdate,
    DAYOFWEEK(birthdate)
FROM people;
SELECT name,
    birthdate,
    DAYOFYEAR(birthdate)
FROM people;
SELECT name,
    birthtime,
    DAYOFYEAR(birthtime)
FROM people;
SELECT name,
    birthdt,
    DAYOFYEAR(birthdt)
FROM people;
SELECT name,
    birthdt,
    MONTH(birthdt)
FROM people;
SELECT name,
    birthdt,
    MONTHNAME(birthdt)
FROM people;
SELECT name,
    birthtime,
    HOUR(birthtime)
FROM people;
SELECT name,
    birthtime,
    MINUTE(birthtime)
FROM people;
SELECT CONCAT(
        MONTHNAME(birthdate),
        ' ',
        DAY(birthdate),
        ' ',
        YEAR(birthdate)
    )
FROM people;
SELECT DATE_FORMAT(birthdt, 'Was born on a %W')
FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y')
FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i')
FROM people;
-- * Date Math
SELECT *
FROM people;
SELECT DATEDIFF(NOW(), birthdate)
FROM people;
SELECT name,
    birthdate,
    DATEDIFF(NOW(), birthdate)
FROM people;
SELECT birthdt
FROM people;
SELECT birthdt,
    DATE_ADD(birthdt, INTERVAL 1 MONTH)
FROM people;
SELECT birthdt,
    DATE_ADD(birthdt, INTERVAL 10 SECOND)
FROM people;
SELECT birthdt,
    DATE_ADD(birthdt, INTERVAL 3 QUARTER)
FROM people;
SELECT birthdt,
    birthdt + INTERVAL 1 MONTH
FROM people;
SELECT birthdt,
    birthdt - INTERVAL 5 MONTH
FROM people;
SELECT birthdt,
    birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR
FROM people;
-- * TIMESTAMPS
-- ? does almost the same thing as DATETIME except the range of DATETIME IS (1000-9999) and the range of TIMESTAMP is (1970-2038) & TIMESTAMP takes up about half the space of DATETME
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
INSERT INTO comments (content)
VALUES('lol what a funny article');
INSERT INTO comments (content)
VALUES('I found this offensive');
INSERT INTO comments (content)
VALUES('Ifasfsadfsadfsad');
SELECT *
FROM comments
ORDER BY created_at DESC;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO comments2 (content)
VALUES('dasdasdasd');
INSERT INTO comments2 (content)
VALUES('lololololo');
INSERT INTO comments2 (content)
VALUES('I LIKE CATS AND DOGS');
UPDATE comments2
SET content = 'THIS IS NOT GIBBERISH'
WHERE content = 'dasdasdasd';
SELECT *
FROM comments2;
SELECT *
FROM comments2
ORDER BY changed_at;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);