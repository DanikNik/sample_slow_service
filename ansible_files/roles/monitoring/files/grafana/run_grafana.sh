#!/usr/bin/env bash

#port 3000
docker build -t aws_graf_img -f grafana.Dockerfile .
docker run -d --network host --name aws_graf aws_graf_img