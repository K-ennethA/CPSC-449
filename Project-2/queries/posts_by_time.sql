-- :name posts_by_time :many
SELECT id,title,comm,username,created_date FROM posts
ORDER BY created_date DESC
LIMIT :num_of_posts;
