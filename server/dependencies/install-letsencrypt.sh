#!/bin/bash

set -e

echo "Installing Let's Encrypt..."
echo ""

sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot

echo ""
echo "Let's Encrypt was installed with success!"
