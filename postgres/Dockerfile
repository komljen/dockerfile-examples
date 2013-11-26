FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV VERSION 9.1
ENV USER docker
ENV PASS SiHRDZ3Tt13uVVyH0ZST

RUN apt-get -qy install postgresql-$VERSION

ADD postgresql.conf etc/postgresql/$VERSION/main/postgresql.conf
ADD pg_hba.conf etc/postgresql/$VERSION/main/pg_hba.conf
ADD start.sh start.sh

EXPOSE 5432
CMD ["/start.sh"]
