FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install wget php7.4 php-fpm php-mysql mariadb-client -y

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html

RUN cd /var/www/html && tar -xzf latest.tar.gz && rm latest.tar.gz

RUN mv /var/www/html/wordpress/* /var/www/html/

RUN chmod -R 755 /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/config.sh /usr/local/bin/config.sh

RUN chmod +x /usr/local/bin/config.sh

ENTRYPOINT ["/usr/local/bin/config.sh"]

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
