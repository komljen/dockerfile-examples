Docker
======

Docker images which can be simply reused for whatever you want.

Script env.sh reads config.yaml, so you don't need to update this script if you want to change something or to add new Docker image. Usage info:
```
Usage: ./env.sh option key

Options:
 - start
 - stop
 - restart
 - build
 - rebuild
 - kill
 - rm
 - rmi

Keys from config.yaml:
 - wp
 - redis
 - mongo
 - rails
```

**NOTE:**
All values in config.yaml except port needs to match directory name where Dockerfile is located.

Tested on Ubuntu 12.04.3

Image layers
======

<img src="https://dl.dropboxusercontent.com/s/7u6fw9ytl6kxdiu/image_layers.png" title="Image layers" />

Dependencies
======

Docker 0.6.6 and above:
```
docker version
```

Shyaml shell yaml parser:
```
apt-get -y install python-pip && pip install shyaml
```

WordPress example
======

To build WordPress images run:
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
