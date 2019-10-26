#!/usr/bin/env bash

docker build -t dswa -f Dockerfile .
docker run -d --rm -p 8000:8000 -e PROMETHEUS_ADDRESS=${PROMETHEUS_ADDRESS} dswa