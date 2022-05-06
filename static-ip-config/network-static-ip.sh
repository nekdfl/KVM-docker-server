#!/bin/bash

apt install -y network-manager
cp -fr etc/* /etc/
systemctl restart network-manager
systemctl restart system-networkd

nmtui