-- TODO Print this:
-- +----------------------+--------+
-- | title                | rating |
-- +----------------------+--------+
-- | Archer               |    8.0 |
-- | Archer               |    7.5 |
-- | Archer               |    8.5 |
-- | Archer               |    7.7 |
-- | Archer               |    8.9 |
-- | Arrested Development |    8.1 |
-- | Arrested Development |    6.0 |
-- | Arrested Development |    8.0 |
-- | Arrested Development |    8.4 |
-- | Arrested Development |    9.9 |
-- | Bob's Burgers        |    7.0 |
-- | Bob's Burgers        |    7.5 |
-- | Bob's Burgers        |    8.0 |
-- | Bob's Burgers        |    7.1 |
-- | Bob's Burgers        |    8.0 |
-- +----------------------+--------+
SELECT title,
    rating
FROM series
    JOIN reviews ON series.id = reviews.series_id
LIMIT 15;
-- TODO Print this:
-- +----------------------+------------+
-- | title                | avg_rating |
-- +----------------------+------------+
-- | General Hospital     |    5.38000 |
-- | Bob's Burgers        |    7.52000 |
-- | Seinfeld             |    7.60000 |
-- | Bojack Horseman      |    7.94000 |
-- | Arrested Development |    8.08000 |
-- | Curb Your Enthusiasm |    8.12000 |
-- | Archer               |    8.12000 |
-- | Freaks and Geeks     |    8.60000 |
-- | Stranger Things      |    8.76667 |
-- | Breaking Bad         |    9.36000 |
-- | Fargo                |    9.40000 |
-- | Halt and Catch Fire  |    9.90000 |
-- +----------------------+------------+
SELECT title,
    AVG(rating) AS avg_rating
FROM series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;
-- TODO Print this:
-- +------------+-----------+--------+
-- | first_name | last_name | rating |
-- +------------+-----------+--------+
-- | Thomas     | Stoneman  |    8.0 |
-- | Thomas     | Stoneman  |    8.1 |
-- | Thomas     | Stoneman  |    7.0 |
-- | Thomas     | Stoneman  |    7.5 |
-- | Thomas     | Stoneman  |    9.5 |
-- | Wyatt      | Skaggs    |    7.5 |
-- | Wyatt      | Skaggs    |    7.6 |
-- | Wyatt      | Skaggs    |    9.3 |
-- | Wyatt      | Skaggs    |    6.5 |
-- | Wyatt      | Skaggs    |    8.4 |
-- | Wyatt      | Skaggs    |    9.1 |
-- | Wyatt      | Skaggs    |    7.8 |
-- | Wyatt      | Skaggs    |    5.5 |
-- | Wyatt      | Skaggs    |    8.5 |
-- | Kimbra     | Masters   |    8.5 |
-- | Kimbra     | Masters   |    8.0 |
-- | Kimbra     | Masters   |    7.1 |
-- | Kimbra     | Masters   |    7.8 |
-- | Kimbra     | Masters   |    9.0 |
-- | Kimbra     | Masters   |    7.8 |
-- +------------+-----------+--------+
SELECT first_name,
    last_name,
    rating
FROM reviewers
    JOIN reviews ON reviewers.id = reviews.reviewer_id
LIMIT 20;
-- -or-
SELECT first_name,
    last_name,
    rating
FROM reviews
    INNER JOIN reviewers ON reviewers.id = reviews.reviewer_id;
-- TODO Print this:
-- +-----------------------+
-- | unreviewed_series     |
-- +-----------------------+
-- | Malcolm In The Middle |
-- | Pushing Daisies       |
-- +-----------------------+
SELECT title AS unreviewd_series
FROM series
    LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;
--  TODO Print this:
-- +-----------+------------+
-- | genre     | avg_rating |
-- +-----------+------------+
-- | Animation |    7.86000 |
-- | Comedy    |    8.16250 |
-- | Drama     |    8.04375 |
-- +-----------+------------+
SELECT genre,
    ROUND(AVG(rating), 2) AS rating
FROM series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;
-- TODO Print this:
-- +------------+-----------+-------+-----+-----+---------+----------+
-- | first_name | last_name | COUNT | MIN | MAX | AVG     | STATUS   |
-- +------------+-----------+-------+-----+-----+---------+----------+
-- | Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE   |
-- | Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE   |
-- | Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE   |
-- | Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE   |
-- | Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE   |
-- | Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE   |
-- | Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTIVE |
-- +------------+-----------+-------+-----+-----+---------+----------+
SELECT first_name,
    last_name,
    COUNT(reviewer_id) AS COUNT,
    IFNULL(MIN(rating), '0') AS MIN,
    IFNULL(MAX(rating), '0') AS MAX,
    IFNULL(AVG(rating), '0') AS AVG,
    CASE
        WHEN COUNT(reviewer_id) = 0 THEN 'INACTIVE'
        ELSE 'ACTIVE'
    END AS STATUS -- or replace case with 'ternary'
    - - IF(Count(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS
FROM reviewers
    LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;
-- Reviewer Stats With POWER USERS 
SELECT first_name,
    last_name,
    Count(rating) AS COUNT,
    Ifnull(Min(rating), 0) AS MIN,
    Ifnull(Max(rating), 0) AS MAX,
    Round(Ifnull(Avg(rating), 0), 2) AS AVG,
    CASE
        WHEN Count(rating) >= 10 THEN 'POWER USER'
        WHEN Count(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    end AS STATUS
FROM reviewers
    LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;
-- TODO Print this:
-- +----------------------+--------+-----------------+
-- | title                | rating | reviewer        |
-- +----------------------+--------+-----------------+
-- | Archer               |    8.0 | Thomas Stoneman |
-- | Archer               |    7.7 | Domingo Cortes  |
-- | Archer               |    8.5 | Kimbra Masters  |
-- | Archer               |    7.5 | Wyatt Skaggs    |
-- | Archer               |    8.9 | Colt Steele     |
-- | Arrested Development |    8.4 | Pinkie Petit    |
-- | Arrested Development |    9.9 | Colt Steele     |
-- | Arrested Development |    8.1 | Thomas Stoneman |
-- | Arrested Development |    6.0 | Domingo Cortes  |
-- | Arrested Development |    8.0 | Kimbra Masters  |
-- | Bob's Burgers        |    7.0 | Thomas Stoneman |
-- | Bob's Burgers        |    8.0 | Domingo Cortes  |
-- | Bob's Burgers        |    7.1 | Kimbra Masters  |
-- | Bob's Burgers        |    7.5 | Pinkie Petit    |
-- | Bob's Burgers        |    8.0 | Colt Steele     |
-- +----------------------+--------+-----------------+
SELECT title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM series
    JOIN reviews ON series.id = reviews.series_id
    JOIN reviewers ON reviewers.id = reviews.reviewer_id
ORDER BY title;
