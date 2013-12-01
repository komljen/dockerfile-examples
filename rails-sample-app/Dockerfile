FROM komljen/ruby-rails
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV APP_ROOT /data/app

RUN git clone https://github.com/railstutorial/sample_app_2nd_ed.git $APP_ROOT
RUN cd $APP_ROOT && bundle install

ADD start.sh start.sh

VOLUME ["/data/app"]

EXPOSE 3000
CMD ["/start.sh"]
