FROM komljen/nodejs
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV GHOST_VERSION 0.3.3
ENV APP_ROOT /data/app

RUN curl -sLO http://ghost.org/archives/ghost-$GHOST_VERSION.zip
RUN mkdir -p $APP_ROOT && unzip -uo ghost-$GHOST_VERSION.zip -d $APP_ROOT
RUN rm ghost-$GHOST_VERSION.zip
RUN cd $APP_ROOT && npm install --production

ADD start.sh start.sh

VOLUME ["/data/app"]

EXPOSE 2368
CMD ["/start.sh"]
