#!/bin/bash
curl --verbose \
     --request GET \
    http://localhost:5000/api/v1/resources/votes/$1
