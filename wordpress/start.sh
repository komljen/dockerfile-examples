#!/usr/bin/env bash
#===============================================================================
# 
#===============================================================================
echo "Waiting for mysql:"
until $(: </dev/tcp/$MYSQL_PORT_3306_TCP_ADDR/$MYSQL_PORT_3306_TCP_PORT)
do
    sleep 1
done

echo "Creating database:"
./create_db.sh

sed -e "s/database_name_here/$WP_DB/
s/username_here/$WP_USER/
s/password_here/$WP_PASS/
s/localhost/$MYSQL_PORT_3306_TCP_ADDR/
/'AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
/'SECURE_AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
/'LOGGED_IN_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
/'NONCE_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
/'AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
/'SECURE_AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
/'LOGGED_IN_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
/'NONCE_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/"              \
/var/www/wp-config-sample.php > /var/www/wp-config.php

chown -R www-data: /var/www

echo "Starting wordpress:"
source /etc/apache2/envvars
/usr/sbin/apache2 -D FOREGROUND
#-------------------------------------------------------------------------------
