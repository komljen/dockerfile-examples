FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV VERSION 2.4.8

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
RUN apt-get -qq update
RUN apt-get -qy install mongodb-10gen=$VERSION

VOLUME ["/data/db"]

EXPOSE 27017
CMD ["usr/bin/mongod"]
