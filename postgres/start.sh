#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
CONF="/etc/postgresql/${PG_VERSION}/main/postgresql.conf"
DATA="/var/lib/postgresql/${PG_VERSION}/main"
POSTGRES="/usr/lib/postgresql/${PG_VERSION}/bin/postgres"
#-------------------------------------------------------------------------------
echo "Creating superuser: ${USER}"
su postgres -c "${POSTGRES} --single -D ${DATA} -c config_file=${CONF}" <<EOF
CREATE USER $USER WITH SUPERUSER PASSWORD '$PASS';
EOF
#-------------------------------------------------------------------------------
echo "Starting postgres:"
su postgres -c "${POSTGRES} -D ${DATA} -c config_file=${CONF}"
#===============================================================================
