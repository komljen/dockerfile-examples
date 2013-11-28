FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV VERSION 1.9.3

RUN apt-get -qy install curl git-core
RUN curl -ssL https://get.rvm.io | bash -s stable
RUN rvm requirements
RUN rvm install ruby-$VERSION
RUN /bin/bash -l -c 'rvm use $VERSION --default'
