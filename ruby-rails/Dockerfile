FROM komljen/ruby
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV RAILS_VERSION 3.2.16

RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -qq update
RUN apt-get -qqy install nodejs

RUN apt-get -qqy install libpq-dev libxslt-dev libxml2-dev postgresql-client-9.1
RUN /bin/bash -c -l 'gem install rails -v $RAILS_VERSION'
