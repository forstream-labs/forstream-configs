#!/bin/bash

docker run --rm -it --network forstream redis:5.0.5-alpine redis-cli -h redis
