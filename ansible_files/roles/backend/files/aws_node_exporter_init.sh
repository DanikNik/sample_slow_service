#!/usr/bin/env bash

cd /etc/systemd/system && \
sudo ln -s /node_exporter/node-exporter.service && \
sudo systemctl daemon-reload && \
sudo systemctl enable node-exporter.service && \
sudo systemctl start node-exporter.service
