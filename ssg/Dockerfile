FROM komljen/ruby-rails
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV RAILS_PASS aeshiethooghahtu4Riebooquae6Ithe
ENV RAILS_USER rails
ENV RAILS_DB rails
ENV APP_ROOT /data/app

RUN git clone https://github.com/ssg-org/ssg.git $APP_ROOT
RUN cd $APP_ROOT && /bin/bash -c -l 'bundle install'

ADD create_db.sh create_db.sh
ADD start.sh start.sh

VOLUME ["/data/app"]

EXPOSE 3000
RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]
