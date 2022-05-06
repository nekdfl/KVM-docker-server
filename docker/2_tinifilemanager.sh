#!/bin/bash

BASEDIR=/data
APPDIR='tfm'
KVMISO=/kvm/iso

mkdir -p /data/tfm/conf
cp $PWD/tfm_conf/* /data/tfm/conf

docker run -d \
-v ${KVMISO}:/var/www/html/data \
-v ${BASEDIR}/${APPDIR}/conf/php.ini:/usr/local/etc/php/php.ini \
-v ${BASEDIR}/${APPDIR}/conf/config.php:/var/www/html/config.php \
-p 9001:80 --restart=unless-stopped \
--name tinyfilemanager \
tinyfilemanager/tinyfilemanager:master
