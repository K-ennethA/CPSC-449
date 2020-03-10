# CPSC-449
CPSC 449 Back End Engineering Project 1
## Janeen Yamak, Kenneth Aguilar, Lorena Macias  

### Foreman 
Foreman start 

### Posts have the form 
```json
[
  {
    "id" : "Number",
    "title" : "title",
    "des" : "description",
    "comm" : "community",
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
