#!/usr/bin/env bash

cd /etc/systemd/system
sudo ls -s /home/ubuntu/node_exporter/node-exporter.service
sudo systemctl daemon-reload
sudo systemctl enable node-exporter.service
sudo systemctl start node-exporter.service
