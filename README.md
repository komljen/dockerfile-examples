Dockerfile examples
======

Script env.sh reads config.yaml, so you don't need to update this script if you want to change something or to add new Docker image. Usage info:

    USAGE: ./env.sh option key

    Options:
        start
        stop
        restart
        build
        rebuild
        kill
        rm
        rmi

    Keys from config.yaml:
        wp
        jenkins
        redis
        mongo
        rails
        ssg
        ghost
        hipache
        abh-jmeter

**NOTE:**
Images values in config.yaml needs to match directory name where Dockerfile is located.

Trusted images
======

Insted of building images on your machine you can get them from trusted image repository on public docker index:
https://index.docker.io/u/komljen/

If you skip build part with env.sh script, images will be automatically pulled from docker index.

Image layers
======

    |-- ubuntu:precise
	    |-- komljen/ubuntu
	        |-- komljen/redis
	        |-- komljen/apache
	        |   |-- komljen/php-apache
	        |       |-- komljen/wordpress
	        |-- komljen/nodejs
	        |   |-- komljen/ghost
	        |   |-- komljen/hipache
	        |-- komljen/postgres
	        |-- komljen/mysql
	        |-- komljen/mongo
	        |-- komljen/jdk-oracle
	        |   |-- komljen/tomcat
	        |   |-- komljen/jenkins
	        |   |-- komljen/maven
	        |       |-- komljen/jmeter-abh
	        |-- komljen/ruby
	        |   |-- komljen/ruby-rails
	        |       |-- komljen/ssg
	        |       |-- komljen/rails-sample-app

Dependencies
======

Docker 1.3 and above. Installation on Ubuntu 14.04:

    wget -qO- https://get.docker.io/gpg | apt-key add -
    echo "deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
    apt-get update
    apt-get -y install lxc-docker

Shyaml shell yaml parser:

    apt-get -y install python-pip && pip install shyaml

When all is ready clone this git repository:

    git clone https://github.com/komljen/dockerfile-examples.git && cd dockerfile-examples

Mac OSX
======

Requirements to run docker on Mac OSX:

- VirtualBox
- brew

Install and run boot2docker:

    brew install boot2docker
    boot2docker init
    boot2docker up

Export DOCKER_HOST variable and test if docker client is connected to server:

    docker ps
    
Tools required for my env.sh script:

    brew install python
    brew install libyaml
    pip install shyaml

Port forwarding example from localhost:8080 to port 80 inside boot2docker-vm:
    
    VBoxManage controlvm boot2docker-vm natpf1 "web,tcp,127.0.0.1,8080,,80"

When all is ready clone this git repository:

    git clone https://github.com/komljen/dockerfile-examples.git && cd dockerfile-examples

WordPress example
======

To build WordPress images run ( https://github.com/komljen/dockerfile-examples#trusted-images ):

    ./env.sh build wp

This command will build all images from config.yaml (wp.images) needed by WordPress.


To start WordPress:

    ./env.sh start wp

This command will search for dependencies (wp.links) and start them first if they are present. Then it will run new container which will be linked to dependencies. Also it will read port (wp.service.port) and name (wp.service.name).

WordPress installation will be available at: http://localhost

Also thanks to Docker VOLUMES you can access to Apache root directory (/var/www) or to MySQL from new container:

    docker run -i -t --volumes-from wordpress --link mysql:mysql komljen/wordpress /bin/bash

To access to MySQL database from container:

    mysql -h $MYSQL_PORT_3306_TCP_ADDR -u $WP_USER -p$WP_PASS

Hipache example
======

To build Hipache images run ( https://github.com/komljen/dockerfile-examples#trusted-images ):

    ./env.sh build hipache

To start Hipache:

    ./env.sh start hipache

Updating redis configuration from new container:

    docker run -t -rm --link redis:redis komljen/redis /bin/bash -c \
           'redis-cli -h $REDIS_PORT_6379_TCP_ADDR rpush frontend:www.dotcloud.com mywebsite'

Ghost example
======

To build Ghost images run ( https://github.com/komljen/dockerfile-examples#trusted-images ):

    ./env.sh build ghost

To start Ghost:

    ./env.sh start ghost
