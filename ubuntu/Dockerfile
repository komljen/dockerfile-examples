FROM ubuntu:precise

# Add repo
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

# Update and upgrade
RUN apt-get -qq update
RUN apt-get -qy upgrade
RUN apt-get -qy install python-software-properties vim pwgen
