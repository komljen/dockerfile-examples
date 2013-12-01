FROM komljen/apache
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV WP_PASS aeshiethooghahtu4Riebooquae6Ithe
ENV WP_USER wordpress
ENV WP_DB wordpress
ENV APP_ROOT /var/www

ADD http://wordpress.org/latest.tar.gz wordpress.tar.gz
RUN tar xzf wordpress.tar.gz -C $APP_ROOT --strip-components 1
RUN rm wordpress.tar.gz

ADD create_db.sh create_db.sh
ADD start.sh start.sh

VOLUME ["/var/www"]

EXPOSE 80
CMD ["/start.sh"]
