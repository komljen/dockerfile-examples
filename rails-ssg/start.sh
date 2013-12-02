#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
echo "Waiting for postgres:"
until $(: </dev/tcp/$POSTGRES_PORT_5432_TCP_ADDR/$POSTGRES_PORT_5432_TCP_PORT)
do
    sleep 1
done
#-------------------------------------------------------------------------------
echo "Creating database:"
./create_db.sh
#-------------------------------------------------------------------------------
echo "Create database.yml:"
cat > $APP_ROOT/config/database.yml <<EOF
development:
  adapter: postgresql
  host: $POSTGRES_PORT_5432_TCP_ADDR
  database: $RAILS_DB
  username: $RAILS_USER
  password: $RAILS_PASS
EOF
#-------------------------------------------------------------------------------
echo "Pull latest changes:"
cd $APP_ROOT
git pull origin master
bundle install
rake db:migrate
#-------------------------------------------------------------------------------
echo "Starting rails:"
source /usr/local/rvm/scripts/rvm
rails s
#===============================================================================
