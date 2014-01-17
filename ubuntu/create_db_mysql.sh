#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#     USAGE: ./create_db_mysql.sh DB_NAME DB_USER DB_PASS
#
#===============================================================================
mysql -h $MYSQL_PORT_3306_TCP_ADDR -u $MYSQL_ENV_USER -p$MYSQL_ENV_PASS <<EOF
CREATE DATABASE $1;
GRANT ALL PRIVILEGES ON $1.* TO '$2'@'%' IDENTIFIED BY '$3';
EOF
#===============================================================================
