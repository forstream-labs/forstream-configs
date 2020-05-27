#!/bin/bash

set -e
set -f

if [ -z "$FORSTREAM_HOME" ]; then
  echo "Enrivonment variable with name FORSTREAM_HOME is required"
  exit 1
fi

echo "Installing certificates cron task..."

CRON_RENEW_CMD="$FORSTREAM_HOME/apps/forstream-configs/server/certs/renew-certs.sh $FORSTREAM_HOME"
CRON_RENEW_JOB="0 0 * * * $CRON_RENEW_CMD"

(sudo crontab -l | grep -v -F "$CRON_RENEW_CMD") | sudo crontab - || true
(sudo crontab -l | grep -v -F "$CRON_RENEW_CMD" ; echo "$CRON_RENEW_JOB") | sudo crontab - || true

echo ""
echo "Certificate cron task was installed with success!"
echo "Current tasks:"
sudo crontab -l
