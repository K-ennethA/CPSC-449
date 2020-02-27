-- :name create_vote :insert
INSERT INTO votes(upvotes, downvotes, total, post)
VALUES(:upvotes,:downvotes,:total,:post)
