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

echo "Preparing environment..."
echo ""

$FORSTREAM_HOME/apps/forstream-configs/server/certs/install-certs.sh
sleep 5

echo ""
$FORSTREAM_HOME/apps/forstream-configs/server/certs/install-certs-task.sh
sleep 5

echo ""
$FORSTREAM_HOME/apps/forstream-configs/server/docker/create-network.sh

echo ""
echo "Enrivonment prepared with success!"
