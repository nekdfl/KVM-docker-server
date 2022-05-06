#!/bin/bash


docker run -d \
-p 80:80 \
-p 6080:6080 \
-v /var/run/libvirt:/var/run/libvirt \
-v /kvm/iso:/var/lib/libvirt/iso \
-v /kvm/storage:/var/lib/libvirt/images \
--restart=unless-stopped \
--name=webvirtcloud \
retspen/webvirtcloud:custom

