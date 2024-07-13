#!/bin/bash

while ! mariadb -h mariadb -u$SQL_USER -p$SQL_PASSWORD <<< "SHOW databases;" &>/dev/null; do
	echo "waiting for mariadb"
	sleep 1
done

echo "Starting config.sh script..."

# checks if wp-config.php exists, only executes the first time
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "wp-config.php not found, creating..."

    cd /var/www/html

    wp config create --allow-root \
                     --dbname="${SQL_DATABASE}" \
                     --dbuser="${SQL_USER}" \
                     --dbpass="${SQL_PASSWORD}" \
                     --dbhost="mariadb:3306" \
                     --path='/var/www/html'
else
    echo "wp-config.php found."
fi

if ! wp --allow-root core is-installed &>/dev/null; then
    echo "wp core not installed, installing..."

    wp core install --allow-root \
                    --url=${WP_URL} \
                    --title="${WP_TITLE}" \
                    --admin_user=${WP_ADMIN} \
                    --admin_password=${WP_ADMIN_PASSWORD} \
                    --admin_email=${WP_ADMIN_EMAIL} \
                    --path='/var/www/html'

    echo "admin user: ${WP_ADMIN} created"

    wp user create --allow-root \
                   $WP_USER_NAME \
		   $WP_USER_EMAIL \
                   --role=editor \
                   --user_pass=${WP_USER_PASSWORD} \
                   --path='/var/www/html'

    echo "user: ${WP_USER_NAME} created"

else
	echo "wp core already installed"
fi

$@
