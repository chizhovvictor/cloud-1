FROM alpine:3.13
RUN apk update && apk upgrade

RUN	apk add mysql mysql-client perl --no-cache
# bash and rc-service
RUN apk add bash openrc

RUN mkdir -p /run/mysqld
RUN	mkdir -p /var/lib/mysql
COPY ./conf/my.cnf /etc/mysql/
RUN	rm -rf /etc/my.cnf*

EXPOSE 3306

COPY ./tools/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]