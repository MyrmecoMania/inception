FROM debian:buster
RUN apt update -y && apt upgrade -y && apt-get install -y wget && apt-get install -y php7.3 \
    php-fpm\
	php-mysql\
	mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && mv wordpress html
RUN chown -R www-data:www-data /var/www/html
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir -p /run/php

WORKDIR /var/www/html
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY tools/wordpress_setup.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/wordpress_setup.sh

ENTRYPOINT ["/usr/local/bin/wordpress_setup.sh"]