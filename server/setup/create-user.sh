#!/bin/bash

set -e

USER=forstream

echo "Creating user $USER..."

sudo adduser $USER
sudo usermod -aG sudo $USER
sudo groupadd docker || true
sudo usermod -aG docker $USER

sudo chown $USER:$USER /opt/$USER

FORSTREAM_ECR_REGISTRY="554511234717.dkr.ecr.us-east-1.amazonaws.com"
FORSTREAM_ECR_REGION="us-east-1"

echo "" | sudo tee --append /home/$USER/.profile > /dev/null
echo "export FORSTREAM_HOME=\"/opt/$USER\"" | sudo tee --append /home/$USER/.profile > /dev/null
echo "export FORSTREAM_ECR_REGISTRY=\"$FORSTREAM_ECR_REGISTRY\"" | sudo tee --append /home/$USER/.profile > /dev/null
echo "export FORSTREAM_ECR_REGION=\"$FORSTREAM_ECR_REGION\"" | sudo tee --append /home/$USER/.profile > /dev/null
echo "" | sudo tee --append /home/$USER/.profile > /dev/null
echo "cd \$FORSTREAM_HOME" | sudo tee --append /home/$USER/.profile > /dev/null

echo ""
echo "User $USER created with success!"
