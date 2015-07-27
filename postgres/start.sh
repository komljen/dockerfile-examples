#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
CONF="/etc/postgresql/${PG_VERSION}/main/postgresql.conf"
HBA="/etc/postgresql/${PG_VERSION}/main/pg_hba.conf"
DATA="/var/lib/postgresql/${PG_VERSION}/main"
POSTGRES="/usr/lib/postgresql/${PG_VERSION}/bin/postgres"
#-------------------------------------------------------------------------------
echo "host all  all    0.0.0.0/0  md5" >> "$HBA"
echo "listen_addresses='*'" >> "$CONF"
#-------------------------------------------------------------------------------
echo "Creating superuser: ${USER}"
su postgres -c "${POSTGRES} --single -D ${DATA} -c config_file=${CONF}" <<EOF
CREATE USER $USER WITH SUPERUSER PASSWORD '$PASS';
EOF
#-------------------------------------------------------------------------------
echo "Starting postgres:"
exec su postgres -c "${POSTGRES} -D ${DATA} -c config_file=${CONF}"
#===============================================================================
