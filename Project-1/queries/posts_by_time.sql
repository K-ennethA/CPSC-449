-- :name posts_by_time :many
SELECT * FROM posts
ORDER BY created_date DESC
LIMIT :num_of_posts;
