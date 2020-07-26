#!/usr/bin/env bash

this_dir=$(cd `dirname $0` && pwd)

# Set local project permisions
sudo chown -R "$USER":"$USER" "$this_dir"/../project
sudo chmod -R 777 "$this_dir"/../project

# Initial setup Wordpress
cmd='wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="$DB_HOST" --dbprefix="$DB_PREFIX" --allow-root --skip-check'
docker-compose exec wp sh -c "$cmd"
cmd='wp core install --url="$DEV_URL" --title="$SITE_TITLE" --admin_user="$WP_ADMIN" --admin_email="$WP_ADMIN_EMAIL" --allow-root'
docker-compose exec wp sh -c "$cmd"

# If file db/import.sql exist
import="$this_dir"/../db/import.sql

if test -f "$import"; then
    # Restore database to db container
    cmd='exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"'
    docker-compose exec -T db sh -c "$cmd" < "$import"

    # Replace LIVE_URL using WP-CLI in wp container
    cmd='wp --allow-root search-replace "$LIVE_URL" "$DEV_URL" --skip-columns=guid'
    docker-compose exec wp sh -c "$cmd"
fi

# Set container ownership
cmd="chown -R www-data:www-data /var/www/html"
docker-compose exec wp sh -c "$cmd"

# Set container permissions
cmd="chmod -R 777 /var/www/html"
docker-compose exec wp sh -c "$cmd"
