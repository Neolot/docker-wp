# Helper Scripts

## wp-up.sh
Script for final environment setup. Should be run immediately after creating containers.
```bash
$ bin/wp-up.sh
```
1. Installs WordPress.
2. Imports the database and replaces the domain according to settings in docker-compose.yml (searches for lines with LIVE_URL and replaces with DEV_URL), if there is an import.sql file in the db folder.  
If such a file does not exist, a clean WordPress installation will be created.
3. Sets permissions on the site folder in the container and the project folder.

## docker-start.sh
Script for starting containers.
```bash
$ bin/docker-start.sh
```

## docker-stop.sh
Script for stopping containers.
```bash
$ bin/docker-stop.sh
```

## import-db.sh
Script for loading the site database into the container, for example, when you need to deploy a site locally.  
The path to the import file must be specified as a parameter.
```bash
$ bin/import-db.sh import.sql
```
1. Imports the database.
2. Replaces the domain according to settings in docker-compose.yml (searches for lines with LIVE_URL and replaces with DEV_URL).

## export-db.sh
Script for exporting the database from the container, for example, when you need to export the database and upload it to hosting.
```bash
$ bin/export-db.sh
```
1. Replaces the domain in the container database according to settings in docker-compose.yml (searches for lines with DEV_URL and replaces with LIVE_URL).
2. Exports the database to the db folder.
3. Replaces the domain in the container database according to settings in docker-compose.yml (searches for lines with LIVE_URL and replaces with DEV_URL).
