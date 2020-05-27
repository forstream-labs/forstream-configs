#!/bin/bash

docker run --rm --network forstream -v "${HOME}/.backups:/data/bkp" mongo:4.0.10 mongorestore --host mongo --gzip --archive=/data/bkp/$1
