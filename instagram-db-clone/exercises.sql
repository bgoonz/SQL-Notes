-- TODO We want to reward our users who have been around the longest.
-- ! Find the 5 oldest users.
SELECT username,
    created_at
FROM users
ORDER BY created_at
LIMIT 5;
-- TODO What day of the week do most users register on? 
-- ! We need to figure out when to schedule an ad campgain
SELECT DAYNAME(created_at) AS day,
    COUNT(*) as count
FROM users
GROUP BY day
ORDER BY count DESC;
-- TODO We want to target our inactive users with an email campaign.
-- ! Find the users who have never posted a photo
SELECT username
FROM users
    LEFT JOIN photos ON users.id = photos.user_id
WHERE image_url IS NULL;
-- TODO We're running a new contest to see who can get the most likes on a single photo.
-- ! WHO WON??!!
SELECT photos.id,
    photos.image_url,
    COUNT(*) AS LIKES,
    users.username
FROM photos
    JOIN likes ON likes.photo_id = photos.id
    JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY COUNT(*) DESC
LIMIT 10;
-- TODO Our Investors want to know...
-- ! How many times does the average user post?
SELECT (
        SELECT COUNT(*)
        FROM photos
    ) / (
        SELECT COUNT(*)
        FROM users
    ) AS avg_user_posts;
-- TODO A brand wants to know which hashtags to use in a post
-- ! What are the top 5 most commonly used hashtags?
SELECT tags.tag_name,
    COUNT(*)
FROM photo_tags
    JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY COUNT(*) DESC;
-- TODO We have a small problem with bots on our site...
-- ! Find users who have liked every single photo on the site
SELECT username,
    Count(*) AS num_likes
FROM users
    INNER JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (
        SELECT Count(*)
        FROM photos
    );
-- TODO We also have a problem with celebrities
-- ! Find users who have never commented on a photo

-- TODO Are we overrun with bots and celebrity accounts?
-- ! Find the percentage of our users who have either never commented on a photo or have commented on every photo