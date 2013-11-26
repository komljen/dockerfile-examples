FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -qq update
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -qy install oracle-java6-installer
RUN update-alternatives --display java
