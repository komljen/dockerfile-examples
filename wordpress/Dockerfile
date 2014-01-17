FROM komljen/php-apache
MAINTAINER Alen Komljen <alen.komljen@live.com>

ENV WP_PASS aeshiethooghahtu4Riebooquae6Ithe
ENV WP_USER wordpress
ENV WP_DB wordpress
ENV APP_ROOT /var/www

ADD http://wordpress.org/latest.tar.gz wordpress.tar.gz
RUN tar xzf wordpress.tar.gz -C $APP_ROOT --strip-components 1
RUN rm wordpress.tar.gz

ADD start.sh start.sh

VOLUME ["/var/www"]

EXPOSE 80
RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]
