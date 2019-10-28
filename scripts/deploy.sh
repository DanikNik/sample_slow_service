#!/usr/bin/env bash

docker build -t dswa -f Dockerfile .
docker run -d -p 8000:8000 --name slow-service dswa