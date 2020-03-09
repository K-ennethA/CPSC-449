#!/bin/bash
curl --verbose \
     -X POST \
     --data "list=[15,16]" \
    http://localhost:5001/api/v1/resources/votes/list
