FROM komljen/nodejs
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV GHOST_VERSION 0.5.7
ENV APP_ROOT /data/app

RUN \
  curl -sLO http://ghost.org/archives/ghost-${GHOST_VERSION}.zip && \
  mkdir -p ${APP_ROOT} && \
  unzip -uo ghost-${GHOST_VERSION}.zip -d ${APP_ROOT} && \
  rm ghost-${GHOST_VERSION}.zip

RUN \
  cd ${APP_ROOT} && \
  npm install --production

COPY start.sh start.sh

VOLUME ["$APP_ROOT"]

RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]

EXPOSE 2368
