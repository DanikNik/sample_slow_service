#!/usr/bin/env bash

docker build -t dswa -f Dockerfile .
docker run -d -p 8000:8000 -e AWS_SLOW_SERVICE_NAME=${SELF_SERVICE_NAME} --name slow-service dswa