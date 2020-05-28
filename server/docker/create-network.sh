#!/bin/bash

set -e

echo "Creating Docker network forstream..."
echo ""

docker network create --driver bridge forstream

echo ""
echo "Docker network forstream was created with success!"
