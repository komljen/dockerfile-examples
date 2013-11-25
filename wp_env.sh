#!/usr/bin/env bash
#===============================================================================
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#===============================================================================
set -e

home="$( cd "$( dirname "$0" )" && pwd )"
images=(ubuntu mysql apache wordpress)
containers=(mysql wordpress)
#-------------------------------------------------------------------------------
build(){
    echo "Build docker images:"
    for image in "${images[@]}"
    do
        docker build -t komljen/$image $home/$image/.
    done
}
#-------------------------------------------------------------------------------
rebuild(){
    echo "Rebuild docker images:"
    for image in "${images[@]}"
    do
        docker build -no-cache -t komljen/$image $home/$image/.
    done
}
#-------------------------------------------------------------------------------
stop(){
    set +e
    echo "Stopping docker containers:"
    for container in "${containers[@]}"
    do
        docker stop $container
    done
}
#-------------------------------------------------------------------------------
start(){
    echo "Starting mysql:"
    docker run -d -name mysql komljen/mysql
    echo "Starting wordpress:"
    docker run -d -name wordpress                                              \
                  -p 80:80                                                     \
                  -link mysql:mysql komljen/wordpress

    docker ps
}
#-------------------------------------------------------------------------------
kill(){
    set +e
    echo "Killing docker containers:"
    for container in "${containers[@]}"
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
        echo $"Usage: $0 {start|stop|restart|build|rebuild|kill|rm|rmi}"
        RETVAL=1
esac
#-------------------------------------------------------------------------------
