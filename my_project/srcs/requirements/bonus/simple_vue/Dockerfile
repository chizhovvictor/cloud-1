FROM alpine:3.13
RUN apk update && apk upgrade

# bash and rc-service
RUN apk add bash openrc npm php

# install simple_vue
RUN mkdir -p /var/www/simple_vue
RUN chmod 775 /var/www/simple_vue

# copy config wp
COPY ./tools/simple_vue /var/www/simple_vue

EXPOSE 4000

COPY ./tools/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]