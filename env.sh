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
    echo "Stopping docker containers:"
    for container in $containers
    do
        docker stop $container || true
    done
}
#-------------------------------------------------------------------------------
start(){
    id_name=$(cat $conf | shyaml get-value ${key}.id.name)
    id_image=$(cat $conf | shyaml get-value ${key}.id.image)
    id_port=$(cat $conf | shyaml get-value ${key}.id.port)
    id_port_cmd=$(if [ ! -z "$id_port" ]; then echo "-p ${id_port}:${id_port}"; fi)

    links_num=$(cat $conf | shyaml get-value ${key}.links | grep -c "name") || true

    if [ "$links_num" -ne 0 ]
    then
        n=0
        while [ "$n" -lt "$links_num" ]
        do
            link_name=$(cat $conf | shyaml get-value ${key}.links.${n} | grep name | cut -d' ' -f2)
            link_image=$(cat $conf | shyaml get-value ${key}.links.${n} | grep image | cut -d' ' -f2)

            echo "Starting ${link_name}:"
            docker run -d -name $link_name komljen/$link_image

            if [ ! -z "$links_cmd" ]
            then
                links_cmd=$(echo "-link ${link_name}:${link_image}")
            else
                links_cmd=$(echo $links_cmd" -link ${link_name}:${link_image}")
            fi

            n=$(( n+1 ))
        done
    fi

    echo "Starting ${id_name}:"
    docker run -d -name $id_name                                                \
                  $id_port_cmd                                                  \
                  $links_cmd komljen/$id_image

    docker ps
}
#-------------------------------------------------------------------------------
kill(){
    echo "Killing docker containers:"
    for container in $containers
    do
        docker kill $container || true
    done
}
#-------------------------------------------------------------------------------
rm(){
    echo "Removing stopped containers:"
    docker rm $(docker ps -a -q) || true
}
#-------------------------------------------------------------------------------
rmi(){
    echo "Removing all untagged images:"
    docker images | grep "^<none>" | awk '{print "docker rmi "$3}' | sh
}
#-------------------------------------------------------------------------------
usage (){
    echo "USAGE: $0" option key

    echo -e "\nOptions:"
    for opt in $opts
    do
        echo "    ${opt}"
    done

    echo -e "\nKeys from config.yaml:"
    for key in $keys
    do
        echo "    ${key}"
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
containers=$(cat $conf | shyaml get-value ${key} | grep name | cut -d':' -f2)
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
        rm
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
#===============================================================================
