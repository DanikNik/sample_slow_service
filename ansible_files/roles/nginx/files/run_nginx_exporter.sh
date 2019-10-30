#!/usr/bin/env bash

# port 9113
docker run --network host -d --rm nginx/nginx-prometheus-exporter:0.4.2 -nginx.scrape-uri http://localhost/stub_status
