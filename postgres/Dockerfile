FROM komljen/ubuntu
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV PG_VERSION 9.3
ENV USER docker
ENV PASS SiHRDZ3Tt13uVVyH0ZST

RUN \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
       > /etc/apt/sources.list.d/pgdg.list && \
  curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc \
       | apt-key add - && \
  apt-get update && \
  apt-get -y install \
          postgresql-${PG_VERSION} \
          postgresql-contrib-${PG_VERSION} && \
  rm -rf /var/lib/apt/lists/*

COPY start.sh start.sh

RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]

EXPOSE 5432
