#!/usr/bin/env bash

this_dir=$(cd bin && pwd)
datetime=$(date +'%Y-%m-%d_%H-%M')
export="$this_dir/../db/export_$datetime.sql"

# Replace DEV_URL using WP-CLI in wp container
# shellcheck disable=SC2016
cmd='wp --allow-root search-replace "$DEV_URL" "$LIVE_URL" --skip-columns=guid'
docker-compose exec wp bash -c "$cmd"

# Create dump file
# shellcheck disable=SC2016
cmd='exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"'
docker-compose exec db bash -c "$cmd" > "$export"

# Replace LIVE_URL using WP-CLI in wp container
# shellcheck disable=SC2016
cmd='wp --allow-root search-replace "$LIVE_URL" "$DEV_URL" --skip-columns=guid'
docker-compose exec wp bash -c "$cmd"
