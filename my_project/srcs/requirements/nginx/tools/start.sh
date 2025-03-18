#!/bin/bash

openrc
touch /run/openrc/softlevel
nginx -g 'daemon off;'
# bash