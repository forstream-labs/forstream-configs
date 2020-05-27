#!/bin/bash

set -e

FORSTREAM_HOME=$1

exec &> $FORSTREAM_HOME/logs/renew-certs.log

echo ""
echo "###########################################################"
echo "## Renewing certificates at $(date) ##"
echo "###########################################################"

sudo letsencrypt renew --renew-hook 'docker restart nginx'
