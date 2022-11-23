#!/bin/bash
set -eou pipefail

chown root:kvm /dev/kvm
cp /bin/true /sbin/ip6tables
virtlogd --daemon
libvirtd --daemon
vagrant up --provider=libvirt
tail -f /var/log/*
exec "$@"