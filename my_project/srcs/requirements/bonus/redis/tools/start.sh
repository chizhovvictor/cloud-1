#!/bin/bash

perl -pe 's/\$([_A-Z]+)/$ENV{$1}/g' < /root/redis.conf > /usr/local/etc/redis/redis.conf
rm -f /root/redis.conf

redis-server --include /usr/local/etc/redis/redis.conf