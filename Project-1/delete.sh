curl --verbose \
     --request DELETE \
     --header 'Content-Type: application/json' \
     --data @delete.json \
    http://localhost:5000/api/v1/resources/posts/1
