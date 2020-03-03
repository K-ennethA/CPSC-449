-- :name votes_by_comm :many
SELECT posts.id,posts.title,posts.comm,posts.username,posts.created_date, votes.total
FROM posts
INNER JOIN votes ON posts.id=votes.post
WHERE posts.comm = :comm
ORDER BY votes.total DESC
LIMIT :num_of_posts;
