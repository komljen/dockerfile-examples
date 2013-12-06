#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
echo "Waiting for redis:"
until $(: </dev/tcp/$REDIS_PORT_6379_TCP_ADDR/$REDIS_PORT_6379_TCP_PORT)
do
   sleep 1
done
#-------------------------------------------------------------------------------
sed -e "s/localhost/$REDIS_PORT_6379_TCP_ADDR/g" -i config.json
#-------------------------------------------------------------------------------
echo "Starting hipache:"
/usr/bin/hipache -c config.json
#===============================================================================
