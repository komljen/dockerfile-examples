FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV PG_VERSION 9.2
ENV USER docker
ENV PASS SiHRDZ3Tt13uVVyH0ZST

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get -qq update

RUN apt-get -qqy install postgresql-$PG_VERSION postgresql-contrib-$PG_VERSION

ADD postgresql.conf etc/postgresql/$PG_VERSION/main/postgresql.conf
ADD pg_hba.conf etc/postgresql/$PG_VERSION/main/pg_hba.conf
ADD start.sh start.sh

EXPOSE 5432
RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]
