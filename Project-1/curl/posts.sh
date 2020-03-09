#!/bin/bash
curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "take 5",
       "des": "testing this bitch5",
       "comm":"302",
       "username":"apple",
       "url": "gotmilk.com"
     }' \
    http://localhost:5000/api/v1/resources/posts


curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "take 6",
        "des": "testing this bitch6",
        "comm":"302",
        "username":"apple",
        "url": "gotmilk.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "take 7",
        "des": "testing this bitch7",
        "comm":"302",
        "username":"apple",
        "url": "gotmilk.com"
     }' \
    http://localhost:5000/api/v1/resources/posts
curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "take 8",
        "des": "testing this bitch8",
        "comm":"302",
        "username":"apple",
        "url": "gotmilk.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/posts/$1
