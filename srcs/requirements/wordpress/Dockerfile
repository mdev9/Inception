FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install wget php7.4 php-fpm php-mysql mariadb-client -y

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

RUN echo 'clear_env = no' > /etc/php/7.4/fpm/conf.d/custom.ini && echo 'listen = wordpress:9000' >> /etc/php/7.4/fpm/conf.d/custom.ini

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp 

COPY ./conf/config.sh /usr/local/bin/config.sh

RUN chmod +x /usr/local/bin/config.sh

CMD ["bash", "-c", "/usr/local/bin/config.sh"]
