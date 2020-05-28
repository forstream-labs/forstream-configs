#!/bin/bash

docker run --rm --network forstream -v "${HOME}/.backups:/data/bkp" mongo:4.2.7 mongorestore --host mongo --gzip --archive=/data/bkp/$1
