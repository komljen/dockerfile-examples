#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
source /usr/local/rvm/scripts/rvm
echo "Pull latest changes:"
cd $APP_ROOT
git pull origin master
cp config/database.yml.example config/database.yml
bundle install
rake db:migrate
#-------------------------------------------------------------------------------
echo "Starting rails:"
exec rails s
#===============================================================================
