#!/bin/bash

#created 8 posts
curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "The first reddit post",
       "des": "reddit but for school",
       "comm":"449",
       "username":"lorena"
     }' \
    http://localhost:5000/api/v1/resources/posts


curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "2nd Post",
        "des": "sample description 2",
        "comm":"basement",
        "username":"kenneth",
        "url": "reddit.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "3rd Post",
        "des": "sample desc 3",
        "comm":"449",
        "username":"janeen",
        "url": "reddit.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "4th Post",
        "des": "sample desc 4",
        "comm":"basement",
        "username":"kenneth",
        "url": "reddit.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

curl --verbose \
     --request POST \
     --header 'Content-Type: application/json' \
     --data '{
       "title": "5th Post",
       "des": "lets try something new",
       "comm":"CS-302",
       "username":"lorena"
     }' \
    http://localhost:5000/api/v1/resources/posts


curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "6th Post",
        "des": "hello world",
        "comm":"CS-302",
        "username":"janeen",
        "url": "reddit.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "7th Post",
        "des": "testing last minute",
        "comm":"CS-302",
        "username":"kenneth"
     }' \
    http://localhost:5000/api/v1/resources/posts

curl --verbose \
      --request POST \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "take 8",
        "des": "testing 8th post",
        "comm":"449",
        "username":"kenneth",
        "url": "reddit.com"
     }' \
    http://localhost:5000/api/v1/resources/posts

#delete posts with id's 2 and 6
curl --verbose \
     --request DELETE \
    http://localhost:5000/api/v1/resources/posts/2

curl --verbose \
     --request DELETE \
    http://localhost:5000/api/v1/resources/posts/6

#gety post with id 4
curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/posts/4

# get 2 most recent posts from community 449
curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/posts/449/2

# get 3 recent posts from any community
curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/posts/recent/3
