-- :name upvote_post :affected
UPDATE votes SET upvotes = upvotes + 1 WHERE post=:post;
