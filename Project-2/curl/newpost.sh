#!/bin/bash
curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "hello",
       "des": "does this work?",
       "comm":"302",
       "username":"apple"
     }' \
    http://localhost:5000/api/v1/resources/posts
