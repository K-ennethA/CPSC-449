#!/bin/bash
curl --verbose \
     --request POST \
    http://localhost:5001/api/v1/resources/votes/upvote/$1
