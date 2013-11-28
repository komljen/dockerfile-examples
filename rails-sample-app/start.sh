#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
echo "Pull latest changes:"
cd $APP_ROOT
git pull origin master
bundle install
rake db:migrate
#-------------------------------------------------------------------------------
echo "Starting rails:"
source /usr/local/rvm/scripts/rvm
rails server
#===============================================================================
