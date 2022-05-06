#!/bin/bash

apt -y install bridge-utils cpu-checker libvirt-clients libvirt-daemon qemu qemu-kvm libvirt-daemon-system  virtinst virt-manager
mkdir -p /kvm/iso
mkdir -p /kvm/storage
