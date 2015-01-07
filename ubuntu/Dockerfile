FROM ubuntu:trusty
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

RUN echo $'#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d

RUN \
  apt-get update && \
  apt-get -y install \
          software-properties-common \
          vim \
          pwgen \
          unzip \
          curl \
          git-core && \
  rm -rf /var/lib/apt/lists/*

ADD tcp_wait.sh tcp_wait.sh
ADD create_db_pg.sh create_db_pg.sh
ADD create_db_mysql.sh create_db_mysql.sh
