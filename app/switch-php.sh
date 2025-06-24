#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <php-version> (e.g., 8.3 or 8.4)"
    exit 1
fi

PHP_VERSION=$1

# Validate PHP version
if ! command -v php${PHP_VERSION} &> /dev/null; then
    echo "PHP ${PHP_VERSION} is not installed."
    exit 1
fi

# Switch CLI version
sudo update-alternatives --set php /usr/bin/php${PHP_VERSION}
echo "CLI PHP switched to version ${PHP_VERSION}"

# Switch Apache PHP-FPM
sudo systemctl stop php8.3-fpm php8.4-fpm php8.2-fpm php8.1-fpm php8.0-fpm php7.2-fpm php7.0-fpm
sudo a2disconf php8.3-fpm php8.4-fpm php8.2-fpm php8.1-fpm php8.0-fpm php7.2-fpm php7.0-fpm
sudo a2enconf php${PHP_VERSION}-fpm
sudo systemctl start php${PHP_VERSION}-fpm
sudo systemctl restart apache2

echo "Apache PHP-FPM switched to version ${PHP_VERSION}"
php -v

