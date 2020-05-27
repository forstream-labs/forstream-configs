#!/bin/bash

set -e

USER_HOME="/home/forstream"
FORSTREAM_HOME=/opt/forstream

echo "Creating directories..."
echo ""

sudo mkdir $FORSTREAM_HOME

echo "$FORSTREAM_HOME/apps"
sudo mkdir $FORSTREAM_HOME/apps

echo "$FORSTREAM_HOME/configs"
sudo mkdir $FORSTREAM_HOME/configs
touch ${FORSTREAM_HOME}/configs/forstream.yml

echo "$FORSTREAM_HOME/data"
sudo mkdir $FORSTREAM_HOME/data

echo "$FORSTREAM_HOME/data/letsencrypt"
sudo mkdir $FORSTREAM_HOME/data/letsencrypt

echo "$FORSTREAM_HOME/logs"
sudo mkdir $FORSTREAM_HOME/logs

echo "$FORSTREAM_HOME/public"
sudo mkdir $FORSTREAM_HOME/public

echo "$USER_HOME/.backups"
sudo mkdir $USER_HOME/.backups

touch $USER_HOME/.backups/credentials
chmod 700 $USER_HOME/.backups
chmod 600 $USER_HOME/.backups/credentials

echo ""
echo "Directories created with success!"
