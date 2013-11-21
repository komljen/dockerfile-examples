FROM komljen/apache
MAINTAINER Alen Komljen <alen.komljen@live.com>

# Get latest wordpress
ADD http://wordpress.org/latest.tar.gz wordpress.tar.gz
RUN tar xzf wordpress.tar.gz
RUN mv wordpress /var/www/
RUN rm wordpress.tar.gz

ADD create_db.sh create_db.sh
ADD start.sh start.sh

# Set wordpress database password
ENV WP_PASS aeshiethooghahtu4Riebooquae6Ithe
ENV WP_USER wordpress
ENV WP_DB wordpress

EXPOSE 80
CMD ["/start.sh"]
