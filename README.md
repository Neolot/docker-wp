# Local WordPress Development in Docker on Debian/Ubuntu Linux

A setup for installing WordPress in Docker on Ubuntu for local development.  
Runs on Apache, PHP 8.4, MySQL 8, XDebug, WordPress, and WP-CLI.

Make sure you already have `git`, `docker`, and `docker-compose` installed.  
If not, see the installation guides below.

## Installation
### Create a project
Download and copy the files to the folder where your project will be located.  
You can download the zip archive or simply type in the console:
```shell script
$ git clone https://github.com/Neolot/docker-wp.git
```
After creating the project, navigate to the `docker-wp` folder:
```shell script
$ cd docker-wp/
```
### Configuration
The `docker-compose.yml` file contains all the settings for the project in the `environment` section.  
You can leave it as is or modify it to your liking.  
Don't forget to add the local domain to your `hosts` file. By default, it's `development.site`:
```text
127.0.0.1   development.site
```
#### Database import during installation
The script can automatically import a database during installation.  
Place an import file named `import.sql` in the `db` folder, and it will be loaded.

Make sure that the domain of the site from which you exported the database is specified in `docker-compose.yml` (the `LIVE_URL` parameter).
Then during import, the site domain will be automatically changed to the value of the `DEV_URL` parameter.

### Project installation
```shell script
$ ./install.sh
```
After this, the images will start downloading and the containers will be installed.

If everything went successfully, the site will be available at:
```text
http://development.site
```
If you get an error after launching:
> /usr/bin/env: ‘bash\r’: No such file or directory

simply change the line endings in the script to `LF` and run the script again.
## Starting and stopping containers
After the first launch, the containers are immediately ready to work. And you no longer need to reinstall everything each time, as the containers are already created.

Start containers:
```shell script
$ bin/docker-start.sh
```
Stop containers:
```shell script
$ bin/docker-stop.sh
```

### Uninstalling the project
```shell script
$ ./uninstall.sh
```
This will delete the database and all files in the `project` folder.
