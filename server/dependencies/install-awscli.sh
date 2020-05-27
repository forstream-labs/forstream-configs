#!/bin/bash

set -e

echo "Installing AWS Client..."
echo ""

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
rm get-pip.py
~/.local/bin/pip install awscli --upgrade --user

echo ""
echo "AWS Client was installed with success!"
