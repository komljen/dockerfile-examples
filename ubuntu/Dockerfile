FROM ubuntu:precise
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq update
RUN apt-get -qy upgrade
RUN apt-get -qy install python-software-properties vim pwgen unzip curl git-core
