FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV USER root
ENV PASS aiPeekai0AeZ2meephoolais7doo1thu

RUN apt-get -qqy install mysql-server-5.5

ADD my.cnf /etc/mysql/my.cnf
ADD start.sh start.sh

EXPOSE 3306
RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]
