#!/bin/bash

cd /var/www/simple_vue
npm install
npm install webpack-cli
npm run prod
php -S 0.0.0.0:4000 -t /var/www/simple_vue/dst/