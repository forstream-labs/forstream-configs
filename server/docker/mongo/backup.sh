#!/bin/bash

set -e

source $HOME/.profile
source $HOME/.backups/credentials

if [ -z "$FORSTREAM_HOME" ]; then
  echo "Enrivonment variable with name FORSTREAM_HOME is required"
  exit 1
fi

if [ -z "$MONGO_PASSWORD" ]; then
  echo "Enrivonment variable with name MONGO_PASSWORD is required"
  exit 1
fi

exec &> $FORSTREAM_HOME/logs/mongo-backup.log

echo ""
echo "#############################################################"
echo "## Generating Mongo backup at $(date) ##"
echo "#############################################################"
echo ""

DATABASE=forstream
BUCKET=forstream-backups
FILENAME=mongo-$(date "+%Y%m%d%H%M%S").bkp
USERNAME=forstream

# Dump from Mongo and upload to S3
docker run --rm --network forstream mongo:4.2.7 mongodump --host mongo --db $DATABASE --username $USERNAME --password $MONGO_PASSWORD --authenticationDatabase admin --gzip --archive | aws s3 cp - s3://$BUCKET/$FILENAME

echo ""
echo "Backup generated and uploaded to S3 with success!"
