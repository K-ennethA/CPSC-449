-- :name upvote_post :affected
UPDATE votes SET upvotes = upvotes + 1, total = upvotes - downvotes + 1 WHERE post=:post;
