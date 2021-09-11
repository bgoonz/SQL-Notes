-- TODO reverse and uppercase 'Why does my cat look at me with such hatred?'
SELECT REVERSE
    (
    UPPER('Why does my cat look at me with such hatred?')
    );
-- TODO what does the following print out
-- I-like-cats
SELECT
    REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
-- TODO Replace spaces in titles with '->'
SELECT
    REPLACE
    (
        title, ' ', '->'
    ) AS title
FROM books;
-- TODO Print This Out
-- +----------------+----------------+
-- | forwards       | backwards      |
-- +----------------+----------------+
-- | Lahiri         | irihaL         |
-- | Gaiman         | namiaG         |
-- | Gaiman         | namiaG         |
-- | Lahiri         | irihaL         |
-- | Eggers         | sreggE         |
-- | Eggers         | sreggE         |
-- | Chabon         | nobahC         |
-- | Smith          | htimS          |
-- | Eggers         | sreggE         |
-- | Gaiman         | namiaG         |
-- | Carver         | revraC         |
-- | Carver         | revraC         |
-- | DeLillo        | olliLeD        |
-- | Steinbeck      | kcebnietS      |
-- | Foster Wallace | ecallaW retsoF |
-- | Foster Wallace | ecallaW retsoF |
-- | Smith          | htimS          |
-- +----------------+----------------+
SELECT author_lname AS forwards,
    REVERSE(author_lname) AS backwards
FROM books;
-- TODO You know what to do!
-- +----------------------+
-- | full name in caps    |
-- +----------------------+
-- | JHUMPA LAHIRI        |
-- | NEIL GAIMAN          |
-- | NEIL GAIMAN          |
-- | JHUMPA LAHIRI        |
-- | DAVE EGGERS          |
-- | DAVE EGGERS          |
-- | MICHAEL CHABON       |
-- | PATTI SMITH          |
-- | DAVE EGGERS          |
-- | NEIL GAIMAN          |
-- | RAYMOND CARVER       |
-- | RAYMOND CARVER       |
-- | DON DELILLO          |
-- | JOHN STEINBECK       |
-- | DAVID FOSTER WALLACE |
-- | DAVID FOSTER WALLACE |
-- | ADAM SMITH           |
SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) 
AS 'full name in caps'
FROM books;
-- TODO Make this happen!
-- +--------------------------------------------------------------------------+
-- | blurb                                                                    |
-- +--------------------------------------------------------------------------+
-- | The Namesake was released in 2003                                        |
-- | Norse Mythology was released in 2016                                     |
-- | American Gods was released in 2001                                       |
-- | Interpreter of Maladies was released in 1996                             |
-- | A Hologram for the King: A Novel was released in 2012                    |
-- | The Circle was released in 2013                                          |
-- | The Amazing Adventures of Kavalier & Clay was released in 2000           |
-- | Just Kids was released in 2010                                           |
-- | A Heartbreaking Work of Staggering Genius: was released in 2001          |
-- | Coraline was released in 2003                                            |
-- | What We Talk About When We Talk About Love: Stories was released in 1981 |
-- | Where I'm Calling From: Selected Stories was released in 1989            |
-- | White Noise was released in 1985                                         |
-- | Cannery Row was released in 1945                                         |
-- | Oblivion: Stories was released in 2004                                   |
-- | Consider the Lobster was released in 2005                                |
SELECT CONCAT(title, ' was released in ', released_year) 
AS blurb
FROM books;
-- TODO Print book titles and the length of each title
-- +-----------------------------------------------------+-----------------+
-- | title                                               | character count |
-- +-----------------------------------------------------+-----------------+
-- | The Namesake                                        |              12 |
-- | Norse Mythology                                     |              15 |
-- | American Gods                                       |              13 |
-- | Interpreter of Maladies                             |              23 |
-- | A Hologram for the King: A Novel                    |              32 |
-- | The Circle                                          |              10 |
-- | The Amazing Adventures of Kavalier & Clay           |              41 |
-- | Just Kids                                           |               9 |
-- | A Heartbreaking Work of Staggering Genius:          |              42 |
-- | Coraline                                            |               8 |
-- | What We Talk About When We Talk About Love: Stories |              51 |
-- | Where I'm Calling From: Selected Stories            |              40 |
-- | White Noise                                         |              11 |
-- | Cannery Row                                         |              11 |
-- | Oblivion: Stories                                   |              17 |
-- | Consider the Lobster                                |              20 | |
-- +-----------------------------------------------------+-----------------+
SELECT title AS title, CHAR_LENGTH(title) AS 'character count'
FROM books;
-- TODO last one!
-- +---------------+-------------+--------------+
-- | short title   | author      | quantity     |
-- +---------------+-------------+--------------+
-- | American G... | Gaiman,Neil | 12 in stock  |
-- | A Heartbre... | Eggers,Dave | 104 in stock |
-- +---------------+-------------+--------------+
SELECT
    CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    )
AS 'short title',
    CONCAT(author_lname, ',', author_fname) 
AS author,
    CONCAT(stock_quantity, ' in stock')
AS quantity
FROM books
WHERE stock_quantity=12 AND author_fname='Neil' OR stock_quantity=104;

