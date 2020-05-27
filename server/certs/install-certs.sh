#!/bin/bash

set -e

if [ -z "$FORSTREAM_HOME" ]; then
  echo "Enrivonment variable with name FORSTREAM_HOME is required"
  exit 1
fi

echo "Installing forstream certificate..."
sudo letsencrypt certonly --standalone -d forstream

echo "Installing api.forstream certificate..."
sudo letsencrypt certonly --standalone -d api.forstream

echo "Installing www.forstream certificate..."
sudo letsencrypt certonly --standalone -d www.forstream

echo ""
echo "Certificates installed with success!"
