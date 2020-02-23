PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INTEGER primary key,
  title VARCHAR NOT NULL,
  des VARCHAR NOT NULL,
  comm VARCHAR NOT NULL,
  url VARCHAR,
  username VARCHAR NOT NULL,
  created_date VARCHAR NOT NULL
);
INSERT INTO posts(title,des,comm,url,username,created_date)
VALUES('WOW','so amazing','LOL','https://','Ken','10.20.20');
COMMIT;
