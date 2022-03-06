#!/bin/bash
# Author: ccasper@gmail.com
#
# Basic backup script for nginx server.
#
# The generated file is capable of being efficiently
# rsync'd with minimal network traffic when $DATE is
# disabled and a past file already exists.
#
# Add more directories/files to this for additional
# customizations that were applied.

DATE=$(date -I)

mkdir -p $HOME/backups
OUTPUT=$HOME/backups/site-${DATE}.tar.gz

echo "Creating backup file: $OUTPUT"
tar -c -C / \
etc/letsencrypt \
etc/cron.daily \
etc/php/7.3/fpm/pool.d \
etc/nginx/sites-available \
etc/nginx/sites-enabled \
etc/nginx/nginx.conf \
var/www \
| gzip --rsyncable > $OUTPUT

