-- * CONCAT() 
-- ? combines data for cleaner output
SELECT CONCAT('Hello', ' ', 'World');

SELECT CONCAT(author_fname, ' ', author_lname) AS fullname
FROM books;

SELECT author_fname AS first, author_lname AS last,
    CONCAT(author_fname, ' ', author_lname)
AS 'full'
FROM books;

-- * CONCAT_WS()
-- ? will concat with a seprator (first argument) between each item (in this case ' - ')
SELECT
    CONCAT_WS(' - ', title, author_fname, author_lname)
FROM books;

-- * SUBSTRING()
-- ? will return a substring (these are a 1 based index not 0 like js) 
-- 2 arguments will be starting and ending index INCLUSIVE ie ('hello world', 1, 4) hell
-- 1 argument will return whatever word is on that index ie ('hello world', 7) returns world
-- negative arguments start from the end of the string going backwards
SELECT SUBSTRING('Hello World', 1, 4);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING(title, 1, 10)
FROM books;

SELECT SUBSTRING(title, 1, 10) AS 'short title'
FROM books;

-- ! can use concat with substring
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    )
FROM books;

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;

-- * REPLACE()
--  ? replaces parts of strings ie. all spaces with commas
SELECT REPLACE('Hello World', 'Hell', '%$#@');

SELECT REPLACE('Hello World', 'l', '7');

SELECT REPLACE('Hello World', 'o', '0');

SELECT REPLACE('HellO World', 'o', '*');

SELECT
    REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REPLACE(title, 'e ', '3')
FROM books;

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
FROM books;

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string'
FROM books;

-- * REVERSE()
-- ? reverses strings
SELECT REVERSE('Hello World');

SELECT REVERSE('meow meow');

SELECT REVERSE(author_fname)
FROM books;

SELECT CONCAT('woof', REVERSE('woof'));

SELECT CONCAT(author_fname, REVERSE(author_fname))
FROM books;

--  * CHAR_LENGTH
-- ? returns the number of characters in a string
SELECT CHAR_LENGTH('Hello World');

SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length'
FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long')
FROM books;

-- * UPPER() & LOWER()
-- ? change case of a string making it all caps or all lowercase
SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;