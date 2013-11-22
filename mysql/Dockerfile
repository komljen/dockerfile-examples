FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

# Set env variables
ENV USER root
ENV PASS aiPeekai0AeZ2meephoolais7doo1thu

# MySQL installation
RUN apt-get -qy install mysql-server-5.5

# Add additional files
ADD my.cnf /etc/mysql/my.cnf
ADD start.sh start.sh

EXPOSE 3306
CMD ["/start.sh"]
