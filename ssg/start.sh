#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
echo "Waiting for postgres:"
./tcp_wait.sh $POSTGRES_PORT_5432_TCP_ADDR $POSTGRES_PORT_5432_TCP_PORT
#-------------------------------------------------------------------------------
echo "Creating database:"
./create_db_pg.sh $RAILS_DB $RAILS_USER $RAILS_PASS
#-------------------------------------------------------------------------------
source /usr/local/rvm/scripts/rvm
echo "Pulling latest changes:"
cd $APP_ROOT
git pull origin master
bundle install
#-------------------------------------------------------------------------------
echo "Creating database.yml:"
cat > config/database.yml <<EOF
development:
  adapter: postgresql
  host: $POSTGRES_PORT_5432_TCP_ADDR
  database: $RAILS_DB
  username: $RAILS_USER
  password: $RAILS_PASS
EOF
rake db:migrate
#-------------------------------------------------------------------------------
echo "Starting rails:"
exec rails s
#===============================================================================
