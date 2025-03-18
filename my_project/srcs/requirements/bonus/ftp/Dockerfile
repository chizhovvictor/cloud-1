FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add vsftpd openssl --no-cache
# bash and rc-service
RUN apk add bash openrc

COPY ./conf/vsftpd.conf /etc/
RUN mkdir -p /var/www/html
RUN chmod -R 775 /var/www/html

# Ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj "/CN=localhost" \
-keyout /etc/ssl/private/ft_server.key -out /etc/ssl/certs/ft_server.crt

EXPOSE 21

COPY ./tools/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]