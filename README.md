# CPSC-449
CPSC 449 Back End Engineering Project 1

Nicholas Webster, Jason Jose, Gilbert Paderogo

Foreman Command

foreman start -m post-service=3,vote-service=3,caddy=1

All entries have the form

[
  {
    "id": "####",
    "title": "title",
    "bodyText": "bodyText",
    "community": "community",
    "url": "www.url.com",
    "username": "username",
    "date": "YYYY-MM-DD HH:MM:SS"
  }
]
All votes have the form

[
  {
    "id": "####",
    "upVotes": "upVotes",
    "downVotes": "downVotes"
  }
]
List all entries

Definition

GET /api/v1/entries/all

Response

200 OK on success
 

Retrieve an entry

Definition

GET /api/v1/entries/<int:id>

Response

404 Not Found if does not exist
200 OK on success
 

Post an entry

Definition

POST /api/v1/entries

Response

201 CREATED on success
409 CONFLICT if ID already exists
 

Delete an entry

Definition

DELETE /api/v1/entries/<int:id>

Response

200 OK on success
 

List n most recent posts in a community

Definition

GET /api/v1/entries/<string:community>/recent/<int:numOfEntries>

Response

200 OK on success
 

List n most recent posts in all communities

Definition

GET /api/v1/entries/all/recent/<int:numOfEntries>

Response

200 OK on success
 

Report the number of upvotes/downvotes for a post

Definition

GET /api/v1/votes/<int:id>

Response

200 OK on success
 

Upvote a post

Definition

PUT /api/v1/votes/<int:id>

Example curl --verbose --request PUT http://localhost:5000/api/v1/votes/1

Response

200 OK on success
 

Downvote a post

Definition

PATCH /api/v1/votes/<int:id>

Example curl --verbose --request PATCH http://localhost:5000/api/v1/votes/1

Response

200 OK on success
 

List the n top-scoring posts to any community

Definition

GET /api/v1/votes/top/<int:numOfEntries>

Response

200 OK on success
 

Given a list of post identifiers, return the list sorted by score

Definition

POST /api/v1/votes/scorelist

Example

curl --verbose --request POST --header 'Content-Type: application/json' --data '{"id":[1,2,3]}' http://localhost:5100/api/v1/votes/scorelist

Response

200 OK on success