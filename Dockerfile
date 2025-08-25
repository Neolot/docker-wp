FROM wordpress:php8.4-apache

RUN apt update && apt -y install less zip unzip

# Install Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install WP-CLI
RUN curl -s -o /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp
