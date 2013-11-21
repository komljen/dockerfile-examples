#!/usr/bin/env bash
#===============================================================================
#    AUTHOR: Alen Komljen <alen.komljen@live.com>
#===============================================================================
set -e

HOME="$( cd "$( dirname "$0" )" && pwd )"
#-------------------------------------------------------------------------------
build(){
    echo "Build docker images:"
    docker build -t komljen/ubuntu $HOME/ubuntu/.
    docker build -t komljen/mysql $HOME/mysql/.
    docker build -t komljen/apache $HOME/apache/.
    docker build -t komljen/wordpress $HOME/wordpress/.
}
#-------------------------------------------------------------------------------
rebuild(){
    echo "Rebuild docker images:"
    docker build -no-cache -t komljen/ubuntu $HOME/ubuntu/.
    docker build -no-cache -t komljen/mysql $HOME/mysql/.
    docker build -no-cache -t komljen/apache $HOME/apache/.
    docker build -no-cache -t komljen/wordpress $HOME/wordpress/.
}
#-------------------------------------------------------------------------------
stop(){
    docker ps
    echo "Stopping docker containers:"
    for i in {mysql,wordpress}
    do
        docker stop $i
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
    echo "Killing docker containers:"
    for i in {mysql,wordpress}
    do
        docker kill $i
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
        echo $"Usage: $0 {start|stop|build|rebuild|kill|rm|rmi}"
        RETVAL=1
esac
#-------------------------------------------------------------------------------
