-- :name posts_by_time_comm :many
SELECT * FROM posts
WHERE comm = :comm
ORDER BY created_date DESC
LIMIT :num_of_posts;
