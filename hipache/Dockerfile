FROM komljen/nodejs
MAINTAINER Alen Komljen <alen.komljen@live.com>

RUN \
  npm install hipache -g

COPY config.json config.json
COPY start.sh start.sh

RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]

EXPOSE 80
