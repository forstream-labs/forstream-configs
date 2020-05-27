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
  echo "Examples: $0 forstream/forstream"
  echo "          $0 redis"
  exit 1
fi

echo "Creating container $1..."
echo ""

cd $FORSTREAM_HOME/apps/forstream-configs/server/docker/$1
docker-compose up -d

echo ""
echo "Container $1 was created with success!"
