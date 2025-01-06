#!/bin/bash
# Author: ccasper@gmail.com
#
# Bakup the root filesystem with minimal temporary files
#
# We include / /home /boot since these are sometimes separate file systems.

OUTPUT=/backup.tgz

tar -cvpzf -C / $OUTPUT \
 --one-file-system \
 --exclude=$OUTPUT \
 --exclude=/proc \
 --exclude=/tmp \
 --exclude=/srv \
 --exclude=/mnt/*/ \
 --exclude=/dev \
 --exclude=/var/lib/plexmediaserver \
 --exclude=/opt/plexmediaserver \
 --exclude=/opt/getmail6 \
 --exclude=/sys \
 --exclude=/run \
 --exclude=/media \
 --exclude=/var/log \
 --exclude=/var/cache/apt/archives \
 --exclude=/usr/src/linux-headers* \
 --exclude=/home/*/.gvfs \
 --exclude=/home/*/Downloads \
 --exclude=/home/*/.cache \
 --exclude=/home/amcrest/*/* \
 --exclude=/home/*/.local/share/Trash / /boot /home

## To Restore:
# tar -xvpzf backup.tar.gz -C /media/newroot --numeric-owner
# mkdir /media/newroot/proc /media/newroot/sys /media/newroot/mnt /media/newroot/media
# sudo -s for f in dev dev/pts proc ; do mount --bind /$f /media/newroot/$f ; done
# chroot /media/newroot
# dpkg-reconfigure grub-pc
## Rebuild /dev (which is done automatically on restart)
# udevadm control --reload-rules
# udevadm trigger

