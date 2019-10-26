#!/usr/bin/env bash

docker kill $(docker ps -aq) && docker rm $(docker ps -aq)