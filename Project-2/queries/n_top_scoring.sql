-- :name n_top_scoring :many
SELECT posts.id,posts.title,posts.comm,posts.username,posts.created_date, votes.total
FROM posts
INNER JOIN votes ON posts.id=votes.post
ORDER BY votes.total DESC
LIMIT :num_of_posts;
