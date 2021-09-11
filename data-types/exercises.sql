-- TODO What's a good use case for CHAR? (just make one up)
-- Y/N or M/F
-- TODO Fill In The Blanks (price is always < 1,000,000)
-- CREATE TABLE inventory (
--     item_name ____________,
--     price ________________,
--     quantity _____________
-- );
CREATE TABLE inventory (
    item_name VARCHAR(255),
    price DECIMAL(8, 2),
    quantity INT
);
-- TODO What's the difference between DATETIME and TIMESTAMP?
-- The range of time they cover and TIMESTAMP takes up about half the space DATETIME does
-- TODO Print Out The Current Time
SELECT CURTIME();
-- TODO Print Out The Current Date (but not time)
SELECT CURDATE();
-- TODO Print Out The Current Day Of The Week (The Number)
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(CURDATE(), '%w');
-- TODO Print Out The Current Day Of The Week (The Day Name)
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(CURDATE(), '%W');
-- TODO Print out the current day and time using this format: mm/dd/yyyy
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
-- TODO Print out the current day and time using this format: January 2nd at 3:15 April 1st at 10:18
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
-- TODO Create a tweets table that stores: The Tweet content, A Username, Time it was created
CREATE TABLE tweets (content VARCHAR(140), username VARCHAR(20), time_created TIMESTAMP() DEFAULT NOW())
