FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/init-db.sh /usr/local/bin/init-db.sh

RUN chmod +x /usr/local/bin/init-db.sh

ENTRYPOINT ["/usr/local/bin/init-db.sh"]

EXPOSE 3306

CMD ["mysqld"]
