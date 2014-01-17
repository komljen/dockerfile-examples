#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#     USAGE: ./create_db_pg.sh DB_NAME DB_USER DB_PASS
#
#===============================================================================
export PGPASSWORD=$POSTGRES_ENV_PASS
#-------------------------------------------------------------------------------
until $(psql -c "\quit" -h $POSTGRES_PORT_5432_TCP_ADDR -d postgres -U $POSTGRES_ENV_USER)
do
    :
done
#-------------------------------------------------------------------------------
psql -h $POSTGRES_PORT_5432_TCP_ADDR -d postgres -U $POSTGRES_ENV_USER <<EOF
CREATE DATABASE $1;
CREATE USER $2 WITH PASSWORD '$3';
GRANT ALL PRIVILEGES ON DATABASE $1 to $2;
EOF
#===============================================================================
