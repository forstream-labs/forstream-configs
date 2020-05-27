#!/bin/bash

set -e

echo "Creating Docker network forstream..."
echo ""

docker network create \
  --driver bridge \
  --subnet 172.30.0.0/16 \
  --ip-range 172.30.5.0/24 \
  --gateway 172.30.5.254 \
  forstream

echo ""
echo "Docker network forstream was created with success!"
