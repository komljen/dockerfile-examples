#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#
#===============================================================================
set -e

home="$( cd "$( dirname "$0" )" && pwd )"
conf="${home}/config.yaml"
key=$2
keys=$(cat $conf | egrep "^[a-z]" | cut -d':' -f1 | tr '\n' ' ')
opts="start stop restart build rebuild kill rm rmi"
#-------------------------------------------------------------------------------
build(){
    echo "Build docker images:"
    for image in $images
    do
        docker build -t komljen/$image $home/$image/.
    done
}
#-------------------------------------------------------------------------------
rebuild(){
    echo "Rebuild docker images:"
    for image in $images
    do
        docker build -no-cache -t komljen/$image $home/$image/.
    done
}
#-------------------------------------------------------------------------------
stop(){
    set +e
    echo "Stopping docker containers:"
    for container in $containers
    do
        docker stop $container
    done
}
#-------------------------------------------------------------------------------
start(){
    name=$(cat $conf | shyaml get-value ${key}.name)
    port=$(cat $conf | shyaml get-value ${key}.port)
    port_cmd=$(if [ ! -z "$port" ]; then echo "-p ${port}:${port}"; fi)
    links=$(cat $conf | shyaml get-value ${key}.links | cut -d' ' -f2)
    links_cmd=$(for link in ${links}; do echo "-link ${link}:${link}"; done)

    for link in $links
    do
        echo "Starting ${link}:"
        docker run -d -name $link komljen/$link
    done

    echo "Starting ${name}:"
    docker run -d -name $name                                                   \
                  $port_cmd                                                     \
                  $links_cmd komljen/$name

    docker ps
}
#-------------------------------------------------------------------------------
kill(){
    set +e
    echo "Killing docker containers:"
    for container in $containers
    do
        docker kill $container
    done
}
#-------------------------------------------------------------------------------
rm(){
    echo "Removing stopped containers:"
    docker rm $(docker ps -a -q)
}
#-------------------------------------------------------------------------------
rmi(){
    echo "Removing all untagged images:"
    docker images | grep "^<none>" | awk '{print "docker rmi "$3}' | sh
}
#-------------------------------------------------------------------------------
usage (){
    echo "Usage: $0" option key
    
    echo -e "\nOptions:"
    for opt in $opts
    do
        echo " - ${opt}"
    done

    echo -e "\nKeys from config.yaml:"
    for key in $keys
    do
        echo " - ${key}"
    done
    echo ""
    exit 1
}
#-------------------------------------------------------------------------------
if [ ! $# -eq 2 ]
then
    usage
elif [ $(echo $keys | grep -cwm1 $key) -eq 0 ]
then
    usage
fi
#-------------------------------------------------------------------------------
images=$(cat $conf | shyaml get-value ${key}.images | cut -d' ' -f2)
containers=$(cat $conf | shyaml get-value ${key}.containers | cut -d' ' -f2)
#-------------------------------------------------------------------------------
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        kill
        rm
        start
        ;;
    build)
        build
        ;;
    rebuild)
        rebuild
        ;;
    kill)
        kill
        ;;
    rm)
        rm
        ;;
    rmi)
        rmi
        ;;
    *)
        usage
        ;;
esac
#-------------------------------------------------------------------------------
