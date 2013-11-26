FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

RUN add-apt-repository -y ppa:chris-lea/redis-server
RUN apt-get -qq update
RUN apt-get -qy install redis-server

EXPOSE 6379
CMD ["usr/bin/redis-server"]
