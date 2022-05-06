#!/bin/bash

echo "auto install script"

echo "install common apps"
bash ./scripts/preconfig.sh
echo "install kvm"
bash ./install_kvm.sh
echo "install docker"
bash ./docker/run/0_docker_install.sh
echo "build portainer..."
bash ./docker/1_build_portainer.sh
echo "build tinifilemanager"
bash ./docker/2_tinifilemanager.sh
echo "build webvirtcloud"
docker build -t retspen/webvirtcloud:custom ./docker/webvirtcloud/
bash ./docker/3_build_webvirtcloud.sh


