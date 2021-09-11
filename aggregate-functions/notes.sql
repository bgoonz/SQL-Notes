--  * COUNT function
-- ? counts what you tell it to count
SELECT COUNT(*)
FROM books;
SELECT COUNT(author_fname)
FROM books;
SELECT COUNT(DISTINCT author_fname)
FROM books;
SELECT COUNT(DISTINCT author_lname)
FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname)
FROM books;
SELECT COUNT(*)
FROM books
WHERE title LIKE '%the%';
-- * GROUP BY
-- ? groups results of query by summarizing or aggregating identical data into single rows creates 'super rows' containing all SELECTED items belonging to item being grouped by
SELECT title,
    author_lname
FROM books
GROUP BY author_lname;
SELECT author_lname,
    COUNT(*)
FROM books
GROUP BY author_lname;
SELECT title,
    author_fname,
    author_lname
FROM books
GROUP BY author_lname;
SELECT author_fname,
    author_lname,
    COUNT(*)
FROM books
GROUP BY author_lname;
SELECT author_fname,
    author_lname,
    COUNT(*)
FROM books
GROUP BY author_lname,
    author_fname;
SELECT released_year,
    COUNT(*)
FROM books
GROUP BY released_year;
SELECT CONCAT(
        'In ',
        released_year,
        ' ',
        COUNT(*),
        ' book(s) released'
    ) AS year
FROM books
GROUP BY released_year;
-- * Min and Max Basics
-- ? help identify minimum or maximum values in a table
SELECT MIN(released_year)
FROM books;
SELECT MIN(released_year)
FROM books;
SELECT MIN(pages)
FROM books;
SELECT MAX(pages)
FROM books;
SELECT MAX(released_year)
FROM books;
-- * Subqueries (can be slow since running multiple queries) workaround would be to use ORDER BY ASC or DESC and LIMIT instead of MIN MAX
--  ! this will not print the title of the book with most pages, it will print the number of pages in the longest book and the first title it finds.. need to use subqueries
SELECT MAX(pages),
    title
FROM books;
-- ? subqueries allow running one query inside of another to fix issues like above, executes a query and uses the results to do another query
SELECT *
FROM books
WHERE pages = (
        SELECT Min(pages)
        FROM books
    );
SELECT title,
    pages
FROM books
WHERE pages = (
        SELECT Max(pages)
        FROM books
    );
SELECT title,
    pages
FROM books
WHERE pages = (
        SELECT Min(pages)
        FROM books
    );
SELECT *
FROM books
ORDER BY pages ASC
LIMIT 1;
SELECT title,
    pages
FROM books
ORDER BY pages ASC
LIMIT 1;
SELECT *
FROM books
ORDER BY pages DESC
LIMIT 1;
-- * MIN & MAX with GROUP BY
-- ? finds the min or max value and groups results by something you define
SELECT author_fname,
    author_lname,
    Min(released_year)
FROM books
GROUP BY author_lname,
    author_fname;
SELECT author_fname,
    author_lname,
    Max(pages)
FROM books
GROUP BY author_lname,
    author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
    author_fname;
-- * SUM
-- ? sums together data
SELECT SUM(pages)
FROM books;
SELECT SUM(released_year)
FROM books;
SELECT author_fname,
    author_lname,
    Sum(pages)
FROM books
GROUP BY author_lname,
    author_fname;
SELECT author_fname,
    author_lname,
    Sum(released_year)
FROM books
GROUP BY author_lname,
    author_fname;
-- * AVG
-- ? sums and divides data to find the average
SELECT AVG(released_year)
FROM books;
SELECT AVG(pages)
FROM books;
SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;
SELECT released_year,
    AVG(stock_quantity)
FROM books
GROUP BY released_year;
SELECT author_fname,
    author_lname,
    AVG(pages)
FROM books
GROUP BY author_lname,
    author_fname;