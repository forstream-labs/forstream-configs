#!/bin/bash

set -e

if [ -z "$FORSTREAM_HOME" ]; then
  echo "Enrivonment variable with name FORSTREAM_HOME is required"
  exit 1
fi

echo "Installing forstream.io certificate..."
sudo letsencrypt certonly --standalone -d forstream.io

echo "Installing www.forstream.io certificate..."
sudo letsencrypt certonly --standalone -d www.forstream.io

echo "Installing api.forstream.io certificate..."
sudo letsencrypt certonly --standalone -d api.forstream.io

echo ""
echo "Certificates installed with success!"
