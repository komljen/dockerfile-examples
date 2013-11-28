FROM komljen/ruby-rails
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV APP_ROOT /opt/app

RUN git clone https://github.com/railstutorial/sample_app_2nd_ed.git $APP_ROOT
RUN cp $APP_ROOT/config/database.yml.example $APP_ROOT/config/database.yml
RUN cd $APP_ROOT && bundle install

ADD start.sh start.sh

VOLUME ["/opt"]

EXPOSE 3000
CMD ["./start.sh"]
