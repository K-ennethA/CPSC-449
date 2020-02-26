-- :name posts_by_time_comm :many
SELECT id,title,comm,username,created_date FROM posts
WHERE comm = :comm
ORDER BY created_date DESC
LIMIT :num_of_posts;
