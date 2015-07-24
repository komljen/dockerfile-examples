FROM komljen/ruby-rails
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV RAILS_PASS aeshiethooghahtu4Riebooquae6Ithe
ENV RAILS_USER rails
ENV RAILS_DB rails
ENV APP_ROOT /data/app

RUN \
  git clone https://github.com/ssg-org/ssg.git ${APP_ROOT} && \
  cd ${APP_ROOT} && \
  /bin/bash -c -l 'bundle install'

COPY start.sh start.sh

VOLUME ["$APP_ROOT"]

RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]

EXPOSE 3000
