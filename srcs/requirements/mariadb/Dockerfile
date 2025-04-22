FROM debian:buster
RUN apt update -y  && apt upgrade -y && apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/database_create.sh /
RUN chmod 755 /database_create.sh
CMD ["sh", "./database_create.sh"]