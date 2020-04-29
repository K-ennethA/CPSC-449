-- :name all_votes :many
SELECT posts.id, posts.title, posts.comm, votes.upvotes, votes.downvotes, votes.total
FROM posts
INNER JOIN votes ON posts.id=votes.post;
