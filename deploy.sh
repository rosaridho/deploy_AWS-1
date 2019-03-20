#!/bin/bash

eval "$(ssh-agent -s)" &&
ssh-add -k ~/.ssh/id_rsa &&
cd /home/ubuntu/deploy_aws/deploy_AWS-1
git pull

source ~/.profile
echo "$DOCKERHUB_PASS" | sudo docker login --username $DOCKERHUB_USER --password-stdin
sudo docker stop deploy_AWS-1
sudo docker rm deploy_AWS-1
sudo docker rmi ridhorosa/deploy_AWS-1
sudo docker run -d --name deploy_AWS-1 -p 5002:5002 ridhorosa/deploy_AWS-1:latest
