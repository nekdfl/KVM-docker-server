#!/bin/bash

apt update
apt upgrade -y
apt dist-upgrade -y
apt purge cloud-init snapd cloud-initramfs-copymods cloud-initramfs-dyn-netconf -y
systemctl daemon-relaod 
apt autoremove -y
apt install -y net-tools mc htop mlocate iotop powertop bind9-utils  aptitude
apt update
apt upgrade -y
apt autoremove -y
updatedb

