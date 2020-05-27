#!/bin/bash

set -e

if [ "$(whoami)" != "forstream" ]; then
  echo "This script must be executed with the user forstream"
  exit 1
fi

if [ -z "$FORSTREAM_HOME" ]; then
  echo "Enrivonment variable with name FORSTREAM_HOME is required"
  exit 1
fi

if [ ! -d "$FORSTREAM_HOME/apps/forstream-configs" ]; then
  echo "The project forstream-configs must be located in $FORSTREAM_HOME/apps"
  exit 1
fi

echo "Installing dependencies..."
echo ""

sudo apt-get install python
sleep 5

echo ""
$FORSTREAM_HOME/apps/forstream-configs/server/dependencies/install-docker.sh
sleep 5

echo ""
$FORSTREAM_HOME/apps/forstream-configs/server/dependencies/install-docker-compose.sh
sleep 5

echo ""
$FORSTREAM_HOME/apps/forstream-configs/server/dependencies/install-awscli.sh
sleep 5

echo ""
$FORSTREAM_HOME/apps/forstream-configs/server/dependencies/install-letsencrypt.sh

echo ""
echo "Dependencies installed with success!"
echo "Please log out and log back in with the user $USER."
