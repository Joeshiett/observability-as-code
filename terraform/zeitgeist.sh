#!/bin/sh
sudo apt-get update
sudo snap install docker
sudo docker pull zeitgeist/zeitgeist-node
sudo docker run -d zeitgeistpm/zeitgeist-node --dev --tmp