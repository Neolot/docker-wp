# Локальная разработка Wordpress в Docker на Ubuntu

Сборка для установки Wordpress в Docker на Ubuntu для локальной разработки.  
Работает на Apache, PHP 7.4, MySQL 8, XDebug, Wordpress и WP-CLI.

Убедитесь, что у вас уже установлен `git`, `docker` и `docker-compose`.  
Если нет, мануалы по установке смотрите ниже.

## Установка
### Создайте проект
Скачайте и скопируйте файлы в папку, где будет находиться ваш проект.  
Можете скачать zip-архив или просто набрать в консоли:
```shell script
$ git clone https://github.com/Neolot/docker-wp.git
```
После создания проекта, перейдите в папку `docker-wp`:
```shell script
$ cd docker-wp/
```
### Конфигурация
В файле `docker-compose.yml` в секции `environment` содержатся все настройки для работы проекта.  
Можете оставить как есть или изменить по своему вкусу.  
Не забудьте добавить локальный домен в ваш `hosts`. По-умолчанию это `development.site`:
```text
127.0.0.1   development.site
```
#### Импорт БД при установке
Скрипт может автоматически импортировать БД во время установки.  
Положите файл импорта с именем `import.sql` в папку `db`, и он будет загружен.

Убедитесь, что в `docker-compose.yml` указан домен того сайта, из которого вы сделали экспорт (параметр `LIVE_URL`).
Тогда при импорте домен сайта будет автоматически изменен на значение параметра `DEV_URL`.

### Установка проекта
```shell script
$ ./install.sh
```
После этого начнется скачивание образов и установка контейнеров.

Если всё прошло успешно, сайт будет доступен по адресу:
```text
http://development.site
```
Если после запуска у вас ошибка:
> /usr/bin/env: ‘bash\r’: No such file or directory

то просто поменяйте переносы в скрипте на `LF` и повторно запустите скрипт.
## Запуск и остановка контейнеров
После первого запуска контейнеры сразу готовы к работе. И вам больше не нужно каждый раз заново все устанавливать, ведь контейнеры уже созданы.

Запустить контейнеры:
```shell script
$ bin/docker-start.sh
```
Остановить контейнеры:
```shell script
$ bin/docker-stop.sh
```

### Удаление проекта
```shell script
$ ./uninstall.sh
```
При этом будет удалена БД и все файлы в папке `project`.

## Установка docker и docker-compose
[How To Install and Use Docker on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)  
[Установка Docker Compose в Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04-ru)
