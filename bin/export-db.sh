#!/usr/bin/env bash
this_dir=$(cd `dirname $0` && pwd)
file="$this_dir/../data/dump.sql"
 
# Create dump file
cmd='exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"'
docker-compose exec db sh -c "$cmd" > $file
 
# Remove password warning from the file
sed -i '.bak' 1,1d $file && rm "$file.bak"