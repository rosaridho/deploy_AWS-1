#!/bin/bash

eval "$(ssh-agent -s)" &&
ssh-add -k ~/.ssh/id_rsa &&
cd /home/ubuntu/deploy_aws/deploy_AWS-1
git pull

source ~/.profile
echo "$DOCKERHUB_PASS" | sudo docker login --username $DOCKERHUB_USER --password-stdin
sudo docker stop ridhorosa
sudo docker rm ridhorosa
sudo docker rmi ridhorosa/ecommerce2:production3
sudo docker run -d --name ridhorosa -p 5000:5000 ridhorosa/ecommerce2:production3
