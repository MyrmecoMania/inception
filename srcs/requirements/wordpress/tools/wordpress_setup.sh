#!/bin/bash

# waiting for DB to be up
sleep 10

# checking if wordpress config already exists
if [ -f "wp-config.php" ]; then
    echo "Configuration already exists, exiting..."
    php-fpm7.3 -F
    exit 0
else
    echo "Configurating wordpress"
fi

# creating config
echo "wp config create"
wp config create	--allow-root \
                    --dbname=$SQL_DATABASE_NAME \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb --path='/var/www/html'

echo "wp core install"
wp core install	--allow-root \
                --url=http://enorie.42.fr \
                --title=inception \
                --admin_user=enorie \
                --admin_password=12345\
                --admin_email=test@test.com --path='/var/www/html'

wp user create paul paul@paul.com --allow-root --user_pass=123

echo "starting php"
php-fpm7.3 -F