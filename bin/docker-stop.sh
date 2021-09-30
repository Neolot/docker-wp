#!/usr/bin/env bash
# shellcheck disable=SC2046
this_dir=$(cd `dirname $0` && pwd)
docker-compose -f "$this_dir"/../docker-compose.yml stop
