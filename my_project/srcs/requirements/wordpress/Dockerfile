FROM alpine:3.13
RUN apk update && apk upgrade

RUN	apk add wget perl
RUN apk add php7 php7-phar php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

# bash and rc-service
RUN apk add bash openrc

# copy config php-fpm
COPY ./conf/php-fpm.conf /etc/php7/
COPY ./conf/www.conf /etc/php7/php-fpm.d/
COPY ./conf/php.ini /etc/php7/

# install wp-cli
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	mv wp-cli.phar /usr/bin/wp-cli && chmod +x /usr/bin/wp-cli

# install wordpress
RUN mkdir -p /var/www/html
RUN chmod 775 /var/www/html
RUN wp-cli --path=/var/www/html core download

# copy config wp
COPY ./conf/wp-config-sample.php /var/www/html

EXPOSE 9000

COPY ./tools/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]