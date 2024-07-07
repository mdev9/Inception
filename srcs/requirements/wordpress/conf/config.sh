#!/bin/bash

until mysqladmin ping -hmariadb --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
done

# checks if wp-config.php exists, only executes the first time
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp config create --allow-root \
                     --dbname="$SQL_DATABASE" \
                     --dbuser="$SQL_USER" \
                     --dbpass="$SQL_PASSWORD" \
                     --dbhost="mariadb:3306" \
                     --path='/var/www/wordpress'

    wp core install --allow-root \
                    --url="https://marde-vr.42.fr" \
                    --title="Epic website" \
                    --admin_user="marde-vr" \
                    --admin_password="password" \
                    --admin_email="marde-vr@marde-vr.42.fr" \
                    --path='/var/www/wordpress'

    wp user create --allow-root \
                   test \
                   test@marde-vr.42.fr \
                   --role=editor \
                   --user_pass=password \
                   --path='/var/www/wordpress'
fi

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F
