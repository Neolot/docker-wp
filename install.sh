#!/usr/bin/env bash

docker-compose up -d

# Wait for the containers to start
sleep 10s

bin/wp-up.sh
