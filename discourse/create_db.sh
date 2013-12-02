#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
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
CREATE EXTENSION hstore;
CREATE DATABASE $RAILS_DB;
CREATE USER $RAILS_USER WITH PASSWORD '$RAILS_PASS';
GRANT ALL PRIVILEGES ON DATABASE $RAILS_DB to $RAILS_USER;
EOF
#===============================================================================
