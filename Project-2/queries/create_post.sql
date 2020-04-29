-- :name create_post :insert
INSERT INTO posts(title, des, comm, url, username, created_date)
VALUES(:title,:des,:comm,:url,:username, :created_date)
