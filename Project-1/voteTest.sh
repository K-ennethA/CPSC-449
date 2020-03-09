#!/bin/bash

#upvote post with id 3
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/upvote/3

#upvote post with id 3
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/upvote/3

#upvote post with id 3
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/upvote/3

#upvote post with id 1
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/upvote/1

#upvote post with id 4
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/upvote/4

#upvote post with id 7
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/upvote/7

#downvote post with id 4
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/downvote/4

#downvote post with id 8
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/downvote/8

#downvote post with id 4
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/downvote/3

#get number of votes for post with id 3
curl --verbose \
     --request GET \
    http://localhost:5001/api/v1/resources/votes/3

#n top
curl --verbose \
     --request GET \
    http://localhost:5001/api/v1/resources/votes/CS-302/2

#get top 2 scoring posts
curl --verbose \
     --request GET \
    http://localhost:5001/api/v1/resources/votes/top/2

#given id's 2,7,8; sort by sco
curl --verbose \
     -X POST \
     --data "list=[2,7,8]" \
    http://localhost:5001/api/v1/resources/votes/list
