#!/usr/bin/env bash
 
file=$1
if [ -z "$file" ]; then
    echo "USAGE: import-db <filename>"
    exit 1;
fi
 
# Import database to db container
# shellcheck disable=SC2016
cmd='exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"'
docker-compose exec -T db bash -c "$cmd" < "$file"
 
# Replace LIVE_URL using WP-CLI in wp container
# shellcheck disable=SC2016
cmd='wp --allow-root search-replace "$LIVE_URL" "$DEV_URL" --skip-columns=guid'
docker-compose exec wp bash -c "$cmd"
