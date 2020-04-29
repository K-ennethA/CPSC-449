-- :name votes_by_post_id :one
SELECT posts.id, posts.title, votes.upvotes, votes.downvotes, votes.total
FROM posts
INNER JOIN votes ON posts.id=votes.post
WHERE posts.id=:post
