#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
echo "Pull latest changes:"
cd $APP_ROOT
git pull origin master
cp $APP_ROOT/config/database.yml.example $APP_ROOT/config/database.yml
bundle install
rake db:migrate
#-------------------------------------------------------------------------------
echo "Starting rails:"
source /usr/local/rvm/scripts/rvm
rails s
#===============================================================================
