#!/bin/bash

sleep 5

WP_CONFIG="/var/www/html/wp-config.php"

sed -i "s/'database_name_here'/'$MYSQL_DATABASE'/g" "$WP_CONFIG"
sed -i "s/'username_here'/'$MYSQL_USER'/g" "$WP_CONFIG"
sed -i "s/'password_here'/'$MYSQL_PASSWORD'/g" "$WP_CONFIG"
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306');/" "$WP_CONFIG"


echo "define('WP_HOME', 'https://jbalahce.42.fr');
define('WP_SITEURL', 'https://jbalahce.42.fr');" >> $WP_CONFIG


wp core install --allow-root \
    --url=localhost \
    --title="Inception" \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email="jbalahce@student.1337.ma";

wp user create --allow-root $WP_USER "flyerjawad@gmail.com" --user_pass=$WP_USER_PASSWORD;

wp theme install twentytwentytwo --activate --allow-root

wp plugin install redis-cache --activate --allow-root ;

wp config set --allow-root WP_REDIS_CLIENT "phpredis" ;
wp config set --allow-root WP_REDIS_HOST "redis" ;
wp config set --allow-root WP_REDIS_PORT "6380" ;
wp config set --allow-root WP_REDIS_PREFIX "wp_" ;


wp plugin update --all --allow-root

wp redis enable --allow-root ;

exec $@
