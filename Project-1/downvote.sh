#!/bin/bash
curl --verbose \
     --request POST \
    http://localhost:5000/api/v1/resources/votes/downvote/$1
