FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add openssl nginx
# bash
RUN apk add --no-cache bash
# rc-service
RUN apk add openrc --no-cache


# Ssl
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 -subj "/CN=localhost" \
-keyout /etc/ssl/private/ft_server.key -out /etc/ssl/certs/ft_server.crt

# Nginx
RUN mkdir /www
RUN	mkdir -p /run/nginx
RUN chmod 775 /run/nginx/
COPY ./conf/* /etc/nginx/conf.d/

EXPOSE 443

COPY ./tools/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]