#!/usr/bin/env bash

echo export PROMETHEUS_ADDR=3.19.211.176 >> .bashrc

sudo apt update
sudo apt install git -y
git clone https://github.com/DanikNik/sample_slow_service

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
exit
