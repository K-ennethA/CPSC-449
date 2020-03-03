-- :name downvote_post :affected
UPDATE votes SET downvotes = downvotes + 1, total = upvotes - downvotes  - 1 WHERE post=:post;
