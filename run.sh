#!/bin/bash
if [ $# -eq 0 ]
  then
    #starting php-fpm in foreground
    service tideways-daemon start
    /usr/sbin/php5-fpm -F
else
    php "$@"
fi