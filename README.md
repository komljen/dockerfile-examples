Docker
======

Dockerfile examples that can be reused for whatever you want.

Script env.sh reads config.yaml, so you don't need to update this script if you want to change something or to add new Docker image. Usage info:
```
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
    redis
    mongo
    rails
    ssg
    ghost
    hipache
```

**NOTE:**
All values in config.yaml except port needs to match directory name where Dockerfile is located.

Tested on Ubuntu 12.04.3

Trusted images
======

Insted of building images on your machine you can get them from trusted image repository on public docker index:
https://index.docker.io/u/komljen/

If you skip build part with env.sh script, images will be automatically pulled from docker index.

Image layers
======

<img src="https://dl.dropboxusercontent.com/s/7u6fw9ytl6kxdiu/image_layers.png" title="Image layers" />

Dependencies
======

Docker 0.6.6 and above. Installation on Ubuntu 12.04.3:
```
wget -qO- https://get.docker.io/gpg | apt-key add -
echo "deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get -y install lxc-docker
```

Shyaml shell yaml parser:
```
apt-get -y install python-pip && pip install shyaml
```

When all is ready clone git repository:
```
git clone git@github.com:komljen/docker.git && cd docker
```

WordPress example
======

To build WordPress images run ( https://github.com/komljen/docker#trusted-images ):
```
./env.sh build wp
```

This command will build all images from config.yaml (wp.images) needed by WordPress.


To start WordPress:
```
./env.sh start wp
```

This command will search for dependencies (wp.links) and start them first if they are present. Then it will run new container which will be linked to dependencies. Also it will read port (wp.port) and name (wp.name).

WordPress installation will be available at: http://localhost

Also thanks to Docker VOLUMES you can access to Apache root directory (/var/www) or to MySQL from new container:
```
docker run -i -t -volumes-from wordpress -link mysql:mysql komljen/wordpress /bin/bash
```

To access to MySQL database from container:
```
mysql -h $MYSQL_PORT_3306_TCP_ADDR -u $WP_USER -p$WP_PASS
```

Hipache example
======

To build Hipache images run ( https://github.com/komljen/docker#trusted-images ):
```
./env.sh build hipache
```

To start Hipache:
```
./env.sh start hipache
```

Updating redis configuration from new container:
```
docker run -t -rm -link redis:redis komljen/redis /bin/bash -c \
'redis-cli -h $REDIS_PORT_6379_TCP_ADDR rpush frontend:www.dotcloud.com mywebsite'
```

Ghost example
======

To build Ghost images run ( https://github.com/komljen/docker#trusted-images ):
```
./env.sh build ghost
```

To start Ghost:
```
./env.sh start ghost
