FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

# MySQL installation
RUN apt-get -qy install mysql-server-5.5
ADD my.cnf /etc/mysql/my.cnf
ADD start.sh start.sh

# Root credentials
ENV USER root
ENV PASS aiPeekai0AeZ2meephoolais7doo1thu

EXPOSE 3306
CMD ["/start.sh"]
