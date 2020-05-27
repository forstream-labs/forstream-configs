#!/bin/bash

set -e

if [ -z "$FORSTREAM_HOME" ]; then
  echo "Enrivonment variable with name FORSTREAM_HOME is required"
  exit 1
fi

if [ -z "$FORSTREAM_ECR_REGISTRY" ]; then
  echo "Enrivonment variable with name FORSTREAM_ECR_REGISTRY is required"
  exit 1
fi

if [ ! -d "$FORSTREAM_HOME/apps/forstream-configs" ]; then
  echo "The project forstream-configs must be located in $FORSTREAM_HOME/apps"
  exit 1
fi

if [ $# != 1 ]; then
  echo "Usage: $0 <image_name>"
  echo "Examples: $0 redis"
  echo "          $0 mongo"
  echo "          $0 nginx"
  echo "          $0 forstream"
  exit 1
fi

echo "Creating container $1..."
echo ""

cd $FORSTREAM_HOME/apps/forstream-configs/server/docker/$1
docker-compose up -d

echo ""
echo "Container $1 was created with success!"
