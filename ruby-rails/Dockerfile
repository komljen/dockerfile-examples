FROM komljen/ruby
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV RAILS_VERSION 3.2.17

RUN \
  add-apt-repository -y ppa:chris-lea/node.js && \
  apt-get update && \
  apt-get -y install \
          nodejs \
          libxslt-dev \
          libxml2-dev \
          libpq-dev \
          postgresql-client \
          libmysqld-dev \
          libmysqlclient-dev \
          mysql-client \
          libsqlite3-dev && \
  rm -rf /var/lib/apt/lists/*

RUN \
  /bin/bash -l -c 'gem install rails -v ${RAILS_VERSION}'
