#!/usr/bin/env bash

#port 9090
docker build -t aws_prometheus -f prom.Dockerfile .
docker run -d --network host --name aws_prom aws_prometheus
