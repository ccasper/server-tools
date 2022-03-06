#!/bin/bash
# Author: ccasper@gmail.com
#
# Bakup the root filesystem with minimal temporary files
#
# We include / /home /boot since these are sometimes separate file systems.

OUTPUT=$HOME/root_backup.tgz
tar -cvpzf $OUTPUT --one-file-system \
 --exclude=$OUTPUT \
 --exclude=/backup \
 --exclude=/var/cache/* \
 --exclude=/var/log/* \
 --exclude=/var/backups/* \
 --exclude=/home/*/.bash_history \
 --exclude=/tmp/* \
 --exclude=/var/www/*/log \
/ /home /boot

