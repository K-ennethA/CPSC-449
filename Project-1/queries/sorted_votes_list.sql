-- :name sorted_votes_list :many
SELECT posts.id,posts.title,posts.comm,posts.username,posts.created_date,votes.total
FROM posts
INNER JOIN votes ON posts.id=votes.post
WHERE posts.id IN :list
ORDER BY votes.total DESC;
