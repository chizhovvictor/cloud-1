FROM alpine:3.13
RUN apk update && apk upgrade

# bash and rc-service
RUN apk add bash openrc wget php php-session php-mysqli php-sqlite3 php-pdo_pgsql php-gd php-pdo_mysql php-pdo_sqlite

# install adminer
RUN mkdir -p /var/www/adminer
RUN chmod 775 /var/www/adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN mv adminer-4.8.1.php /var/www/adminer/index.php


EXPOSE 5000

COPY ./tools/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]