#!/usr/bin/env bash
 
file=$1
if [ -z "$file" ]; then
    echo "USAGE: import-db <filename>"
    exit 1;
fi
 
# Import database to db container
cmd='exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"'
docker-compose exec -T db sh -c "$cmd" < $file
 
# Replace LIVE_URL using WP-CLI in wp container
cmd='wp --allow-root search-replace "$LIVE_URL" "$DEV_URL" --skip-columns=guid'
docker-compose exec wp sh -c "$cmd"
