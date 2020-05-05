
# CPSC-449
### CPSC 449 Back End Engineering Project 2
## Janeen Yamak (Dev 3), Kenneth Aguilar(Dev 1), Lorena Macias (Dev 2)

### Posts Requirements

**Must have dynamo installed locally and configured**

`Remember to run the following command in the directory where dynamo is downloaded`

`java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb `

**Must have boto 3 installed**

**To Delete the Posts Table and Create the Posts Table**

`open python3 terminal in proper directory and remember to set ENV variables`

`from api import delete_aws,init_aws`

`delete_aws()`

`init_aws()`

### Foreman 
foreman start -m posts=3,votes=3,rssfeeds=3,caddy=1

### Testing 

**To Test Posts Microservice Run the File**

`postTest.sh`

**To Test Votes Microservice Run the File**

`voteTest.sh`

### Posts have the form 
```json
[
  {
    "PostId" : "Number",
    "title" : "title",
    "text" : "description",
    "subreddit" : "community",
    "url" : "url",
    "date" : "YYYY-MM-DD HH:MM:SS"
  }
]
```  
### Votes have the form 
``` json 
[
  {
    "id" : "Number",
    "upvotes" : "Number",
    "downvotes" : "Number",
    "total" : "Number",
    "post" : "PostID"
    }
]
```
## Create a Post
**Definition**

`POST /api/v1/resources/posts`

**Response**
- `201 CREATED` if successful 
- `409 CONFLICT` if unsuccessful 
<p>&nbsp;</p>


## Delete a Post
**Definition**

`DELETE /api/v1/resources/posts/<int:id>`

**Response**
- `200 OK` if successful 
- `404 NOT FOUND` if post does not exist 
<p>&nbsp;</p>

## The 25 most recent posts to a particular community
**Definition**

`GET /api/rss/resources/posts/<string:comm>/25`

**Response**
- `200 OK` if successful 
<p>&nbsp;</p>


## The 25 most recent posts to any community
**Definition**

`GET /api/rss/resources/posts/recent/25`

**Response**
- `200 OK` if successful 
<p>&nbsp;</p>

## The top 25 posts to a particular community, sorted by score
**Definition**

`GET /api/rss/resources/posts/top/<string:comm>/25`

**Response**
- `200 OK` if successful 
<p>&nbsp;</p>

## The top 25 posts to any community, sorted by score 
**Definition**

`GET /api/rss/resources/posts/top/25`

**Response**
- `200 OK` if successful 
<p>&nbsp;</p>

## The hot 25 posts to any community, ranked usinf reddits "hot ranking algorithm"
**Definition**

`GET /api/rss/resources/posts/<string:comm> <int:num_of_posts>`

**Response**
- `200 OK` if successful 
<p>&nbsp;</p>


<p>&nbsp;</p>

# Project 1 Endpoints

## Retrieve All Posts
**Definition**

`GET /api/v1/resources/posts/all`

**Response**
- `200 OK` if successful 
<p>&nbsp;</p>


## Retrieve Post by ID
**Definition**

`GET /api/v1/resources/posts/<int:id>`

**Response**
- `200 OK` if successful 
- `404 NOT FOUND` if post does not exist   
<p>&nbsp;</p>


## Retrieve N Most Recent Posts to any Community 
**Definition**

`GET /api/v1/resources/posts/recent/<int:num_of_posts>`

**Response**
- `200 OK` if successful 
- `404 NOT FOUND` if no posts are found
<p>&nbsp;</p>

## Retrieve N Most Recent Posts by a specific Community 
**Definition**

`GET /api/v1/resources/posts/recent/<string:comm>/<int:num_of_posts>`

**Response**
- `200 OK` if successful 
- `404 NOT FOUND` if no posts are found
<p>&nbsp;</p>

## Upvote a Post
**Definition**

`POST /api/v1/resources/votes/upvote/<int:id>`

**Response**
- `200 OK` on success
- `404 NOT FOUND` if post does not exist
<p>&nbsp;</p>

## Downvote a Post
**Definition**

`POST /api/v1/resources/votes/downvote/<int:id>`

**Response**
- `200 OK` on success
- `404 NOT FOUND` if post does not exist
<p>&nbsp;</p>

## Report Number of Upvotes and Downvotes for a Post
**Definition**

`GET /api/v1/resources/votes/<int:id>`

**Response**
- `200 OK` on success
- `404 NOT FOUND` if post does not exist
<p>&nbsp;</p>

## List the n Top-Scoring Posts to Any Community
**Definition**

`GET /api/v1/resources/votes/top/<int:num_of_posts>`

**Response**
- `200 OK` on success
<p>&nbsp;</p>

## Given a List of Post Identifiers, Return the List Sorted by Score
**Definition**

`POST /api/v1/resources/votes/list`

**Response**
- `200 OK` on success
<p>&nbsp;</p>
