-- :name post_by_id :one
SELECT id,title,comm,username,created_date FROM posts
WHERE id = :id;
