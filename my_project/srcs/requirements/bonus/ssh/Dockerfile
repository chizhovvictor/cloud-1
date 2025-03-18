FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add openssh vim sudo sed
# bash and rc-service
RUN apk add bash openrc  --no-cache

EXPOSE 22

COPY ./tools/start.sh /home/start.sh
RUN chmod 755 /home/start.sh
ENTRYPOINT ["/home/start.sh"]