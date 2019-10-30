#!/usr/bin/env bash
#port 9090

docker build -t aws_prom_img -f prom.Dockerfile .
docker run -d --network host --name aws_prom aws_prom_img
