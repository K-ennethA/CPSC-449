#!/bin/bash

curl --verbose \
     --request DELETE \
    http://localhost:5000/api/v1/resources/posts/$1

curl --verbose \
     --request DELETE \
    http://localhost:5000/api/v1/resources/posts/$2

curl --verbose \
     --request DELETE \
    http://localhost:5000/api/v1/resources/posts/$3
