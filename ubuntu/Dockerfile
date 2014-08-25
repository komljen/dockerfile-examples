FROM ubuntu:precise
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

RUN echo $'#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d

RUN apt-get -qq update
RUN apt-get -qqy upgrade
RUN apt-get -qqy install python-software-properties vim pwgen unzip curl git-core

ADD tcp_wait.sh tcp_wait.sh
ADD create_db_pg.sh create_db_pg.sh
ADD create_db_mysql.sh create_db_mysql.sh
