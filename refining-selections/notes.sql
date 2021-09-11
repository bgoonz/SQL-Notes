-- * DISTINCT
-- ? works with SELECT to return only distinct results without repeated values
SELECT author_lname
FROM books;

SELECT DISTINCT author_lname
FROM books;

SELECT author_fname, author_lname
FROM books;

SELECT DISTINCT CONCAT(author_fname,' ', author_lname)
FROM books;

SELECT DISTINCT author_fname, author_lname
FROM books;

-- * ORDER BY & ASC DESC
-- ? used to sort results data ASC DESC specify ascending or descending, can also order by a number corresponding to the SELECTED column you want to order by ie. SELECT title, author_fname, author_lname.. ORDER BY 2 will return data ordered by author_fname, can also sort by more than one column but not commonly used
-- ! you do not have to select the column you want to order by
SELECT author_lname
FROM books
ORDER BY author_lname;

SELECT title
FROM books
ORDER BY title;

SELECT author_lname
FROM books
ORDER BY author_lname DESC;

SELECT released_year
FROM books
ORDER BY released_year ASC;

SELECT title, pages
FROM books
ORDER BY released_year;

SELECT title, author_fname, author_lname
FROM books
ORDER BY 2;

SELECT author_fname, author_lname
FROM books
ORDER BY author_lname, author_fname;

-- * LIMIT
-- ? limits results by a number, more often used with ORDER BY.. can take a starting point and how many to return from there LIMIT 4, 9 inclusive (useful for pagination!) 
-- ! this in on a zero based index
SELECT title
FROM books LIMIT
3;

SELECT title, released_year
FROM books
ORDER BY released_year DESC LIMIT 5;
 
SELECT title
, released_year 
FROM books 
ORDER BY released_year DESC LIMIT 0,5;

SELECT title, released_year
FROM books
ORDER BY released_year DESC LIMIT 10,1;
 
SELECT title
FROM books LIMIT 5, 123219476457;

-- * LIKE
-- ? returns partial matches, syntax '%da%' uses optional wildcards (%) to match anything with 'da' in it, 'da%' will only return anything starting with 'da', no wildcards does an exact match 
-- ! backslash will escape a % sign ('%\%%') if you need to search for something with an actual % sign in it
SELECT title, author_fname
FROM books
WHERE author_fname LIKE '%da%';

SELECT title, author_fname
FROM books
WHERE author_fname LIKE 'da%';

SELECT title
FROM books
WHERE  title LIKE '%the';

SELECT title
FROM books
WHERE title LIKE '%the%';

SELECT title
FROM books
WHERE title LIKE '%\%%'

SELECT title
FROM books
WHERE title LIKE '%\_%'

-- * more Wildcards '_'
-- ? and _ will specify a wildcard representing exactly 1 character, useful for finding numbers exactly <4> digits long or some number, also very useful for finding patterns ie. phone numbers... ((235)234-0987 LIKE '(___)___-____')
SELECT title, stock_quantity
FROM books
WHERE stock_quantity LIKE '____';

SELECT title, stock_quantity
FROM books
WHERE stock_quantity LIKE '__';


