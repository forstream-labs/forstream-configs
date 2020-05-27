#!/bin/bash

set -e

FORSTREAM_HOME=/opt/forstream

echo "Creating directories..."
echo ""

echo "$FORSTREAM_HOME/apps"
mkdir -p $FORSTREAM_HOME/apps

echo "$FORSTREAM_HOME/configs"
mkdir -p $FORSTREAM_HOME/configs
touch ${FORSTREAM_HOME}/configs/forstream.yml
touch ${FORSTREAM_HOME}/configs/forstream-web.yml
touch ${FORSTREAM_HOME}/configs/firebase.json

echo "$FORSTREAM_HOME/data"
mkdir -p $FORSTREAM_HOME/data

echo "$FORSTREAM_HOME/data/letsencrypt"
mkdir -p $FORSTREAM_HOME/data/letsencrypt

echo "$FORSTREAM_HOME/logs"
mkdir -p $FORSTREAM_HOME/logs

echo "$FORSTREAM_HOME/public"
mkdir -p $FORSTREAM_HOME/public

echo "$HOME/.backups"
mkdir -p $HOME/.backups

touch $HOME/.backups/credentials
chmod 700 $HOME/.backups
chmod 600 $HOME/.backups/credentials

echo ""
echo "Directories created with success!"
