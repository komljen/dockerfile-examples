#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
echo "Waiting for mysql:"
./tcp_wait.sh $MYSQL_PORT_3306_TCP_ADDR $MYSQL_PORT_3306_TCP_PORT
#-------------------------------------------------------------------------------
echo "Creating database:"
./create_db_mysql.sh $WP_DB $WP_USER $WP_PASS
#-------------------------------------------------------------------------------
sed -e "s/database_name_here/$WP_DB/
s/username_here/$WP_USER/
s/password_here/$WP_PASS/
s/localhost/$MYSQL_PORT_3306_TCP_ADDR/
/'AUTH_KEY'/s/put your unique phrase here/$(pwgen -c -n -1 65)/
/'SECURE_AUTH_KEY'/s/put your unique phrase here/$(pwgen -c -n -1 65)/
/'LOGGED_IN_KEY'/s/put your unique phrase here/$(pwgen -c -n -1 65)/
/'NONCE_KEY'/s/put your unique phrase here/$(pwgen -c -n -1 65)/
/'AUTH_SALT'/s/put your unique phrase here/$(pwgen -c -n -1 65)/
/'SECURE_AUTH_SALT'/s/put your unique phrase here/$(pwgen -c -n -1 65)/
/'LOGGED_IN_SALT'/s/put your unique phrase here/$(pwgen -c -n -1 65)/
/'NONCE_SALT'/s/put your unique phrase here/$(pwgen -c -n -1 65)/"             \
$APP_ROOT/wp-config-sample.php > $APP_ROOT/wp-config.php

chown -R www-data: $APP_ROOT
#-------------------------------------------------------------------------------
echo "Starting wordpress:"
source /etc/apache2/envvars
exec /usr/sbin/apache2 -D FOREGROUND
#===============================================================================
