FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

RUN add-apt-repository -y ppa:chris-lea/redis-server
RUN apt-get -qq update
RUN apt-get -qqy install redis-server

EXPOSE 6379
RUN rm /usr/sbin/policy-rc.d
CMD ["/usr/bin/redis-server"]
