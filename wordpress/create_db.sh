#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
mysql -h $MYSQL_PORT_3306_TCP_ADDR -u $MYSQL_ENV_USER -p$MYSQL_ENV_PASS <<EOF
CREATE DATABASE $WP_DB;
GRANT ALL PRIVILEGES ON $WP_DB.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_PASS';
EOF
#===============================================================================
