#!/usr/bin/env bash

this_dir=$(cd `dirname $0` && pwd)
datetime=$(date +'%Y-%m-%d_%H-%M')
export="$this_dir/../db/export_$datetime.sql"

# Replace DEV_URL using WP-CLI in wp container
cmd='wp --allow-root search-replace "$DEV_URL" "$LIVE_URL" --skip-columns=guid'
docker-compose exec wp sh -c "$cmd"

# Create dump file
cmd='exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"'
docker-compose exec db sh -c "$cmd" > $export

# Replace LIVE_URL using WP-CLI in wp container
cmd='wp --allow-root search-replace "$LIVE_URL" "$DEV_URL" --skip-columns=guid'
docker-compose exec wp sh -c "$cmd"