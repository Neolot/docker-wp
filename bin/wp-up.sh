#!/usr/bin/env bash
  
# Initial setup Wordpress
cmd='wp core install --url=$DEV_URL --title=Test --admin_user=neolot --admin_email=neolot@gmail.com --allow-root'
docker-compose exec wp sh -c "$cmd"

# Restore database to db container
cmd='exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"'
docker exec -i $(docker-compose ps -q db) sh -c "$cmd" < db/current.sql
 
# Replace LIVE_URL using WP-CLI in wp container
cmd='wp --allow-root search-replace "$LIVE_URL" "$DEV_URL" --skip-columns=guid'
docker-compose exec wp sh -c "$cmd"

# Set container permissions
cmd='chown -R www-data:www-data /var/www/html'
docker-compose exec wp sh -c "$cmd"

# Set local project permisions
sudo chown -R neolot:neolot ./project