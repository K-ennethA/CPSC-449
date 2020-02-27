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

DROP TABLE IF EXISTS votes;
CREATE TABLE votes (
  id INTEGER primary key,
  upvotes INTEGER,
  downvotes INTEGER,
  total INTEGER,
  post INTEGER NOT NULL,
  FOREIGN KEY(post) REFERENCES posts(id)
);

COMMIT;
