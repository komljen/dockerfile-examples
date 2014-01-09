FROM komljen/ruby
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV RAILS_VERSION 3.2.16

RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -qq update
RUN apt-get -qqy install nodejs

RUN apt-get -qqy install libxslt-dev libxml2-dev
RUN apt-get -qqy install libpq-dev postgresql-client
RUN apt-get -qqy install libmysqld-dev libmysqlclient-dev mysql-client
RUN apt-get -qqy install libsqlite3-dev

RUN /bin/bash -c -l 'gem install rails -v $RAILS_VERSION'
