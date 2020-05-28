#!/bin/bash

docker run --rm -it --network forstream redis:6.0.3-alpine redis-cli -h redis
