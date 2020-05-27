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

if [ -z "$FORSTREAM_ECR_REGION" ]; then
  echo "Enrivonment variable with name FORSTREAM_ECR_REGION is required"
  exit 1
fi

if [ ! -d "$FORSTREAM_HOME/apps/forstream-configs" ]; then
  echo "The project forstream-configs must be located in $FORSTREAM_HOME/apps"
  exit 1
fi

echo "Pulling images..."
echo ""

eval $(aws ecr get-login --no-include-email --region $FORSTREAM_ECR_REGION)

docker pull $FORSTREAM_ECR_REGISTRY/forstream/forstream:latest
docker tag $FORSTREAM_ECR_REGISTRY/forstream/forstream:latest forstream:latest

docker pull $FORSTREAM_ECR_REGISTRY/forstream/forstream-web:latest
docker tag $FORSTREAM_ECR_REGISTRY/forstream/forstream-web:latest forstream-web:latest

docker pull $FORSTREAM_ECR_REGISTRY/forstream/forstream-events-reminder:latest
docker tag $FORSTREAM_ECR_REGISTRY/forstream/forstream-events-reminder:latest forstream-events-reminder:latest

echo ""
echo "Images pulled with success!"
